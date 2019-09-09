-- FUNCTION: network.is_blank_id(text)

-- DROP FUNCTION network.is_blank_id(text);

CREATE OR REPLACE FUNCTION network.is_blank_id(
	str text)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$   
BEGIN
/*
    Summary:
	  Check if a string a blank id
    Testing:
	  SELECT is_blank_id('ABC')
	  SELECT is_blank_id('')
  */
  IF is_blank_string(str) THEN
    RETURN true;
  ELSE 
    RETURN str = '0';
  END IF;  
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN true;
END;  
$BODY$;

ALTER FUNCTION network.is_blank_id(text)
    OWNER TO network;
