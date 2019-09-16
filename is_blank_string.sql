-- FUNCTION: code_src.is_blank_string(text)

-- DROP FUNCTION code_src.is_blank_string(text);

CREATE OR REPLACE FUNCTION code_src.is_blank_string(
	str text)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
	SECURITY DEFINER 
AS $BODY$   
BEGIN 
/*
Summary: 
  Check blank string
Testing: 
  SELECT is_blank_string('ABC')
*/
  RETURN str IS null 		
		OR trim(str) = ''
		OR trim(lower(str)) = 'null' ;  
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN true;
END;  
$BODY$;

ALTER FUNCTION code_src.is_blank_string(text)
    OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.is_blank_string(text) TO anchorto_run