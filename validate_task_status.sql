-- FUNCTION: code_src.validate_task_status(text, numeric)

-- DROP FUNCTION code_src.validate_task_status(text, numeric);

CREATE OR REPLACE FUNCTION code_src.validate_task_status(
	v_status text,
	v_task_id numeric DEFAULT 0)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE   
  msg text = '';
  v_cur_status text;
BEGIN 
/*
    Summary:
	  Validate the task status
    Testing:
	  SELECT validate_task_status('COMPLETED')  --valid
	  SELECT validate_task_status('COMPLETED', 70315)  -- valid
	  SELECT validate_task_status('HOLD', 1000002242) --valid
	  SELECT * FROM validate_task_status('POSTED', 1000002242) --invalid
	  SELECT * FROM validate_task_status('TAKEN', 65792) --Ignored: from POSTED to TAKEN
	  
  */  
  IF v_task_id = 0 THEN
    IF EXISTS 
	  (SELECT * 
	   FROM dmn_task_status
	   WHERE task_status = UPPER(v_status)
		AND trans_id_expire = -1) THEN
		 msg = '';
	  ELSE 
		  msg = 'Invalid status';
	  END IF; 
  ELSE 
    SELECT task_status INTO v_cur_status FROM ige_task WHERE task_id = v_task_id;
	raise notice 'Changing from % to %:', v_cur_status, v_status;
	-- Check if allowed but ignored request
	IF EXISTS 
	  (SELECT * 
	   FROM task_status_flow 
	   WHERE UPPER(v_cur_status) = UPPER(status_from) 
	     AND UPPER(v_status) = UPPER(status_to)
	     AND ignored = 1
	     AND date_expiry is null) THEN 
	  msg = 'IGNORED';		
	ELSIF EXISTS 
	  (SELECT * 
	   FROM task_status_flow 
	   WHERE UPPER(v_cur_status) = UPPER(status_from) 
	     AND UPPER(v_status) = UPPER(status_to)
	     AND date_expiry is null) THEN 
	  msg = '';
	ELSE 
	  msg = format('Cannot change status from %1$s to %2$s', v_cur_status, v_status);
	END IF;
  END IF; -- End of IF v_task_id = 0	
  RETURN msg;
 EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
    RETURN 'Invalid status';
END;  
$BODY$;

ALTER FUNCTION code_src.validate_task_status(text, numeric)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.validate_task_status(text, numeric) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.validate_task_status(text, numeric) TO network;

REVOKE ALL ON FUNCTION code_src.validate_task_status(text, numeric) FROM PUBLIC;
