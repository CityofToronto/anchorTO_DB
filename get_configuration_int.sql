-- FUNCTION: network.get_configuration_int(text, text, text, integer)

-- DROP FUNCTION network.get_configuration_int(text, text, text, integer);

CREATE OR REPLACE FUNCTION network.get_configuration_int(
	                                             v_category text,
	                                             v_type text,
	                                             v_name text,
	                                             v_default_value integer default null
	                                            )
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  retval integer;
  thevalue text;
BEGIN    
  SELECT get_configuration($1, $2, $3) INTO thevalue;  
  RAISE NOTICE '%', thevalue;
  IF thevalue IS NULL AND $4 IS NOT NULL THEN 
    RETURN $4;
  END IF;
  RETURN thevalue::integer;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
    RETURN $4;
END;  
$BODY$;

ALTER FUNCTION network.get_configuration_int(text, text, text, integer)
    OWNER TO network;
