-- FUNCTION: code_src.update_ama_usage_status(numeric, text, numeric)

-- DROP FUNCTION code_src.update_ama_usage_status(numeric, text, numeric);

CREATE OR REPLACE FUNCTION code_src.update_ama_usage_status(
	v_address_string_id numeric,
	v_status text,
	v_trans_id numeric DEFAULT '-1'::integer)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  v_objectid numeric;
  v_old_status text;
  o_status text;  
  o_message text;
  o_json text;   
  retval integer; 
BEGIN
/*
Summary: 
  Update usage status in authorized_municipal_address_evw 
Testing:
  SELECT update_ama_usage_status(1082, 'C', 30000000002); -- No Change
  SELECT update_ama_usage_status(1082, 'H', 30000000003);
*/
    o_status = 'OK';
    o_message = '';   
	retval = 0;  
	SELECT usage_status INTO v_old_status FROM authorized_municipal_address_evw
	WHERE address_string_id = v_address_string_id 
	    and trans_id_expire = -1
	LIMIT 1;
	raise notice 'Old status:%', v_old_status;
	IF v_old_status <> upper(v_status) THEN
		-- Expired the old one	
		UPDATE authorized_municipal_address_evw 
		SET  trans_id_expire = v_trans_id
		WHERE address_string_id = v_address_string_id 
			and trans_id_expire = -1;	
	  -- Insert new AMA	   
	  SELECT sde.next_rowid(current_schema()::text, 'authorized_municipal_address')
	  INTO v_objectid;	
	  
	  INSERT INTO network.authorized_municipal_address_evw(
	              address_string_id, 
		          trans_id_create, 
		          trans_id_expire, 
		          linear_name_id, 
		          lo_num, 
		          lo_num_suf, 
		          hi_num, 
		          hi_num_suf, 
		          objectid, 
		          usage_status)
		SELECT address_string_id,
		       v_trans_id,
			   -1,
			   linear_name_id,
			   lo_num, 
		       lo_num_suf, 
		       hi_num, 
		       hi_num_suf,
			   v_objectid,
			   upper(v_status)
		FROM  network.authorized_municipal_address_evw
		 WHERE address_string_id = v_address_string_id 
		 and trans_id_expire = v_trans_id;	 
     
	END IF;	  
	
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

ALTER FUNCTION code_src.update_ama_usage_status(numeric, text, numeric)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_ama_usage_status(numeric, text, numeric) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_ama_usage_status(numeric, text, numeric) TO network;

REVOKE ALL ON FUNCTION code_src.update_ama_usage_status(numeric, text, numeric) FROM PUBLIC;
