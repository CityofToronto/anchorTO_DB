-- FUNCTION: code_src.rpt_daily(text)

-- DROP FUNCTION code_src.rpt_daily(text);

CREATE OR REPLACE FUNCTION code_src.rpt_daily(
	v_string text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text;   
  html_base text;
BEGIN  
/*
  Summary: 
    Generate daily report
  Testing:
    SELECT rpt_daily('')	
*/
  
  with cte as 
  (
	  select * from ige_transaction 
      where to_char(date_start, 'YYYYMMDD') = to_char(current_timestamp, 'YYYYMMDD') 
  )
  select string_agg(stats_type::text || ',' ||stats_count::text, '|') into retval
  from (
	select 'Source #' as stats_type, count(1) stats_count from ige_source_evw where trans_id_create in (select trans_id from cte) 
	union all
	select 'Task #', count(1) from ige_task where trans_id_create in (select trans_id from cte)--where task_id > 60000013 
	union all
	select 'transaction #', count(1) from ( select * from cte ) t
	union all
	select 'Control task #', count(1) from ige_control_task where trans_id_create in (select trans_id from cte) 
	union all
	select 'AMA #', count(1) from authorized_municipal_address_evw where trans_id_create in (select trans_id from cte)
	union all
	select 'LFN #', count(1) from linear_name_evw where trans_id_create in (select trans_id from cte)
	) t;
  /*html_base = '<html><style>table {border-collapse: collapse}</style><table border = 1><tr><td>Stats Type</td><td>Stats Count</td></tr><tr><td>[DATA]</td></tr></table></html>';	
  retval = replace(retval, ',', '</td><td>');  
  retval = replace(retval,'|', '</td></tr><tr><td>');
  retval = replace(html_base,'[DATA]', retval);*/
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN v_string;
END;  
$BODY$;

ALTER FUNCTION code_src.rpt_daily(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.rpt_daily(text) TO network;

REVOKE ALL ON FUNCTION code_src.rpt_daily(text) FROM PUBLIC;
