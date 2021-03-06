-- FUNCTION: network.get_task_by_user_name(text)

-- DROP FUNCTION network.get_task_by_user_name(text);

CREATE OR REPLACE FUNCTION network.get_task_by_user_name(
	v_user_name text)
    RETURNS json
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
AS $BODY$SELECT to_json(row)
FROM
(
 SELECT 
  (		  
	SELECT json_agg(row_to_json(a)) 
	FROM 
	 (
		 SELECT g1.*,
		        sc.source_class,
		        sc.source_type,
		        format_string(sc.internal_source_no) AS internal_source_no,
		        to_char(sc.internal_source_date, 'YYYY-MM-DD') internal_source_date,
		        format_string(sc.external_source_no) AS external_source_no,
		        to_char(sc.external_source_date, 'YYYY-MM-DD') external_source_date,
		        format_string(sc.plan_name) AS plan_name,
		        format_string(sc.source_comments) AS source_comments
		 FROM 
		 (
			 SELECT t.task_id, 
					t.task_type, 
					t.source_id, 
					t.assigned_to, 
				   -- t.taken_by, 
					t.task_sequence, 
					t.task_status, 
					format_string(t.task_comments) AS task_comments, 
					t.control_task_id, 
					t.task_category, 
					t.trans_id_create
			 FROM ige_task t
			 JOIN ige_control_task c ON t.control_task_id = c.control_task_id 
			 JOIN -- Get min task_sequence for each control_task
			 (
				 SELECT tt.control_task_id, min(tt.task_sequence) min_seq
				 FROM ige_task tt
				 WHERE tt.task_status <> 'COMPLETED' 
				   AND tt.taken_by is null
				   AND tt.trans_id_expire = -1
				 GROUP BY tt.control_task_id
			 ) mc ON mc.control_task_id = c.control_task_id
			 WHERE t.task_status = 'READY'
			   AND t.taken_by is null
			   AND t.trans_id_expire = -1
			   AND 
				 (
					 UPPER(t.assigned_to) = UPPER(v_user_name)
				 OR t.assigned_to IN 
					 (
						 SELECT s.steward_group 
						 FROM ige_user_steward s 
						 JOIN ige_user u ON u.user_id = s.user_id 
						 WHERE UPPER(u.username) = UPPER(v_user_name)
					 ) 
				 )
			   AND c.trans_id_expire = -1 
			   AND c.control_task_status IN ('READY', 'IN PROGRESS')
			   AND t.task_sequence = mc.min_seq
		  ) g1
		  JOIN ige_source_evw sc ON sc.source_id = g1.source_id
		  ORDER BY 1
	 ) a
  ) AS tasks 
	 

) row
 ;
$BODY$;

ALTER FUNCTION network.get_task_by_user_name(text)
    OWNER TO network;
