-- FUNCTION: network.validate_task_status(text)

-- DROP FUNCTION network.validate_task_status(text);

CREATE OR REPLACE FUNCTION network.validate_task_status(
	v_status text)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
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

ALTER FUNCTION network.validate_task_status(text)
    OWNER TO network;
