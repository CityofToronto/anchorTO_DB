-- FUNCTION: network.create_transaction(numeric, text, text, text)

-- DROP FUNCTION network.create_transaction(numeric, text, text, text);

CREATE OR REPLACE FUNCTION network.create_transaction(
	taskid numeric,
	uname text,
	ucomment text,
	uapplication text)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  transid numeric(12,0);
BEGIN
/*
  Summary: 
    Create a transaction.
  Testing:
    SELECT create_transaction(1,'slee33', 'some comments', 'anchorTO');
*/
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
    RETURN transid;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
    RETURN -1;
END;  
$BODY$;

ALTER FUNCTION network.create_transaction(numeric, text, text, text)
    OWNER TO network;
