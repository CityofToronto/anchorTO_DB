-- FUNCTION: network.update_tasks(json, numeric, numeric, text, numeric, numeric)

-- DROP FUNCTION network.update_tasks(json, numeric, numeric, text, numeric, numeric);
CREATE OR REPLACE FUNCTION network.update_tasks(
	v_task json,
	v_source_id numeric,
	v_control_task_id numeric,
	v_task_category text,    
    v_trans_id_create numeric,
    v_trans_id_expire numeric)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  theid numeric(12,0); 
  v_task_json json;
  msg text;
  o_json text;
  o_status text;
  o_message text;
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
		     task_comments,
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
	  WHERE task_id is null;
	  raise notice 'Generated new task id(s)';
	  -- Expire the deleted tasks	  
	  UPDATE ige_task
	    SET trans_id_expire = trans_id_create
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
			 assigned_to = tmp_ige_task.assigned_to, 
			 taken_by = tmp_ige_task.taken_by, 
			 task_sequence = tmp_ige_task.task_sequence, 
			 task_status = tmp_ige_task.task_status, 
			 task_comments = tmp_ige_task.task_comments, 
			 control_task_id = tmp_ige_task.control_task_id, 
			 task_category = tmp_ige_task.task_category, 
			 trans_id_create = tmp_ige_task.trans_id_create, 
			 trans_id_expire = tmp_ige_task.trans_id_expire
	  FROM tmp_ige_task 
	  WHERE ige_task.task_id = tmp_ige_task.task_id;
	  raise notice 'Updated existing tasks';
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
			 assigned_to,
			 taken_by,
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
	  
	 -- select json_agg(row_to_json(c)) into msg from (select * from tmp_ige_task) c;
	 -- raise notice '%', msg;
	 
	 -- Beginning of updating Oracle
	  IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
	      -- Expire the deleted tasks	  
		  UPDATE imaint_oracle.ige_task
			SET trans_id_expire = trans_id_create
			WHERE task_id IN 
			  (
				  SELECT task_id
				  FROM tmp_ige_task
				  WHERE UPPER(deleted) = 'TRUE' 
			  );
		  raise notice 'Expired tasks in Oracle';
		  -- Update existing tasks
		  UPDATE ige_task 
			SET  task_type = tmp_ige_task.task_type, 
				 source_id = tmp_ige_task.source_id, 
				 assigned_to = tmp_ige_task.assigned_to, 
				 taken_by = tmp_ige_task.taken_by, 
				 task_sequence = tmp_ige_task.task_sequence, 
				 task_status = tmp_ige_task.task_status, 
				 task_comments = tmp_ige_task.task_comments, 
				 control_task_id = tmp_ige_task.control_task_id, 
				 task_category = tmp_ige_task.task_category, 
				 trans_id_create = tmp_ige_task.trans_id_create, 
				 trans_id_expire = tmp_ige_task.trans_id_expire
		  FROM tmp_ige_task 
		  WHERE ige_task.task_id = tmp_ige_task.task_id;
		  raise notice 'Updated existing tasks in Oracle';
		  -- Insert new tasks	  
		  INSERT INTO imaint_oracle.ige_task(
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
				 assigned_to,
				 taken_by,
				 task_sequence,
				 task_status,
				 task_comments,
				 control_task_id,
				 task_category,
				 trans_id_create,
				 trans_id_expire
		  FROM tmp_ige_task
		  WHERE new_task_id is not null; 
	  END IF;
	  raise notice 'Inserted new tasks in Oracle';
	 -- End of updating Oracle  
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

ALTER FUNCTION network.update_tasks(json, numeric, numeric, text, numeric, numeric)
    OWNER TO network;
