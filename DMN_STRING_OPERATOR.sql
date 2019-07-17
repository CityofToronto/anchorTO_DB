--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 5, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_STRING_OPERATOR...
truncate table DMN_STRING_OPERATOR;
--PROMPT Loading DMN_STRING_OPERATOR...
insert into DMN_STRING_OPERATOR ("operator", description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (0, 'Start With', 1, to_timestamp('06-10-2008 09:49:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STRING_OPERATOR ("operator", description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1, 'Contains', 2, to_timestamp('06-10-2008 09:49:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 2 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
