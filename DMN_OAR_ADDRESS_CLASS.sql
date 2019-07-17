--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 6, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_OAR_ADDRESS_CLASS...
truncate table DMN_OAR_ADDRESS_CLASS;
--PROMPT Loading DMN_OAR_ADDRESS_CLASS...
insert into DMN_OAR_ADDRESS_CLASS (address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('L', 'Land', 1, to_timestamp('25-01-2009 19:35:07', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_ADDRESS_CLASS (address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('LE', 'Land Entrance', 2, to_timestamp('25-01-2009 19:35:07', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_ADDRESS_CLASS (address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('S', 'Structure', 3, to_timestamp('25-01-2009 19:35:07', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_ADDRESS_CLASS (address_class, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('SE', 'Structure Entrance', 4, to_timestamp('25-01-2009 19:35:07', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 4 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
