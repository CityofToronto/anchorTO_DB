-- FUNCTION: network.get_registration_id(text, text)

-- DROP FUNCTION network.get_registration_id(text, text);

CREATE OR REPLACE FUNCTION network.get_registration_id(
	tableowner text,
	tablename text)
    RETURNS sde.sde_table_registry.registration_id%TYPE
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  rid sde.sde_table_registry.registration_id%TYPE;
BEGIN
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

ALTER FUNCTION network.get_registration_id(text, text)
    OWNER TO network;
