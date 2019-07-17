--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019
--set feedback off
--set define off

--prompt Truncating DMN_REPORT_TYPE...
truncate table DMN_REPORT_TYPE;
--prompt Loading DMN_REPORT_TYPE...
insert into DMN_REPORT_TYPE (report_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('INHOUSE MAINTENANCE', 'In-house Maintenance', 4, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_REPORT_TYPE (report_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MUNICIPAL NUMBERING LETTER', 'Municipal Numbering Letter', 2, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_REPORT_TYPE (report_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('BYLAW', 'By-Law', 1, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_REPORT_TYPE (report_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MUNICIPAL NAMING LETTER', 'Municipal Naming Letter', 3, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 4 records loaded
--prompt 4 records loaded

--set feedback on
--set define on
--prompt Done
