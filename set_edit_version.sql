-- FUNCTION: code_src.set_edit_version(text, integer)

-- DROP FUNCTION code_src.set_edit_version(text, integer);

CREATE OR REPLACE FUNCTION code_src.set_edit_version(
	v_version_name text,
	edit_action integer)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
	SECURITY DEFINER
AS $BODY$
DECLARE 
  retval integer;   
BEGIN 
/*
    Summary:
	  Set a version to edit mode (1) or not (2)
    Testing:
	  SELECT set_edit_version('TRANS81',1)
  */
  SELECT sde.sde_edit_version(v_version_name, edit_action) INTO retval;  
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
    RETURN -1;
END;  
$BODY$;

ALTER FUNCTION code_src.set_edit_version(text, integer) OWNER TO network;
 GRANT EXECUTE ON FUNCTION code_src.set_edit_version(text, integer) TO anchorto_run
