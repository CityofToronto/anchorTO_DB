-- FUNCTION: network.update_lfn(text, numeric)

-- DROP FUNCTION network.update_lfn(text, numeric);

CREATE OR REPLACE FUNCTION network.update_lfn(
	v_info text,
	--v_trans_id_create numeric,
	v_trans_id_expire numeric DEFAULT '-1'::integer)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  v_linear_name_id numeric(12,0);
  v_trans_id_create numeric;
  v_object_id numeric;
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
    o_status = 'OK';
    o_message = '';   
	isnew = false;	
	retval = 0;  
	
	  SELECT $1::json->>'object_id',
             $1::json->>'linear_name_id',
		     format_string(TRIM(INITCAP($1::json->>'name_part'))),
		     TRIM(INITCAP($1::json->>'type_part')),
		     TRIM(INITCAP($1::json->>'dir_part')),
		     format_string(TRIM($1::json->>'description')),
		     TRIM(UPPER($1::json->>'activation_status')),
			 TRIM(UPPER($1::json->>'authorized')),
			 TRIM(UPPER($1::json->>'used_by')),
			 $1::json->>'version'
		INTO v_object_id,
			 v_linear_name_id,			
			 v_name_part,
			 v_type_part,
			 v_dir_part,
			 v_description,
			 v_activation_status,
			 v_authorized,
			 v_use_by,
			 v_trans_id_create;
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
	  raise notice 'Version / trans_id_create: %', v_trans_id_create;	 	  
	  
		  IF (isnew) THEN
		    -- Unique name_part + type_part + dir_part
			SELECT count(*) INTO retval 
			FROM linear_name_evw 
			WHERE UPPER(name_part || coalesce(type_part,'') || coalesce(dir_part,'')) = UPPER(v_name_part || coalesce(v_type_part,'') || coalesce(v_dir_part,''));
			IF retval > 0 THEN 
			  o_status = 'Failed';
		      o_message = 'Linear full name (Name_Part + Type_Part + Dir_Part) must be unique';
			ELSE
			  SELECT nextval('linear_name_id_seq')::numeric(12,0),
			         sde.next_rowid(current_schema()::text, 'linear_name')
			  INTO v_linear_name_id, v_object_id;
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
					    v_object_id,
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
				        null
				  );
				  
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
	           VALUES (	
					    v_object_id,
				        v_linear_name_id,
				        current_timestamp,
				        TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),
					    v_trans_id_create,
					    v_trans_id_expire,				      
				        v_name_part,
				        v_type_part,
				        v_dir_part,				        
				        v_description,
				        v_activation_status,
				        'A',
				        null,
				        null,
				        v_name_part || coalesce(v_type_part,'') || coalesce(v_dir_part,'')
				  );
			END IF;			
		  ELSE -- Update LFN info
		    -- Unique name_part + type_part + dir_part other than itself
		    SELECT count(*) INTO retval 
			FROM linear_name_evw 
			WHERE UPPER(name_part || coalesce(type_part,'') || coalesce(dir_part,'')) = UPPER(v_name_part || coalesce(v_type_part,'') || coalesce(v_dir_part,''))
		      AND linear_name_id <> v_linear_name_id;
		    IF retval > 0 THEN -- #1
			  o_status = 'Failed';
		      o_message = 'Name Part + Type Part + Dir Part must be unique';
			ELSE
			  -- LFN maybe expired or editted if it's never been referenced	  
	          SELECT count(*) INTO retval 
			  FROM linear_name_evw 
			  WHERE linear_name_id = v_linear_name_id
			    AND usage_status NOT IN ('C', 'H');
			  IF retval > 0 THEN -- #2
			     o_status = 'Failed';
		         o_message = 'LFN has been referenced and cannot be editted';	
		      ELSE
			    UPDATE linear_name_evw 
			      SET  name_part = v_name_part,
				       type_part = v_type_part,
					   dir_part = v_dir_part,
					   description = v_description,
					   authorized = v_authorized,
					   use_by = v_use_by					  
				  WHERE linear_name_id = v_linear_name_id;
			  END IF; -- End of IF retval > 0 #2
			END IF;  -- End of IF retval > 0 #1
		  END IF; -- End of Update LFN info	
	
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

ALTER FUNCTION network.update_lfn(text, numeric)
    OWNER TO network;
