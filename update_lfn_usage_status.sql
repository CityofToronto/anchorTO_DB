-- FUNCTION: code_src.update_lfn_usage_status(numeric, text, numeric)

-- DROP FUNCTION code_src.update_lfn_usage_status(numeric, text, numeric);

CREATE OR REPLACE FUNCTION code_src.update_lfn_usage_status(
	v_linear_name_id numeric,
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
  Update usage status in linear_name_evw 
Testing:
  SELECT update_lfn_usage_status(1082, 'C', 30000000002); -- No Change
  SELECT update_lfn_usage_status(1082, 'H', 30000000003);
*/
    o_status = 'OK';
    o_message = '';   	
	retval = 0;  
	SELECT usage_status INTO v_old_status FROM linear_name_evw 
	WHERE linear_name_id = v_linear_name_id 
	    and trans_id_expire = -1;
	IF v_old_status <> upper(v_status) THEN
	    UPDATE linear_name_evw 
		SET  trans_id_create = v_trans_id,
		     usage_status = upper(v_status)
		WHERE linear_name_id = v_linear_name_id 
			and trans_id_expire = -1;	
		/*
		-- Expired the old one	
		UPDATE linear_name_evw 
		SET  trans_id_expire = v_trans_id
		WHERE linear_name_id = v_linear_name_id 
			and trans_id_expire = -1;	
	  -- Insert new LFN	    
	  SELECT sde.next_rowid(current_schema()::text, 'linear_name')
	  INTO v_objectid;		 
	  INSERT INTO linear_name_evw
			   (
				   objectid, 
				   linear_name_id, 
				   trans_id_create, 
				   trans_id_expire, 
				   record_type, 
				   use_by, 
				   name_part, 
				   type_part, 
				   dir_part, 
				   description, 
				   activation_status, 
				   approval_status, 
				   duplication_status, 
				   duplication_desc, 						   
				   authorized, 
				   usage_status
			   )
	   SELECT 	
				v_objectid,
				v_linear_name_id,
				v_trans_id,
				-1,
				'P',
				use_by,
				name_part,
				type_part,
				dir_part,				        
				description,
				activation_status,
				'A',
				null,
				null,
				authorized,
				upper(v_status)
	   FROM linear_name_evw
	   WHERE linear_name_id = v_linear_name_id 
		 and trans_id_expire = v_trans_id;	
		 */
	END IF;	  
	
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   v_linear_name_id AS linear_name_id  
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
		   null AS linear_name_id 
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.update_lfn_usage_status(numeric, text, numeric)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_lfn_usage_status(numeric, text, numeric) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_lfn_usage_status(numeric, text, numeric) TO network;

REVOKE ALL ON FUNCTION code_src.update_lfn_usage_status(numeric, text, numeric) FROM PUBLIC;
