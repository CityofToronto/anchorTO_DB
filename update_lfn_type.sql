-- FUNCTION: code_src.update_lfn_type(text, numeric, numeric)

-- DROP FUNCTION code_src.update_lfn_type(text, numeric, numeric);

CREATE OR REPLACE FUNCTION code_src.update_lfn_type(
	v_info text,
	v_trans_id_create numeric,
	v_trans_id_expire numeric DEFAULT '-1'::integer)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  v_linear_name_type_id numeric(12,0);  
  v_object_id numeric; 
  v_type_part text;
  v_type_part_code text;  
  v_current_type_part text;
  v_activation_status text;
  o_status text;  
  o_message text;
  o_json text;   
  retval integer;
  isnew boolean;  
BEGIN  
/*
Summary: 
  Create (linear_name_type_id = null) or Update (linear_name_type_id <> null) LFN type (versioned linear_name_type table)
Testing:
  -- 1. Blank type_part:
  SELECT update_lfn_type('{ "objectid": null,"linear_name_type_id": null,"type_part": "","type_part_code": ""}', 123);
  -- 2. Blank type_part_code:
  SELECT update_lfn_type('{ "objectid": null,"linear_name_type_id": null,"type_part": "New Type","type_part_code": ""}', 123);
  -- 3. Regular case:
  SELECT update_lfn_type('{ "objectid": null,"linear_name_type_id": null,"type_part": "Street name","type_part_code": "St N"}', 125);
  SELECT update_lfn_type('{ "objectid": null,"linear_name_type_id": 1000000002,"type_part": "Street Name","type_part_code": "St N"}', 126);
  SELECT update_lfn_type('{ "objectid": null,"linear_name_type_id": 1000000002,"type_part": "Street Name","type_part_code": "St N"}', 128);
    --Created linear_name_type_id: 1000000002
  SELECT * FROM linear_name_type_evw WHERE linear_name_type_id = 1000000002	
  SELECT * FROM linear_name_type_h order by objectid DESC
  SELECT * FROM linear_name_type_dm order by 1 DESC, 2 DESC
  -- 4. Run above update_lfn_type again to check duplication of linear name type
  -- 5. Update type part to an existing name
    SELECT update_lfn_type('{ "objectid": null,"linear_name_type_id": 1000000002,"type_part": "Street","type_part_code": "St N"}', 125);
  -- 6. Update a referenced type part
    SELECT update_lfn_type('{ "objectid": null,"linear_name_type_id": 2,"type_part": "Woods","type_part_code": "Wd"}', 125);
  -- 7. Type part & type part code are alphabet only
    SELECT update_lfn_type('{ "objectid": null,"linear_name_type_id": 2,"type_part": "Street2","type_part_code": "St"}', 125);
	SELECT update_lfn_type('{ "objectid": null,"linear_name_type_id": 2,"type_part": "Street","type_part_code": "St2"}', 125);
*/
    o_status = 'OK';
    o_message = '';   
	isnew = false;	
	retval = 0;  
	
	  SELECT $1::json->>'linear_name_type_id',
	         $1::json->>'activation_status',
		     format_string(TRIM(INITCAP($1::json->>'type_part'))),		     
		     format_string(TRIM(INITCAP($1::json->>'type_part_code')))
		INTO v_linear_name_type_id,	
		     v_activation_status,
			 v_type_part,
			 v_type_part_code;
	  SELECT is_blank_id(v_linear_name_type_id::text) INTO isnew; 
	  raise notice 'Is New? %', isnew;
	  raise notice 'linear_name_type_id: %', v_linear_name_type_id;	  
	  raise notice 'Type Part: %', v_type_part;
	  raise notice 'Type Part Code: %', v_type_part_code;	
	  raise notice 'Activation Status: %', v_activation_status;
	  -- Validation	  
	  IF is_blank_string(v_type_part) THEN
	    RAISE 'Linear name type cannot be blank' USING ERRCODE = '20000';
	  END IF;
	  IF is_blank_string(v_type_part_code) THEN
	    RAISE 'Linear name type code cannot be blank' USING ERRCODE = '20001';
	  END IF;
	  -- Type part & type part code are alphabet only
	  IF LENGTH(regexp_replace(v_type_part, '[^a-zA-Z]', '', 'g')) <> LENGTH(replace(v_type_part, ' ', '')) THEN 
	    RAISE 'Linear name type is alphabetic only' USING ERRCODE = '20006';
	  END IF;
	  IF LENGTH(regexp_replace(v_type_part_code, '[^a-zA-Z]', '', 'g')) <> LENGTH(replace(v_type_part_code, ' ', '')) THEN 
	    RAISE 'Linear name type code is alphabetic only' USING ERRCODE = '20007';
	  END IF;
	  IF isnew THEN	  
		-- Unique type_part 
		SELECT count(*) INTO retval 
		FROM linear_name_type_evw 
		WHERE UPPER(type_part) = UPPER(v_type_part);
		IF retval > 0 THEN 		  
		  RAISE 'Linear name type must be unique' USING ERRCODE = '20002';
		END IF;
		-- Unique type_part_code 
		SELECT count(*) INTO retval 
		FROM linear_name_type_evw 
		WHERE UPPER(type_part_code) = UPPER(v_type_part_code);
		IF retval > 0 THEN 		  
		  RAISE 'Linear name type code must be unique' USING ERRCODE = '20003';
		END IF;
	  ELSE -- Not new 
	    -- Unique type_part  
		SELECT count(*) INTO retval 
		FROM linear_name_type_evw 
		WHERE UPPER(type_part) = UPPER(v_type_part)
		  AND linear_name_type_id <> v_linear_name_type_id;
		IF retval > 0 THEN 		  
		  RAISE 'Linear name type must be unique' USING ERRCODE = '20002';
		END IF;
		-- Unique type_part_code  
		SELECT count(*) INTO retval 
		FROM linear_name_type_evw 
		WHERE UPPER(type_part_code) = UPPER(v_type_part_code)
		  AND linear_name_type_id <> v_linear_name_type_id;
		IF retval > 0 THEN 		  
		  RAISE 'Linear name type code must be unique' USING ERRCODE = '20003';
		END IF;			     
		-- LFN type maybe editted if it's never been referenced	in LFN 
		SELECT type_part INTO v_current_type_part FROM linear_name_type_evw WHERE linear_name_type_id = v_linear_name_type_id;
		IF EXISTS (SELECT * FROM linear_name_evw WHERE UPPER(type_part) = UPPER(v_current_type_part)) 
		  OR EXISTS (SELECT * FROM linear_name_dm WHERE UPPER(type_part) = UPPER(v_current_type_part))
		  OR EXISTS (SELECT * FROM linear_name_h WHERE UPPER(type_part) = UPPER(v_current_type_part)) THEN 		
		  RAISE 'LFN type has been referenced and cannot be editted' USING ERRCODE = '20005';		 
		END IF;
	  END IF;
	  -- End of validation
	 /* -- Append to _h table
	  IF NOT isnew THEN  
	    RAISE NOTICE 'Recording _h ...';
		INSERT INTO linear_name_type_h
			  (
				  linear_name_type_id, 
				  trans_id_create, 
				  trans_id_expire, 				 
				  type_part, 
				  type_part_code, 				  
				  objectid)
		  SELECT linear_name_type_id, 
				 trans_id_create, 
				 v_trans_id_create, -- make it expired				 
				 type_part, 
				 type_part_code,
				 sde.next_rowid(current_schema()::text, 'linear_name_type_h')
		  FROM linear_name_type_evw 
		  WHERE linear_name_type_id = v_linear_name_type_id
		  LIMIT 1;
	  END IF; -- End of Append to _h table*/
	  -- Insert / update LFN
	  IF isnew THEN		    
		  SELECT nextval('linear_name_type_id_seq')::numeric(12,0),
				 sde.next_rowid(current_schema()::text, 'linear_name_type')
		  INTO v_linear_name_type_id, v_object_id;
		  RAISE NOTICE 'Creating new LFN ...';
		  INSERT INTO linear_name_type_evw
				   (
					   objectid, 
					   linear_name_type_id, 
					   trans_id_create, 
					   trans_id_expire,
					   type_part, 
					   type_part_code
				   )
		   VALUES (	
					v_object_id,
					v_linear_name_type_id,
					v_trans_id_create,
					v_trans_id_expire,
					v_type_part, 
					v_type_part_code
			  );
		ELSE -- Update LFN info		   
		    RAISE NOTICE 'Updating LFN type...';
			UPDATE linear_name_type_evw 
			SET  type_part = v_type_part,
				 type_part_code = v_type_part_code,				 
				 trans_id_create = v_trans_id_create
			WHERE linear_name_type_id = v_linear_name_type_id;	
			-- Expire LFN type
			IF v_activation_status = 'X' THEN 
			  DELETE FROM linear_name_type_evw
			    WHERE linear_name_type_id = v_linear_name_type_id;
			END IF;
		END IF; -- End of Update LFN type info		
		/*-- Update _dm table
		  -- 1. Expire the old one
		  IF NOT isnew THEN		  
		    RAISE NOTICE 'Expire old _dm record ...';
		    UPDATE linear_name_type_dm
		      SET date_expiry = current_timestamp,
			      trans_id_expire = v_trans_id_create
		      WHERE linear_name_type_id = v_linear_name_type_id 
			    AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS');
	      END IF;		  
		  -- 2. Add a new record from linear_name_type table
		  --IF isnew OR v_activation_status <> 'X' THEN		    
	      RAISE NOTICE 'Creating new _dm record ...';
		  INSERT INTO linear_name_type_dm
				   (
					   objectid, 
					   linear_name_type_id, 
					   date_effective,
					   date_expiry,
					   trans_id_create, 
					   trans_id_expire,
					   type_part, 
					   type_part_code
				   )
			   SELECT	
					sde.next_rowid(current_schema()::text, 'linear_name_type_dm'),
					linear_name_type_id,
					current_timestamp,
					TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),
					trans_id_create,
					trans_id_expire,
					type_part,
					type_part_code
			    FROM linear_name_type_evw
				WHERE linear_name_type_id = v_linear_name_type_id
				LIMIT 1;	
				*/
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   v_linear_name_type_id AS linear_name_type_id  
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
		   null AS linear_name_type_id 
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.update_lfn_type(text, numeric, numeric)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_lfn_type(text, numeric, numeric) TO anchorto_run;

revoke EXECUTE ON FUNCTION code_src.update_lfn_type(text, numeric, numeric) from PUBLIC;

GRANT EXECUTE ON FUNCTION code_src.update_lfn_type(text, numeric, numeric) TO network;

