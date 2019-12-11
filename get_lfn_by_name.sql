-- FUNCTION: code_src.get_lfn_by_name(text)

-- DROP FUNCTION code_src.get_lfn_by_name(text);

CREATE OR REPLACE FUNCTION code_src.get_lfn_by_name(
	v_linear_name text)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE SECURITY DEFINER 
    ROWS 1000
AS $BODY$
/*
  Summary:
    Get LFN by name
  Testing:
    SELECT get_lfn_by_name('dyas')
	SELECT get_lfn_by_name('Highway')
*/
   SELECT json_agg(row_to_json(c)) 
   FROM
   (	 
	   SELECT * 
	   FROM 
	   (
			SELECT format_string(UPPER(n.name_part || ' ' || coalesce(n.type_part,'') || ' ' || coalesce(n.dir_part,''))) AS full_name, 
				   n.objectid,
				   n.linear_name_id,
				   n.name_part,
				   n.dir_part,
				   n.type_part,
		           n.duplication_desc
			FROM linear_name_evw n
			WHERE format_string(UPPER(n.name_part || coalesce(n.type_part,'') || coalesce(n.dir_part,''))) LIKE UPPER(replace(v_linear_name,' ', '%') || '%')
			  AND n.trans_id_expire = -1
		      AND use_by IN ('L', 'B')
		) t
		ORDER BY 1
    ) c	
	;	
   $BODY$;

ALTER FUNCTION code_src.get_lfn_by_name(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_lfn_by_name(text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_lfn_by_name(text) TO network;

REVOKE ALL ON FUNCTION code_src.get_lfn_by_name(text) FROM PUBLIC;
