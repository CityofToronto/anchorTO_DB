-- FUNCTION: network.get_predefined_task_info(text)

-- DROP FUNCTION network.get_predefined_task_info(text);

CREATE OR REPLACE FUNCTION network.get_predefined_task_info(
	in_source_class text)
    RETURNS json
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
AS $BODY$
  /*
    Summary:
	  Get pre-defined task information
    Testing:
	  select get_predefined_task_info('REPORT')
  */
SELECT to_json(row)
FROM
(
 SELECT 
  (	
	SELECT json_agg(row_to_json(a)) 
	FROM 
	 (SELECT CONTROL_TASK_TYPE AS name, sort_sequence
	  FROM dmn_source_class
	  WHERE trans_id_expire = -1
	   AND  source_class = upper($1)
	  ORDER BY sort_sequence
	 ) a
  ) AS control_task_type,  
  (
	 SELECT json_agg(row_to_json(b)) 
	 FROM 
	 (SELECT report_status AS name,description AS desc, sort_sequence
	  FROM dmn_report_status
	  WHERE trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) b
  ) AS report_status,	 
  (
	 SELECT json_agg(row_to_json(c)) 
	 FROM 
	 (SELECT report_type AS name,description AS desc, sort_sequence
	  FROM dmn_report_type
	  WHERE trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) c
   ) AS report_type,	 
  (
	 SELECT json_agg(row_to_json(d)) 
	 FROM 
	 (SELECT plan_status AS name,description AS desc, sort_sequence
	  FROM dmn_plan_status
	  WHERE trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) d
   ) AS plan_status,	 
  (
	 SELECT json_agg(row_to_json(d)) 
	 FROM 
	 (SELECT plan_type AS name,description AS desc, sort_sequence
	  FROM dmn_plan_type
	  WHERE trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) d
   ) AS plan_type,
   (	
	SELECT json_agg(row_to_json(f)) 
	FROM 
	 (SELECT s.control_task_type,
		     s.task_type,
		     t.description AS task_type_desc,
		     format_string(s.control_task_comments) AS control_task_comments,
		     s.assigned_to AS task_assigned_to	   
	  FROM ige_task_default s
	  JOIN dmn_task_type t ON s.task_type = t.task_type
	  JOIN dmn_source_class c ON s.control_task_type = c.control_task_type
	  WHERE c.source_class = upper($1) 
	    AND t.trans_id_expire = -1
	    AND c.trans_id_expire = -1
	  ORDER BY s.task_sequence
	 ) f
  ) AS default_task	
) row
 ;
$BODY$;

ALTER FUNCTION network.get_predefined_task_info(text)
    OWNER TO network;
