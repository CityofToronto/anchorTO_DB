-- FUNCTION: network.format_message(text, text)

-- DROP FUNCTION network.format_message(text, text);

CREATE OR REPLACE FUNCTION network.format_message(
	instring text,
	customval text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  msg text;   
BEGIN  
/*
  Summary: 
    Format a message
  Testing:
    SELECT format_message('Source Id <srcId>  new external_source_id <externalNo> is not unique','888')
*/
  IF customval IS NOT NULL THEN
    SELECT REGEXP_REPLACE(instring,'<.+?>',customval) INTO msg; 
  ELSE
    RETURN instring; 
  END IF;
  RETURN msg;
EXCEPTION 
  WHEN OTHERS THEN    
    RETURN '';
END;  
$BODY$;

ALTER FUNCTION network.format_message(text, text)
    OWNER TO network;
