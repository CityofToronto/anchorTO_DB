-- FUNCTION: code_src.update_control_task_status_by_tasks(numeric, boolean)

-- DROP FUNCTION code_src.update_control_task_status_by_tasks(numeric, boolean);

CREATE OR REPLACE FUNCTION code_src.update_control_task_status_by_tasks(
	v_control_task_id numeric,
	v_close_source boolean)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
/*
    Summary:
	  Update control task status when any task is updated
    Testing:
	  SELECT update_control_task_status_by_tasks(1000000016, TRUE);
	  SELECT update_control_task_status_by_tasks(6003, FALSE);
  */
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
  STATUS_STARTED text = 'TAKEN'; 
  cnt_tasks integer = 0;
  cnt_completed integer = 0;   
  cnt_first_hold integer = 0;
  cnt_first_incompleted integer = 0;
  cnt_started integer = 0; 
  v_trans_id_expire integer;
  v_control_task_status text;
  v_current_status text = '';
  v_task_seq integer = -1;
  v_min_task_seq numeric(4,1) ; 
BEGIN 
    o_status = 'OK';
    o_message = ''; 
	
	SELECT control_task_status INTO v_current_status  
	FROM ige_control_task 
	WHERE control_task_id = v_control_task_id;	
	v_control_task_status = STATUS_READY;  	
	 
	  -- Get count of all active tasks 
	  SELECT count(*) INTO cnt_tasks  
	  FROM ige_task 
	  WHERE control_task_id = v_control_task_id
	    AND trans_id_expire = -1;
	 	
	  -- Get count of all active completed tasks
	  SELECT count(*) INTO cnt_completed  
	  FROM ige_task 
	  WHERE control_task_id = v_control_task_id
	    AND trans_id_expire = -1
	    AND task_status = STATUS_COMPLETED;
		
	  IF cnt_tasks = cnt_completed THEN -- IF #1
	    v_control_task_status = STATUS_COMPLETED;
	  ELSE -- ELSE #1	    
	    -- Check 1st / next (if there is completed task) tasks all HOLD?
		-- Get lowest incompleted task sequence
		SELECT MIN(task_sequence) INTO v_min_task_seq
		  FROM ige_task 
		  WHERE control_task_id = v_control_task_id
	        AND trans_id_expire = -1
			AND task_status <> STATUS_COMPLETED;
	    -- Get count of 1st/next HOLD tasks 
	    SELECT count(*) INTO cnt_first_hold  
	    FROM ige_task 
	    WHERE control_task_id = v_control_task_id
	      AND trans_id_expire = -1
	      AND task_status = STATUS_HOLD
		  AND task_sequence = v_min_task_seq; 
		-- Get count of first/next incompleted tasks  
	    SELECT count(*) INTO cnt_first_incompleted  
	    FROM ige_task 
	    WHERE control_task_id = v_control_task_id
	      AND trans_id_expire = -1	       
		  AND task_status <> STATUS_COMPLETED
		  AND task_sequence = v_min_task_seq;   	  		 
	      -- Check if all the 1st/next tasks are HOLD?		
		  Raise notice 'Checking if all 1st task(s) are HELD? Current status:%',v_control_task_status;
		  IF cnt_first_incompleted = cnt_first_hold THEN 
			  Raise notice 'To be hold due to 1st HOLD task. Current status:%', v_control_task_status;
		      v_control_task_status = STATUS_HOLD;
			  Raise notice 'Set to HOLD: Current status:%',v_control_task_status;
		  ELSE 
		      -- Check one of tasks is STARTED?
			  SELECT count(*) INTO cnt_started  
			  FROM ige_task 
			  WHERE control_task_id = v_control_task_id
				AND trans_id_expire = -1
				AND not is_blank_string(taken_by);
			  IF cnt_started > 0 or cnt_completed > 0 THEN  
				 v_control_task_status = STATUS_IN_PROGRESS;		   			  
			  END IF;  
		  END IF;	
	  END IF;  -- END IF #1	  
	  
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
	  IF v_current_status <> v_control_task_status THEN 
	    UPDATE ige_control_task 
	      SET control_task_status = v_control_task_status
		  WHERE control_task_id = v_control_task_id;		
	  END IF; 		  
  raise notice 'Control_task_id: %; Total tasks #:%; Total COMPLETED #:%; Total Started: %; 1st Incompleted task SEQ: %; 1st hold #:%; 1st incompleted #:%; Current Status:%; New Status: %;', 
                v_control_task_id, cnt_tasks, cnt_completed, cnt_started, v_min_task_seq, cnt_first_hold, cnt_first_incompleted, v_current_status, v_control_task_status;
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

ALTER FUNCTION code_src.update_control_task_status_by_tasks(numeric, boolean)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_control_task_status_by_tasks(numeric, boolean) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_control_task_status_by_tasks(numeric, boolean) TO network;

REVOKE ALL ON FUNCTION code_src.update_control_task_status_by_tasks(numeric, boolean) FROM PUBLIC;
