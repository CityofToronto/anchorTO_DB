--PROMPT PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--PROMPT Created by slee5 on June 5, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Disabling foreign key constraints for IGE_USER_STEWARD...
--alter table IGE_USER_STEWARD disable constraint IGE_USER_STEWARD_USERID_FK;
--PROMPT Truncating IGE_USER_STEWARD...
truncate table IGE_USER_STEWARD;
--PROMPT Loading IGE_USER_STEWARD...
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'VSD_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'VOTING_LOCATION_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (26, 'VSD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (26, 'VOTING_LOCATION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (15, 'GENERATE_REPORT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'GENERATE_REPORT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'AMA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (26, 'CONTROLTASK_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (29, 'INTERSECTION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (30, 'CONTROLTASK_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (30, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (53, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (49, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (53, 'AMA_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (51, 'AMA_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (52, 'AMA_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (52, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (53, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (49, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (49, 'CONTROLTASK_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (53, 'CONTROLTASK_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (52, 'CONTROLTASK_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (52, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (53, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (49, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (29, 'STEWARD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'STEWARD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (30, 'VSD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (30, 'VOTING_LOCATION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (27, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (27, 'STEWARD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (29, 'ADDRESS_VIEW', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (26, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (27, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (29, 'SEGMENT_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (31, 'LINEARNAME_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (31, 'INTERSECTION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (31, 'SEGMENT_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'LINEARNAME_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (27, 'CONTROLTASK_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'INTERSECTION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (45, 'ADDRESS_VIEW', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (45, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (30, 'SEGMENT_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (15, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (19, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (22, 'AMA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (15, 'AMA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (12, 'LINEARNAME_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (22, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (15, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (12, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (14, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (12, 'CONTROLTASK_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (14, 'CONTROLTASK_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (30, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'CONTROLTASK_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (38, 'AMA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (12, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (27, 'INTERSECTION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (29, 'CONTROLTASK_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (29, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (32, 'LINEARNAME_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (32, 'INTERSECTION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (32, 'SEGMENT_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'SEGMENT_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (31, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (14, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (27, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (29, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (27, 'VSD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (27, 'VOTING_LOCATION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'ADDRESS_VIEW', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (30, 'STEWARD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (34, 'INTERSECTION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (30, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (34, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (43, 'VOTING_LOCATION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (15, 'LINEARNAME_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (47, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (19, 'SEGMENT_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (52, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (51, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (49, 'AMA_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (31, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (31, 'AMA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (41, 'VSD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (44, 'VOTING_LOCATION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (44, 'VSD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'VSD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (31, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (47, 'AMA_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (47, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (51, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (51, 'CONTROLTASK_MAINT', 'N', 'N');
--commit;
--PROMPT 100 records committed...
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (47, 'CONTROLTASK_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (47, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (51, 'BROWSE_CODES', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (48, 'CADASTRE_MAINT', 'Y', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (48, 'PLAN_PARCEL_MAINT', 'Y', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (29, 'VOTING_LOCATION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (29, 'VSD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (30, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (30, 'GENERATE_REPORT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (41, 'VOTING_LOCATION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'GENERATE_REPORT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (48, 'SOURCE_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (48, 'CONTROLTASK_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (48, 'INTERSECTION_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (48, 'SEGMENT_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (26, 'STEWARD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (26, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (26, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (27, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (39, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (39, 'STEWARD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (43, 'VSD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (42, 'VSD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (42, 'VOTING_LOCATION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (28, 'VOTING_LOCATION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (15, 'SEGMENT_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (48, 'MUNICIPAL_PARCEL_MAINT', 'Y', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'ADDRESS_VIEW', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (48, 'PRIVATE_ROAD_MAINT', 'Y', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'ADDRESS_VIEW', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (15, 'INTERSECTION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'CONTROLTASK_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'INTERSECTION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'INTERSECTION_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'LINEARNAME_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'CONTROLTASK_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'CADASTRE_MAINT', 'N', 'N');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'AMA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'SEGMENT_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'ADDRESS_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'AMA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'LINEARNAME_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'SEGMENT_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (7, 'STEWARD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'STEWARD_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (8, 'CADASTRE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (14, 'AMA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (22, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (12, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (14, 'SOURCE_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (15, 'SITE_AREA_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (15, 'CONTROLTASK_MAINT', 'N', 'Y');
insert into IGE_USER_STEWARD (user_id, steward_group, supervisor, enabled)
values (22, 'CONTROLTASK_MAINT', 'N', 'Y');
--commit;
--PROMPT 158 records loaded
--PROMPT Enabling foreign key constraints for IGE_USER_STEWARD...
--alter table IGE_USER_STEWARD enable constraint IGE_USER_STEWARD_USERID_FK;

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
