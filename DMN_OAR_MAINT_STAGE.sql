--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 6, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_OAR_MAINT_STAGE...
truncate table DMN_OAR_MAINT_STAGE;
--PROMPT Loading DMN_OAR_MAINT_STAGE...
insert into DMN_OAR_MAINT_STAGE (maint_stage, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('RESERVED', 'Reserved', 1, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_MAINT_STAGE (maint_stage, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('REGULAR', 'Regular', 2, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 2 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
