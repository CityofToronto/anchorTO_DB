-- FUNCTION: network.update_source_task_info(text, numeric, numeric, numeric)

-- DROP FUNCTION network.update_source_task_info(text, numeric, numeric, numeric);

CREATE OR REPLACE FUNCTION network.update_source_task_info(
	v_info text,
	v_source_id numeric,
	v_trans_id_create numeric,
	v_trans_id_expire numeric)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  o_status text;  
  o_message text;
  o_json text;  
  v_user_id text;
  v_maint_status text; 
  v_control_task_id numeric;
  v_control_task_comment text;
  v_control_task_type text;
  isnew boolean;
  v_task json;
  v_task_num integer = 0;
  ret_json text;
  ret_msg text;
  ret_status text;
  ret_id text;
  t_expire_id numeric;
BEGIN
    o_status = 'OK';
    o_message = '';    
	ret_msg = '';
	isnew = false;	
	IF EXISTS (SELECT * FROM ige_control_task WHERE source_id = v_source_id and trans_id_expire = -1) THEN
	  isnew = false;
	  SELECT control_task_id INTO v_control_task_id FROM ige_control_task WHERE source_id = v_source_id and trans_id_expire = -1;
	ELSE 
	  isnew = true;	 	  
	END IF;
	
	SELECT $1::json->>'maint_status',
             $1::json->'task', -- get json array object
		     $1::json->>'control_task_type',
		     $1::json->>'comment',		     		 
			 $1::json->>'user_id'
		INTO v_maint_status,
			 v_task,
			 v_control_task_type,
			 v_control_task_comment,
			 v_user_id;
	v_control_task_comment = format_string(v_control_task_comment);  
	raise notice 'Is New? %', isnew;	  
	raise notice 'Maint Status: %', v_maint_status;
	raise notice 'control_task_type: %', v_control_task_type;	
	raise notice 'Comment: %', v_control_task_comment;
	raise notice 'User ID: %', v_user_id;	
	  
	--IF is_blank_string(v_maint_status) THEN 
	--  v_maint_status = 'READY';
	--END IF;
	SELECT json_array_length(v_task) INTO v_task_num;
	
	IF isnew THEN 
	  -- Add
	  v_control_task_id = 0;
	  t_expire_id = -1;
	ELSE  -- updating 
	  t_expire_id = v_trans_id_expire;
	END IF;	  
	SELECT update_control_task(v_control_task_id,v_source_id,v_maint_status,null,v_control_task_type,v_trans_id_create,t_expire_id) INTO ret_json;
	raise notice 'Update control_task message: %', ret_json;
	SELECT ret_json::json->>'status',
	       ret_json::json->>'message',
		   ret_json::json->>'control_task_id'
    INTO  ret_status,
	      ret_msg,
		  v_control_task_id;
	IF ret_status <> 'OK' THEN
	  RAISE EXCEPTION USING
            errcode= ret_status,
            message= ret_msg;
	END IF;
	SELECT update_tasks(v_task, v_source_id, v_control_task_id, 'SUPERVISOR DEFINED', v_trans_id_create, t_expire_id) INTO ret_json;
	raise notice 'Update tasks message: %', ret_json;
	SELECT ret_json::json->>'status',
	       ret_json::json->>'message',
		   ret_json::json->>'control_task_id'
    INTO  ret_status,
	      ret_msg,
		  v_control_task_id;
	IF ret_status <> 'OK' THEN
	  RAISE EXCEPTION USING
            errcode= ret_status,
            message= ret_msg;
	END IF;
	SELECT update_control_task_status_by_tasks(v_control_task_id) INTO ret_json;
	raise notice 'Update update_control_task_status_by_tasks message: %', ret_json;
	SELECT ret_json::json->>'status',
	       ret_json::json->>'message'
    INTO  ret_status,
	      ret_msg;		  
    IF ret_status <> 'OK' THEN
	  RAISE EXCEPTION USING
            errcode= ret_status,
            message= ret_msg;
	ELSE
	  o_status = 'OK';
	  o_message = '';	  
	  SELECT row_to_json(c) INTO o_json
	  FROM
	  (
	    SELECT o_status status, 
	           o_message message,
		       v_control_task_id AS control_task_id  
	  ) c;		
	  RETURN o_json;
	END IF;	
EXCEPTION
  WHEN OTHERS THEN 
    o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   v_control_task_id AS control_task_id  
	) c;	
	raise notice 'Error: %', o_json;
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION network.update_source_task_info(text, numeric, numeric, numeric)
    OWNER TO network;
