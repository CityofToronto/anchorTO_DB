-- FUNCTION: network.delete_transaction_by_trans_id(numeric)

-- DROP FUNCTION network.delete_transaction_by_trans_id(numeric);

CREATE OR REPLACE FUNCTION network.delete_transaction_by_trans_id(
	transid numeric)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE     
  o_status text;
  o_message text;  
  o_json text;    
BEGIN
/*
  Summary: 
    Delete a transaction by a transaction id.
  Testing:
    SELECT delete_transaction_by_trans_id(123);
*/
    o_status = 'OK';
    o_message = '';	
	
	DELETE FROM ige_transaction
	  WHERE trans_id = $1;
	
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

ALTER FUNCTION network.delete_transaction_by_trans_id(numeric)
    OWNER TO network;
