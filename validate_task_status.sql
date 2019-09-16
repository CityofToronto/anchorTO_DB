-- FUNCTION: code_src.validate_task_status(text)

-- DROP FUNCTION code_src.validate_task_status(text);

CREATE OR REPLACE FUNCTION code_src.validate_task_status(
	v_status text)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
	SECURITY DEFINER
AS $BODY$
DECLARE 
  retval boolean; 
BEGIN 
/*
    Summary:
	  Validate the task status
    Testing:
	  SELECT validate_task_status('COMPLETED')
  */
  retval = false;
  IF EXISTS 
  (SELECT * 
   FROM dmn_task_status
   WHERE task_status = UPPER(v_status)
    AND trans_id_expire = -1) THEN
     RETURN true;
  ELSE 
     RETURN false;
  END IF;  
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
    RETURN false;
END;  
$BODY$;

ALTER FUNCTION code_src.validate_task_status(text)  OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.validate_task_status(text) TO anchorto_run
