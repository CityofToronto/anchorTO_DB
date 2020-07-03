-- FUNCTION: code_src.format_report(text)

-- DROP FUNCTION code_src.format_report(text);

CREATE OR REPLACE FUNCTION code_src.format_report(
	v_string text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text;   
  html_base text;
BEGIN  
/*
  Summary: 
    Generate html report based on , & | seperated string;
  Testing:
    SELECT format_report('Source #,0|Task #,0|transaction #,0|Control task #,0|AMA #,0|LFN #,0')	
*/ 
  retval = v_string;
  html_base = '<html><style>table {border-collapse: collapse}</style><h2>[TITLE]</h2><table border = 1><tr><td>Stats Type</td><td>Stats Count</td></tr><tr><td>[DATA]</td></tr></table></html>';	
  retval = replace(retval, ',', '</td><td>');  
  retval = replace(retval,'|', '</td></tr><tr><td>');
  retval = replace(html_base,'[DATA]', retval);
  retval = replace(retval, '[TITLE]', to_char(current_timestamp, 'dd/MM/yyyy'));
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN v_string;
END;  
$BODY$;

ALTER FUNCTION code_src.format_report(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.format_report(text) TO network;

REVOKE ALL ON FUNCTION code_src.format_report(text) FROM PUBLIC;
