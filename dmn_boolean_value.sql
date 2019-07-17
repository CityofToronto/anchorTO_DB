--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019


--prompt Truncating DMN_BOOLEAN_VALUE...
truncate table DMN_BOOLEAN_VALUE;
--prompt Loading DMN_BOOLEAN_VALUE...
insert into DMN_BOOLEAN_VALUE (boolean_value, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('Y', 'Yes', 1, to_timestamp('18-09-2008 12:12:21', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_BOOLEAN_VALUE (boolean_value, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('N', 'No', 2, to_timestamp('18-09-2008 12:12:21', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 2 records loaded


--prompt Done
