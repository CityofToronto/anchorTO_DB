--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 6, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_OAR_CLASS_LINKAGE...
truncate table DMN_OAR_CLASS_LINKAGE;
--PROMPT Loading DMN_OAR_CLASS_LINKAGE...
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10011, 11000, 'S+SE=>L', 1, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10100, 11000, 'LE=>L', 5, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (100, 1000, 'LE=>L', 7, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11, 1011, 'S+SE=>L+S+SE', 8, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11, 1100, 'S+SE=>L+LE', 10, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10011, 11100, 'S+SE=>L+LE', 2, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10011, 11011, 'S+SE=>L+S+SE', 3, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10100, 11011, 'LE=>L+S+SE', 6, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11, 1000, 'S+SE=>L', 9, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (100, 1011, 'LE=>L+S+SE', 5, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10001, 10011, 'SE=>S+SE', 6, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10001, 11011, 'SE=>L+S+SE', 7, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10100, 11100, 'LE=>L+LE', 4, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (100, 1100, 'LE=>L+LE', 8, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1, 11, 'SE=>S+SE', 1, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_LINKAGE (address_class_flag, link_address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1, 1011, 'L+S+SE', 1, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 16 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
