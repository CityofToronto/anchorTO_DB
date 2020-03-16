-- FUNCTION: code_src.is_integer(text)

-- DROP FUNCTION code_src.is_integer(text);

CREATE OR REPLACE FUNCTION code_src.is_integer(
	v_string text)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text;   
BEGIN  
/*
  Summary: 
    Check if a string is a number
  Testing:
    SELECT is_integer('9999')
    SELECT is_integer('99.99')
	SELECT is_integer('99%A')
*/
  if $1 is not null then
     return (select $1 ~ '^([-+]?[0-9]+)$');
    else
     return false;
    end if;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN false;
END;  
$BODY$;

ALTER FUNCTION code_src.is_integer(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.is_integer(text) TO network;

REVOKE ALL ON FUNCTION code_src.is_integer(text) FROM PUBLIC;
