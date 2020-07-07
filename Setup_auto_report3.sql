select tt.* 
from (
	select 
		   to_char(current_timestamp, 'YYYY|MM|DD||DY|HH24|') ||
           trim(to_char(extract (minute from current_timestamp)::integer - extract (minute from current_timestamp)::integer % 5, '00')) as report_trigger_key       
	       ,t.*
	from report_conf t
	where enabled = 1
	and current_timestamp between start_datetime and end_datetime
	and coalesce(length(trim(repeat_months)), 0) + 
	    coalesce(length(trim(repeat_week_days)), 0) + 
	    coalesce(length(trim(repeat_month_days)), 0) + 
	    coalesce(length(trim(repeat_hours)), 0) +
	    coalesce(length(trim(repeat_minutes)), 0) > 0
	and (
		  repeat_months is null or 
		  coalesce(length(trim(repeat_months)), 0) = 0 or
		  extract(month from current_timestamp)::text in 
				  (
                   select trim(unnest(string_to_array(UPPER(repeat_months), ';')))	
				  )
		 )
	and (
		  repeat_week_days is null or 
		  coalesce(length(trim(repeat_week_days)), 0) = 0 or
		  extract(isodow from current_timestamp)::text in 
				  (
                   select trim(unnest(string_to_array(UPPER(repeat_week_days), ';')))	
				  )
		 )
	and (
		  repeat_month_days is null or 
		  coalesce(length(trim(repeat_month_days)), 0) = 0 or
		  extract(day from current_timestamp)::text in 
				  (
                   select trim(unnest(string_to_array(UPPER(repeat_month_days), ';')))	
				  )
		 )
    and (
		  repeat_hours is null or 
		  coalesce(length(trim(repeat_hours)), 0) = 0 or
		  extract(hour from current_timestamp)::text in 
				  (
                   select trim(unnest(string_to_array(UPPER(repeat_hours), ';')))	
				  )
		 )
	and ( 
			 (
			  case when repeat_minutes is null or 
						coalesce(length(trim(repeat_minutes)), 0) = 0 then true
				   else exists (
						  select * from 
						  (
							select (trim(unnest(string_to_array(UPPER('20;50;55'), ';'))))::integer as mins	 
						  ) t
						  where extract(minute from current_timestamp) >= mins
						  )		
			  end
			  ) or
		      (1=1)
		 )
) tt 	
where report_trigger_key not in 
  (
	  select report_trigger_key
	  from report_log
	  where report_id = tt.id
	    and report_trigger_key = tt.report_trigger_key
	    and completed = 0
  )
  
--   select extract (isodow from to_date('20200705', 'YYYYMMDD'))
-- select extract (day from to_date('20200705', 'YYYYMMDD'))
--  select extract (day from current_timestamp)
--select extract (hour from current_timestamp)
--select extract (minute from current_timestamp)