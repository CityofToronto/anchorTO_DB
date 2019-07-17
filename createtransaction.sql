CREATE OR REPLACE FUNCTION network.createtransaction(taskid numeric, uname text, ucomment text, uapplication text)  
RETURNS numeric
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE 
  transid numeric(12,0);
BEGIN
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
                   null, --BATCH_SOURCE_ID,
                   $2,
                   now(),
                   null,
                   $4,
                   null,
                   null,
                   'OPEN') 
		 RETURNING trans_id INTO transid;
         UPDATE ige_transaction
         SET trans_name = transid::text,
                trans_desc = $3 --BATCH_TRANS_DESC
         WHERE trans_id = transid;
    RETURN transid;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
    RETURN -1;
END;  
$BODY$;

ALTER FUNCTION network.createtransaction(numeric,text, text,text) OWNER TO network;
