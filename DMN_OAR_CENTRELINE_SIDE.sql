--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 6, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_OAR_CENTRELINE_SIDE...
truncate table DMN_OAR_CENTRELINE_SIDE;
--PROMPT Loading DMN_OAR_CENTRELINE_SIDE...
insert into DMN_OAR_CENTRELINE_SIDE (centreline_side, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('L', 'Left', 1, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_OAR_CENTRELINE_SIDE (centreline_side, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('R', 'Right', 2, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
--commit;
--PROMPT 2 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
