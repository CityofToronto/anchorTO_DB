-- FUNCTION: code_src.get_control_task_by_source_id(numeric, text)

-- DROP FUNCTION code_src.get_control_task_by_source_id(numeric, text);

CREATE OR REPLACE FUNCTION code_src.get_control_task_by_source_id(
	v_source_id numeric,
	v_filter text DEFAULT NULL::text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  v_sql text; 
  o_status text = '';
  o_message text = 'OK';
  v_result text;
BEGIN
/*
Summary: 
    Get tasks by source id
Testing:
    SELECT get_control_task_by_source_id(2070);
    SELECT get_control_task_by_source_id(2070, 'control_task_id = 70310');
*/
  IF position(';' in v_filter) > 0 THEN
    RAISE 'Invalid filter clause: %', v_filter USING ERRCODE = '20001';
  END IF;
  v_sql = ' 
  SELECT json_agg(row_to_json(c)) 
  FROM
  (
      SELECT 
			control_task_id,
			trans_id_create,
			source_id 
	  FROM ige_control_task 
	  WHERE source_id = [SOURCEID] 
	  [FILTER]
	  ORDER BY control_task_id	  
  ) c';
  
  v_sql = replace(v_sql, '[SOURCEID]', v_source_id::text);
  
  IF is_blank_string(v_filter) THEN
    v_sql = replace(v_sql, '[FILTER]', '');
  ELSE
    v_sql = replace(v_sql, '[FILTER]', ' AND (' || v_filter || ')' );
  END IF;
  RAISE NOTICE 'v_sql: %', v_sql;
  EXECUTE v_sql INTO v_result;
  RETURN v_result;
 /* EXCEPTION 
  WHEN OTHERS THEN
    o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) 
	FROM
	(
	  SELECT o_status status, 
	       o_message message		   
	) c;
 */   
END;
$BODY$;

ALTER FUNCTION code_src.get_control_task_by_source_id(numeric, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_control_task_by_source_id(numeric, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_control_task_by_source_id(numeric, text) TO network;

REVOKE ALL ON FUNCTION code_src.get_control_task_by_source_id(numeric, text) FROM PUBLIC;
