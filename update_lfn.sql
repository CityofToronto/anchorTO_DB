-- FUNCTION: code_src.update_lfn(text, numeric, numeric)

-- DROP FUNCTION code_src.update_lfn(text, numeric, numeric);

CREATE OR REPLACE FUNCTION code_src.update_lfn(
	v_info text,
	v_trans_id_create numeric,
	v_trans_id_expire numeric DEFAULT '-1'::integer)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE  
	SECURITY DEFINER
AS $BODY$
DECLARE 
  v_linear_name_id numeric(12,0);  
  v_objectid numeric;
  v_name_part text;
  v_type_part text;
  v_dir_part text;
  v_description text;
  v_activation_status text;
  v_authorized text;
  v_use_by text;
  v_version text;
  o_status text;  
  o_message text;
  o_json text;   
  retval integer;
  isnew boolean;  
BEGIN
/*
Summary: 
  Create (linear_name_id = null) or Update (linear_name_id <> null) LFN (versioned linear name table)
Record the update in linear_name_dm table (Current & History) and linear_name_h table (History only) 
When activation_status = 'X', LFN will be expired
Testing:
  -- 1. Blank name part:
  SELECT update_lfn('{ "objectid": null,"linear_name_id": null,"name_part": "","type_part": "Street","dir_part": "South","description": "test test", "activation_status": "A","authorized": "Y","used_by": "L"}', 123,-1);
  -- 2. Regular case:
  SELECT update_lfn('{ "objectid": null,"linear_name_id": null,"name_part": "test","type_part": "Street","dir_part": "South","description": "test test", "activation_status": "A","authorized": "Y","used_by": "L"}',123, -1);
    --Created linear_name_id: 1000000005
  SELECT * FROM linear_name_evw WHERE linear_name_id = 1000000005	
  SELECT * FROM linear_name_h order by 1 DESC
  SELECT * FROM linear_name_dm order by 1 DESC, 2 DESC
  -- 3. Run above update_lfn again to check duplication of linear name
  -- 4.1 Update name part with an existing name
    SELECT update_lfn('{ "objectid": null,"linear_name_id": 1000000003,"name_part": "Ln N College E Shaw-2","type_part": "Road","dir_part": "","description": "test test", "activation_status": "A","authorized": "Y","used_by": "L"}', 123,-1);
  -- 4.2 Update referenced LFN 
    SELECT update_lfn('{ "objectid": null,"linear_name_id": 11860,"name_part": "Ln N College E Shaw-2","type_part": "Road","dir_part": "","description": "test test", "activation_status": "A","authorized": "Y","used_by": "L"}', 123,-1);
  -- 5. Expire LFN
    SELECT update_lfn('{ "objectid": null,"linear_name_id": 1000000005,"name_part": "Ln N College E Shaw-2","type_part": "Road","dir_part": "","description": "test test", "activation_status": "X","authorized": "Y","used_by": "L"}', 123,-1);
   SELECT update_lfn('{"objectid":null,"linear_name_id":null,"name_part":"Test by ry","type_part":"Boulevard","dir_part":"East","authorized":"Y","used_by":"B","used_by_desc":null,"description":"test","activation_status":"A","activation_status_desc":null,"usage_status":null,"usage_status_desc":null,"duplication_status":null,"duplication_desc":null,"segment":null,"task_id":1000001331,"user_id":"rli4"}', 111,-1);
  
*/
    o_status = 'OK';
    o_message = '';   
	isnew = false;	
	retval = 0;  
	
	  SELECT $1::json->>'objectid',
             $1::json->>'linear_name_id',
		     format_string(TRIM(INITCAP($1::json->>'name_part'))),
		     TRIM(INITCAP($1::json->>'type_part')),
		     TRIM(INITCAP($1::json->>'dir_part')),
		     format_string(TRIM($1::json->>'description')),
		     TRIM(UPPER($1::json->>'activation_status')),
			 TRIM(UPPER($1::json->>'authorized')),
			 TRIM(UPPER($1::json->>'used_by'))
		INTO v_objectid,
			 v_linear_name_id,			
			 v_name_part,
			 v_type_part,
			 v_dir_part,
			 v_description,
			 v_activation_status,
			 v_authorized,
			 v_use_by;
	  SELECT is_blank_id(v_linear_name_id::text) INTO isnew; 
	  raise notice 'Is New? %', isnew;
	  raise notice 'linear_name_id: %', v_linear_name_id;
	  raise notice 'Name Part: %', v_name_part;
	  raise notice 'Type Part: %', v_type_part;
	  raise notice 'Dir Part: %', v_dir_part;
	  raise notice 'Description: %', v_description;
	  raise notice 'Activation Status: %', v_activation_status;
	  raise notice 'Authorized: %', v_authorized;
	  raise notice 'Use By: %', v_use_by;	 
	  -- Validation	  
	  IF is_blank_string(v_name_part) THEN
	    RAISE 'Linear name cannot be blank' USING ERRCODE = '20000';
	  END IF;
	  IF isnew THEN	  
		-- Unique name_part + type_part + dir_part
		SELECT count(*) INTO retval 
		FROM linear_name_evw 
		WHERE UPPER(name_part || coalesce(type_part,'') || coalesce(dir_part,'')) = UPPER(v_name_part || coalesce(v_type_part,'') || coalesce(v_dir_part,''));
		IF retval > 0 THEN 		  
		  RAISE 'Linear full name (name_part + type_part + dir_part) must be unique' USING ERRCODE = '20001';
		END IF;  
	  ELSE -- Not new 
	    -- Unique name_part + type_part + dir_part other than itself
		SELECT count(*) INTO retval 
		FROM linear_name_evw 
		WHERE UPPER(name_part || coalesce(type_part,'') || coalesce(dir_part,'')) = UPPER(v_name_part || coalesce(v_type_part,'') || coalesce(v_dir_part,''))
		  AND linear_name_id <> v_linear_name_id;
		IF retval > 0 THEN -- #1
		  RAISE 'Linear full name (name_part + type_part + dir_part) must be unique' USING ERRCODE = '20001';	
		END IF;  
		-- LFN maybe expired or editted if it's never been referenced	  
		SELECT count(*) INTO retval 
		FROM linear_name_evw 
		WHERE linear_name_id = v_linear_name_id
		 AND usage_status IN ('C', 'H');
		IF retval > 0 THEN -- #2
		  RAISE 'LFN has been referenced and cannot be editted' USING ERRCODE = '20002';		 
		END IF;
	  END IF;
	  -- End of validation
	 /*
	 -- Append to _h table
	  IF NOT isnew THEN  
	    RAISE NOTICE 'Recording _h ...';
		INSERT INTO linear_name_h
			  (
				  linear_name_id, 
				  trans_id_create, 
				  trans_id_expire, 
				  name_part, 
				  type_part, 
				  dir_part, 
				  description, 
				  activation_status, 
				  approval_status, 
				  duplication_status, 
				  duplication_desc, 
				  objectid)
		  SELECT linear_name_id, 
				 trans_id_create, 
				 v_trans_id_create, -- make it expired
				 name_part, 
				 type_part, 
				 dir_part, 
				 description, 
				 activation_status, 
				 approval_status, 
				 duplication_status, 
				 duplication_desc, 
				 sde.next_rowid(current_schema()::text, 'linear_name_h')
		  FROM linear_name_evw 
		  WHERE linear_name_id = v_linear_name_id
		  LIMIT 1;
	  END IF; -- End of Append to _h table
	  */
	  -- Insert / update LFN
	  IF isnew THEN		    
		  SELECT nextval('linear_name_id_seq')::numeric(12,0),
				 sde.next_rowid(current_schema()::text, 'linear_name')
		  INTO v_linear_name_id, v_objectid;
		  RAISE NOTICE 'Creating new LFN ...';
		  INSERT INTO linear_name_evw
				   (
					   objectid, 
					   linear_name_id, 
					   trans_id_create, 
					   trans_id_expire, 
					   record_type, 
					   use_by, 
					   name_part, 
					   type_part, 
					   dir_part, 
					   description, 
					   activation_status, 
					   approval_status, 
					   duplication_status, 
					   duplication_desc, 						   
					   authorized, 
					   usage_status
				   )
		   VALUES (	
					v_objectid,
					v_linear_name_id,
					v_trans_id_create,
					v_trans_id_expire,
					'P',
					v_use_by,
					v_name_part,
					v_type_part,
					v_dir_part,				        
					v_description,
					v_activation_status,
					'A',
					null,
					null,
					v_authorized,
					'N'
			  );
		ELSE -- Update LFN info		   
		    RAISE NOTICE 'Updating LFN ...';
			UPDATE linear_name_evw 
			SET  name_part = v_name_part,
				 type_part = v_type_part,
				 dir_part = v_dir_part,
				 description = v_description,
				 authorized = v_authorized,
				 activation_status = CASE WHEN v_activation_status = 'X' THEN activation_status ELSE v_activation_status END, 
				 use_by = v_use_by,
				 trans_id_create = v_trans_id_create
			WHERE linear_name_id = v_linear_name_id;	
			-- Expire LFN
			IF v_activation_status = 'X' THEN 
			  DELETE FROM linear_name_evw
			    WHERE linear_name_id = v_linear_name_id;
			END IF;
		END IF; -- End of Update LFN info		
		/*-- Update _dm table
		  -- 1. Expire the old one
		  IF NOT isnew THEN		  
		    RAISE NOTICE 'Expire old _dm record ...';
		    UPDATE linear_name_dm
		      SET date_expiry = current_timestamp,
			      trans_id_expire = v_trans_id_create
		      WHERE linear_name_id = v_linear_name_id 
			    AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS');
	      END IF;		  
		  -- 2. Add a new record from linear_name table
		  IF isnew OR v_activation_status <> 'X' THEN
		    RAISE NOTICE 'Creating new _dm record ...';
		    INSERT INTO linear_name_dm
				   (
					   objectid, 
					   linear_name_id, 
					   date_effective,
					   date_expiry,
					   trans_id_create, 
					   trans_id_expire, 
					   name_part, 
					   type_part, 
					   dir_part, 
					   description, 
					   activation_status, 
					   approval_status, 
					   duplication_status, 
					   duplication_desc,
					   linear_name_full
				   )
			   SELECT	
					sde.next_rowid(current_schema()::text, 'linear_name_dm'),
					linear_name_id,
					current_timestamp,
					TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),
					trans_id_create,
					trans_id_expire,				      
					name_part,
					type_part,
					dir_part,				        
					description,
					activation_status,
					approval_status,
					duplication_status,
					duplication_desc,
					name_part || ' ' || coalesce(type_part,'') || ' ' || coalesce(dir_part,'')
			    FROM linear_name_evw
				WHERE linear_name_id = v_linear_name_id
				LIMIT 1;
		  END IF;		*/
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   v_linear_name_id AS linear_name_id  
	) c;
	
	RETURN o_json;
EXCEPTION
  WHEN OTHERS THEN 
    o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   null AS linear_name_id 
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.update_lfn(text, numeric, numeric) OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.update_lfn(text, numeric, numeric) TO anchorto_run
