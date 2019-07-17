--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 5, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_LN_APPROVAL_STATUS...
truncate table DMN_LN_APPROVAL_STATUS;
--PROMPT Loading DMN_LN_APPROVAL_STATUS...
insert into DMN_LN_APPROVAL_STATUS (approval_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('S', 'System Coded Name', 1, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_LN_APPROVAL_STATUS (approval_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('A', 'Approved', 2, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_LN_APPROVAL_STATUS (approval_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('P', 'Prior to Approval', 3, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 3 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
