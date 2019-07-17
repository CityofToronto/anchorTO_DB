-- FUNCTION: network.get_sources()

-- DROP FUNCTION network.get_sources();

CREATE OR REPLACE FUNCTION network.get_sources(
	)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
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
	       t.plan_name,
	       t.internal_source_no AS int_id,
	       to_char(t.internal_source_date, 'YYYY-MM-DD') AS int_date,
	       t.external_source_no AS ext_id,
	       to_char(t.external_source_date, 'YYYY-MM-DD') AS ext_date,
	       k.control_task_status AS maint_status,
	       t.source_comments AS comment,
	       t.objectid
    FROM ige_source_evw t
    JOIN ige_control_task k ON t.source_id = k.source_id
	ORDER BY t.source_id
    ) c	
  ) AS source
) r	
	;	
   $BODY$;

ALTER FUNCTION network.get_sources()
    OWNER TO network;
