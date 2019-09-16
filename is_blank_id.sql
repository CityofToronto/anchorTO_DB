-- FUNCTION: code_src.is_blank_id(text)

-- DROP FUNCTION code_src.is_blank_id(text);

CREATE OR REPLACE FUNCTION code_src.is_blank_id(
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

ALTER FUNCTION code_src.is_blank_id(text)
    OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.is_blank_id(text) TO anchorto_run