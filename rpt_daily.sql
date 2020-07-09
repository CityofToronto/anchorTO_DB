-- FUNCTION: code_src.rpt_daily()

-- DROP FUNCTION code_src.rpt_daily();

CREATE OR REPLACE FUNCTION code_src.rpt_daily(
	)
    RETURNS json
    LANGUAGE 'sql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$

/*
  Summary: 
    Generate daily report
  Testing:
    SELECT rpt_daily()	
*/
  
  with cte as 
  (
	  select * from ige_transaction 
      where to_char(date_start, 'YYYYMMDD') = to_char(current_timestamp, 'YYYYMMDD') 
  )
  --select string_agg(stats_type::text || ',' ||stats_count::text, '|') into retval
  SELECT json_agg(row_to_json(t)) 
  from (
	  -- Header includes the column alignment definition as follow: [C]: Center; [L]: Left; [R]: Right;
	select 1 as "Index[C]", 'Source #' as "Stats Type[L]", count(1) "Stats Count[R]" from ige_source_evw where trans_id_create in (select trans_id from cte) 
	union all
	select 2, 'Task #', count(1) from ige_task where trans_id_create in (select trans_id from cte)--where task_id > 60000013 
	union all
	select 3, 'transaction #', count(1) from ( select * from cte ) t
	union all
	select 4, 'Control task #', count(1) from ige_control_task where trans_id_create in (select trans_id from cte) 
	union all
	select 5, 'AMA #', count(1) from authorized_municipal_address_evw where trans_id_create in (select trans_id from cte)
	union all
	select 6, 'LFN #', count(1) from linear_name_evw where trans_id_create in (select trans_id from cte)
	) t;

$BODY$;

ALTER FUNCTION code_src.rpt_daily()
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.rpt_daily() TO network;

REVOKE ALL ON FUNCTION code_src.rpt_daily() FROM PUBLIC;
