-- FUNCTION: code_src.get_source_by_id_core(integer)

-- DROP FUNCTION code_src.get_source_by_id_core(integer);

CREATE OR REPLACE FUNCTION code_src.get_source_by_id_core(
	v_source_id integer)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
	SECURITY DEFINER
AS $BODY$
DECLARE   
  transname text;
  o_status text;
  o_message text;  
  o_json text;  
  retval integer;  
BEGIN
  /*
    Summary:
	  Get source information by source id
    Testing:
	  select get_source_by_id_core(1699);
  */
    o_status = 'OK';
    o_message = '';
	o_json = '';	
	retval = 0;
    SELECT to_json(row) INTO o_json
    FROM
	(
	  SELECT t.*,
			 ct.control_task_id,
			 ct.control_task_status,
			 ct.control_task_type,
			 format_string(ct.control_task_comments) AS control_task_comments,
			(
			  SELECT json_agg(row_to_json(c))
			  FROM (	
				  SELECT task_id, 
				         task_type, 
				         source_id, 
				         assigned_to, 
				         taken_by, 
				         task_sequence, 
				         task_status, 
				         format_string(task_comments) AS task_comments, 
						 control_task_id, 
						 task_category, 
						 trans_id_create, 
						 trans_id_expire
				  FROM ige_task ts
				  WHERE ts.control_task_id = ct.control_task_id 
				    AND ts.trans_id_expire = -1
				  ORDER BY task_sequence --task_id
			  ) c
			) AS tasks,
			 o_status return_status, 
			 o_message return_message
	  FROM ige_source_evw t
	  LEFT JOIN ige_control_task ct ON t.source_id = ct.source_id 		  
	  WHERE t.source_id = v_source_id
	) row;
	--raise notice 'json:%', o_json;		
	IF o_json IS NULL THEN
	  raise notice 'No data found.';	
	  SELECT to_json(row) INTO o_json
		FROM
		(
		  SELECT v_source_id AS source_id,
				 null AS source_class,
				 null AS source_type,
				 null AS internal_source_no,
				 null AS internal_source_date,
				 null AS external_source_no,
				 null AS external_source_date,
				 null AS plan_name,
				 null AS source_comments,
				 null AS source_status,
				 null AS parent_source_id,
				 null AS trans_id_create,
				 null AS trans_id_expire,		
				 null AS control_task_id,
				 null AS control_task_status,
				 null AS control_task_type,
				 null AS control_task_comments,
				 (
				  SELECT row_to_json(c)
				  FROM (	
						SELECT null AS task_id, 
							   null AS task_type,
							   null AS source_id,
							   null AS assigned_to,
							   null AS taken_by,
							   null AS task_sequence,
							   null AS task_status,
							   null AS task_comments,
							   null AS control_task_id,
							   null AS task_category,
							   null AS trans_id_create,
							   null AS trans_id_expire
					  FROM ige_task where task_id = 1
				  ) c
				) AS tasks,
				 o_status return_status, 
				 o_message return_message	  
		) row;		
	END IF;
	RETURN o_json;
EXCEPTION 
  WHEN OTHERS THEN    
    o_status = SQLSTATE;
	o_message = SQLERRM;
	raise notice 'No data found in Exception.';
	SELECT to_json(row) INTO o_json
    FROM
	(
	  SELECT 0 AS source_id,
		     null AS source_class,
		     null AS source_type,
		     null AS internal_source_no,
		     null AS internal_source_date,
		     null AS external_source_no,
		     null AS external_source_date,
		     null AS plan_name,
		     null AS source_comments,
		     null AS source_status,
		     null AS parent_source_id,
		     null AS trans_id_create,
		     null AS trans_id_expire,		
			 null AS control_task_id,
			 null AS control_task_status,
			 null AS control_task_type,
			 null AS control_task_comments,
			 (
			  SELECT row_to_json(c)
			  FROM (	
				    SELECT null AS task_id, 
						   null AS task_type,
						   null AS source_id,
						   null AS assigned_to,
						   null AS taken_by,
						   null AS task_sequence,
						   null AS task_status,
						   null AS task_comments,
						   null AS control_task_id,
						   null AS task_category,
						   null AS trans_id_create,
						   null AS trans_id_expire
				  FROM ige_task where task_id = 1
			  ) c
			) AS tasks,
			 o_status return_status, 
			 o_message return_message	  
	) row;		
    RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.get_source_by_id_core(integer) OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.get_source_by_id_core(integer) TO anchorto_run