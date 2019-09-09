-- FUNCTION: network.get_configuration_bool(text, text, text, boolean)

-- DROP FUNCTION network.get_configuration_bool(text, text, text, boolean);

CREATE OR REPLACE FUNCTION network.get_configuration_bool(
	v_category text,
	v_type text,
	v_name text,
	v_default_value boolean DEFAULT false)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  retval boolean;
  thevalue text;
BEGIN  
/*
    Summary:
	  Get boolean setting from configuration table
    Testing:
	  select get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') 
  */
  retval = false;
  SELECT get_configuration($1, $2, $3) INTO thevalue;  
  RAISE NOTICE '%', thevalue;
  IF thevalue IS NULL AND $4 IS NOT NULL THEN 
    RETURN $4;
  END IF;
  RETURN upper(thevalue) = 'T' 
      OR upper(thevalue) = 'TRUE'
	  OR thevalue = '1'
	  OR upper(thevalue) = 'Y'
	  OR upper(thevalue) = 'YES'
	  OR upper(thevalue) = 'ON';
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
    RETURN $4;
END;  
$BODY$;

ALTER FUNCTION network.get_configuration_bool(text, text, text, boolean)
    OWNER TO network;
