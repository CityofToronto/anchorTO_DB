--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 6, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_OAR_CLASS...
truncate table DMN_OAR_CLASS;
--PROMPT Loading DMN_OAR_CLASS...
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1, 'SE', 'Structure Entrance', 'S', 1, 'OTHER', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11, 'S', 'Structure', 'L', 2, 'OTHER', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11, 'SE', 'Structure Entrance', 'S', 3, 'SAME', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (100, 'LE', 'Land Entrance', 'L', 4, 'OTHER', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1000, 'L', 'Land', null, 5, null, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1011, 'L', 'Land', null, 6, null, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1011, 'S', 'Structure', 'L', 7, 'SAME', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1011, 'SE', 'Structure Entrance', 'S', 8, 'SAME', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1100, 'L', 'Land', null, 9, null, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1100, 'LE', 'Land Entrance', 'L', 10, 'SAME', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10001, 'SE', 'Structure Entrance', 'S', 11, 'OTHER', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10011, 'S', 'Structure', 'L', 12, 'OTHER', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10011, 'SE', 'Structure Entrance', 'S', 13, 'SAME', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10100, 'LE', 'Land Entrance', 'L', 14, 'OTHER', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11000, 'L', 'Land', null, 15, null, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11011, 'L', 'Land', null, 16, null, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11011, 'S', 'Structure', 'L', 17, 'SAME', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11011, 'SE', 'Structure Entrance', 'S', 18, 'SAME', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11100, 'L', 'Land', null, 19, null, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS (address_class_flag, address_class, description, link_to_class, sort_sequence, link_to_point, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11100, 'LE', 'Land Entrance', 'L', 20, 'SAME', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 20 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
