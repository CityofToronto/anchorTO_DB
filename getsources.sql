-- FUNCTION: network.getsources()

-- DROP FUNCTION network.getsources();

CREATE OR REPLACE FUNCTION network.getsources(
	)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
    ROWS 1000
AS 
$BODY$
SELECT json_agg(row_to_json(r)) 
FROM
(SELECT s.source_id,
        s.source_class,
        c.description AS source_class_desc,
        s.source_type,
        t.description AS source_type_desc,
        s.internal_source_no,
        to_char(s.internal_source_date, 'DD-MM-YYYY') AS internal_source_date,
        COALESCE(s.external_source_no, '') AS external_source_no,
        COALESCE(to_char(s.external_source_date, 'DD-MM-YYYY'), '') AS external_source_date,
	    COALESCE(s.plan_name, '') AS plan_name,
		COALESCE(s.source_comments, '') AS source_comments,
	    COALESCE(s.source_status, '') AS source_status,
		COALESCE(p.description, '') AS source_status_desc,
		COALESCE(s.parent_source_id, 0) AS parent_source_id,
        s.trans_id_create
 FROM ige_source s
 JOIN dmn_source_class c ON s.source_class = c.source_class
 JOIN dmn_report_type t ON s.source_type = t.report_type
 JOIN dmn_plan_status p ON s.source_status = p.plan_status
 WHERE s.trans_id_expire = -1
 ORDER BY source_id
) r;
$BODY$;

ALTER FUNCTION network.getsources()  OWNER TO network;
