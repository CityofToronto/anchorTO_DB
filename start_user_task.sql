-- FUNCTION: network.start_user_task(numeric, text)

-- DROP FUNCTION network.start_user_task(numeric, text);

CREATE OR REPLACE FUNCTION network.start_user_task(
	v_task_id numeric,
	v_user_name text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE   
  msg text;
  o_json text;
  o_status text;
  o_message text;
  ret_status text; 
  ret_msg text;	
  ret_json text;
  v_sql text;  
  STATUS_STARTED text = 'WORK STARTED';
  /*cnt_tasks integer = 0;
  cnt_completed integer = 0;
  cnt_incompleted integer = 0;
  cnt_hold integer = 0;
  cnt_started integer = 0;
  cnt_ready integer = 0;
  v_trans_id_expire integer;
  v_control_task_status text;
  v_current_status text = '';
  v_task_seq integer = -1;
  v_min_task_seq numeric(4,1) ; */
  v_version_num text;
  v_active_task_type text;
BEGIN 
    o_status = 'OK';
    o_message = ''; 
	-- Check if the task belongs the user or user's group(s)
	IF EXISTS
	  (
		SELECT * 
		FROM ige_task t
		WHERE task_id = v_task_id 
		  AND 
		    ( UPPER(t.assigned_to) = UPPER(v_user_name) 
			  OR t.assigned_to IN 
				 (
					 SELECT s.steward_group 
					 FROM ige_user_steward s 
					 JOIN ige_user u ON u.user_id = s.user_id 
					 WHERE UPPER(u.username) = UPPER(v_user_name)
				 )	
			 )
	  ) THEN
	  -- Update task status
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
	
	/*
	  SELECT count(*) INTO cnt_tasks  
	  FROM ige_task 
	  WHERE control_task_id = v_control_task_id
	    AND trans_id_expire = -1;
	  -- Get count of all active incompleted tasks for the source/control task
	  SELECT count(*) INTO cnt_incompleted  
	  FROM ige_task 
	  WHERE control_task_id = v_control_task_id
	    AND trans_id_expire = -1
		AND task_status <> STATUS_COMPLETED;	
	  -- Get count of all active completed tasks for the source/control task
	  SELECT count(*) INTO cnt_completed  
	  FROM ige_task 
	  WHERE control_task_id = v_control_task_id
	    AND trans_id_expire = -1
	    AND task_status = STATUS_COMPLETED;
		
	  IF cnt_tasks = cnt_completed THEN -- IF #2
	    v_control_task_status = STATUS_COMPLETED;
	  ELSE -- ELSE #2
	    -- Check all HOLD?
	    -- Get count of all active HOLD tasks for the source/control task
	    SELECT count(*) INTO cnt_hold  
	    FROM ige_task 
	    WHERE control_task_id = v_control_task_id
	      AND trans_id_expire = -1
	      AND task_status = STATUS_HOLD;
		SELECT MIN(task_sequence) INTO v_min_task_seq
		  FROM ige_task 
		  WHERE control_task_id = v_control_task_id
	        AND trans_id_expire = -1
			AND task_status <> STATUS_COMPLETED;	  
	--	IF cnt_hold > 0 THEN  -- IF #3		  		 
	      -- Check if the 1st task is HOLD?		
		  Raise notice 'Checking if the 1st task is HOLD? Current status:%',v_control_task_status;
		  IF EXISTS (
			  SELECT 1
			  FROM ige_task 
	          WHERE control_task_id = v_control_task_id
	            AND trans_id_expire = -1
	            AND task_status = STATUS_HOLD
			    AND task_sequence = v_min_task_seq
			  ) THEN 
			  Raise notice 'To be hold due to 1st HOLD task. Current status:%', v_control_task_status;
		      v_control_task_status = STATUS_HOLD;
			  Raise notice 'Set to HOLD: Current status:%',v_control_task_status;
		  END IF;
--      ELSE  -- ELSE #3		  
		  -- Check one of tasks is STARTED?
		  SELECT count(*) INTO cnt_started  
	      FROM ige_task 
	      WHERE control_task_id = v_control_task_id
	        AND trans_id_expire = -1
	        AND (task_status = STATUS_STARTED); -- OR task_status = STATUS_COMPLETED);
		  IF cnt_started > 0 THEN -- IF #4
		    v_control_task_status = STATUS_IN_PROGRESS;		  
		  ELSE -- ELSE #4		    
			-- Check if the 1st task is READY?		  	  
		    IF EXISTS (
			    SELECT 1
			    FROM ige_task 
	            WHERE control_task_id = v_control_task_id
	              AND trans_id_expire = -1
	              AND task_status = STATUS_READY
			      AND task_sequence = v_min_task_seq
			    ) THEN 
		      v_control_task_status = STATUS_READY;
		    END IF; 			  
		  END IF; -- END IF #4
		  
--		END IF; -- END IF #3 
	  END IF;  -- END IF #2
	  
	  -- Need to close?
	  raise notice 'To close source? %', v_close_source;
	  IF v_close_source IS NOT NULL 
	    AND v_control_task_status = STATUS_COMPLETED THEN 
	    IF v_close_source THEN 
		  v_control_task_status = STATUS_CLOSED;
		ELSE 
		  v_control_task_status = STATUS_COMPLETED;
		END IF;
	  END IF;
	  -- Need to change status?
	  IF v_current_status <> v_control_task_status THEN -- IF #5
	    UPDATE ige_control_task 
	      SET control_task_status = v_control_task_status
		  WHERE control_task_id = v_control_task_id;
		-- Beginning of updating Oracle
	    IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN -- IF #6
		  UPDATE imaint_oracle.ige_control_task 
	      SET control_task_status = v_control_task_status
		  WHERE control_task_id = v_control_task_id;  
		END IF;  -- END IF #6
	    -- End of updating Oracle  		
	  END IF; -- END IF #5			  
--	END IF; -- END IF #1
  raise notice 'Control_task_id: %; Total tasks #:%; Total COMPLETED #:%; Total HOLD #:%; Total Started: %; 1st Incompleted task SEQ: %; Current Status:%; New Status: %;', 
                v_control_task_id, cnt_tasks, cnt_completed, cnt_hold, cnt_started, v_min_task_seq,v_current_status, v_control_task_status;
  */
  SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT 
		   v_version_num version_num,
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
		   null version_num,
		   null active_task_type,
		   o_status status, 
	       o_message message		     
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION network.start_user_task(numeric, text)
    OWNER TO network;
