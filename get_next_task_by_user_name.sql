-- FUNCTION: code_src.get_next_task_by_user_name(text)

-- DROP FUNCTION code_src.get_next_task_by_user_name(text);

CREATE OR REPLACE FUNCTION code_src.get_next_task_by_user_name(
	v_user_name text)
    RETURNS json
    LANGUAGE 'sql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
/*
    Summary:
	  Get next task(s) by user name
    Testing:
	  select get_next_task_by_user_name('sarzand');
	  select get_next_task_by_user_name('slee5');
  */
SELECT to_json(row)
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
				 WHERE tt.task_status IN (SELECT task_status FROM dmn_task_status WHERE task_status NOT IN ( 'HOLD', 'COMPLETED')) 				   
				   AND (is_blank_string(tt.taken_by) OR upper(tt.taken_by) = upper(v_user_name))
				   AND tt.trans_id_expire = -1
				 GROUP BY tt.control_task_id
			 ) mc ON mc.control_task_id = c.control_task_id
			 WHERE t.task_status IN (SELECT task_status FROM dmn_task_status WHERE task_status NOT IN ( 'HOLD', 'COMPLETED')) 
			   AND t.task_type IN ('LINEARNAME', 'AMA') -- For phase 1 only and this should be removed in phase 2 
			   AND (is_blank_string(t.taken_by) OR upper(t.taken_by) = upper(v_user_name))
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
			    --     (SELECT control_task_status FROM dmn_control_task_status WHERE control_task_status NOT IN ('COMPLETED','CLOSED'))
			   AND t.task_sequence = mc.min_seq
		  ) g1
		  JOIN ige_source_evw sc ON sc.source_id = g1.source_id
		  ORDER BY 1
	 ) a
  ) AS tasks 
	 

) row
 ;
$BODY$;

ALTER FUNCTION code_src.get_next_task_by_user_name(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_next_task_by_user_name(text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_next_task_by_user_name(text) TO network;

REVOKE ALL ON FUNCTION code_src.get_next_task_by_user_name(text) FROM PUBLIC;
