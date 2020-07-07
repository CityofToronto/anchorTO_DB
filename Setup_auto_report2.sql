 /*
 select (trim(unnest(string_to_array(UPPER('50;55'), ';'))))::integer, 
       (trim(unnest(string_to_array(UPPER('1;2'), ';'))))::integer


select  trim(to_char(t2.hh::integer, '00')) || ':' || trim(to_char(t1.mm::integer, '00')) as tm
from (select (trim(unnest(string_to_array(UPPER('50;55'), ';'))))::text as mm) t1, 
      (select (trim(unnest(string_to_array(UPPER('0;1;5;12'), ';'))))::text as hh) t2

select 23 - 23 % 5

select string_agg(f::text,
				  ';')
from  generate_series(0, 23) f

				  select string_agg(id::text, ';') from report_conf
				  
	
 */
 

 /*
 select * from report_conf;

update report_conf
set repeat_minutes = '5;20'
where id = 1;
select * from report_log;
delete from report_log;

insert into report_log (report_id, scheduled_run_time)
  values(1, '2020-07-07-09:05');

 */
  