--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 5, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_INT_ELEV_FEATURE_CODE...
truncate table DMN_INT_ELEV_FEATURE_CODE;
--PROMPT Loading DMN_INT_ELEV_FEATURE_CODE...
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('501100', 'Expressway', 1, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('501200', 'Major', 2, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('501300', 'Minor', 3, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('501700', 'Laneway', 4, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('504000', 'Pedatraian', 5, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('509400', 'River', 6, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('509300', 'Utility', 7, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('502000', 'Railway', 8, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('509900', 'No Intersection', 9, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('509200', 'Pseudo', 10, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('509100', 'Cul de sac', 11, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEV_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('509999', 'Unknown', 12, to_timestamp('18-11-2008 13:18:16', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 12 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
