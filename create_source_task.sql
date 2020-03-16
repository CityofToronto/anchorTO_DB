-- FUNCTION: code_src.create_source_task(text, text)

-- DROP FUNCTION code_src.create_source_task(text, text);

CREATE OR REPLACE FUNCTION code_src.create_source_task(
	uname text,
	ucomment text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  transid numeric(12,0);
  taskid numeric(12,0);
  transname text;
  o_status text;
  o_message text;  
  o_json text;   
BEGIN
/*
  Summary: 
    Create a task for source.
  Testing:
    SELECT create_source_task('slee5', 'comments32010');
*/
    o_status = 'OK';
    o_message = '';
	transid = -1;
	taskid = -1;	
	SELECT create_task($1, $2, 'anchorTO','SOURCE') INTO o_json; 
	SELECT o_json::json->>'status',
           o_json::json->>'message',
		   o_json::json->>'taskid',
		   o_json::json->>'transid'
    INTO o_status,
	     o_message,
		 taskid,
		 transid;
	transname = 'TRANS' || transid::text;
	
--	UPDATE ige_transaction 
--	  SET application_code = 'anchorTO',
--	      trans_name = transname
--	WHERE trans_id = transid;
	
	-- Beginning of updating Oracle
   -- UPDATE imaint_oracle.ige_transaction 
--	  SET application_code = 'anchorTO',
--	      trans_name = transname
--	WHERE trans_id = transid;
    -- End of updating Oracle
	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	         o_message message,
		     taskid,
		     transid,
		     transname
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
		   transid,
		   transname
	) c;
    RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.create_source_task(text, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.create_source_task(text, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.create_source_task(text, text) TO network;

REVOKE ALL ON FUNCTION code_src.create_source_task(text, text) FROM PUBLIC;
