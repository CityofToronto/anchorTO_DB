-- FUNCTION: code_src.get_next_seq_id(text, integer)

-- DROP FUNCTION code_src.get_next_seq_id(text);

CREATE OR REPLACE FUNCTION code_src.get_next_seq_id(
	seqname text, seq_num integer)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text;  
  o_status text;
  o_message text;  
  o_json text; 
BEGIN  
/*
    Summary:
	  Get next sequence id
    Testing:
	  select get_next_seq_id('address_string_id_seq', 5); 
  */
  o_status = 'OK';
  o_message = '';
  SELECT string_agg(nextval(seqname)::text,',') INTO retval from generate_series(1, seq_num);
  SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   retval AS id
	) c;
    RETURN o_json; 
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
	o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   '-1' AS id
	) c;
    RETURN o_json;   
END;  
$BODY$;

ALTER FUNCTION code_src.get_next_seq_id(text,integer)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_next_seq_id(text,integer) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_next_seq_id(text,integer) TO network;

REVOKE ALL ON FUNCTION code_src.get_next_seq_id(text,integer) FROM PUBLIC;
