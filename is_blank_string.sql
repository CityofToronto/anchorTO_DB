-- FUNCTION: network.is_blank_string(text)

-- DROP FUNCTION network.is_blank_string(text);

CREATE OR REPLACE FUNCTION network.is_blank_string(
	str text)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$   
BEGIN  
/*
    Summary:
	  Check if a string is blank  
    Testing:
	  SELECT is_blank_string(' ')
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

ALTER FUNCTION network.is_blank_string(text)
    OWNER TO network;
