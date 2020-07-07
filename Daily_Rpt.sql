/*
select * from ige_source_evw order by 1 desc;
select * from ige_control_task order by 1 desc;
select * from ige_source_evw order by 1 desc
select * from ige_task order by 1 desc;
select * from ige_transaction order by 1 desc;
select * from linear_name_evw order by 1 desc;
select * from authorized_municipal_address_evw order by 1 desc;

*/
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
with cte as 
  (
	  select * from ige_transaction 
      where to_char(date_start, 'YYYYMMDD') = to_char(current_timestamp, 'YYYYMMDD') 
  ),
  cte_s as 
  (
	  select * from ige_transaction 
      where to_char(date_start, 'YYYYMMDD') between '20200608' and to_char(current_timestamp, 'YYYYMMDD') 
  )
select 'Source #' as stats_type, 
       count(1) as stats_today,
	   (select count(1) from ige_source_evw where trans_id_create in (select trans_id from cte_s) ) as "stats since June_08"
from ige_source_evw where trans_id_create in (select trans_id from cte) 
union all
select 'Task #', 
        count(1),
		(select count(1) from ige_task where trans_id_create in (select trans_id from cte_s)) 
from ige_task where trans_id_create in (select trans_id from cte)--where task_id > 60000013 
union all
select 'Transaction #', 
	    count(1),
		(select count(1) from ( select * from cte_s ) t) 
from ( select * from cte ) t
union all
select 'Control task #', 
	   count(1),
	   (select count(1) from ige_control_task where trans_id_create in (select trans_id from cte_s))	 
from ige_control_task where trans_id_create in (select trans_id from cte) 
union all
select 'AMA #', 
	    count(1),
		(select count(1) from authorized_municipal_address_evw where trans_id_create in (select trans_id from cte_s)) 
from authorized_municipal_address_evw where trans_id_create in (select trans_id from cte)
union all
select 'LFN #', 
	   count(1),
	   (select count(1) from linear_name_evw where trans_id_create in (select trans_id from cte_s))
from linear_name_evw where trans_id_create in (select trans_id from cte)
;




/*
with cte as 
  (
	  select * from ige_transaction 
      where to_char(date_start, 'YYYYMMDD') = to_char(current_timestamp, 'YYYYMMDD') 
  )
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
;

---- Summary report since June 8.
with cte as 
  (
	  select * from ige_transaction 
      where to_char(date_start, 'YYYYMMDD') between '20200608' and to_char(current_timestamp, 'YYYYMMDD') 
  )
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
;
*/
----------------------------------------------------------------------------------------------------


--revoke network from aturvey;

