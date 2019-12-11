-- FUNCTION: code_src.validate_ama(text)

-- DROP FUNCTION code_src.validate_ama(text);

CREATE OR REPLACE FUNCTION code_src.validate_ama(
	v_info text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  o_status text;
  o_json text;   
  o_message text; 
  v_duplicate_ama boolean;
BEGIN 
/*
    Summary:
	  Validate the linear_name_id + lo_num + lo_num_suf + hi_num + hi_num_suf should be unique
    Testing:
	  SELECT validate_ama('{"linear_name_id":2084,"lo_num":53,"low_num_suf":null,"hi_num":null, "hi_num_suf":null}') -- return true
	  SELECT validate_ama('{"linear_name_id":2084,"lo_num":53,"low_num_suf":null,"hi_num":null, "hi_num_suf":null, "address_string_id":"639310"}') --return true
	  SELECT validate_ama('{"linear_name_id":2084,"lo_num":53,"low_num_suf":null,"hi_num":null, "hi_num_suf":null, "address_string_id":"639310,639308"}') --return false
  */
  o_status = 'OK';
  o_message = ''; 
  v_duplicate_ama = false;  
  raise notice 'linear_name_id:%', ($1::json->>'linear_name_id')::numeric;
  raise notice 'lo_num:%', coalesce(($1::json->>'lo_num')::integer,-1);
  raise notice 'lo_num_suf:%', UPPER(coalesce((($1::json->>'lo_num_suf')::text),'||'));
  raise notice 'hi_num:%', coalesce(($1::json->>'hi_num')::integer,-1);
  raise notice 'hi_num_suf:%', UPPER(coalesce(($1::json->>'hi_num_suf')::text,'||'));
  SELECT row_to_json(c) INTO o_json
  FROM
  (
	  SELECT o_status status, 
	       o_message message,	       
	       CASE WHEN EXISTS 
	                 (SELECT 1
		              FROM authorized_municipal_address_evw n					  
		              WHERE 
					     n.linear_name_id = ($1::json->>'linear_name_id')::numeric
						 AND coalesce(n.lo_num,-1) = coalesce(($1::json->>'lo_num')::integer,-1)
						 AND 
					      (
							  (is_blank_string(n.lo_num_suf) AND is_blank_string(($1::json->>'lo_num_suf')::text)) 
							OR coalesce(UPPER(n.lo_num_suf), '||') = UPPER(coalesce(($1::json->>'lo_num_suf')::text,'||'))
						  )
						 AND coalesce(n.hi_num, -1) = coalesce(($1::json->>'hi_num')::integer,-1)	
						 AND 
					      (
							  (is_blank_string(n.lo_num_suf) AND is_blank_string(($1::json->>'lo_num_suf')::text)) 
							 OR coalesce(UPPER(n.hi_num_suf), '||') = UPPER(coalesce(($1::json->>'hi_num_suf')::text,'||'))
						  )    
						 AND (is_blank_id(($1::json->>'address_string_id')::text)
							 OR position((n.address_string_id::text) || ',' in ($1::json->>'address_string_id')::text || ',') = 0
							 )						        
		              ) THEN true ELSE false END duplicate_ama
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
	         null duplicate_ama
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.validate_ama(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.validate_ama(text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.validate_ama(text) TO network;

REVOKE ALL ON FUNCTION code_src.validate_ama(text) FROM PUBLIC;
