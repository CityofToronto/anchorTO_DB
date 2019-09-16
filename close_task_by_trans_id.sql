-- FUNCTION: code_src.close_task_by_trans_id(text, numeric, text)

-- DROP FUNCTION code_src.close_task_by_trans_id(text, numeric, text);

CREATE OR REPLACE FUNCTION code_src.close_task_by_trans_id(
	v_user_name text,
	v_trans_id numeric,
	v_status text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
	SECURITY DEFINER 
AS $BODY$
DECLARE    
/*
    Summary:
	  Close a task by transaction id
    Testing:
	  select close_task_by_trans_id('slee333', 296388,'ABORTED') 
	  select * from ige_transaction where trans_id = 296388
	  select * from ige_task where task_id = 160036
	  
	  select close_task_by_trans_id('slee333', 296388,'COMPLETED') 
	  select * from ige_transaction where trans_id = 296388
	  select * from ige_task where task_id = 160036
  */
  userstatus text[] = '{"ABORTED","COMPLETED"}';
  vfound boolean;
  taskid ige_task.task_id%TYPE;
  taskstatus ige_task.task_status%TYPE;
  vversion ige_transaction.trans_name%TYPE;
  o_status text;
  o_message text;  
  o_json text;  
  ret_json text;
  ret_status text;
  ret_msg text;
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
	SELECT get_task_id_by_trans_id(v_trans_id) INTO taskid;
	
	/*SELECT task_status INTO taskstatus 
 	FROM ige_task t
	WHERE t.task_id = taskid	 
	  AND UPPER(t.assigned_to) = UPPER($1);*/
	  
	SELECT update_trans_status(v_trans_id, v_status) INTO ret_json;
	SELECT ret_json::json->>'status',
	       ret_json::json->>'message'
    INTO  ret_status,
	      ret_msg;
	IF ret_status <> 'OK' THEN
	  RAISE EXCEPTION USING
            errcode= ret_status,
            message= ret_msg;
	END IF;
	
	UPDATE ige_task
      SET task_status = UPPER(v_status)
      where task_id = taskid
      and trans_id_expire = -1;
	/*-- Beginning of updating Oracle
	IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
		UPDATE imaint_oracle.ige_transaction
		  SET trans_status = $4,
			  date_end = NOW()
		WHERE (trans_status = 'OPEN' OR trans_status IS NULL)
		  AND trans_name = vVersion;
		UPDATE imaint_oracle.ige_task
		  SET task_status = $4
		  where task_id = taskid
		  and trans_id_expire = -1;
	END IF;	  
	-- End of updating Oracle  */
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message		  
	) c;
	RETURN o_json;
EXCEPTION 
  --WHEN SQLSTATE '20001' THEN      
  WHEN NO_DATA_FOUND THEN 
    o_status = SQLSTATE;
	o_message = 'Transaction '||v_trans_id|| ' by user ('|| upper(v_user_name) || ') not found or Transaction status not equal to "OPEN"';	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	         o_message message
	) c;
    RETURN o_json;
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

ALTER FUNCTION code_src.close_task_by_trans_id(text, numeric, text) OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.close_task_by_trans_id(text, numeric, text) TO anchorto_run
