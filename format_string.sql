-- FUNCTION: network.format_string(text)

-- DROP FUNCTION network.format_string(text);

CREATE OR REPLACE FUNCTION network.format_string(
	v_string text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  retval text;   
BEGIN  
/*
  Summary: 
    Format a string with trim space, replace one double-quotation mark with two singel quoation mark
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

ALTER FUNCTION network.format_string(text)
    OWNER TO network;
