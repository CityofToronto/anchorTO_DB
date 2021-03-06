-- FUNCTION: code_src.update_tasks(json, numeric, numeric, text, numeric, numeric, text)

-- DROP FUNCTION code_src.update_tasks(json, numeric, numeric, text, numeric, numeric, text);

CREATE OR REPLACE FUNCTION code_src.update_tasks(
	v_task json,
	v_source_id numeric,
	v_control_task_id numeric,
	v_task_category text,
	v_trans_id_create numeric,
	v_trans_id_expire numeric,
    v_userid text DEFAULT ''::text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
/*
    Summary:
	  Update tasks information
    Testing:
	  SELECT update_tasks('[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD","deleted":false }]'::json,
						     10005,
						     20005,
						    'SUPERVISOR DEFINED',
						    10006,
						    -1);
  */
  theid numeric(12,0); 
  v_task_json json;
  msg text;
  o_json text;
  o_status text;
  o_message text;
  v_sql text;
  dmsg text;
BEGIN 
    o_status = 'OK';
    o_message = ''; 
    -- Rename json element name: use task_assigned_to as assigned_to; control_task_comments as task_comments
    v_task_json = replace(replace(v_task::text,'"task_assigned_to"','"assigned_to"'),'"control_task_comments"','"task_comments"')::json;
    --Create a temp table to host all tasks information
    DROP TABLE IF EXISTS tmp_ige_task;
	CREATE TEMPORARY TABLE tmp_ige_task
	  (
		  task_id numeric,
		  new_task_id numeric,
		  task_type text,
		  source_id numeric,
		  assigned_to text,
		  taken_by text,
		  task_sequence numeric(4,1),
		  task_status text,
		  task_comments text,
		  control_task_id numeric,
		  task_category text,
		  trans_id_create numeric,
		  trans_id_expire numeric,
		  deleted text  -- match with the deleted element in json
	  );
	  raise notice 'Temp table created';
	  INSERT INTO tmp_ige_task
	  SELECT task_id, 
	         new_task_id,
	         task_type, 
			 source_id,
		     assigned_to,
		     taken_by,
		     task_sequence,
		     task_status,
		     format_string(task_comments),
		     control_task_id,
		     task_category,
		     trans_id_create,
		     trans_id_expire,
		     deleted   
	  FROM json_populate_recordset(null::tmp_ige_task,v_task_json);
	  raise notice 'Imported json data into temp table'; 
	  -- Set source information & control task information
	  UPDATE tmp_ige_task
	    SET source_id = v_source_id,
		    control_task_id = v_control_task_id,
			task_category = v_task_category,
			trans_id_create = v_trans_id_create,
	        trans_id_expire = v_trans_id_expire;
	  raise notice 'Imported source & control_task info into temp table';
	  -- Get task_id for new task(s)
	  UPDATE tmp_ige_task
	    SET new_task_id = nextval('ige_task_id_seq')::numeric(12,0),
		    task_status = CASE WHEN task_status IS null THEN 'READY' ELSE task_status END 
	  WHERE task_id is null
	    AND UPPER(deleted) = 'FALSE';
	  raise notice 'Generated new task id(s)';
	  -- Expire the deleted tasks	  
	  UPDATE ige_task
	    SET trans_id_expire = v_trans_id_create
		WHERE task_id IN 
		  (
			  SELECT task_id
			  FROM tmp_ige_task
			  WHERE UPPER(deleted) = 'TRUE' 
		  );
	  raise notice 'Expired tasks';	 
	  
	  -- Update existing tasks
	  UPDATE ige_task 
	    SET  task_type = tmp_ige_task.task_type, 
			 source_id = tmp_ige_task.source_id, 
			 assigned_to = UPPER(tmp_ige_task.assigned_to), 
			 taken_by = UPPER(tmp_ige_task.taken_by), 
			 task_sequence = tmp_ige_task.task_sequence, 
			 --task_status = tmp_ige_task.task_status, 
			 task_comments = tmp_ige_task.task_comments, 
			 control_task_id = tmp_ige_task.control_task_id, 
			 task_category = tmp_ige_task.task_category, 
			 trans_id_create = tmp_ige_task.trans_id_create, 
			 trans_id_expire = tmp_ige_task.trans_id_expire
	  FROM tmp_ige_task 
	  WHERE ige_task.task_id = tmp_ige_task.task_id
	    AND UPPER(deleted) = 'FALSE' ;
	  raise notice 'Updated existing tasks';
	   -- Update task status
	   SELECT string_agg(update_task_status(task_id, task_status, v_userid), ',') INTO dmsg
	   FROM tmp_ige_task 
	   WHERE UPPER(deleted) = 'FALSE' ; 
	  -- Insert new tasks	  
	  INSERT INTO ige_task(
	                      task_id, 
		                  task_type, 
		                  source_id, 
		                  assigned_to, 
		                  taken_by, 
						  task_sequence, 
						  task_status, 
						  task_comments, 
						  control_task_id, 
						  task_category, 
						  trans_id_create, 
						  trans_id_expire)
	  SELECT new_task_id,
	         task_type,
			 source_id,
			 UPPER(assigned_to),
			 UPPER(taken_by),
			 task_sequence,
			 task_status,
			 task_comments,
			 control_task_id,
			 task_category,
			 trans_id_create,
			 trans_id_expire
	  FROM tmp_ige_task
	  WHERE new_task_id is not null;
	  raise notice 'Inserted new tasks';
	
  DROP TABLE IF EXISTS tmp_ige_task;
  SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message		     
	) c;		
  RETURN o_json;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
	DROP TABLE IF EXISTS tmp_ige_task;
    o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message		     
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.update_tasks(json, numeric, numeric, text, numeric, numeric, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_tasks(json, numeric, numeric, text, numeric, numeric, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_tasks(json, numeric, numeric, text, numeric, numeric, text) TO network;

REVOKE ALL ON FUNCTION code_src.update_tasks(json, numeric, numeric, text, numeric, numeric, text) FROM PUBLIC;
