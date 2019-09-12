-- FUNCTION: network.update_lfn_type_dm_h(numeric, numeric)

-- DROP FUNCTION network.update_lfn_type_dm_h(numeric, numeric);

CREATE OR REPLACE FUNCTION network.update_lfn_type_dm_h(
	v_id numeric,
	v_trans_id_create numeric)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
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
  Update linear_name_type_h (History) & linear_name_type_dm (Current & History) table after updating linear_name_type (versioned) table successfully
Testing:
  -- 3. Regular case:
  SELECT update_lfn_type('{ "object_id": null,"linear_name_type_id": null,"name": "StreetNorth","code": "St NOR"}', 125);
  SELECT update_lfn_type_dm_h(1000000003, 125)
   --Created linear_name_type_id: 1000000003
  SELECT update_lfn_type('{ "object_id": null,"linear_name_type_id": 1000000003,"name": "Street North","code": "St No"}', 220);
  SELECT update_lfn_type_dm_h(1000000003, 220)
  SELECT update_lfn_type('{ "object_id": null,"linear_name_type_id": 1000000003,"name": "Street North","code": "St N"}', 228);
  SELECT update_lfn_type_dm_h(1000000003, 228)
  
  SELECT * FROM linear_name_type_evw WHERE linear_name_type_id = 1000000003	
  SELECT * FROM linear_name_type_h order by objectid DESC
  SELECT * FROM linear_name_type_dm order by 1 DESC, 2 DESC
  
*/
    o_status = 'OK';
    o_message = '';   
	isnew = false;	
	retval = 0;  
	
	  IF NOT EXISTS 
	    (
			SELECT * 
			FROM linear_name_type_dm 
			WHERE linear_name_type_id = v_id 
			AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS')
		) THEN 
		  isnew = true;
	  END IF; 
	  -- Append to _h table
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
		  FROM linear_name_type_dm  
		  WHERE linear_name_type_id = v_id
		    AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS');		
	  END IF; -- End of Append to _h table
	  -- Update _dm table
	  -- 1. Expire the old one
	  IF NOT isnew THEN		  
		RAISE NOTICE 'Expire old _dm record ...';
		UPDATE linear_name_type_dm
		      SET date_expiry = current_timestamp,
			      trans_id_expire = v_trans_id_create
		      WHERE linear_name_type_id = v_id 
			    AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS');		
	  END IF;		  
	  -- 2. Add a new record from linear_name table	  
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
				WHERE linear_name_type_id = v_id;	
	-- End of Update _dm table			
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   v_id AS linear_name_type_id  
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

ALTER FUNCTION network.update_lfn_type_dm_h(numeric, numeric)
    OWNER TO network;
