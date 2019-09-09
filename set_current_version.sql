-- FUNCTION: network.set_current_version(text)

-- DROP FUNCTION network.set_current_version(text);

CREATE OR REPLACE FUNCTION network.set_current_version(
	v_version_name text)
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
    Set current version to a specific version
  Testing:
    SELECT sde.sde_set_current_version('myedits12111');
*/
  SELECT sde.sde_set_current_version(v_version_name) INTO retval;  
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
    RETURN -1;
END;  
$BODY$;

ALTER FUNCTION network.set_current_version(text)
    OWNER TO network;
