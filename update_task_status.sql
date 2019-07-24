-- FUNCTION: network.update_task_status(numeric, text)

-- DROP FUNCTION network.update_task_status(numeric, text);

CREATE OR REPLACE FUNCTION network.update_task_status(
	v_task_id numeric,
	v_status text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE   
  o_status text;  
  o_message text;
  o_json text;   
  ret_json text;
  ret_msg text;
  ret_status text;
  v_control_task_id numeric;
BEGIN
    o_status = 'OK';
    o_message = '';
    -- Validate status 
	IF validate_task_status(v_status) THEN
	  UPDATE ige_task
	    SET task_status = UPPER(v_status)
	  WHERE task_id = v_task_id;
	  -- Beginning of updating Oracle
	  IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
	    UPDATE imaint_oracle.ige_task
		  SET task_status = UPPER(v_status)
	    WHERE task_id = v_task_id;		 
	  END IF;
	 -- End of updating Oracle
	ELSE 
	  o_status = 'Failed';
      o_message = 'Invalid task status ' || v_status;
	END IF;  	
	
	-- Sync control_task status
	SELECT control_task_id INTO v_control_task_id
	FROM ige_task	    
	WHERE task_id = v_task_id;
	SELECT update_control_task_status_by_tasks(v_control_task_id) INTO ret_json;
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

ALTER FUNCTION network.update_task_status(numeric, text)
    OWNER TO network;
