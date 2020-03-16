-- FUNCTION: code_src.get_sources()

-- DROP FUNCTION code_src.get_sources();

CREATE OR REPLACE FUNCTION code_src.get_sources(
	)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE SECURITY DEFINER 
    ROWS 1000
AS $BODY$
  /*
    Summary:
	  Get all sources information
    Testing:
	  SELECT get_sources()
  */
SELECT to_json(r)
FROM 
(
  SELECT 
  (
   SELECT json_agg(row_to_json(c)) 
   FROM
   (
	SELECT t.source_id,
	       t.source_class AS class,
	       t.source_type AS type,
	       t.source_status AS status,
	       format_string(t.plan_name) AS plan_name,
	       format_string(t.internal_source_no) AS int_id,
	       to_char(t.internal_source_date, 'YYYY-MM-DD') AS int_date,
	       format_string(t.external_source_no) AS ext_id,
	       to_char(t.external_source_date, 'YYYY-MM-DD') AS ext_date,
	       k.control_task_status AS maint_status,
	       --format_string(t.source_comments) AS comment,
	       t.source_comments AS comment,
	       t.objectid
    FROM ige_source_evw t
    JOIN ige_control_task k ON t.source_id = k.source_id
	WHERE t.source_id > 99   
	ORDER BY t.source_id DESC
    ) c	
  ) AS source
) r	
	;	
   $BODY$;

ALTER FUNCTION code_src.get_sources()
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_sources() TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_sources() TO network;

REVOKE ALL ON FUNCTION code_src.get_sources() FROM PUBLIC;
