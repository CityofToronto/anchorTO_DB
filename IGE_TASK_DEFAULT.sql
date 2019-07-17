--PROMPT PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--PROMPT Created by slee5 on June 24, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating IGE_TASK_DEFAULT...
truncate table IGE_TASK_DEFAULT;
--PROMPT Loading IGE_TASK_DEFAULT...
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('PARCEL', 'PLANPARCEL', 'PLAN_PARCEL_MAINT', 110, 'Create Plan Parcel');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('PARCEL', 'MUNICIPALPARCEL', 'MUNICIPAL_PARCEL_MAINT', 120, 'Create Municipal Parcel');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('PARCEL', 'EASEMENT', 'EASEMENT_MAINT', 130, 'Create Easement');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('PARCEL', 'PRIVATEROAD', 'PRIVATE_ROAD_MAINT', 140, 'Create Private Road');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('PARCEL', 'ADJUSTMENT', 'ADJUSTMENT_MAINT', 150, 'Adjust Parcel');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('STREET/ADDRESS', 'SITEAREA', 'SITE_AREA_MAINT', 70, 'Close Site Area');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('STREET/ADDRESS', 'SITEAREA', 'SITE_AREA_MAINT', 10, 'Create/adjust Site Area');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('STREET/ADDRESS', 'LINEARNAME', 'LINEARNAME_MAINT', 20, 'Add/adjust/delete Linear Name');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('STREET/ADDRESS', 'AMA', 'AMA_MAINT', 30, 'Add/adjust/delete AMA');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('STREET/ADDRESS', 'CENTRELINE', 'SEGMENT_MAINT', 50, 'Add/edit/delete Segments');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('STREET/ADDRESS', 'INTERSECTION', 'INTERSECTION_MAINT', 40, 'Add/edit/delete Intersections');
insert into IGE_TASK_DEFAULT (control_task_type, task_type, assigned_to, task_sequence, control_task_comments)
values ('STREET/ADDRESS', 'ADDRESSPOINT', 'ADDRESS_MAINT', 60, 'Add/edit/delete Reserved Address Points');
--commit;
--PROMPT 12 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
