--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019
--set feedback off
--set define off

--prompt Truncating DMN_PLAN_TYPE...
truncate table DMN_PLAN_TYPE;
--prompt Loading DMN_PLAN_TYPE...
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('INHOUSE MAINTENANCE', 'In-house Maintenance', 'N', null, 319, to_timestamp('14-03-2016 13:16:46', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('APPORTIONMENT SHEET', 'MPAC document', 'N', null, 101, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('BYLAW', 'By-Law', 'N', null, 105, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('COMMITTEE REPORT', 'C.O.A and Local Council report', 'N', null, 205, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('COURT ORDER', 'Provincial Judge order', 'N', null, 207, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('DIGITIZING', 'Parcel Map by digitizing', 'N', null, 209, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('FIELD TIES', 'Control points and ties', 'N', null, 213, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('HISTORIC PLAN', 'Historic plan', 'N', null, 215, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('METES AND BOUNDS', 'Metes and Bounds descriptions', 'N', null, 221, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ONTARIO MUNICIPAL BOARD', 'Ontario Municipal Board document', 'N', null, 225, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PRELIMINARY PLAN', 'Preliminary plan', 'N', null, 309, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PROPERTY AND PIN REPORT', 'Land Registry Office or Teranet report', 'N', null, 227, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('TRANSACTION', 'Land Registry Office document', 'Y', null, 115, to_timestamp('21-01-2016 14:44:52', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CERTIFICATION OF TITLE ACT PLAN', 'Certification of Title Act Plan', 'N', null, 203, to_timestamp('17-02-2016 14:29:56', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('INDEX PLAN', 'Index Plan', 'N', null, 217, to_timestamp('17-02-2016 14:29:56', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('DEPOSITED PLAN', 'Deposited Plan', 'N', null, 303, to_timestamp('17-02-2016 14:29:56', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('DESIGNATION PLAN', 'Designation plan', 'N', null, 305, to_timestamp('17-02-2016 14:29:56', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('TOWNSHIP', 'Original Township plan', 'N', null, 315, to_timestamp('17-02-2016 14:29:56', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('UNKNOWN', 'Unknown', 'N', null, 317, to_timestamp('17-02-2016 14:29:56', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('BOUNDARIES ACT PLAN', 'Boundaries act plan', 'N', 'PLAN', 1, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CANADA LAND PLAN', 'Canada Land Plan', 'N', 'LAND PLAN', 2, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CONDOMINIUM PLAN', 'Condominium plan', 'Y', 'CONDO PLAN', 3, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CROWN LOCATION PLAN', 'Crown location plan', 'Y', 'PLAN ', 4, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('DIRECTOR''S PLAN', 'Director''s plan', 'Y', 'PLAN', 5, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('EXPROPRIATION PLAN', 'Expropriation plan', 'Y', 'EXP PLAN', 6, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('JUDGE''S PLAN', 'Judge''s plan', 'Y', 'JUDGES PLAN', 7, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MUNICIPAL PLAN', 'Municipal plan', 'Y', null, 8, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PLAN OF SUBDIVISION', 'Plan of subdivision', 'Y', 'REG PLAN', 9, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PLAN OF SURVEY', 'Plan of survey', 'N', 'PLAN ', 10, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('REFERENCE PLAN', 'Reference plan', 'N', 'REF PLAN', 11, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('REGISTRAR''S COMPILED PLAN', 'Registrar''s compiled plan', 'Y', 'REG COMP PLAN', 12, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_PLAN_TYPE (plan_type, description, subdiv_fabric, name_abbreviation, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('SKETCH', 'Sketch', 'N', 'SKETCH', 13, to_timestamp('01-10-2008 13:56:22', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 32 records loaded

--set feedback on
--set define on
--prompt Done
