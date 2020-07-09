-- FUNCTION: code_src.format_report_placeholder(text)

-- DROP FUNCTION code_src.format_report_placeholder(text);

CREATE OR REPLACE FUNCTION code_src.format_report_placeholder(
	v_string text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text; 
  v_date_string text;
  v_date_string_new text;
  v_format_string text;  
  v_start integer;
  v_end integer;
BEGIN  
/*
  Summary: 
    Format a report data: convert placeholder to the real data
  Testing:
    SELECT format_report_placeholder('Header[L][R][C]');
	SELECT format_report_placeholder('Dates: [TODAY] @ [TODAY]');
	SELECT format_report_placeholder('Dates: [DATE] @ [DATE]');
	SELECT format_report_placeholder('Dates: [TODAY:Month DD, YYYY] or [TODAY:YYYY-MM-DD]');
	SELECT format_report_placeholder('Dates: [DATE:Month DD, YYYY] or [DATE:YYYY-MM-DD]');
*/
  -- Replace alignment definition from table header
  retval = TRIM(REPLACE(v_string, '[L]', ''));
  retval = REPLACE(retval, '[R]', '');
  retval = REPLACE(retval, '[C]', '');
  -- Convert date placeholders [TODAY] and [DATE]
  retval = REPLACE(retval, '[DATE]', '[TODAY]');
  retval = REPLACE(retval, '[DATE:', '[TODAY:');
  retval = REPLACE(retval, '[TODAY]', TO_CHAR(current_timestamp, 'MM/DD/YYYY'));
  -- Date with format string
  WHILE POSITION('[TODAY:' IN retval) > 0 LOOP
    v_date_string = '[' || SUBSTRING(retval FROM '%#"TODAY:%]#"%' FOR '#' );
	v_start = POSITION('[TODAY:' IN v_date_string) + 7;
	v_end = LENGTH(v_date_string);
	v_format_string = SUBSTRING(v_date_string, v_start, v_end - v_start);
	v_date_string_new = TO_CHAR(current_timestamp, v_format_string);
	-- Remove extra spaces
	WHILE POSITION('  ' IN v_date_string_new) > 0 LOOP
	  v_date_string_new = REPLACE(v_date_string_new, '  ', ' ');
	END LOOP;	
	retval = REPLACE(retval, v_date_string, v_date_string_new);
	raise notice 'date string: %; formatting: %', v_date_string, v_format_string;
  END LOOP;
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	   
	RETURN 'Failed to format the string: ' || v_string || ' with error: ' || SQLERRM;
END;  
$BODY$;

ALTER FUNCTION code_src.format_report_placeholder(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.format_report_placeholder(text) TO network;

REVOKE ALL ON FUNCTION code_src.format_report_placeholder(text) FROM PUBLIC;
