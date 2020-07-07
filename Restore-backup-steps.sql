-- Run Under Admin user 
-- 1. Stop user connections:
alter user network connection limit 0;
alter user anchorto_run connection limit 0;
-- 2. Get stats before restoring
select replace('select ''[TBL]'' as tblname, count(*) from network.' || table_name || ' union all ', '[TBL]', table_name) from information_schema.tables
where table_schema = 'network' and table_catalog = 'anchorto'
and length(table_name) > 4
and table_name not like '_%evw'
and table_name not like 'v_%'
and table_name not like '%_bak'
order by table_name
-- 3. Before restoring data, truncate current tables 
select 'truncate table network.' || table_name || ' cascade;' from information_schema.tables
where table_schema = 'network' and table_catalog = 'anchorto'
and length(table_name) > 4
and table_name not like '_%evw'
and table_name not like 'v_%'
and table_name not like '%_bak'
order by table_name
------------------------------
-- 4. Restore Data from c:\anchorTO-Bak-PROD-202006051500
-- 5. Truncate delta tables
select 'truncate table network.' || table_name || ';' from information_schema.tables
where table_schema = 'network' and table_catalog = 'anchorto'
and length(table_name) < 5
and table_name not like 'i%'
order by table_name
-- 6.1 Import table_status_flow
  truncate table network.task_status_flow;
  -- Import data for the table from c:\task_status_flow-PROD20200615; Format: TXT 
  select * from network.task_status_flow;
-- 7.2 Insert data into dmn_address_unit_status
  select * from network.dmn_address_unit_status
  -- Insert data:
  INSERT INTO  network.dmn_address_unit_status
    (address_unit_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
    VALUES ('L', 'MPAC', 1, TO_TIMESTAMP('2019-06-06 11:30:20','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'), 1, -1);
  INSERT INTO  network.dmn_address_unit_status
    (address_unit_status, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
    VALUES ('T', 'IMaint', 2, TO_TIMESTAMP('2019-06-06 11:30:20','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'), 1, -1);
  select * from network.dmn_address_unit_status	
-- 7.3 Set linear_name_id_seq to 30000
SELECT setval('network.linear_name_id_seq', 30000, true);
-- 7.4 Set address_id_seq, address_string_id_seq to 60,000,000
SELECT setval('network.address_id_seq', 60000000, true);
SELECT setval('network.address_string_id_seq', 60000000, true);
-- 7.5 Truncate _dm & _h tables
select 'truncate table network.' || table_name || ';' from information_schema.tables
where table_schema = 'network' and table_catalog = 'anchorto'
and ( substring(table_name, length(table_name) - 2, 3) = '_dm' or  substring(table_name, length(table_name) - 1, 2) = '_h')
order by table_name
-- 8. Check data: run #0 again to generate stats
-- 9. Check data:
select 'select * from network.' || table_name || ';' from information_schema.tables
where table_schema = 'network' and table_catalog = 'anchorto'
and length(table_name) > 4
and table_name not like '_%evw'
and table_name not like 'v_%'
and table_name not like '%_bak'
order by table_name
-- 10. Run functions under "network" user
   SELECT fix_objectid_number()
   SELECT fix_sequence_number()
-- 11. Restore user's connection:
alter user network connection limit 2000;
alter user anchorto_run connection limit 2000;
