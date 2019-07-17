--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019
--set feedback off
--set define off

--prompt Truncating DMN_TASK_STATUS...
truncate table DMN_TASK_STATUS;
--prompt Loading DMN_TASK_STATUS...
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('COMPLETE FAILED', 'Complete failed', 12, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('HOLD', 'Hold', 11, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('READY', 'Ready', 1, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('TAKEN', 'Taken', 2, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('WORK STARTED', 'Work started', 3, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('WORK STOPPED', 'Work stopped', 4, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
values ('WORK STOPPED', 'Work stopped', 4, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('POSTING', 'Posting', 5, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('POST FAILED', 'Post failed', 6, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('POSTED', 'Posted', 7, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('COMPLETED', 'Completed', 8, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CREATED', 'Created', 9, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ABORTED', 'Aborted', 10, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_STATUS (task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('POST SYSERR', 'System error. Admin group has been notified', 13, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 13 records loaded

--set feedback on
--set define on
--prompt Done
