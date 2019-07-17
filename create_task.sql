-- FUNCTION: network.create_task(text, text, text)

-- DROP FUNCTION network.create_task(text, text, text);

CREATE OR REPLACE FUNCTION network.create_task(
	uname text,
	ucomment text,
	uapplication text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  transid numeric(12,0);
  taskid numeric(12,0);
  o_status text;
  o_message text;  
  o_json text;  
BEGIN
    o_status = 'OK';
    o_message = '';
	transid = -1;
	taskid = -1;
	SELECT nextval('ige_task_id_seq')::numeric(12,0) INTO taskid;
	SELECT create_transaction(taskid, $1, $2, 'anchorTO') INTO transid;
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
                     ,$3
                     ,null
                     ,$1
                     ,$1
                     ,10
                     ,'CREATED'
                     ,$2
                     ,null --controlTaskId
                     ,'STEWARD DEFINED' --'SUPERVISOR DEFINED'
                     ,transid
                     ,-1) 
	RETURNING task_id INTO taskid;
	-- Beginning of updating Oracle
	IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
      INSERT INTO imaint_oracle.ige_task 
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
                     ,$3
                     ,null
                     ,$1
                     ,$1
                     ,10
                     ,'CREATED'
                     ,$2
                     ,null --controlTaskId
                     ,'STEWARD DEFINED' --'SUPERVISOR DEFINED'
                     ,transid
                     ,-1);
    END IF;
	-- End of updating Oracle	
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

ALTER FUNCTION network.create_task(text, text, text)
    OWNER TO network;
