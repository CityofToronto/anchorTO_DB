-- FUNCTION: code_src.update_job_log(text)

-- DROP FUNCTION code_src.update_job_log(text);

CREATE OR REPLACE FUNCTION code_src.update_job_log(
	info text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
/*
    Summary:
	  Update job log
    Testing:
	  select update_job_log('{"job_id": 123, "task_id":236, "user_name":"slee5", "job_status":"submitted", "start_time":"2019-08-19 10:00:00", "end_time":"2019-08-19 11:00:00", "comments":"comments"}');
	  
	  select * from ige_job_log;
  */
  o_status text;     
  o_message text;  
  i_status text; 
  i_user_name text;
  i_task_id numeric;
  i_job_id numeric;
  i_start_time text;
  i_end_time text;
  i_comments text;
  o_json text;    
  v_cnt integer;
BEGIN  
  o_status = 'OK';
  o_message = '';  
  SELECT $1::json->>'job_id',
         $1::json->>'task_id',
		 $1::json->>'job_status',
		 $1::json->>'user_name',
		 $1::json->>'start_time',		
		 $1::json->>'end_time',	
		 $1::json->>'comments'
    INTO i_job_id,
         i_task_id,
		 i_status,
		 i_user_name,
		 i_start_time,
		 i_end_time,
		 i_comments;
  i_user_name = UPPER(i_user_name);
  i_status = UPPER(i_status);
  raise notice 'start time:%', i_start_time;
  raise notice 'end time:%', i_end_time;
  IF is_blank_id(i_job_id::text) THEN 
      o_status = 'Failed';
      o_message = 'Invalid Job ID' || v_status;
  ELSE 
      --Check existing job_id
	  SELECT count(1) INTO v_cnt FROM ige_job_log WHERE job_id = i_job_id;
	  IF v_cnt = 0 THEN 	      
	    INSERT INTO network.ige_job_log(job_id, task_id, user_name, job_status, start_time, end_time, comments)
	    VALUES 
	    (i_job_id,
         i_task_id,
		 i_user_name,
		 i_status,		 
		 i_start_time,
		 i_end_time,
		 i_comments );
      ELSE
	    UPDATE ige_job_log
		  SET user_name = CASE WHEN i_user_name is not null THEN i_user_name END,
		      job_status = i_status,
			  start_time = CASE WHEN i_start_time is not null THEN i_start_time END,
			  end_time = i_end_time,
			  comments = CASE WHEN i_comments is not null THEN i_comments END
		WHERE job_id = i_job_id;
      END IF;
  END IF;  

  SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message		   
	) c;	
	RETURN o_json;
  EXCEPTION  
  WHEN OTHERS THEN 
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

ALTER FUNCTION code_src.update_job_log(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_job_log(text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_job_log(text) TO network;

REVOKE ALL ON FUNCTION code_src.update_job_log(text) FROM PUBLIC;
