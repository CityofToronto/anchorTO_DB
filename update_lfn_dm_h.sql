-- FUNCTION: code_src.update_lfn_dm_h(numeric, numeric)

-- DROP FUNCTION code_src.update_lfn_dm_h(numeric, numeric);

CREATE OR REPLACE FUNCTION code_src.update_lfn_dm_h(
	v_id numeric,
	v_trans_id_create numeric)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
	SECURITY DEFINER 
AS $BODY$
DECLARE 
  v_object_id numeric;  
  o_status text;  
  o_message text;
  o_json text;   
  retval integer;
  isnew boolean;  
  isexpired boolean;
BEGIN
/*
Summary: 
  Update linear_name_h (History) & linear_name_dm (Current & History) table after updating linear_name (versioned) table successfully
Testing:
  -- 1. Regular case:
  SELECT update_lfn('{ "object_id": null,"linear_name_id": null,"name_part": "Ln N College E Shaw-2","type_part": "Street","dir_part": "South","description": "test test", "activation_status": "A","authorized": "Y","used_by": "L"}',123, -1);
    --Created linear_name_id: 1000000010
  SELECt update_lfn_dm_h(1000000010, 126);
  SELECT * FROM linear_name_evw WHERE linear_name_id = 1000000010	
  SELECT * FROM linear_name_h order by 1 DESC
  SELECT * FROM linear_name_dm order by 1 DESC, 2 DESC
  -- 2. Update LFN
    SELECT update_lfn('{ "object_id": null,"linear_name_id": 1000000010,"name_part": "Ln N College E Shaw-3","type_part": "Road","dir_part": "","description": "test test", "activation_status": "","authorized": "Y","used_by": "L"}', 123,-1);
    SELECt update_lfn_dm_h(1000000010, 128);
  SELECT * FROM linear_name_evw WHERE linear_name_id = 1000000010	
  SELECT * FROM linear_name_h order by 1 DESC
  SELECT * FROM linear_name_dm order by 1 DESC, 2 DESC
  -- 3. Expire LFN
    SELECT update_lfn('{ "object_id": null,"linear_name_id": 1000000010,"name_part": "Ln N College E Shaw-2","type_part": "Road","dir_part": "","description": "test test", "activation_status": "X","authorized": "Y","used_by": "L"}', 158,-1);
    SELECt update_lfn_dm_h(1000000010, 158);
  SELECT * FROM linear_name_evw WHERE linear_name_id = 1000000010	
  SELECT * FROM linear_name_h order by 1 DESC
  SELECT * FROM linear_name_dm order by 1 DESC, 2 DESC
*/
    o_status = 'OK';
    o_message = '';   
	isnew = false;	
	retval = 0;  
	
	  IF NOT EXISTS 
	    (
			SELECT * 
			FROM linear_name_dm 
			WHERE linear_name_id = v_id 
			AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS')
		) THEN 
		  isnew = true;
	  END IF; 
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
		  FROM linear_name_dm 
		  WHERE linear_name_id = v_id 
		  AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS');
	  END IF; -- End of Append to _h table
	  -- Update _dm table
	  -- 1. Expire the old one
	  IF NOT isnew THEN		  
		RAISE NOTICE 'Expire old _dm record ...';
		UPDATE linear_name_dm
		  SET date_expiry = current_timestamp,
			  trans_id_expire = v_trans_id_create
		  WHERE linear_name_id = v_id 
			AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS');
	  END IF;		  
	  -- 2. Add a new record from linear_name table	  
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
			WHERE linear_name_id = v_id;
	 
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   v_id AS linear_name_id  
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

ALTER FUNCTION code_src.update_lfn_dm_h(numeric, numeric) OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.update_lfn_dm_h(numeric, numeric) TO anchorto_run
