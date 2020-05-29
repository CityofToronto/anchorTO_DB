-- FUNCTION: code_src.get_task_id(text, text)

-- DROP FUNCTION code_src.get_task_id(text, text);

CREATE OR REPLACE FUNCTION code_src.get_task_id(
	vversion text,
	appcode text)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  taskid ige_task.task_id%TYPE;
BEGIN
  SELECT task_id INTO taskid
  FROM ige_transaction
  WHERE (trans_status = 'OPEN' OR is_blank_string(trans_status))
    AND application_code = $2
    AND trans_name = $1 
	LIMIT 1;
  RETURN taskid;
EXCEPTION
  WHEN OTHERS THEN 
    taskid = NULL;
	RAISE NOTICE '%',SQLERRM;
	RETURN taskid;
END;  
$BODY$;

ALTER FUNCTION code_src.get_task_id(text, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_task_id(text, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_task_id(text, text) TO network;

REVOKE ALL ON FUNCTION code_src.get_task_id(text, text) FROM PUBLIC;
