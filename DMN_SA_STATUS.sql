--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 6, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_SA_STATUS...
truncate table DMN_SA_STATUS;
--PROMPT Loading DMN_SA_STATUS...
insert into DMN_SA_STATUS (site_area_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('A', 'Current Without Parcel', 1, to_timestamp('06-10-2008 09:49:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_SA_STATUS (site_area_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('P', 'Current With Parcel', 2, to_timestamp('06-10-2008 09:49:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-2000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_SA_STATUS (site_area_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('C', 'Complete', 3, to_timestamp('06-10-2008 09:49:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_SA_STATUS (site_area_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('X', 'Abandoned', 4, to_timestamp('06-10-2008 09:49:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 4 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
