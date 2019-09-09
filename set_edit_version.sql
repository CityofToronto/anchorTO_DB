-- FUNCTION: network.set_edit_version(text, integer)

-- DROP FUNCTION network.set_edit_version(text, integer);

CREATE OR REPLACE FUNCTION network.set_edit_version(
	v_version_name text,
	edit_action integer)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
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

ALTER FUNCTION network.set_edit_version(text, integer)
    OWNER TO network;
