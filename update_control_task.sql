-- FUNCTION: code_src.update_control_task(numeric, numeric, text, text, text, numeric, numeric)

-- DROP FUNCTION code_src.update_control_task(numeric, numeric, text, text, text, numeric, numeric);

CREATE OR REPLACE FUNCTION code_src.update_control_task(
	v_control_task_id numeric,
	v_source_id numeric,
	v_control_task_status text,
	v_control_task_comment text,
	v_control_task_type text,
	v_trans_id_create numeric,
	v_trans_id_expire numeric)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
/*
    Summary:
	  Update control task
    Testing:
	  SELECT update_control_task(0,10001,null,'some "comments','STREET/ADDRESS',20000,-1);
  */
  theid numeric(12,0);
  v_status text;
  o_json text;
  o_status text;
  o_message text;
BEGIN
  o_status = 'OK';
  o_message = ''; 
  theid = v_control_task_id;
  v_status = v_control_task_status;  
  IF theid = 0 OR is_blank_string(v_status) THEN
    v_status = 'READY';  
  END IF;
  
  IF theid = 0 THEN  -- Add
    SELECT nextval('ige_control_task_id_seq')::numeric(12,0) INTO theid;	
	INSERT INTO ige_control_task
             (
	             control_task_id, 
				 source_id, 
				 control_task_status, 
				 control_task_comments, 
				 control_task_type, 
				 trans_id_create, 
				 trans_id_expire)
	VALUES 
	         (
		         theid, 
			     v_source_id, 
			     v_status, 
				 format_string(v_control_task_comment), 
				 v_control_task_type, 
				 v_trans_id_create, 
				 -1
			 );         
	/* -- Beginning of updating Oracle
	 IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
	   INSERT INTO imaint_anchor.ige_control_task
				 (
					 control_task_id, 
					 source_id, 
					 control_task_status, 
					 control_task_comments, 
					 control_task_type, 
					 trans_id_create, 
					 trans_id_expire)
		VALUES 
				 (
					 theid, 
					 v_source_id, 
					 v_status, 
					 format_string(v_control_task_comment), 
					 v_control_task_type, 
					 v_trans_id_create, 
					 -1
				 );		   
	 END IF;
	 -- End of updating Oracle */
  ELSE -- Update	
    UPDATE ige_control_task        
	  SET control_task_status = v_status, 
		  control_task_comments = format_string(v_control_task_comment), 
		  control_task_type = v_control_task_type, 				
		  trans_id_expire = v_trans_id_expire
	WHERE control_task_id = theid;
	/* -- Beginning of updating Oracle
	 IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
	   UPDATE imaint_anchor.ige_control_task        
	   SET control_task_status = v_status, 
		   control_task_comments = format_string(v_control_task_comment), 
		   control_task_type = v_control_task_type, 				
		   trans_id_expire = v_trans_id_expire
	   WHERE control_task_id = theid;
	 END IF;
	 -- End of updating Oracle */
  END IF; 
   	
  SELECT row_to_json(c) INTO o_json
  FROM
  (
	  SELECT o_status status, 
	       o_message message,
		   theid control_task_id
  ) c;		
  RETURN o_json; 
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;   
	o_status = SQLSTATE;
	o_message = SQLERRM;
	theid = -1;
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   theid control_task_id		     
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.update_control_task(numeric, numeric, text, text, text, numeric, numeric)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_control_task(numeric, numeric, text, text, text, numeric, numeric) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_control_task(numeric, numeric, text, text, text, numeric, numeric) TO network;

REVOKE ALL ON FUNCTION code_src.update_control_task(numeric, numeric, text, text, text, numeric, numeric) FROM PUBLIC;
