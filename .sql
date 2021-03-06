-- FUNCTION: code_src.update_task_takenby(numeric, text)

-- DROP FUNCTION code_src.update_task_takenby(numeric, text);

CREATE OR REPLACE FUNCTION code_src.update_task_takenby(
	v_task_id numeric,
	v_user_name text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE    
  o_message text;
  o_status text;
  o_json text;   
  ret_json text;
  ret_msg text;  
  v_old_user_name text;
BEGIN
/*
    Summary:
	  Update task taken by value
    Testing:
	  SELECT update_task_takenby(67092,'slee5')
  */
    o_status = 'OK';
    o_message = '';
    SELECT taken_by INTO v_old_user_name FROM ige_task WHERE task_id = v_task_id;
	-- Remove active task from old user
	IF NOT is_blank_string(v_old_user_name) AND UPPER(v_old_user_name) <> UPPER(v_user_name) THEN 	    
		UPDATE ige_task_active 
		SET task_id = null,
		    date_modified = current_timestamp
	    WHERE UPPER(username) = UPPER(v_old_user_name);
	END IF;
	-- Update taken_by
	UPDATE ige_task
	SET taken_by = UPPER(v_user_name)
	WHERE task_id = v_task_id;	 
	-- Update active task for new taken_by user	
	IF EXISTS (SELECT * FROM ige_task_active WHERE UPPER(username) = UPPER(v_user_name)) THEN
	  UPDATE ige_task_active 
	  SET task_id = v_task_id
	  WHERE UPPER(username) = UPPER(v_user_name);
	ELSE
	  IF EXISTS 
	    (
			SELECT * 
			FROM ige_task 
			WHERE task_id = v_task_id 
			  AND task_type IN ('LINEARNAME', 'AMA') -- For phase 1 only and this should be removed in phase 2
		) THEN	  
	    INSERT INTO ige_task_active (username, task_id, date_modified)
	      VALUES (UPPER(v_user_name), v_task_id, current_timestamp);
	  END IF;	  
	END IF;	
	
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message		    
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
	       format_string(o_message) message		  
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.update_task_takenby(numeric, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_task_takenby(numeric, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_task_takenby(numeric, text) TO network;

REVOKE ALL ON FUNCTION code_src.update_task_takenby(numeric, text) FROM PUBLIC;
