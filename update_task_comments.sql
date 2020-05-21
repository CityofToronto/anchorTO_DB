-- FUNCTION: code_src.update_task_comments(numeric, text, text)

-- DROP FUNCTION code_src.update_task_comments(numeric, text, text);

CREATE OR REPLACE FUNCTION code_src.update_task_comments(
	v_task_id numeric,
	v_username text,
	v_comments text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE   
  o_status text;  
  o_message text;
  o_json text;   
  ret_json text;
  ret_msg text;
  ret_status text;  
  V_new_comment text;
  
  v_control_task_id numeric;
  
  v_currentstatus text;
  v_transid numeric;
  v_need_update_active integer;
BEGIN
/*
    Summary:
	  Append new task comments
    Testing:
	  SELECT update_task_comments(67092,'SLEE5', 'COMPLETED')
  */
    o_status = 'OK';
    o_message = '';	
	IF not is_blank_string(v_comments) THEN
        v_new_comment = format('<%s %s: %s>' || chr(13) || chr(10), to_char(current_timestamp, 'dd-Mon-YYYY HH24:MI'), v_username, v_comments); 
		IF 0 = (SELECT position(v_new_comment in task_comments) 
		--IF 0 = (SELECT position(format(' %s: %s>', v_username, v_comments) in task_comments) 
				FROM ige_task 
                WHERE task_id = v_task_id)  THEN
			UPDATE ige_task 
			  SET task_comments = v_new_comment || task_comments
			WHERE task_id = v_task_id;
		END IF;
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
	       format_string(o_message) message		  
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.update_task_comments(numeric, text, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_task_comments(numeric, text, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_task_comments(numeric, text, text) TO network;

REVOKE ALL ON FUNCTION code_src.update_task_comments(numeric, text, text) FROM PUBLIC;
