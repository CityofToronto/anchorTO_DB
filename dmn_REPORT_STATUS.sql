--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019
--set feedback off
--set define off

--prompt Truncating DMN_REPORT_STATUS...
truncate table DMN_REPORT_STATUS;
--prompt Loading DMN_REPORT_STATUS...
insert into DMN_REPORT_STATUS (report_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PREAPPROVAL', 'Pre-Approval', 1, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_REPORT_STATUS (report_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('APPROVED', 'Approved', 2, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 2 records loaded

--set feedback on
--set define on
--prompt Done
--prompt Done
