--prompt PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--prompt Created by slee5 on June 5, 2019


--prompt Truncating DMN_STEWARD_STATUS...
truncate table DMN_STEWARD_STATUS;
--prompt Loading DMN_STEWARD_STATUS...
insert into DMN_STEWARD_STATUS (steward_status, decription, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('ACTIVE', 'Active', 1, to_timestamp('11-12-2008 23:16:40', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_STATUS (steward_status, decription, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('LOCKED', 'Locked', 2, to_timestamp('11-12-2008 23:16:40', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_STEWARD_STATUS (steward_status, decription, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('EXPIRED', 'Expired', 3, to_timestamp('11-12-2008 23:16:40', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--prompt 3 records loaded


--prompt Done
