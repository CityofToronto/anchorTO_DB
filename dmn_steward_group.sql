--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019


--prompt Truncating DMN_STEWARD_GROUP...
truncate table DMN_STEWARD_GROUP;
--prompt Loading DMN_STEWARD_GROUP...
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('VSD_MAINT', 'Voting SubDivision Maintenance', 20, to_timestamp('10-07-2009 09:58:03', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('VOTING_LOCATION_MAINT', 'Voting Location Maintenance', 30, to_timestamp('10-07-2009 09:58:03', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('BROWSE_CODES', 'Browse Feature Codes', 16, to_timestamp('18-06-2009', 'dd-mm-yyyy'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('GENERATE_REPORT', 'Generate Report', 17, to_timestamp('29-07-2008', 'dd-mm-yyyy'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CENTRELINE_NETWORK_MAINT', 'Centreline Network Maintenance', 12, to_timestamp('05-03-2009 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ADDRESS_NETWORK_MAINT', 'Address Network Maintenance', 13, to_timestamp('05-03-2009 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ADJUSTMENT_MAINT', 'Cadatstral Fabric Adjustment Management', 110, to_timestamp('09-07-2013 16:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('EASEMENT_MAINT', 'Cadastral Fabric Easement Management', 140, to_timestamp('09-07-2013 16:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('MUNICIPAL_PARCEL_MAINT', 'Municipal Parcel Management', 120, to_timestamp('09-07-2013 16:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PLAN_PARCEL_MAINT', 'Plan Parcel Management', 100, to_timestamp('09-07-2013 16:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('PRIVATE_ROAD_MAINT', 'Cadastral Private Road Management', 130, to_timestamp('09-07-2013 16:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('SITE_AREA_MAINT', 'Site Area Management', 10, to_timestamp('24-06-2008', 'dd-mm-yyyy'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ADDRESS_MAINT', 'Address Point Management', 1, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ADDRESS_VIEW', 'Address Point Viewing', 2, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('SOURCE_MAINT', 'Source Management', 8, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('AMA_MAINT', 'Municipal Number Management', 3, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CADASTRE_MAINT', 'Cadastral Management', 5, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('LINEARNAME_MAINT', 'Linear Name Management', 4, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('SEGMENT_MAINT', 'Centreline Management', 6, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('INTERSECTION_MAINT', 'Intersection Management', 7, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CONTROLTASK_MAINT', 'Control Task Management', 11, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_GROUP (steward_group, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('STEWARD_MAINT', 'Steward Management', 9, to_timestamp('24-06-2008 14:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 22 records loaded


--prompt Done
