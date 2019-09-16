-- FUNCTION: code_src.create_transaction2(numeric, text, text, text)

-- DROP FUNCTION code_src.create_transaction2(numeric, text, text, text);

CREATE OR REPLACE FUNCTION code_src.create_transaction2(
	taskid numeric,
	uname text,
	ucomment text,
	uapplication text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
	SECURITY DEFINER 
AS $BODY$DECLARE 
  transid numeric(12,0);
  o_status  text;
  o_message text;
  o_json text;
BEGIN
/*
  Summary: 
    Create a transaction.
  Testing:
    SELECT create_transaction2(1,'slee33', 'some comments', 'anchorTO');
*/
    o_status = 'OK';
    o_message = '';
	transid = -1;
  INSERT INTO ige_transaction(trans_id,
								task_id,
								source_id,
								username,
								date_start,
								date_end,
								application_code,
								trans_desc,
								trans_name,
								trans_status)
         VALUES (nextval('ige_transaction_id_seq')::numeric(12,0),
                   $1,
                   (SELECT source_id FROM ige_task WHERE task_id = taskid), --null, --BATCH_SOURCE_ID,
                   $2,
                   now(),
                   null,
                   $4,
				   $3,
                   null,                   
                   'OPEN') 
		 RETURNING trans_id INTO transid;
         UPDATE ige_transaction
         SET trans_name = 'TRANS' || transid::text
         WHERE trans_id = transid;
		/* -- Beginning of updating Oracle
		 IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
           INSERT INTO imaint_oracle.ige_transaction
		                       (trans_id,
								task_id,
								source_id,
								username,
								date_start,
								date_end,
								application_code,
								trans_desc,
								trans_name,
								trans_status)
           VALUES (transid,
                   $1,
                   null, --BATCH_SOURCE_ID,
                   $2,
                   now(),
                   null,
                   $4,
				   $3,
                   'TRANS' || transid::text,
                   'OPEN'); 	
         END IF;
		 -- End of updating Oracle*/
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
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
		   transid
	) c;
    RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.create_transaction2(numeric, text, text, text)  OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.create_transaction2(numeric, text, text, text) TO anchorto_run