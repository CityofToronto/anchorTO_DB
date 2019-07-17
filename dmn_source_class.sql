--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019
--set feedback off
--set define off

--prompt Truncating DMN_SOURCE_CLASS...
truncate table DMN_SOURCE_CLASS;
--prompt Loading DMN_SOURCE_CLASS...
insert into DMN_SOURCE_CLASS (source_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CADAST_DOCUMENT', 'CADAST_DOCUMENT', 3, to_timestamp('21-01-2016 14:43:51', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_SOURCE_CLASS (source_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PLAN', 'PLAN', 1, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_SOURCE_CLASS (source_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('REPORT', 'REPORT', 2, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 3 records loaded

--set feedback on
--set define on
--prompt Done
