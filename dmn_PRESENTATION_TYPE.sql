--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019
--set feedback off
--set define off

--prompt Truncating DMN_PRESENTATION_TYPE...
truncate table DMN_PRESENTATION_TYPE;
--prompt Loading DMN_PRESENTATION_TYPE...
insert into DMN_PRESENTATION_TYPE (pres_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('dgn', 'MicroStation Design File', 5, to_timestamp('24-06-2008', 'dd-mm-yyyy'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PRESENTATION_TYPE (pres_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('doc', 'Microsoft Word', 1, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PRESENTATION_TYPE (pres_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('jpg', 'Raster', 2, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
values ('jpg', 'Raster', 2, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PRESENTATION_TYPE (pres_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('txt', 'Plain text', 3, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PRESENTATION_TYPE (pres_type, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('pdf', 'PDF', 4, to_timestamp('24-06-2008 14:00:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 5 records loaded

--set feedback on
--set define on
--prompt Done
