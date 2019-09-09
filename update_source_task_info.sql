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
/*
    Summary:
	  Update source & task information 
    Testing:
	  select update_source_task_info('{"objectid":133059,"source_id":11969,"class":"REPORT","type":"MUNICIPAL NUMBERING LETTER","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"em-13-19 Winchester","int_date":"2019-05-13","ext_id":"18164283STE28SA","ext_date":"2019-05-13","plan_name":null,"maint_status":"HOLD","comment":"amalg, Margaret''s House -test","closed":false,"task":[{"task_id":156824,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"EMACHYNI","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","status":"ACTIVE","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"EMACHYNI","status":"ACTIVE","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"JFLIGG","status":"ACTIVE","user_id":14,"full_name":"John Fligg"},{"username":"KPORTER","status":"LOCKED","user_id":30,"full_name":"Kevin Porter"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"}],"task_comments":"<13-May-2019 11:05 EMACHYNI: Complete Task: Submit job successfully, job request id 157971>rn<13-May-2019 11:03 EMACHYNI: Post Work: Submit job successfully, job request id 157968>rn<13-May-2019 11:02 EMACHYNI: Stop Work>rn<13-May-2019 11:01 EMACHYNI: Start Work>rn<13-May-2019 11:01 EMACHYNI: Taken>rn<13-May-2019 10:09 EMACHYNI: Updated>rnCreate/adjust Site Area","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":156829,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_assigned_to_user_list":[{"username":"ADDRESS_MAINT","status":"ACTIVE","user_id":0,"full_name":"ADDRESS_MAINT"},{"username":"CWDOWCZ","status":"ACTIVE","user_id":57,"full_name":"Carol Wdowczyk"},{"username":"HMARROW","status":"ACTIVE","user_id":49,"full_name":"Hisham Marrow"},{"username":"JELLIOTT","status":"ACTIVE","user_id":60,"full_name":"James Elliott"},{"username":"JCHONG","status":"ACTIVE","user_id":55,"full_name":"Joyce Chong"},{"username":"KMERREM","status":"ACTIVE","user_id":28,"full_name":"Karl Merrem"},{"username":"BURTON","status":"ACTIVE","user_id":61,"full_name":"Michael Burton"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"RLI4","status":"ACTIVE","user_id":67,"full_name":"Rui Yang Li"},{"username":"SSellia","status":"ACTIVE","user_id":56,"full_name":"Seeva Selliah"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"SHODGINS","status":"ACTIVE","user_id":51,"full_name":"Steve Hodgins"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"},{"username":"DJOKIC","status":"ACTIVE","user_id":54,"full_name":"Zivorad Djokic"}],"task_comments":"<24-May-2019 12:17 HMARROW: Complete Task: Submit job successfully, job request id 158301>rn<24-May-2019 12:16 HMARROW: Post Work: Submit job successfully, job request id 158300>rn<24-May-2019 12:16 HMARROW: Stop Work>rn<24-May-2019 12:15 HMARROW: Start Work>rn<13-May-2019 11:06 HMARROW: Taken>rnAdd/edit/delete Reserved Address Points","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":156830,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"EMACHYNI","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","status":"ACTIVE","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"EMACHYNI","status":"ACTIVE","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"JFLIGG","status":"ACTIVE","user_id":14,"full_name":"John Fligg"},{"username":"KPORTER","status":"LOCKED","user_id":30,"full_name":"Kevin Porter"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"}],"task_comments":"<28-May-2019 11:55 EMACHYNI: Hold>rn<13-May-2019 10:09 EMACHYNI: Updated>rnClose Site Area","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":[],"user_id":"rli4"}'
                              , 11969 
							  ,294338
							  ,-1)
  */
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
  v_to_close boolean;
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
	       ret_json::json->>'message'		  
    INTO  ret_status,
	      ret_msg;
	IF ret_status <> 'OK' THEN
	  RAISE EXCEPTION USING
            errcode= ret_status,
            message= ret_msg;
	END IF;
	IF v_maint_status = 'CLOSED' THEN 
	  v_to_close = TRUE;
	ELSE
	  v_to_close = FALSE;
	END IF;
	SELECT update_control_task_status_by_tasks(v_control_task_id, v_to_close) INTO ret_json;
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
