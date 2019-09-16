-- FUNCTION: code_src.get_new_task_type(text)

-- DROP FUNCTION code_src.get_new_task_type(text);

CREATE OR REPLACE FUNCTION code_src.get_new_task_type(
	in_control_task_type text)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
    ROWS 1000
	SECURITY DEFINER
AS $BODY$
/*
    Summary:
	  Get new task type
    Testing:
	  select get_new_task_type('PARCEL');
      select get_new_task_type('STREET/ADDRESS');
  */
SELECT json_agg(row_to_json(row)) 
FROM 
(
	SELECT t.task_type, t.description
    FROM  dmn_task_type t
    WHERE t.task_type IN 
	    (SELECT d.task_type 
         FROM ige_task_default d 
         WHERE d.control_task_type = $1)
    AND t.trans_id_expire = -1
	ORDER BY description
	
) row;
$BODY$;

ALTER FUNCTION code_src.get_new_task_type(text) OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.get_new_task_type(text) TO anchorto_run
