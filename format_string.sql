-- FUNCTION: code_src.format_string(text)

-- DROP FUNCTION code_src.format_string(text);

CREATE OR REPLACE FUNCTION code_src.format_string(
	v_string text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text;   
BEGIN  
/*
  Summary: 
    Format a string with trim space, replace one double-quotation mark with two single quotation mark
  Testing:
    SELECT format_string('ABC"DE')
*/
  retval = TRIM(REPLACE(v_string, '"', ''''));
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN v_string;
END;  
$BODY$;

ALTER FUNCTION code_src.format_string(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.format_string(text) TO network;

REVOKE ALL ON FUNCTION code_src.format_string(text) FROM PUBLIC;
