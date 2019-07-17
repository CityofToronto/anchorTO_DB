--PROMPT PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--PROMPT Created by slee5 on June 5, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_CONTROL_TASK_STATUS...
truncate table DMN_CONTROL_TASK_STATUS;
--PROMPT Loading DMN_CONTROL_TASK_STATUS...
insert into DMN_CONTROL_TASK_STATUS (control_task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('INITIALIZED', 'Initialized', 1, to_timestamp('24-06-2008 14:00:10', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CONTROL_TASK_STATUS (control_task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('READY', 'Ready', 2, to_timestamp('24-06-2008 14:00:10', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CONTROL_TASK_STATUS (control_task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('IN PROGRESS', 'In progress', 3, to_timestamp('24-06-2008 14:00:10', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CONTROL_TASK_STATUS (control_task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('COMPLETED', 'Completed', 4, to_timestamp('24-06-2008 14:00:10', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CONTROL_TASK_STATUS (control_task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CLOSED', 'Closed', 5, to_timestamp('24-06-2008 14:00:10', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CONTROL_TASK_STATUS (control_task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CLOSE FAILED', 'Close failed', 6, to_timestamp('24-06-2008 14:00:10', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CONTROL_TASK_STATUS (control_task_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('POST FAILED', 'Post failed', 7, to_timestamp('24-06-2008 14:00:10', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 7 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
