-- FUNCTION: code_src.search_job_log(text)

-- DROP FUNCTION code_src.search_job_log(text);

CREATE OR REPLACE FUNCTION code_src.search_job_log(
	v_search_by text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE   
  o_status text;  
  o_message text;
  o_json text;   
BEGIN
/*
  Summary: Search job log with different search criteria
  Testing:
    -- OR 
	Return all: SELECT search_job_log('{"job_id":null, "task_id":null, "user_name":"", "job_status":"", "logicOP":"OR"}')
	SELECT search_job_log('{"job_id":123, "task_id":236, "user_name":"slee5", "job_status":"submitted", "logicOP":"OR"}')
	SELECT search_job_log('{"job_id":123, "task_id":null, "user_name":"", "job_status":null, "logicOP":"OR"}')
	SELECT search_job_log('{"job_id":null, "task_id":236, "user_name":"", "job_status":"", "logicOP":"OR"}')
	SELECT search_job_log('{"job_id":null, "task_id":null, "user_name":"slee5", "job_status":"", "logicOP":"OR"}')
	SELECT search_job_log('{"job_id":null, "task_id":null, "user_name":null, "job_status":"submitted", "logicOP":"OR"}')
	SELECT search_job_log('{"job_id":12, "task_id":null, "user_name":"", "job_status":"", "logicOP":"OR"}')
	-- AND
	Return all: SELECT search_job_log('{"job_id":null, "task_id":null, "user_name":"", "job_status":"", "logicOP":"AND"}')
	SELECT search_job_log('{"job_id":123, "task_id":236, "user_name":"slee5", "job_status":"submitted", "logicOP":"AND"}')
	SELECT search_job_log('{"job_id":123, "task_id":null, "user_name":"", "job_status":"", "logicOP":"AND"}')
	SELECT search_job_log('{"job_id":12, "task_id":236, "user_name":"slee5", "job_status":"submitted", "logicOP":"AND"}')
	SELECT search_job_log('{"job_id":null, "task_id":null, "user_name":"slee5", "job_status":"", "logicOP":"AND"}')
	SELECT search_job_log('{"job_id":null, "task_id":null, "user_name":null, "job_status":"submitted", "logicOP":"AND"}')
	SELECT search_job_log('{"job_id":null, "task_id":null, "user_name":"slee5", "job_status":"submitted", "logicOP":"AND"}')
*/
   o_status = 'OK';
   o_message = '';   
   IF UPPER(v_search_by::json->>'logicOP') = 'OR' THEN       
	   SELECT json_agg(row_to_json(c)) INTO o_json
	   FROM
	   (	 
		   SELECT cm.*		        
		   FROM 
		   (
			   -- search by job_id
			   SELECT * 
				FROM ige_job_log 					
				WHERE NOT is_blank_string(v_search_by::json->>'job_id') 
			       AND job_id = (v_search_by::json->>'job_id')::numeric			    
		     UNION -- search by task_id
			   SELECT * 
				FROM ige_job_log 					
				WHERE NOT is_blank_string(v_search_by::json->>'task_id') 
			       AND task_id = (v_search_by::json->>'task_id')::numeric
		   
		      UNION -- search by user_name
			   SELECT * 
				FROM ige_job_log 				
				WHERE NOT is_blank_string(v_search_by::json->>'user_name') 
			       AND UPPER(user_name) = UPPER(v_search_by::json->>'user_name')	   
		   
		     UNION -- search by job_status
			   SELECT * 
				FROM ige_job_log 				
				WHERE NOT is_blank_string(v_search_by::json->>'job_status') 
			       AND UPPER(job_status) = UPPER(v_search_by::json->>'job_status')	
			 ) cm
		     UNION
		       SELECT * 
			   FROM ige_job_log 
		       WHERE 1 = 1
		         AND is_blank_string(v_search_by::json->>'job_id') 
		         AND is_blank_string(v_search_by::json->>'task_id') 
		         AND is_blank_string(v_search_by::json->>'user_name') 
		         AND is_blank_string(v_search_by::json->>'job_status') 
			 ORDER BY start_time desc
		) c;		
   ELSE
     SELECT json_agg(row_to_json(c)) INTO o_json
	   FROM
	   (	 
		   SELECT cm.*		        
		   FROM 
		   (
				SELECT *
			    FROM ige_job_log
				WHERE 
			       -- Search by job_id
				  ( 
					 is_blank_string(v_search_by::json->>'job_id') 
					 OR 
					 (
					    NOT is_blank_string(v_search_by::json->>'job_id') 			          
					    AND job_id = (v_search_by::json->>'job_id')::numeric
					 )
				  )
			      AND -- Search by task_id
			      (
				      is_blank_string(v_search_by::json->>'task_id') 
				    OR   
					(  
				      NOT is_blank_string(v_search_by::json->>'task_id')		           
		              AND task_id = (v_search_by::json->>'task_id')::numeric
					)
				  )
			      AND -- Search by user name
			      (
				      is_blank_string(v_search_by::json->>'user_name')
				    OR   
					(  
				      NOT is_blank_string(v_search_by::json->>'user_name')		           
		              AND UPPER(user_name) = UPPER(v_search_by::json->>'user_name')  
					)
				  )
			      AND -- Search by job status
			       (
					   is_blank_string(v_search_by::json->>'job_status')
				    OR   
					(  
				      NOT is_blank_string(v_search_by::json->>'job_status')		           
		              AND UPPER(job_status) = UPPER(v_search_by::json->>'job_status')  
					)
				   )
			 ) cm
			 ORDER BY start_time desc
		) c;	
   END IF;  	
   RETURN o_json;
EXCEPTION
  WHEN OTHERS THEN 
    o_status = SQLSTATE;
	o_message = format_string(SQLERRM);	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message		
	) c;		
	RETURN o_json;
END;  
   $BODY$;

ALTER FUNCTION code_src.search_job_log(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.search_job_log(text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.search_job_log(text) TO network;

REVOKE ALL ON FUNCTION code_src.search_job_log(text) FROM PUBLIC;
