--              Auto-Report setup:
-- 1. Create Tables:
Create table network.report_conf
(id serial primary key,
 enabled INT not null default 1,
 title text not null,
 subtitle text,
 author text,
 description text,
 procedure_name text not null,
 email_from text not null,
 email_to  text not null,
 email_cc text,
 email_bcc text,
 email_subject text,
 email_body_template text,
 email_signature text,
 start_datetime timestamp not null default current_timestamp,
 end_datetime timestamp not null default to_date('3000-01-01', 'YYYY-MM-DD'),
 repeat_months text,
 repeat_week_days text,
 repeat_month_days text,
 repeat_hours text,
 repeat_minutes text, 
 contact_email text not null
);

COMMENT ON TABLE report_conf IS 'Configure auto-generated reports';
COMMENT ON COLUMN report_conf.id IS 'Report identifier; Auto-increment'; 
COMMENT ON COLUMN report_conf.enabled IS 'Report is enabled or not; 1: Enabled; 0: Disabled';
COMMENT ON COLUMN report_conf.title IS 'Report title';
COMMENT ON COLUMN report_conf.subtitle IS 'Report subtitle';
COMMENT ON COLUMN report_conf.author IS 'Report''s author';
COMMENT ON COLUMN report_conf.description IS 'Report description';
COMMENT ON COLUMN report_conf.procedure_name IS 'Procedure to generate report data';
COMMENT ON COLUMN report_conf.email_from IS 'Report email from information';
COMMENT ON COLUMN report_conf.email_to IS 'Report email recipient list';
COMMENT ON COLUMN report_conf.email_cc IS 'Report email cc list';
COMMENT ON COLUMN report_conf.email_bcc IS 'Report email bcc list';
COMMENT ON COLUMN report_conf.email_subject IS 'Report email subject';
COMMENT ON COLUMN report_conf.email_body_template IS 'Report email body template; Generated report data will replace [DATA] section of the template';
COMMENT ON COLUMN report_conf.email_signature IS 'Report email signature; It will replace [SIGNATURE] section in the email body template';
COMMENT ON COLUMN report_conf.start_datetime IS 'Start datetime of the report will be auto-generated';
COMMENT ON COLUMN report_conf.end_datetime IS 'End datetime of the report will be auto-generated';
COMMENT ON COLUMN report_conf.repeat_months IS 'Repeat months; i.e. 1;2;3;8;12';
COMMENT ON COLUMN report_conf.repeat_week_days IS 'Repeat week days starting from Monday (1 - 7); i.e. 1;2;3';
COMMENT ON COLUMN report_conf.repeat_month_days IS 'Repeat month days; i.e. 1;2;20;30';
COMMENT ON COLUMN report_conf.repeat_hours IS 'Repeat hours; i.e. 0;1;22;23';
COMMENT ON COLUMN report_conf.repeat_minutes IS 'Repeat minutes, minimum interval is 5 minutes; i.e. 0;5;15;25;55';
COMMENT ON COLUMN report_conf.contact_email IS 'Contact email if exception is generated';

CREATE INDEX report_conf_i on report_conf(enabled, start_datetime, end_datetime,repeat_months,repeat_week_days,repeat_month_days,repeat_hours,repeat_minutes);

INSERT INTO report_conf 
             (
			  title,
			  subtitle,
			  author,
			  description,
			  procedure_name,
			  email_from,
			  email_to,
			  email_cc,
			  email_bcc,
			  email_subject,
			  email_body_template,
			  email_signature,
			  start_datetime,
			  end_datetime,
			  repeat_months ,
			  repeat_week_days,
			  repeat_month_days,
			  repeat_hours,
			  repeat_minutes, 
			  contact_email
			 )
       VALUES ('Daily Summary Report',
			   'From June 08, 2020 - Present',
		       'Steve L.',
		       'anchorTO daily summary report',
		       'code_src.rpt_daily',
		       'gsg@toronto.ca',
		       'steve.lee@toronto.ca;slee5@toronto.ca',
			   '',
		       '',
		       'anchorTO Daily Summary Report [DATE]',
		       '',
		       '',
		       current_timestamp,
		       to_date('3000-01-01', 'YYYY-MM-DD'),
		       '', 
			   '',
		       '',
		       '', 
			   '0;5;10;15;20;25;30;35;40;45;50;55',
		       'slee@toronto.ca');	      
		      		      
select * from report_conf;
select count(1) from report_conf;
------------------------------------
-- Drop table network.report_log
Create table network.report_log
(id serial primary key,
 report_id int not null,
 scheduled_run_time text,
 email_body text,
 generated_time timestamp not null default current_timestamp,
 completed int default 0,
 results text default 'OK');
COMMENT ON TABLE report_log IS 'Report logs';
COMMENT ON COLUMN report_log.id IS 'Report log identifier; Auto-increment';    
COMMENT ON COLUMN report_log.report_id IS 'Report id';
COMMENT ON COLUMN report_log.scheduled_run_time IS 'Scheduled report run time';
COMMENT ON COLUMN report_log.email_body IS 'Report email body';
COMMENT ON COLUMN report_log.generated_time IS 'Report generated time';
COMMENT ON COLUMN report_log.completed IS 'Report is completed; 1:Completed; 0:Not completed';
COMMENT ON COLUMN report_log.results IS 'Report results';
CREATE INDEX report_log_i_completed on report_log(completed);
CREATE INDEX report_log_i2_id_rpt_tg on report_log(report_id, scheduled_run_time);
---------------------------------
-- 2. Configure table
INSERT INTO configuration VALUES (4, 'anchorTO', 'environment', 'anchorTO', 'DEV');
INSERT INTO configuration VALUES (5, 'anchorTO', 'start_date', 'MM/DD/YYYY', '06/08/2020');
select * from configuration;
-- 3. Query current active jobs
 -- select * from v_report_daily_list
  -- drop view v_report_daily_list
  CREATE OR REPLACE VIEW v_report_daily_list AS 
  with cte as 
  (
  select * 
  from report_conf t
  where t.enabled = 1    
	and current_timestamp between t.start_datetime and t.end_datetime
	-- Has time period definition
    and coalesce(length(trim(t.repeat_hours)), 0) +
	    coalesce(length(trim(t.repeat_minutes)), 0) > 0
    -- valid repeat months
    and (
		  repeat_months is null or 
		  coalesce(length(trim(repeat_months)), 0) = 0 or
		  extract(month from current_timestamp)::text in 
				  (
                   select trim(unnest(string_to_array(UPPER(replace(repeat_months, ',',';')), ';')))	
				  )
		 )
    -- valid repeat week days
	and (
		  repeat_week_days is null or 
		  coalesce(length(trim(repeat_week_days)), 0) = 0 or
		  extract(isodow from current_timestamp)::text in 
				  (
                   select trim(unnest(string_to_array(UPPER(replace(repeat_week_days, ',',';')), ';')))	
				  )
		 )
    -- valid repeat month day
	and (
		  repeat_month_days is null or 
		  coalesce(length(trim(repeat_month_days)), 0) = 0 or
		  extract(day from current_timestamp)::text in 
				  (
                   select trim(unnest(string_to_array(UPPER(replace(repeat_month_days, ',',';')), ';')))	
				  )
		 ) 
)	
-- View starts from here:
select s.*
from 
(
	select s1.*,
	       row_number() over (partition by id order by id, scheduled_run_time desc) as rid
	from (
	  select   to_char(current_timestamp, 'YYYY-MM-DD-') ||
		       trim(to_char(t1.hh::integer, '00')) || ':' || trim(to_char(t2.mm::integer, '00')) as scheduled_run_time,
			   t.* 
		from report_conf t
		-- Hours
		left join 
		  (select id, 
				 (trim(unnest(string_to_array(
							   case when repeat_hours is null or coalesce(length(trim(repeat_hours)), 0) = 0 
									  then (select string_agg(f::text,';') from  generate_series(0, 23) f)
									else repeat_hours 
							   end, ';')
							 )
					  )
				 )::text as hh 
		   from cte) t1 on t1.id = t.id
		-- Minutes
		left join (select id, (trim(unnest(string_to_array(UPPER(repeat_minutes), ';'))))::text as mm from cte) t2 on t1.id = t.id	  
	  ) s1	 
  where to_char(current_timestamp, 'YYYY-MM-DD-HH24:MI') >= s1.scheduled_run_time  
  ) s
  where rid = 1 -- only check the nearest  
    and not exists (
    select * 
	from report_log t
	where t.report_id = s.id
	  and t.scheduled_run_time = s.scheduled_run_time
  )
 -- select * from v_report_daily_list
  

	   