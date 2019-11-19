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
  v_min_task_seq numeric(4,1) ; 
BEGIN 
    o_status = 'OK';
    o_message = ''; 
	
	SELECT control_task_status INTO v_current_status  
	FROM ige_control_task 
	WHERE control_task_id = v_control_task_id;	
	v_control_task_status = v_current_status;
	
--	IF v_current_status = STATUS_CLOSED THEN -- IF #1
--	  o_status = 'Failed';
--      o_message = 'Source was closed'; 
--	ELSE  -- ELSE #1
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
		/*-- Beginning of updating Oracle
	    IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN -- IF #6
		  UPDATE imaint_anchor.ige_control_task 
	      SET control_task_status = v_control_task_status
		  WHERE control_task_id = v_control_task_id;  
		END IF;  -- END IF #6
	    -- End of updating Oracle  	*/	
	  END IF; -- END IF #5			  
--	END IF; -- END IF #1
  raise notice 'Control_task_id: %; Total tasks #:%; Total COMPLETED #:%; Total HOLD #:%; Total Started: %; 1st Incompleted task SEQ: %; Current Status:%; New Status: %;', 
                v_control_task_id, cnt_tasks, cnt_completed, cnt_hold, cnt_started, v_min_task_seq,v_current_status, v_control_task_status;
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
