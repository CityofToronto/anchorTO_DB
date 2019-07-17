CREATE OR REPLACE FUNCTION network.createtask(uname text, ucomment text, uapplication text)  
RETURNS text
LANGUAGE 'plpgsql'
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
	SELECT network.createtransaction(taskid, $1, $2, $3) INTO transid;
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
                     ,'SUPERVISOR DEFINED'
                     ,transid
                     ,-1) 
	RETURNING task_id INTO taskid;
		
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

ALTER FUNCTION network.createtask(text, text,text) OWNER TO network;
