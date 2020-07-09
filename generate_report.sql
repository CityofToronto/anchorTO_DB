-- FUNCTION: code_src.generate_report()

-- DROP FUNCTION code_src.generate_report();

CREATE OR REPLACE FUNCTION code_src.generate_report()
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text; 
  rec v_report_daily_list%ROWTYPE; 
  v_cnt integer;
  v_failed integer;
  v_results text;
  v_completed integer;
  v_email_subject text;
  v_email_body text;
BEGIN  
/*
  Summary: 
    Generate html report based on , & | seperated string;
  Testing:
    SELECT generate_report();
*/     
  retval = 'OK';
  v_cnt = 0;
  v_failed = 0;
  FOR rec IN SELECT * FROM v_report_daily_list
  LOOP
    v_results = 'OK';
	v_completed = 1;
	BEGIN	
	  v_email_subject = format_report_placeholder(rec.email_subject);
	  -- IF #1
	  IF POSITION('FAILED' IN UPPER(v_email_subject)) > 0 THEN 
	      v_results = v_email_subject;
		  v_completed = 0;
          v_failed = v_failed + 1; 
	  ELSE
		  v_email_body = format_report(rec.id);
		  -- IF #2
		  IF POSITION('FAILED' IN UPPER(v_email_body)) > 0 THEN 
	      v_results = v_email_body;
		  v_completed = 0;
          v_failed = v_failed + 1; 
	      ELSE
			  SELECT code_src.send_email(rec.email_from::text, 
										 string_to_array(replace(rec.email_to, ',', ';'), ';'), 
										 CASE WHEN LENGTH(COALESCE(rec.email_cc, '')) = 0 THEN  null
											  ELSE string_to_array(replace(rec.email_cc, ',', ';'), ';')
										 END, 
										 CASE WHEN LENGTH(COALESCE(rec.email_bcc, '')) = 0 THEN  null
											  ELSE string_to_array(replace(rec.email_bcc, ',', ';'), ';')
										 END,
										 v_email_subject,
										 '',
										 '',
										 '',
										 v_email_body
										) 
				INTO v_results;
			  IF v_results = 'OK' THEN
				v_cnt = v_cnt + 1;	
			  ELSE 
				v_failed = v_failed + 1; 
			  END IF;
	    END IF;	-- End of IF #2	  
    END IF; -- End of IF #1
	EXCEPTION 
      WHEN OTHERS THEN
	      v_results = SQLERRM;
		  v_completed = 0;
          v_failed = v_failed + 1; 
		  raise notice 'Msg %', v_results;
	END;	
	-- Write log
	INSERT INTO report_log
		(
		 report_id,
		 scheduled_run_time,
		 email_subject,
		 email_body,
		 generated_time,
		 completed,
		 results)
		VALUES 
		(
			rec.id,
			rec.scheduled_run_time,
			v_email_subject,
			v_email_body,
			current_timestamp,
			v_completed,
			v_results
		);
  END LOOP;
  
  retval = FORMAT('Sent %s ' || CASE WHEN v_cnt > 1 THEN 'emails' ELSE 'email' END || ' successfully; ', v_cnt);
  raise notice 'Return:%', retval;
  retval = retval || FORMAT('Failed to sent %s ' || CASE WHEN v_failed > 1 THEN 'emails' ELSE 'email' END, v_failed);
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN 'Failed to Generate report: ' || SQLERRM;
END;  
$BODY$;

ALTER FUNCTION code_src.generate_report()
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.generate_report() TO network;

REVOKE ALL ON FUNCTION code_src.generate_report() FROM PUBLIC;
