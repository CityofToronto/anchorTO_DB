-- FUNCTION: code_src.get_task_id_txt_by_trans_id(numeric)

-- DROP FUNCTION code_src.get_task_id_txt_by_trans_id(numeric);

CREATE OR REPLACE FUNCTION code_src.get_task_id_txt_by_trans_id(
	v_trans_id numeric)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  taskid ige_task.task_id%TYPE;
  o_status text;
  o_message text;  
  o_json text; 
BEGIN
/*
Summary: 
    Get task id by transaction id
Testing:
    SELECT get_task_id_by_trans_id(1000000682)
*/
  o_status = 'OK';
  o_message = '';
  SELECT task_id INTO taskid
  FROM ige_transaction
  WHERE trans_id = v_trans_id 
	LIMIT 1;
  SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   taskid AS id
	) c;
    RETURN o_json; 
EXCEPTION
  WHEN OTHERS THEN 
    RAISE NOTICE '%', SQLERRM;
	o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   -1 AS id
	) c;
    RETURN o_json; 
END;  
$BODY$;

ALTER FUNCTION code_src.get_task_id_txt_by_trans_id(numeric)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_task_id_txt_by_trans_id(numeric) TO anchorto_run;

REVOKE EXECUTE ON FUNCTION code_src.get_task_id_txt_by_trans_id(numeric) FROM PUBLIC;

GRANT EXECUTE ON FUNCTION code_src.get_task_id_txt_by_trans_id(numeric) TO network;

