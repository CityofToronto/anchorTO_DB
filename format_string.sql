-- FUNCTION: network.format_string(text)

-- DROP FUNCTION network.format_string(text);

CREATE OR REPLACE FUNCTION network.format_string(
	v_string text
	)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  retval text;   
BEGIN  
  retval = REPLACE(v_string, '"', '');
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN v_string;
END;  
$BODY$;

ALTER FUNCTION network.format_string(text)
    OWNER TO network;
