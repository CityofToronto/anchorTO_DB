-- FUNCTION: code_src.update_trans_status(numeric, text)

-- DROP FUNCTION code_src.update_trans_status(numeric, text);

CREATE OR REPLACE FUNCTION code_src.update_trans_status(
	v_trans_id numeric,
	v_status text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE    
/*
    Summary:
	  Update transaction status by transaction id
    Testing:
	  select code_src.update_trans_status(296388, 'COM')
	  select code_src.update_trans_status(296388, 'ABORTED')
	  select code_src.update_trans_status(296388, 'COMPLETED') 
	  SELECT * FROM ige_transaction where trans_id = 296388
 */
  userstatus text[] = '{"ABORTED","COMPLETED", "WORK STOPPED"}';
  vfound boolean;
  taskid ige_task.task_id%TYPE;
  taskstatus ige_task.task_status%TYPE;
  o_status text;
  o_message text;  
  o_json text;  
  astatus text;
  retstatus text;
BEGIN
    o_status = 'OK';
    o_message = '';	
	taskid = -1;
	vfound = false;
	retstatus = '';
    FOREACH astatus IN ARRAY userstatus	LOOP
	  retstatus = TRIM(retstatus) || ' ' || astatus;
	  IF LOWER(astatus) = LOWER(v_status) THEN
	    vfound = true;
	  END IF;	  
	END LOOP;
	IF NOT vfound THEN
	  RAISE 'Status must be member of (%)', retstatus USING ERRCODE = '20001';
	END IF;
	
	UPDATE ige_transaction
	  SET trans_status = UPPER(v_status),
	      date_end = NOW()
	WHERE trans_id = v_trans_id;
	/*-- Beginning of updating Oracle
	 IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN 
       UPDATE imaint_anchor.ige_transaction
	   SET trans_status = UPPER(v_status),
	       date_end = NOW()
	     WHERE trans_id = v_trans_id;
	 END IF;
	 -- End of updating Oracle 	*/
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

ALTER FUNCTION code_src.update_trans_status(numeric, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_trans_status(numeric, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_trans_status(numeric, text) TO network;

REVOKE ALL ON FUNCTION code_src.update_trans_status(numeric, text) FROM PUBLIC;
