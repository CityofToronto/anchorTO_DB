-- FUNCTION: code_src.format_string_to_validate(text)

-- DROP FUNCTION code_src.format_string_to_validate(text);

CREATE OR REPLACE FUNCTION code_src.format_string_to_validate(
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
    Format a string with removing space, replace one double-quotation mark with two singel quoation mark
  Testing:
    SELECT format_string_to_validate('sABC"DE')
*/
  retval = UPPER(REPLACE(REPLACE(v_string, '"', ''''), ' ', ''));
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN v_string;
END;  
$BODY$;

ALTER FUNCTION code_src.format_string_to_validate(text)
    OWNER TO network;
