--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019
--set feedback off
--set define off

--prompt Disabling foreign key constraints for DMN_PLAN_TYPE_EXT...
--alter table DMN_PLAN_TYPE_EXT disable constraint DMN_PLAN_TYPE_EXT_FK;
--prompt Truncating DMN_PLAN_TYPE_EXT...
truncate table DMN_PLAN_TYPE_EXT;
--prompt Loading DMN_PLAN_TYPE_EXT...
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('BA', 'PREFIX', 'Prefix', 'BOUNDARIES ACT PLAN', 1, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('C', 'PREFIX', 'Prefix', 'CROWN LOCATION PLAN', 2, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('D', 'PREFIX', 'Prefix', 'DIRECTOR''S PLAN', 3, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('D', 'PREFIX', 'Prefix', 'EXPROPRIATION PLAN', 4, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('M', 'PREFIX', 'Prefix', 'EXPROPRIATION PLAN', 5, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MX', 'PREFIX', 'Prefix', 'EXPROPRIATION PLAN', 6, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CA', 'PREFIX', 'Prefix', 'EXPROPRIATION PLAN', 7, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('AT', 'PREFIX', 'Prefix', 'EXPROPRIATION PLAN', 8, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('M', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 9, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('66M', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 10, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('R', 'PREFIX', 'Prefix', 'REFERENCE PLAN', 11, to_timestamp('01-10-2008 13:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('DES', 'PREFIX', 'Prefix', 'DESIGNATION PLAN', 30501, to_timestamp('04-04-2016 10:44:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('BA', 'PREFIX', 'Prefix', 'BOUNDARIES ACT PLAN', 10301, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MTCP', 'PREFIX', 'Prefix', 'CONDOMINIUM PLAN', 10701, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MTSCP', 'PREFIX', 'Prefix', 'CONDOMINIUM PLAN', 10702, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('TCECP', 'PREFIX', 'Prefix', 'CONDOMINIUM PLAN', 10703, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('TLCP', 'PREFIX', 'Prefix', 'CONDOMINIUM PLAN', 10704, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('TSCP', 'PREFIX', 'Prefix', 'CONDOMINIUM PLAN', 10705, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('TVLCP', 'PREFIX', 'Prefix', 'CONDOMINIUM PLAN', 10706, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('YCP', 'PREFIX', 'Prefix', 'CONDOMINIUM PLAN', 10707, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MX', 'PREFIX', 'Prefix', 'EXPROPRIATION PLAN', 10901, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('65M', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11101, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('66M', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11102, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('M', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11103, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('A', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11104, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('B', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11105, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('C', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11106, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('D', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11107, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('E', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11108, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CITY', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11109, to_timestamp('17-02-2016 14:36:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('YORK', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11110, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('Forest Hill', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11111, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('Old York', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11112, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('Pickering', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11113, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('Markham', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11114, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ETC', 'PREFIX', 'Prefix', 'PLAN OF SUBDIVISION', 11115, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('40R', 'PREFIX', 'Prefix', 'REFERENCE PLAN', 11301, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('43R', 'PREFIX', 'Prefix', 'REFERENCE PLAN', 11302, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('63R', 'PREFIX', 'Prefix', 'REFERENCE PLAN', 11303, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('64R', 'PREFIX', 'Prefix', 'REFERENCE PLAN', 11304, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('65R', 'PREFIX', 'Prefix', 'REFERENCE PLAN', 11305, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('66R', 'PREFIX', 'Prefix', 'REFERENCE PLAN', 11306, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('R', 'PREFIX', 'Prefix', 'REFERENCE PLAN', 11307, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('RS', 'PREFIX', 'Prefix', 'REFERENCE PLAN', 11308, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('RD', 'PREFIX', 'Prefix', 'REFERENCE PLAN', 11309, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CANL', 'PREFIX', 'Prefix', 'CANADA LAND PLAN', 20101, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CERT', 'PREFIX', 'Prefix', 'CERTIFICATION OF TITLE ACT PLAN', 20301, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('DIG', 'PREFIX', 'Prefix', 'DIGITIZING', 20901, to_timestamp('17-02-2016 14:36:33', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('HIST', 'PREFIX', 'Prefix', 'HISTORIC PLAN', 21501, to_timestamp('17-02-2016 14:36:40', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('IDX', 'PREFIX', 'Prefix', 'INDEX PLAN', 21701, to_timestamp('17-02-2016 14:36:40', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MET', 'PREFIX', 'Prefix', 'METES AND BOUNDS', 22101, to_timestamp('17-02-2016 14:36:45', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MUN', 'PREFIX', 'Prefix', 'MUNICIPAL PLAN', 22301, to_timestamp('17-02-2016 14:36:45', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CL', 'PREFIX', 'Prefix', 'CROWN LOCATION PLAN', 30101, to_timestamp('17-02-2016 14:36:45', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('DEP', 'PREFIX', 'Prefix', 'DEPOSITED PLAN', 30301, to_timestamp('17-02-2016 14:36:45', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('NREG', 'PREFIX', 'Prefix', 'PLAN OF SURVEY', 30701, to_timestamp('17-02-2016 14:36:45', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('D', 'PREFIX', 'Prefix', 'PLAN OF SURVEY', 30702, to_timestamp('17-02-2016 14:36:45', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CT', 'PREFIX', 'Prefix', 'PLAN OF SURVEY', 30703, to_timestamp('17-02-2016 14:36:45', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MT', 'PREFIX', 'Prefix', 'PLAN OF SURVEY', 30704, to_timestamp('17-02-2016 14:36:45', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PRE', 'PREFIX', 'Prefix', 'PRELIMINARY PLAN', 30901, to_timestamp('17-02-2016 14:36:45', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('SKETCH', 'PREFIX', 'Prefix', 'SKETCH', 31301, to_timestamp('17-02-2016 14:36:50', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('TWN', 'PREFIX', 'Prefix', 'TOWNSHIP', 31501, to_timestamp('17-02-2016 14:36:50', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('UNK', 'PREFIX', 'Prefix', 'UNKNOWN', 31701, to_timestamp('17-02-2016 14:36:50', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('RCP', 'PREFIX', 'Prefix', 'REGISTRAR''S COMPILED PLAN', 31101, to_timestamp('17-02-2016 14:37:57', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('DIR', 'PREFIX', 'Prefix', 'DIRECTOR''S PLAN', 21101, to_timestamp('17-02-2016 14:38:38', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE_EXT (ext_name, ext_type, description, plan_type, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('JDG', 'PREFIX', 'Prefix', 'JUDGE''S PLAN', 21901, to_timestamp('17-02-2016 14:38:58', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 65 records loaded
--prompt Enabling foreign key constraints for DMN_PLAN_TYPE_EXT...
--alter table DMN_PLAN_TYPE_EXT enable constraint DMN_PLAN_TYPE_EXT_FK;

--set feedback on
--set define on
--prompt Done
