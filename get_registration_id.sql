-- FUNCTION: code_src.get_registration_id(text, text)

-- DROP FUNCTION code_src.get_registration_id(text, text);

CREATE OR REPLACE FUNCTION code_src.get_registration_id(
	tableowner text,
	tablename text)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
	SECURITY DEFINER
AS $BODY$
DECLARE 
  rid sde.sde_table_registry.registration_id%TYPE;
BEGIN
/*
Summary:
    Get registration id of a table
Testing:
    SELECT get_registration_id('network', 'linear_name')
*/
  SELECT registration_id INTO rid
  FROM sde.sde_table_registry
  WHERE upper(owner)=upper(tableowner) and upper(table_name)=upper(tablename);
  RETURN rid;
EXCEPTION
  WHEN OTHERS THEN     
	RAISE NOTICE '%',SQLERRM;
	RETURN NULL;
END;  
$BODY$;

ALTER FUNCTION code_src.get_registration_id(text, text) OWNER TO network;
 GRANT EXECUTE ON FUNCTION code_src.get_registration_id(text, text) TO anchorto_run