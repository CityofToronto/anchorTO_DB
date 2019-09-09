-- FUNCTION: network.get_predefined_task_info_details(text)

-- DROP FUNCTION network.get_predefined_task_info_details(text);

CREATE OR REPLACE FUNCTION network.get_predefined_task_info_details(
	in_source_class text,
	OUT result json)
    RETURNS json
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS 
$BODY$
DECLARE

    _temp json;
    _arr  text[];
BEGIN
  /*
    Summary:
	  Get pre-defined task information details
    Testing:
	  select get_predefined_task_info_details('Plan')
  */ 
        EXECUTE 'SELECT to_json(row) 
                 from 
                (select 
                    ( select json_agg(row_to_json(a)) 
                        from (select * from v_dmn_' || in_source_class|| '_status) a 
                    ) as source_status,
                    ( select json_agg(row_to_json(a)) 
                        from (select * from v_dmn_' || in_source_class|| '_type) a 
                    ) as source_type,
	            ( select json_agg(row_to_json(a)) 
	                from (select control_task_type as name from dmn_source_class where trans_id_expire = -1 
                              and source_class = upper('''||in_source_class||''') order by sort_sequence ) a
                    ) as control_task_type,
	            ( SELECT json_agg(row_to_json(f)) 
	              FROM 
	                (SELECT s.control_task_type,
		            s.task_type,
		            t.description AS task_type_desc,
		            format_string(s.control_task_comments) AS control_task_comments,
		            s.assigned_to AS task_assigned_to,
					s.task_sequence,
					( 
					  SELECT json_agg(row_to_json(r))
					  FROM (
					      (SELECT 0 AS user_id,
						         s.assigned_to username,
								 s.assigned_to full_name,
								 ''ACTIVE'' AS status)
						  UNION ALL
						  (
					      SELECT u.user_id,
						         u.username,
						  	     u.full_name,
								 u.status
					      FROM ige_user u
						  JOIN ige_user_steward ss ON u.user_id = ss.user_id
						  WHERE 
						     --u.status = ''ACTIVE'' AND
						     ss.steward_group = s.assigned_to
						  ORDER BY full_name
						  )
						  ) r
					) AS task_assigned_to_user_list
	                 FROM ige_task_default s
	                 JOIN dmn_task_type t ON s.task_type = t.task_type
	                 JOIN dmn_source_class c ON s.control_task_type = c.control_task_type
	                 WHERE c.source_class = upper('''||in_source_class||''') 
	                   AND t.trans_id_expire = -1
	                   AND c.trans_id_expire = -1
	                 ORDER BY s.task_sequence) f
                     ) as default_task

                ) row'
        INTO _temp;
        

    result := _temp;

    RETURN;
END
$BODY$;

ALTER FUNCTION network.get_predefined_task_info_details(text)
    OWNER TO network;
