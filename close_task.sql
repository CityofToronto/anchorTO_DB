-- FUNCTION: network.close_task(text, text, text, text)

-- DROP FUNCTION network.close_task(text, text, text, text);
/*
  Close a task
*/
CREATE OR REPLACE FUNCTION network.close_task(
	uname text,
	editversion text,
	uapplication text,
	ustatus text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE    
  userstatus text[] = '{"ABORTED","COMPLETED"}';
  vfound boolean;
  taskid ige_task.task_id%TYPE;
  taskstatus ige_task.task_status%TYPE;
  vversion ige_transaction.trans_name%TYPE;
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
	  IF LOWER(astatus) = LOWER($4) THEN
	    vfound = true;
	  END IF;	  
	END LOOP;
	IF NOT vfound THEN
	  RAISE 'Status must be member of (%)', retstatus USING ERRCODE = '20001';
	END IF;
	vversion = $2;
	SELECT get_task_id($2,$3) INTO taskid;
	
	SELECT task_status INTO taskstatus 
	FROM ige_task t
	WHERE t.task_id = taskid
	  AND t.task_type = $3
	  AND UPPER(t.assigned_to) = UPPER($1);
	  
	UPDATE ige_transaction
	  SET trans_status = $4,
	      date_end = NOW()
	WHERE (trans_status = 'OPEN' OR trans_status IS NULL)
      AND trans_name = vVersion;
	
	UPDATE ige_task
      SET task_status = $4
      where task_id = taskid
      and trans_id_expire = -1;
	-- Beginning of updating Oracle
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
	-- End of updating Oracle  
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
	o_message = 'Transaction '||$2|| ' by user ('|| upper($1) || ') not found or Transaction status not equal to "OPEN"';	
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

ALTER FUNCTION network.close_task(text, text, text, text)
    OWNER TO network;
