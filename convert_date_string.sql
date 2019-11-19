-- FUNCTION: code_src.convert_date_string(text)

-- DROP FUNCTION code_src.convert_date_string(text);

CREATE OR REPLACE FUNCTION code_src.convert_date_string(
	v_dt_str text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text; 
  keystr text;
  cnt integer;
  str text;
BEGIN  
/*show search_path
    Summary:
	  Convert date string to the string used by Oracle SQL
    Testing:
	  -- from the string of '"2019-07-08 00:00:00", "2018-01-22 00:00:00"' to the string of TO_DATE('''2019-07-08 00:00:00''', ''YYYYMMDD HH24:MI:SS'')')
	  SELECT convert_date_string('2019-07-08 00:00:00') 
	  SELECT convert_date_string('ABC, 2019-07-08 00:00:00, CDE, 22, 2019-07-26 00:00:00') 
  */
  retval = v_dt_str;
  cnt = 0;
  str = array_to_string(REGEXP_MATCHES(retval, '\d{4}-\d{2}-\d{2} 00:00:00', 'i'),'!!');
  raise notice 'str:%', str;
  WHILE (str is not null) and (cnt < 5) LOOP
    --raise notice 'dims:%', array_ndims(REGEXP_MATCHES(retval, '\d{4}-\d{2}-\d{2} 00:00:00', 'i'));
    cnt = cnt + 1;
    SELECT substring(retval, (REGEXP_MATCHES(retval, '\d{4}-\d{2}-\d{2} 00:00:00', 'i'))[1]) INTO keystr;
	raise notice 'keystr:%', keystr;		
	retval = REPLACE(retval, keystr, REPLACE('TO_DATE(''[THEDATE]'', ''YYYY-MM-DD HH24:MI:SS'')', '[THEDATE]', REPLACE(keystr, '00:00:00', '00|||00|||00')));
    str = array_to_string(REGEXP_MATCHES(retval, '\d{4}-\d{2}-\d{2} 00:00:00', 'i'),'!!');
  END LOOP;  
  raise notice 'keystr:%', retval;
  retval = REPLACE(retval, '|||', ':');
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN v_dt_str;
END;  
$BODY$;

ALTER FUNCTION code_src.convert_date_string(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.convert_date_string(text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.convert_date_string(text) TO PUBLIC;

GRANT EXECUTE ON FUNCTION code_src.convert_date_string(text) TO network;

