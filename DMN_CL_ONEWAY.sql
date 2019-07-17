--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 5, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_CL_ONEWAY...
truncate table DMN_CL_ONEWAY;
--PROMPT Loading DMN_CL_ONEWAY...
insert into DMN_CL_ONEWAY (oneway_dir_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (0, 'Not One-Way', 1, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_ONEWAY (oneway_dir_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1, 'Follow-Digitization', 2, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_ONEWAY (oneway_dir_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (-1, 'Against-Digitization', 3, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 3 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
