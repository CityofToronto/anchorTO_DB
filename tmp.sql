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
				  
	