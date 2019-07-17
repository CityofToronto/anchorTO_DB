--PROMPT PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--PROMPT Created by slee5 on June 24, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating IGE_TRANS_CONFLICT_LOG...
truncate table IGE_TRANS_CONFLICT_LOG;
--PROMPT Loading IGE_TRANS_CONFLICT_LOG...
insert into IGE_TRANS_CONFLICT_LOG (registration_id, owner, table_name, sde_row_id, version1, version2, conflict_type, trans_id)
values (163, 'NETWORK', 'ADDRESS_POINT', 152298, 'SDE.DEFAULT', 'IGE.TRANS200596', 'UPDATE_DELETE', 200596);
insert into IGE_TRANS_CONFLICT_LOG (registration_id, owner, table_name, sde_row_id, version1, version2, conflict_type, trans_id)
values (332, 'BIZAREA', 'BIZ_POINT_ATTR_EXT', 3035, 'SDE.DEFAULT', 'IGE.TRANS207177', 'UPDATE_UPDATE', 207177);
insert into IGE_TRANS_CONFLICT_LOG (registration_id, owner, table_name, sde_row_id, version1, version2, conflict_type, trans_id)
values (158, 'NETWORK', 'BASE_TURN', 476788, 'SDE.DEFAULT', 'IGE.TRANS203581', 'UPDATE_DELETE', 203581);
insert into IGE_TRANS_CONFLICT_LOG (registration_id, owner, table_name, sde_row_id, version1, version2, conflict_type, trans_id)
values (153, 'NETWORK', 'BASE_INTERSECTION_ELEVATION', 51980, 'SDE.DEFAULT', 'IGE.TRANS202147', 'UPDATE_UPDATE', 202147);
--commit;
--PROMPT 4 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
