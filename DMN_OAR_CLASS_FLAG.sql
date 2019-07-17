--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 6, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_OAR_CLASS_FLAG...
truncate table DMN_OAR_CLASS_FLAG;
--PROMPT Loading DMN_OAR_CLASS_FLAG...
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1000, 'Land', 'RESERVED', 1, 'L', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (100, 'Land Entrance', 'RESERVED', 2, 'LE', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1100, 'Land, Land Entrance', 'RESERVED', 3, 'L,LE', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1011, 'Land, Structure, Structure Entrance', 'RESERVED', 4, 'L,S,SE', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11, 'Structure, Structure Entrance', 'RESERVED', 5, 'S,SE', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1, 'Structure Entrance', 'RESERVED', 6, 'SE', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11000, 'Land', 'REGULAR', 11, 'L', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-2000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10100, 'Land Entrance', 'REGULAR', 12, 'LE', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11100, 'Land, Land Entrance', 'REGULAR', 13, 'L,LE', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (11011, 'Land, Structure, Structure Entrance', 'REGULAR', 14, 'L,S,SE', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10011, 'Structure, Structure Entrance', 'REGULAR', 15, 'S,SE', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CLASS_FLAG (address_class_flag, description, maint_stage, sort_sequence, abbr_description, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (10001, 'Structure Entrance', 'REGULAR', 16, 'SE', to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 12 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
