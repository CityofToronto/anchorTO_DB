--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 5, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_INT_CLASSIFICATION...
truncate table DMN_INT_CLASSIFICATION;
--PROMPT Loading DMN_INT_CLASSIFICATION...
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MJRSL', 'Major-Single Level', 1, to_timestamp('06-01-2009 10:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MNRSL', 'Minor-Single Level', 2, to_timestamp('06-01-2009 10:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('LSRSL', 'Lesser-Single Level', 3, to_timestamp('06-01-2009 10:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CDSSL', 'Cul de Sac-Single Level', 4, to_timestamp('06-01-2009 10:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('SEUSL', 'Pseudo Intersection-Single Level', 5, to_timestamp('06-01-2009 10:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('XICSL', 'Expressway Interchange-Single Level', 6, to_timestamp('06-01-2009 10:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('STASL', 'Statistical-Single Level', 7, to_timestamp('06-01-2009 10:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('SEUML', 'Pseudo Intersection-Overpass/Underpass', 8, to_timestamp('06-01-2009 10:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MJRML', 'Major-Multi Level', 9, to_timestamp('06-01-2009 10:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MNRML', 'Minor-Multi Level', 10, to_timestamp('06-01-2009 10:41:43', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_CLASSIFICATION (classification, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('LSRML', 'Lesser-Multi Level', 11, to_timestamp('06-01-2009 10:42:01', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 11 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
