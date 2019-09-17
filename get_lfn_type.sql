-- FUNCTION: code_src.get_lfn_type() 

-- DROP FUNCTION code_src.get_lfn_type();

CREATE OR REPLACE FUNCTION code_src.get_lfn_type()
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE SECURITY DEFINER 
    ROWS 1000
AS $BODY$
/*
  Summary:
    Get LFN types
  Testing:
    SELECT get_lfn_type()
*/
   SELECT json_agg(row_to_json(c)) 
   FROM
   (	 
	   SELECT objectid,
	          linear_name_type_id,
	          type_part,
	          type_part_code,
	          CASE WHEN EXISTS (SELECT 1 FROM linear_name_evw WHERE UPPER(type_part) = UPPER(v.type_part)) THEN 'C'
	               WHEN EXISTS (SELECT 1 FROM linear_name_dm WHERE UPPER(type_part) = UPPER(v.type_part)) THEN 'H'
	               ELSE 'N' 
	          END usage_status
	   FROM linear_name_type_evw v	   
	   ORDER BY v.type_part
    ) c	
	;	
   $BODY$;

ALTER FUNCTION code_src.get_lfn_type()
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_lfn_type() TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_lfn_type() TO network;

