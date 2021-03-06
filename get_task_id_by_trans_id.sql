-- FUNCTION: code_src.get_task_id_by_trans_id(numeric)

-- DROP FUNCTION code_src.get_task_id_by_trans_id(numeric);

CREATE OR REPLACE FUNCTION code_src.get_task_id_by_trans_id(
	v_trans_id numeric)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
	SECURITY DEFINER 
AS $BODY$
DECLARE 
  taskid ige_task.task_id%TYPE;
BEGIN
/*
Summary: 
    Get task id by transaction id
Testing:
    SELECT get_task_id_by_trans_id(1000000682)
*/
  SELECT task_id INTO taskid
  FROM ige_transaction
  WHERE trans_id = v_trans_id 
	LIMIT 1;
  RETURN taskid;
EXCEPTION
  WHEN OTHERS THEN 
    taskid = NULL;
	RAISE NOTICE '%',SQLERRM;
	RETURN taskid;
END;  
$BODY$;

ALTER FUNCTION code_src.get_task_id_by_trans_id(numeric) OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.get_task_id_by_trans_id(numeric) TO anchorto_run