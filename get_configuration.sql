-- FUNCTION: code_src.get_configuration(text, text, text, text)

-- DROP FUNCTION code_src.get_configuration(text, text, text, text);

CREATE OR REPLACE FUNCTION code_src.get_configuration(
	v_category text,
	v_type text,
	v_name text,
	v_default_value text DEFAULT NULL::text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text;   
BEGIN  
/*show search_path
    Summary:
	  Get settings from configuration table
    Testing:
	  SELECT get_configuration('anchorTO', 'ANCHORTO', 'sync_with_oracle') 
  */
  IF EXISTS (SELECT * FROM configuration WHERE upper(category) = upper($1) AND upper(type) = upper($2) AND upper(name) = upper($3)) THEN
    SELECT value INTO retval FROM configuration WHERE upper(category) = upper($1) AND upper(type) = upper($2) AND upper(name) = upper($3);
	RAISE NOTICE '%', retval;	
  END IF;
  IF retval IS NULL THEN
    retval = $4;
  END IF;
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN $4;
END;  
$BODY$;

ALTER FUNCTION code_src.get_configuration(text, text, text, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_configuration(text, text, text, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_configuration(text, text, text, text) TO network;

