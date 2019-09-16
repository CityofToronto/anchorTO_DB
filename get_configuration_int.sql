-- FUNCTION: code_src.get_configuration_int(text, text, text, integer)

-- DROP FUNCTION code_src.get_configuration_int(text, text, text, integer);

CREATE OR REPLACE FUNCTION code_src.get_configuration_int(
	v_category text,
	v_type text,
	v_name text,
	v_default_value integer DEFAULT NULL::integer)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval integer;
  thevalue text;
BEGIN  
/*
    Summary:
	  Get integer settings from configuration table
    Testing:
	  select get_configuration_int('anchorTO', 'ANCHORTO', 'sync_with_oracle') 
  */
  SELECT get_configuration($1, $2, $3) INTO thevalue;  
  RAISE NOTICE '%', thevalue;
  IF thevalue IS NULL AND $4 IS NOT NULL THEN 
    RETURN $4;
  END IF;
  RETURN thevalue::integer;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
    RETURN $4;
END;  
$BODY$;

ALTER FUNCTION code_src.get_configuration_int(text, text, text, integer) OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.get_configuration_int(text, text, text, integer) TO anchorto_run
