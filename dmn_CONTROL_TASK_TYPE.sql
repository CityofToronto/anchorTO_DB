--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019
--set feedback off
--set define off

--prompt Truncating DMN_CONTROL_TASK_TYPE...
truncate table DMN_CONTROL_TASK_TYPE;
--prompt Loading DMN_CONTROL_TASK_TYPE...
insert into DMN_CONTROL_TASK_TYPE (control_task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PARCEL', 'Cadastral', 1, to_timestamp('24-06-2008 14:00:10', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CONTROL_TASK_TYPE (control_task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('STREET/ADDRESS', 'Centreline/Address', 2, to_timestamp('24-06-2008 14:00:10', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 2 records loaded
--prompt 2 records loaded

--set feedback on
--set define on
--prompt Done
