-- FUNCTION: code_src.update_job_logs(text)

-- DROP FUNCTION code_src.update_job_logs(text);

CREATE OR REPLACE FUNCTION code_src.update_job_logs(
	info text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
/*
    Summary:
	  Update multiple job log data
    Testing:
	  select update_job_logs('{"status": "FAILED", "endTime": "2020-01-21T13:35:00Z", "startTime": "2020-01-21T13:34:58Z", "taskId": "3033", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Version not found \"anchorto_run.TRANS1000000717\""},{"status": "FAILED", "endTime": "2020-01-20T13:53:47Z", "startTime": "2020-01-20T13:53:44Z", "taskId": "3273", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Version not found \"anchorto_run.TRANS1000000717\""},{"status": "FAILED", "endTime": "2020-01-20T13:52:44Z", "startTime": "2020-01-20T13:52:41Z", "taskId": "3270", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Version not found \"anchorto_run.TRANS1000000717\""},{"status": "FAILED", "endTime": "2020-01-20T13:51:42Z", "startTime": "2020-01-20T13:51:39Z", "taskId": "3264", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Version not found \"anchorto_run.TRANS1000001127\""},{"status": "FAILED", "endTime": "2020-01-20T13:28:55Z", "startTime": "2020-01-20T13:28:52Z", "taskId": "3236", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Version not found \"anchorto_run.TRANS1000000717\""},{"status": "FAILED", "endTime": "2020-01-20T13:28:47Z", "startTime": "2020-01-20T13:28:44Z", "taskId": "3233", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Version not found \"anchorto_run.TRANS1000000717\""},{"status": "FAILED", "endTime": "2020-01-17T21:24:39Z", "startTime": "2020-01-17T21:24:36Z", "taskId": "3049", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Not a valid SDE workspace."},{"status": "SUCCESSFUL", "endTime": "2020-01-17T21:20:20Z", "startTime": "2020-01-17T21:20:16Z", "taskId": "3042", "error": ""},{"status": "SUCCESSFUL", "endTime": "2020-01-17T21:20:16Z", "startTime": "2020-01-17T21:20:12Z", "taskId": "3033", "error": ""},{"status": "FAILED", "endTime": "2020-01-17T21:19:20Z", "startTime": "2020-01-17T21:19:16Z", "taskId": "3027", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Not a valid SDE workspace."},{"status": "FAILED", "endTime": "2020-01-17T21:06:50Z", "startTime": "2020-01-17T21:06:42Z", "taskId": "3019", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: ORA-12154: TNS:could not resolve the connect identifier specified"},{"status": "FAILED", "endTime": "2020-01-17T20:26:08Z", "startTime": "2020-01-17T20:26:06Z", "taskId": "2972", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Version not found \"anchorto_run.TRANS1000000717\""},{"status": "FAILED", "endTime": "2020-01-17T20:25:35Z", "startTime": "2020-01-17T20:25:33Z", "taskId": "2954", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Version not found \"anchorto_run.TRANS1000000717\""},{"status": "FAILED", "endTime": "2020-01-17T20:04:18Z", "startTime": "2020-01-17T20:04:16Z", "taskId": "2944", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: Version not found \"anchorto_run.TRANS1000000717\""},{"status": "SUCCESSFUL", "endTime": "2020-01-17T20:04:13Z", "startTime": "2020-01-17T20:04:09Z", "taskId": "2941", "error": ""},{"status": "FAILED", "endTime": "2020-01-17T20:01:43Z", "startTime": "2020-01-17T20:01:36Z", "taskId": "2937", "error": "SCHEDULER-140  Task logged error: Post failed:Exception: ORA-12154: TNS:could not resolve the connect identifier specified"},{"status": "SUCCESSFUL", "endTime": "2020-01-17T19:48:34Z", "startTime": "2020-01-17T19:48:28Z", "taskId": "2923", "error": ""},{"status": "SUCCESSFUL", "endTime": "2020-01-15T16:19:59Z", "startTime": "2020-01-15T16:19:50Z", "taskId": "2208", "error": ""},{"status": "SUCCESSFUL", "endTime": "2020-01-15T15:58:01Z", "startTime": "2020-01-15T15:57:54Z", "taskId": "2207", "error": ""},{"status": "SUCCESSFUL", "endTime": "2020-01-14T18:43:07Z", "startTime": "2020-01-14T18:42:59Z", "taskId": "2205", "error": ""}');
	  
	  select * from ige_job_log;
  */
  o_status text;     
  o_message text;  
  o_json text; 
  i_data text;
BEGIN  
  o_status = 'OK';
  o_message = '';  
  -- Re-format input data
  -- Start with '['?
  i_data = trim(info);
  IF substr(i_data,1,1) <> '[' THEN
    i_data = '[' || i_data;
  END IF;
  -- End with ']'?
  IF right(i_data,1) <> ']' THEN
    i_data = i_data || ']';
  END IF;
  -- Replace element id
  i_data = REGEXP_REPLACE(i_data, '"status"', '"job_status"', 'gi');
  i_data = REGEXP_REPLACE(i_data, '"endTime"', '"end_time"', 'gi');
  i_data = REGEXP_REPLACE(i_data, '"startTime"', '"start_time"', 'gi');
  i_data = REGEXP_REPLACE(i_data, '"taskId"', '"job_id"', 'gi');
  i_data = REGEXP_REPLACE(i_data, '"error"', '"comments"', 'gi');
  UPDATE ige_job_log
    SET job_status = t.job_status,
	    start_time = t.start_time,
		end_time = t.end_time,
		comments = t.comments
	FROM (
		SELECT * FROM json_populate_recordset(null::ige_job_log,i_data::json)
	) t
	WHERE ige_job_log.job_id = t.job_id;
	
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

ALTER FUNCTION code_src.update_job_logs(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_job_logs(text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_job_logs(text) TO network;

REVOKE ALL ON FUNCTION code_src.update_job_logs(text) FROM PUBLIC;
