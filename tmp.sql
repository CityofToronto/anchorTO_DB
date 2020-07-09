SELECT format_report(1); --, rpt_daily());
select * from report_log;
execute sql 'select code_src.rpt_daily()'
begin
EXECUTE 'select * from configuration';
end;
select position ('Cc' IN 'VA[C]') 

select array_upper(ARRAY['a', 'b', 'c'],1)

select json_array_length(rpt_daily())
select json_each(rpt_daily()->0)
select count(f) from (select json_each_text(rpt_daily()->0) f) t
select count(t.value) from json_each_text(rpt_daily()->0) t
select array_agg from (json_object_keys(rpt_daily()->0))
select string_agg(value, '</td><td>') from (select value from json_each_text(rpt_daily()->0)) t
select * from json_populate_recordset(null::record, '[{"stats_type":"Source #","stats_count":0}, {"stats_type":"Task #","stats_count":0}, {"stats_type":"transaction #","stats_count":0}, {"stats_type":"Control task #","stats_count":0}, {"stats_type":"AMA #","stats_count":0}, {"stats_type":"LFN #","stats_count":0}]')
  as 
  ( stats_type text,
	stats_count text
  )
 SELECT count(f)
	  FROM 
	    (
			SELECT json_object_keys(rpt_daily()->0) f
		) t; 
  select json_array_length(rpt_daily())
  
  SELECT array_length(ARRAY(SELECT value 
			  FROM json_each_text(rpt_daily()->0)))
  SELECT ARRAY(SELECT json_object_keys(rpt_daily()->0))
  
  
	    (
			SELECT json_object_keys(rpt_daily()->0) f
		) t; 	
select format('Email sent #:%s', 5)
select * from report_log;
SELECT * 
  FROM v_report_daily_list 
  WHERE id = 1;

select * from report_conf;
INSERT INTO network.report_conf(
	enabled, title, subtitle, footer, author, description, procedure_name, email_from, email_to, email_cc, email_bcc, email_subject, email_body_template, email_signature, start_datetime, end_datetime, repeat_months, repeat_week_days, repeat_month_days, repeat_hours, repeat_minutes, contact_email)
	select enabled, title, subtitle, footer, author, description, procedure_name, email_from, email_to, email_cc, email_bcc, email_subject, email_body_template, email_signature, start_datetime, end_datetime, repeat_months, repeat_week_days, repeat_month_days, repeat_hours, repeat_minutes, contact_email
	from report_conf;
  select SUBSTRING('The [TODAY:Mon DD, YYYY] or [TODAY:YYYY-MM-DD]' FROM '%#"TODAY:%]#"%' FOR '#' );
  
  select substring('foobar' from '%#"o_b#"%' for '#') 
  
  select string_to_array('steve.lee@toronto.ca;slee5@toronto.ca', ';')
  
  
  
  
		