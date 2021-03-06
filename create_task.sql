-- FUNCTION: code_src.create_task(text, text, text, text)

-- DROP FUNCTION code_src.create_task(text, text, text, text);

CREATE OR REPLACE FUNCTION code_src.create_task(
	uname text,
	ucomment text,
	uapplication text,
	utasktype text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  transid numeric(12,0);
  taskid numeric(12,0);
  o_status text;
  o_message text;  
  o_json text;  
BEGIN 
/*
  Summary: 
    Create a task.
  Testing:
    SELECT create_task('slee330', 'some comments', 'anchorTO', 'SOURCE');
*/
    o_status = 'OK';
    o_message = '';
	transid = -1;
	taskid = -1;
	SELECT nextval('ige_task_id_seq')::numeric(12,0) INTO taskid;
	SELECT create_transaction(taskid, $1, $2, $3) INTO transid;
	IF transid = -1 THEN
	  RAISE 'Failed to create transaction' USING ERRCODE = '20001';
	END IF;
	
	INSERT INTO ige_task (task_id
                          ,task_type
                          ,source_id
                          ,assigned_to
                          ,taken_by
                          ,task_sequence
                          ,task_status
                          ,task_comments
                          ,control_task_id
                          ,task_category
                          ,trans_id_create
                          ,trans_id_expire)
              VALUES (taskid
                     ,$4
                     ,null
                     ,upper($1)
                     ,upper($1)
                     ,null -- 10 -- Requested by Waisan on Feb. 24, 2020
                     ,'WORK STARTED'
                     ,$2
                     ,null --controlTaskId
                     ,CASE WHEN upper(utasktype) = 'SOURCE' THEN 'STEWARD DEFINED' ELSE 'SUPERVISOR DEFINED' END
                     ,transid
                     ,-1) 
	RETURNING task_id INTO taskid;
	/*-- Beginning of updating Oracle
	IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
      INSERT INTO imaint_anchor.ige_task 
	                      (task_id
                          ,task_type
                          ,source_id
                          ,assigned_to
                          ,taken_by
                          ,task_sequence
                          ,task_status
                          ,task_comments
                          ,control_task_id
                          ,task_category
                          ,trans_id_create
                          ,trans_id_expire)
              VALUES (taskid
                     ,$4
                     ,null
                     ,$1
                     ,$1
                     ,10
                     ,'WORK STARTED'
                     ,$2
                     ,null --controlTaskId
                     ,CASE WHEN upper(utasktype) = 'SOURCE' THEN 'STEWARD DEFINED' ELSE 'SUPERVISOR DEFINED' END
                     ,transid
                     ,-1);
    END IF;
	-- End of updating Oracle	*/
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   taskid,
		   transid
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
	       o_message message,
		   taskid,
		   transid
	) c;
    RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.create_task(text, text, text, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.create_task(text, text, text, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.create_task(text, text, text, text) TO network;

REVOKE ALL ON FUNCTION code_src.create_task(text, text, text, text) FROM PUBLIC;
