--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 5, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_CL_FEATURE_CODE...
truncate table DMN_CL_FEATURE_CODE;
--PROMPT Loading DMN_CL_FEATURE_CODE...
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201803, 'Access Road', 27, to_timestamp('08-03-2013 11:53:38', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 4, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201100, 'Expressway', 1, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201101, 'Expressway Ramp', 2, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201200, 'Major Arterial', 3, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201201, 'Major Arterial Ramp', 4, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201300, 'Minor Arterial', 5, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201301, 'Minor Arterial Ramp', 6, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201400, 'Collector', 7, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201401, 'Collector Ramp', 8, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201500, 'Local', 9, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201600, 'Other', 10, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201601, 'Other Ramp', 11, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201700, 'Laneway', 12, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201800, 'Pending', 13, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (202001, 'Major Railway', 14, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (202002, 'Minor Railway', 15, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (202003, 'Railway under construcion/proposed', 16, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (203001, 'River', 17, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (203002, 'Creek/Tributary', 18, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (204001, 'Trail', 19, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (204002, 'Walkway', 20, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (205001, 'Hydro Line', 21, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (206001, 'Major Shoreline', 22, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (206002, 'Minor Shoreline (Land locked)', 23, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (207001, 'Geostatistical line', 24, to_timestamp('06-10-2008 09:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (201801, 'Busway', 26, to_timestamp('27-05-2009 12:10:00', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 3, -1);
insert into DMN_CL_FEATURE_CODE (feature_code, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (208001, 'Ferry Route', 25, to_timestamp('22-04-2009 11:18:18', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
--commit;
--PROMPT 27 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
