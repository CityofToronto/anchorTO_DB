-- FUNCTION: code_src.start_user_task(numeric, text)

-- DROP FUNCTION code_src.start_user_task(numeric, text);

CREATE OR REPLACE FUNCTION code_src.start_user_task(
	v_task_id numeric,
	v_user_name text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
/*
    Summary:
	  Start a user's task
    Testing:
	  SELECT start_user_task(1000001331, 'rli4')
  */
DECLARE   
  msg text;
  o_json text;
  o_status text;
  o_message text;
  ret_status text; 
  ret_msg text;	
  ret_json text;
  v_sql text;  
  STATUS_STARTED text = 'TAKEN'; --WORK STARTED';  
  v_version_num text;
  v_active_task_type text;
BEGIN 
    o_status = 'OK';
    o_message = ''; 
	-- Check if the task belongs to the user or user's group(s)
	IF EXISTS
	  (
		SELECT * 
		FROM ige_task t
		WHERE task_id = v_task_id 
		  AND 
		    ( UPPER(t.assigned_to) = UPPER(v_user_name) 
			  OR UPPER(t.assigned_to) IN 
				 (
					 SELECT UPPER(s.steward_group) 
					 FROM ige_user_steward s 
					 JOIN ige_user u ON u.user_id = s.user_id 
					 WHERE UPPER(u.username) = UPPER(v_user_name)
				 )	
			 )
	  ) THEN
	  -- Update task status	 
	  UPDATE ige_task
	    SET taken_by = UPPER(v_user_name)
	  WHERE task_id = v_task_id;
	/* -- Beginning of updating Oracle
	 IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN 
		 UPDATE imaint_anchor.ige_task
			SET taken_by = v_user_name
		  WHERE task_id = v_task_id;
	 END IF;
	 -- End of updating Oracle  */
	 SELECT update_task_status(v_task_id, STATUS_STARTED) INTO ret_json;
	  SELECT ret_json::json->>'status',
	       ret_json::json->>'message'
      INTO  ret_status,
	        ret_msg;		  
	  IF ret_status <> 'OK' THEN
		  RAISE EXCEPTION USING
				errcode= ret_status,
				message= ret_msg;
	  END IF;
	  
	 
	  -- Get task information to return 
	  SELECT trans_id_create, task_type INTO v_version_num,	v_active_task_type FROM ige_task t	WHERE task_id = v_task_id;
	ELSE
	  o_status = 'Error';
	  o_message = 'Task does not belong to the user';	  
	END IF;	
  SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT 
		   --v_version_num version_num,
		   v_active_task_type active_task_type,
		   o_status status, 
	       o_message message		     
	) c;		
  RETURN o_json;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT 
		   --null version_num,
		   null active_task_type,
		   o_status status, 
	       o_message message		     
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.start_user_task(numeric, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.start_user_task(numeric, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.start_user_task(numeric, text) TO network;

REVOKE ALL ON FUNCTION code_src.start_user_task(numeric, text) FROM PUBLIC;
