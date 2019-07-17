--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019
--set feedback off
--set define off

--prompt Truncating DMN_TASK_TYPE...
truncate table DMN_TASK_TYPE;
--prompt Loading DMN_TASK_TYPE...
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PLANPARCEL', 'Plan Parcel Maintenance', 11, to_timestamp('31-07-2012 12:12:17', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MUNICIPALPARCEL', 'Municipal Parcel Maintenance', 12, to_timestamp('31-07-2012 12:12:17', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('EASEMENT', 'Easement Maintenance', 13, to_timestamp('31-07-2012 12:12:17', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PRIVATEROAD', 'Private Road Maintenance', 14, to_timestamp('31-07-2012 12:12:17', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ADJUSTMENT', 'Adjustment', 15, to_timestamp('31-07-2012 12:12:17', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('LINEARNAME', 'Linear Name', 1, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
values ('LINEARNAME', 'Linear Name', 1, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('AMA', 'Municipal Number', 2, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CENTRELINE', 'Centreline', 3, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ADDRESSPOINT', 'Address Point', 4, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('INTERSECTION', 'Intersection', 5, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ADDRESSUNIT', 'Address Unit', 6, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_TASK_TYPE (task_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('SITEAREA', 'Site Area', 7, to_timestamp('24-06-2008 14:00:13', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 12 records loaded

--set feedback on
--set define on
--prompt Done
