--PROMPT PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--PROMPT Created by slee5 on June 24, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating IGE_TASK_STEWARD...
truncate table IGE_TASK_STEWARD;
--PROMPT Loading IGE_TASK_STEWARD...
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('ADDRESSPOINT', 'ADDRESS_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('ADJUSTMENT', 'ADJUSTMENT_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('AMA', 'AMA_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('CENTRELINE', 'SEGMENT_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('EASEMENT', 'EASEMENT_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('ELECTION', 'VOTING_LOCATION_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('ELECTION', 'VSD_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('INTERSECTION', 'INTERSECTION_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('LINEARNAME', 'LINEARNAME_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('MUNICIPALPARCEL', 'MUNICIPAL_PARCEL_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('PLANPARCEL', 'PLAN_PARCEL_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('PRIVATEROAD', 'PRIVATE_ROAD_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('SITEAREA', 'SITE_AREA_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('SOURCE', 'SOURCE_MAINT');
insert into IGE_TASK_STEWARD (task_type, steward_group)
values ('STEWARD', 'STEWARD_MAINT');
--commit;
--PROMPT 15 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
