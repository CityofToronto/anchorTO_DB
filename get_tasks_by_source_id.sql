-- FUNCTION: code_src.get_tasks_by_source_id(numeric)

-- DROP FUNCTION code_src.get_tasks_by_source_id(numeric);

CREATE OR REPLACE FUNCTION code_src.get_tasks_by_source_id(
	v_source_id numeric)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$

/*
Summary: 
    Get tasks by source id
Testing:
    SELECT get_tasks_by_source_id(2070)
*/
  SELECT json_agg(row_to_json(c)) 
  FROM
  (
	  SELECT task_id,
			 control_task_id,
			 trans_id_create,
			 source_id 
	  FROM ige_task 
	  WHERE source_id = v_source_id 
		AND trans_id_expire = -1
	  ORDER BY task_id
  ) c;
 
$BODY$;

ALTER FUNCTION code_src.get_tasks_by_source_id(numeric)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_tasks_by_source_id(numeric) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_tasks_by_source_id(numeric) TO network;

REVOKE ALL ON FUNCTION code_src.get_tasks_by_source_id(numeric) FROM PUBLIC;
