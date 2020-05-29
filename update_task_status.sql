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
  v_currentstatus text;
  v_old_status text;
  v_transid numeric;
  v_need_update_active integer;
BEGIN
/*
    Summary:
	  Update task status
    Testing:
	  SELECT update_task_status(67092,'COMPLETED')
	  SELECT update_task_status(50000026,'COMPLETED')
	  select * from ige_task where task_id = 50000026
	  update ige_task set task_status = 'POSTING' where task_id = 50000026
  */
    o_status = 'OK';
    o_message = '';
    -- Validate status 
	
	o_message = validate_task_status(v_status, v_task_id);
	
	v_need_update_active = 1;
	IF EXISTS 
	    (
			SELECT * 
			FROM ige_task 
			WHERE task_id = v_task_id 
			  AND task_type IN ('LINEARNAME', 'AMA') -- For phase 1 only and this should be removed in phase 2
		) THEN	
		v_need_update_active = 1;
	ELSE 
	    v_need_update_active = 0;
	END IF;
	-- Valid request, but ignore status update
	IF upper(o_message) = 'IGNORED' THEN
	  o_message = '';
	  SELECT taken_by INTO v_username FROM ige_task WHERE task_id = v_task_id;
	  raise notice '% % %', v_task_id,v_username, v_status;
	  SELECT update_task_comments(v_task_id,v_username, v_status) into o_json;
	  SELECT row_to_json(c) INTO o_json
	  FROM
	  (
	    SELECT o_status status, 
		   o_message message		    
	  ) c;	
	  RETURN o_json;
	END IF;
	SELECT task_status INTO v_old_status FROM ige_task WHERE task_id = v_task_id;
	IF o_message  = '' THEN
	  IF UPPER(v_status) = 'COMPLETED' THEN
	    SELECT task_status INTO v_currentstatus FROM ige_task WHERE task_id = v_task_id;
		/*IF v_currentstatus <> 'POSTED' THEN		   
		   RAISE EXCEPTION USING
		     errcode = '50001',
			 message = 'Status must be POSTED before set to COMPLETED';
		END IF;
		*/
		SELECT taken_by INTO v_username FROM ige_task WHERE task_id = v_task_id;
		SELECT create_transaction(v_task_id,v_username, 'Complete task', 'anchorTO') into v_transid;
		UPDATE ige_transaction
         SET trans_status = 'COMPLETED',
		     username = v_username,
			 date_end = current_timestamp
         WHERE trans_id = v_transid;
		raise notice 'transid: %', v_transid;
		UPDATE ige_task
			SET task_status = upper(v_status)
		WHERE task_id = v_task_id;		    
	  ELSE  -- IF UPPER(v_status) = 'COMPLETED' THEN
	    UPDATE ige_task
		   SET task_status = UPPER(v_status)
	    WHERE task_id = v_task_id
	       ; -- commented off for release 1: AND ( v_status <> 'WORK STARTED'); -- OR taken_by IS NULL);
	  END IF; -- END of IF UPPER(v_status) = 'COMPLETED' THEN
	  IF UPPER(v_status) = 'COMPLETED' THEN
	    IF v_need_update_active = 1 THEN 
			UPDATE ige_task_active 
			  SET task_id = null,
				  date_modified = current_timestamp
			WHERE task_id = v_task_id;
		END IF;
	  ELSE 
	    IF v_need_update_active = 1 AND 
		  EXISTS (SELECT * FROM ige_task_active WHERE task_id = v_task_id) THEN
		  -- Remove flag from old user
		  UPDATE ige_task_active 
		  SET task_id = null,
		      date_modified = current_timestamp
	      WHERE task_id = v_task_id;
		END IF; 
		SELECT taken_by INTO v_username FROM ige_task WHERE task_id = v_task_id;
		IF v_need_update_active = 1 THEN 
		  IF EXISTS (SELECT * FROM ige_task_active WHERE UPPER(username) = UPPER(v_username)) THEN
			  UPDATE ige_task_active 
				SET task_id = v_task_id
				WHERE UPPER(username) = UPPER(v_username);
			ELSE
			  INSERT INTO ige_task_active (username, task_id, date_modified)
				VALUES (UPPER(v_username), v_task_id, current_timestamp);	
			END IF;
		END IF;	
	  END IF;	
	 /* -- Beginning of updating Oracle
	  IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
	    UPDATE imaint_anchor.ige_task
		  SET task_status = UPPER(v_status)
	    WHERE task_id = v_task_id
		  AND ( v_status <> 'WORK STARTED');
	  END IF;
	 -- End of updating Oracle */
	ELSE 
	  o_status = 'Failed';      
	END IF;  	-- End of IF o_message  = '' THEN
	
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
	ELSE 
	  IF v_old_status <> v_status and 
	   v_status in ('TAKEN', 'POSTED', 'COMPLETED') THEN
	      SELECT taken_by INTO v_username FROM ige_task WHERE task_id = v_task_id; 
	      SELECT update_task_comments(v_task_id,v_username, v_status) INTO ret_json;  
		  SELECT ret_json::json->>'status',
	             ret_json::json->>'message'
		  INTO  ret_status,
		 	    ret_msg;	
		  IF ret_status <> 'OK' THEN
	        RAISE EXCEPTION USING
                errcode= ret_status,
                message= ret_msg;
			END IF;
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

ALTER FUNCTION code_src.update_task_status(numeric, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_task_status(numeric, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_task_status(numeric, text) TO network;

REVOKE ALL ON FUNCTION code_src.update_task_status(numeric, text) FROM PUBLIC;
