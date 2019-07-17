--PROMPT PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--PROMPT Created by slee5 on June 24, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating IGE_FIELD_INFO...
truncate table IGE_FIELD_INFO;
--PROMPT Loading IGE_FIELD_INFO...
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_POINT', 'SHAPE', null, null, null, 1, null, 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_INTERSECTION_ELEVATION', 'INTERSECTION_ID', null, 'BASE_INTERSECTION', 'INTERSECTION_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_NAME', 'ADDRESS_NAME_ID', null, null, null, null, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_INTERSECTION_ELEVATION', 'ELEVATION_LEVEL', 'dmn_int_elevation_level', null, null, 0, 'BASE_INTERSECTION', 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_NAME', 'PLACE_NAME', null, null, null, 0, 'ADDRESS_POINT', 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_INTERSECTION_ELEVATION', 'FEATURE_CODE', 'dmn_int_elev_feature_code', null, null, 0, 'BASE_CONNECTIVITY', 1, 0, null, 'Y');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_TURN', 'CONNECTIVITY_FROM_ID', null, 'BASE_CONNECTIVITY', 'CONNECTIVITY_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_TURN', 'CONNECTIVITY_TO_ID', null, 'BASE_CONNECTIVITY', 'CONNECTIVITY_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_INTERSECTION', 'INTERSECTION_ID', null, 'BASE_INTERSECTION_ELEVATION', 'INTERSECTION_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_CLASS', 'ADDRESS_CLASS', 'dmn_oar_class', null, null, 0, 'ADDRESS_POINT', 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_POINT', 'ADDRESS_POINT_ID', null, 'ADDRESS_CLASS', 'ADDRESS_POINT_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CONNECTIVITY', 'CONNECTIVITY_ID', null, 'BASE_TURN', 'CONNECTIVITY_TO_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CONNECTIVITY', 'CONNECTIVITY_ID', null, 'BASE_TURN', 'CONNECTIVITY_FROM_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_CLASS', 'ADDRESS_ID_LINK', null, 'ADDRESS_CLASS', 'ADDRESS_ID', 0, null, 0, 1, null, 'Y');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_POINT', 'CENTRELINE_SIDE', 'dmn_oar_centreline_side', null, null, 0, null, 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'LINEAR_NAME', 'TYPE_PART', null, 'LINEAR_NAME_TYPE', 'TYPE_PART_CODE', 0, null, 1, 0, null, 'Y');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'LINEAR_NAME', 'DIR_PART', null, 'LINEAR_NAME_DIRECTION', 'DIR_PART_CODE', 0, null, 1, 0, null, 'Y');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'AUTHORIZED_MUNICIPAL_ADDRESS', 'ADDRESS_STRING_ID', null, 'ADDRESS_POINT', 'ADDRESS_STRING_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_POINT', 'GENERAL_USE_CODE', 'dmn_oar_general_use', null, null, 0, null, 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_CLASS', 'ADDRESS_ID', null, null, null, 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_POINT', 'ADDRESS_STRING_ID', null, null, null, 0, 'BASE_CENTRELINE', 1, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_INTERSECTION', 'CLASSIFICATION', 'dmn_int_classification', null, null, 0, null, 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CENTRELINE', 'FEATURE_CODE', 'dmn_cl_feature_code', null, null, 0, null, 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CONNECTIVITY', 'ELEVATION_ID', null, 'BASE_INTERSECTION_ELEVATION', 'ELEVATION_ID', 0, null, 1, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CENTRELINE', 'SHAPE', null, null, null, 1, 'BASE_CONNECTIVITY', 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_INTERSECTION', 'SHAPE', null, null, null, 1, 'BASE_CONNECTIVITY', 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CONNECTIVITY', 'SHAPE', null, null, null, 1, 'BASE_INTERSECTION', 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CONNECTIVITY', 'SHAPE', null, null, null, 1, 'BASE_CENTRELINE', 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CENTRELINE', 'LINEAR_NAME_ID', null, 'LINEAR_NAME', 'LINEAR_NAME_ID', 0, null, 1, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_POINT', 'ADDRESS_STRING_ID', null, 'AUTHORIZED_MUNICIPAL_ADDRESS', 'ADDRESS_STRING_ID', 0, null, 1, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'AUTHORIZED_MUNICIPAL_ADDRESS', 'LINEAR_NAME_ID', null, 'LINEAR_NAME', 'LINEAR_NAME_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_POINT', 'CENTRELINE_ID', null, 'BASE_CENTRELINE', 'CENTRELINE_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_CLASS', 'ADDRESS_POINT_ID', null, 'ADDRESS_POINT', 'ADDRESS_POINT_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_POINT', 'ADDRESS_POINT_ID', null, 'ADDRESS_NAME', 'ADDRESS_POINT_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_NAME', 'ADDRESS_POINT_ID', null, 'ADDRESS_POINT', 'ADDRESS_POINT_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_POINT', 'CENTRELINE_OFFSET', null, null, null, 0, null, 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'ADDRESS_POINT', 'CENTRELINE_SIDE', null, null, null, 0, null, 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'LINEAR_NAME', 'ACTIVATION_STATUS', null, null, null, 0, null, 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'LINEAR_NAME', 'APPROVAL_STATUS', null, null, null, 0, null, 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'AUTHORIZED_MUNICIPAL_ADDRESS', 'LO_NUM', null, null, null, 0, null, 1, 0, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CENTRELINE', 'CENTRELINE_ID', null, 'ADDRESS_POINT', 'CENTRELINE_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CENTRELINE', 'CENTRELINE_ID', null, 'BASE_CONNECTIVITY', 'CENTRELINE_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CONNECTIVITY', 'INTERSECTION_ID', null, 'BASE_INTERSECTION', 'INTERSECTION_ID', 0, null, 1, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_CONNECTIVITY', 'CENTRELINE_ID', null, 'BASE_CENTRELINE', 'CENTRELINE_ID', 0, null, 1, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'BASE_INTERSECTION', 'INTERSECTION_ID', null, 'BASE_CONNECTIVITY', 'INTERSECTION_ID', 0, null, 0, 1, null, 'N');
insert into IGE_FIELD_INFO (owner, table_name, field_name, domain, reference_table, related_field, geometry_column, dependent_table, ischecked, iskeyfield, no_data, null_data)
values ('NETWORK', 'LINEAR_NAME', 'LINEAR_NAME_ID', null, 'AUTHORIZED_MUNICIPAL_ADDRESS', 'LINEAR_NAME_ID', 0, null, 0, 1, null, 'N');
--commit;
--PROMPT 46 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
