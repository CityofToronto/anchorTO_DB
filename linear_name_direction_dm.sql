


truncate table LINEAR_NAME_DIRECTION_DM;

insert into LINEAR_NAME_DIRECTION_DM (linear_name_dir_id, date_effective, date_expiry, record_type, dir_part, dir_part_code, trans_id_create, trans_id_expire, objectid)
values (1, to_timestamp('11-12-2008 23:22:46', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 'P', 'East', 'E', 1, -1, 1);
insert into LINEAR_NAME_DIRECTION_DM (linear_name_dir_id, date_effective, date_expiry, record_type, dir_part, dir_part_code, trans_id_create, trans_id_expire, objectid)
values (2, to_timestamp('11-12-2008 23:22:46', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 'P', 'West', 'W', 1, -1, 2);
insert into LINEAR_NAME_DIRECTION_DM (linear_name_dir_id, date_effective, date_expiry, record_type, dir_part, dir_part_code, trans_id_create, trans_id_expire, objectid)
values (3, to_timestamp('11-12-2008 23:22:46', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 'P', 'South', 'S', 1, -1, 3);
insert into LINEAR_NAME_DIRECTION_DM (linear_name_dir_id, date_effective, date_expiry, record_type, dir_part, dir_part_code, trans_id_create, trans_id_expire, objectid)
values (4, to_timestamp('11-12-2008 23:22:46', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 'P', 'North', 'N', 1, -1, 4);
commit;

