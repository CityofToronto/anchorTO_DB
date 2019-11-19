-- FUNCTION: code_src.delete_transaction_by_task_id(numeric)

-- DROP FUNCTION code_src.delete_transaction_by_task_id(numeric);

CREATE OR REPLACE FUNCTION code_src.delete_transaction_by_task_id(
	taskid numeric)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE     
  o_status text;
  o_message text;  
  o_json text;    
BEGIN
/*
  Summary: 
    Delete a transaction by a task id.
  Testing:
    SELECT delete_transaction_by_task_id(123);
*/
    o_status = 'OK';
    o_message = '';	
	
	DELETE FROM ige_transaction
	  WHERE task_id = $1;
	-- disable ige_transaction sync for now
	/*-- Beginning of updating Oracle
	IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN 
		DELETE FROM imaint_anchor.ige_transaction
		  WHERE task_id = $1;
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

ALTER FUNCTION code_src.delete_transaction_by_task_id(numeric)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.delete_transaction_by_task_id(numeric) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.delete_transaction_by_task_id(numeric) TO network;

REVOKE ALL ON FUNCTION code_src.delete_transaction_by_task_id(numeric) FROM PUBLIC;
