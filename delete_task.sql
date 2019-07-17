-- FUNCTION: network.delete_task(numeric)

-- DROP FUNCTION network.delete_task(numeric);

CREATE OR REPLACE FUNCTION network.delete_task(
	taskid numeric)
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
    o_status = 'OK';
    o_message = '';	
	
	DELETE FROM ige_task
	  WHERE task_id = $1;
	-- Beginning of updating Oracle
    DELETE FROM imaint_oracle.ige_task
	  WHERE task_id = $1;
    -- End of updating Oracle  
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

ALTER FUNCTION network.delete_task(numeric)
    OWNER TO network;
