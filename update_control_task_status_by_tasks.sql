-- FUNCTION: network.update_control_task_status_by_tasks(numeric)

-- DROP FUNCTION network.update_control_task_status_by_tasks(numeric);

CREATE OR REPLACE FUNCTION network.update_control_task_status_by_tasks(v_control_task_id numeric)
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
  v_sql text;
  STATUS_READY text = 'READY';
  STATUS_CLOSED text = 'CLOSED';
  STATUS_IN_PROGRESS text = 'IN PROGRESS';
  STATUS_COMPLETED text = 'COMPLETED';
  STATUS_HOLD text = 'HOLD';  
  STATUS_STARTED text = 'WORK STARTED';
  cnt_tasks integer = 0;
  cnt_completed integer = 0;
  cnt_incompleted integer = 0;
  cnt_hold integer = 0;
  cnt_started integer = 0;
  cnt_ready integer = 0;
  v_trans_id_expire integer;
  v_control_task_status text;
  v_current_status text = '';
  v_task_seq integer = -1;
BEGIN 
    o_status = 'OK';
    o_message = ''; 
	
	SELECT control_task_status INTO v_current_status  
	FROM ige_control_task 
	WHERE control_task_id = v_control_task_id;	
	v_control_task_status = v_current_status;
	
	IF v_current_status = STATUS_CLOSED THEN -- IF #1
	  o_status = 'Failed';
      o_message = 'Source was closed'; 
	ELSE  -- ELSE #1
	  -- Check all COMPLETED?
	  -- Get count of all active tasks for the source/control task
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
		IF cnt_incompleted = cnt_hold THEN  -- IF #3
	      v_control_task_status = STATUS_HOLD;
	    ELSE  -- ELSE #3
		  -- Check one of tasks is STARTED?
		  SELECT count(*) INTO cnt_started  
	      FROM ige_task 
	      WHERE control_task_id = v_control_task_id
	        AND trans_id_expire = -1
	        AND (task_status = STATUS_STARTED OR task_status = STATUS_COMPLETED);
		  IF cnt_started > 0 THEN -- IF #4
		    v_control_task_status = STATUS_IN_PROGRESS;
		  /*ELSE -- ELSE #4
		    -- Check one of the next task(s) is READY?
			-- Get the next sequence
			SELECT min(task_sequence) INTO v_task_seq
			FROM ige_task 
	        WHERE control_task_id = v_control_task_id
	          AND trans_id_expire = -1
			  AND task_status <> STATUS_COMPLETED;
			  
			SELECT count(*) INTO cnt_ready  
	        FROM ige_task 
	        WHERE control_task_id = v_control_task_id
	          AND trans_id_expire = -1
	          AND task_status = STATUS_STARTED;
			  */
		  END IF; -- END IF #4
		  
		END IF; -- END IF #3 
	  END IF;  -- END IF #2
	  
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
	END IF; -- END IF #1
  raise notice 'Control_task_id: %; Total tasks #:%; Total COMPLETED #:%; Total HOLD #:%; Current Status:%; New Status: %;', 
                v_control_task_id, cnt_tasks, cnt_completed, cnt_hold, v_current_status, v_control_task_status;
  SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message		     
	) c;		
  RETURN o_json;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
	DROP TABLE IF EXISTS tmp_ige_task;
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

ALTER FUNCTION network.update_control_task_status_by_tasks(numeric)
    OWNER TO network;
