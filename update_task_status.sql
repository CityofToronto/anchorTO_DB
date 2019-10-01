-- FUNCTION: code_src.update_task_status(numeric, text)

-- DROP FUNCTION code_src.update_task_status(numeric, text);

CREATE OR REPLACE FUNCTION code_src.update_task_status(
	v_task_id numeric,
	v_status text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE   
  o_status text;  
  o_message text;
  o_json text;   
  ret_json text;
  ret_msg text;
  ret_status text;
  v_control_task_id numeric;
  v_username text;
BEGIN
/*
    Summary:
	  Update task status
    Testing:
	  SELECT update_task_status(67092,'completed')
  */
    o_status = 'OK';
    o_message = '';
    -- Validate status 
	IF validate_task_status(v_status) THEN
	  
	  UPDATE ige_task
		SET task_status = UPPER(v_status)
	  WHERE task_id = v_task_id
	    AND ( v_status <> 'WORK STARTED'); -- OR taken_by IS NULL);
	   
	  IF UPPER(v_status) = 'COMPLETED' THEN
	    UPDATE ige_task_active 
		  SET task_id = null,
		      date_modified = current_timestamp
	    WHERE task_id = v_task_id;
	  ELSE 
	    IF EXISTS (SELECT * FROM ige_task_active WHERE task_id = v_task_id) THEN
		  -- Remove flag from old user
		  UPDATE ige_task_active 
		  SET task_id = null,
		      date_modified = current_timestamp
	      WHERE task_id = v_task_id;
		END IF; 
		SELECT taken_by INTO v_username FROM ige_task WHERE task_id = v_task_id;
		IF EXISTS (SELECT * FROM ige_task_active WHERE username = v_username) THEN
		  UPDATE ige_task_active 
		    SET task_id = v_task_id
			WHERE username = v_username;
		ELSE
	      INSERT INTO ige_task_active (username, task_id, date_modified)
		    VALUES (v_username, v_task_id, current_timestamp);	
		END IF;	
	  END IF;	
	  /*-- Beginning of updating Oracle
	  IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
	    UPDATE imaint_oracle.ige_task
		  SET task_status = UPPER(v_status)
	    WHERE task_id = v_task_id;		 
	  END IF;
	 -- End of updating Oracle*/
	ELSE 
	  o_status = 'Failed';
      o_message = 'Invalid task status ' || v_status;
	END IF;  	
	
	-- Sync control_task status
	SELECT control_task_id INTO v_control_task_id
	FROM ige_task	    
	WHERE task_id = v_task_id;
	SELECT update_control_task_status_by_tasks(v_control_task_id, null) INTO ret_json;
	raise notice 'Update update_control_task_status_by_tasks message: %', ret_json;
	SELECT ret_json::json->>'status',
	       ret_json::json->>'message'
    INTO  ret_status,
	      ret_msg;		  
    IF ret_status <> 'OK' THEN
	  RAISE EXCEPTION USING
            errcode= ret_status,
            message= ret_msg;
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
	       o_message message		  
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.update_task_status(numeric, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_task_status(numeric, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_task_status(numeric, text) TO network;

REVOKE ALL ON FUNCTION code_src.update_task_status(numeric, text) FROM PUBLIC;
