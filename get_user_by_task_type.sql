-- FUNCTION: network.get_user_by_task_type(text)

-- DROP FUNCTION network.get_user_by_task_type(text);

CREATE OR REPLACE FUNCTION network.get_user_by_task_type(
	v_task_type text)
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
		(
	     SELECT
	      distinct  t.assigned_to AS username,
	      0 AS user_id,
	      t.assigned_to AS full_name,
		  'ACTIVE' AS status
	    FROM ige_task_default t 
	    WHERE t.task_type = $1 
		)
	    UNION ALL	    
	    (SELECT 
	       --t.task_type, 
	       --t.assigned_to, 
	       distinct u.username, 
	       u.user_id, 
	       u.full_name,
		   u.status
	    FROM ige_task_default t 
		JOIN ige_user_steward s ON t.assigned_to = s.steward_group
		JOIN ige_user u ON u.user_id = s.user_id --AND u.status = 'ACTIVE'
	    WHERE t.task_type = $1
		ORDER BY u.full_name
		)
    ) c	
  ) AS user
) r	
	;	
   $BODY$;

ALTER FUNCTION network.get_user_by_task_type(text)
    OWNER TO network;
