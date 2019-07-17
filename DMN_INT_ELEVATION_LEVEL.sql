--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 5, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_INT_ELEVATION_LEVEL...
truncate table DMN_INT_ELEVATION_LEVEL;
--PROMPT Loading DMN_INT_ELEVATION_LEVEL...
insert into DMN_INT_ELEVATION_LEVEL (elevation_level, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (0, 'Ground Level', 1, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEVATION_LEVEL (elevation_level, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (1, 'One Level above Ground', 2, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEVATION_LEVEL (elevation_level, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (2, 'Two Levels above Ground', 3, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEVATION_LEVEL (elevation_level, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (-1, 'One Level under Ground', 4, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_INT_ELEVATION_LEVEL (elevation_level, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (-2, 'Two Levels under Ground', 5, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 5 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
