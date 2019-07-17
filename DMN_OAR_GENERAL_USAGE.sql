--PROMPT PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--PROMPT Created by slee5 on June 6, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Truncating DMN_OAR_GENERAL_USE...
truncate table DMN_OAR_GENERAL_USE;
--PROMPT Loading DMN_OAR_GENERAL_USE...
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (100001, 'Low Density Residential', 46, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (100002, 'High Density Residential - Apartment', 47, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (100003, 'Subsidized Housing', 57, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (101001, 'Hospital, Private and Public', 26, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (101002, 'Old Age/Retirement Home', 27, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (101003, 'Day Care', 28, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (101004, 'Hostel', 29, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (101005, 'Nursing Home, all types', 48, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (101006, 'Penal Institution', 49, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (101007, 'Other Medical/Dental', 50, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (102001, 'Public School - Primary', 30, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (102002, 'Public School - Secondary', 31, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (102003, 'Separate School - Primary', 32, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (102004, 'Separate School - Secondary', 33, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (102005, 'Private School', 34, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (102006, 'College', 35, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (102007, 'University', 36, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (102008, 'Other Educational Institution', 51, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (103001, 'Ambulance Station', 37, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (103002, 'Fire Station', 38, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (103003, 'Police Station', 39, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (103004, 'Other Emergency Service', 40, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (103005, 'Fire/Ambulance Stations', 56, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (104001, 'Municipal City Hall', 41, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (104002, 'Municipal Other', 42, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (104003, 'Regional Hall', 43, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (104004, 'Regional Other', 44, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (104005, 'Provincial Legislature', 52, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (104006, 'Provincial Other', 53, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (104007, 'Federal Office Building', 54, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (104008, 'Other Office Building', 55, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (106001, 'Municipal Park', 1, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (106002, 'Regional Park', 2, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (106003, 'Provincial Park', 3, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (106004, 'Federal Park', 4, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (106005, 'Sport Complex', 5, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (106006, 'Golf Course', 6, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (106007, 'Community/Assembly Hall', 7, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (106008, 'Other Recreational Facility', 8, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (107001, 'Restaurant', 9, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (107002, 'Concert Hall/Theatre/Cinema', 10, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (107003, 'Regional Shopping Centre', 11, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (107004, 'Community Shopping Centre', 12, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (107005, 'Neighbourhood Shopping Centre', 13, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (107006, 'Hotel', 14, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (107007, 'Exhibition/Fair Ground', 15, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (107008, 'Museum/Art Gallery', 16, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (107009, 'Library', 17, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (107010, 'Other Point of Interest', 18, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (108001, 'Subway Station', 19, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (108002, 'Rapid Transit Station', 20, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (108003, 'GO Bus Terminal', 21, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (108004, 'GO Train Station', 22, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (108005, 'Airport', 23, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (108006, 'Parking Lot', 24, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (108007, 'Railway Station', 25, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (108008, 'Other Transportation Facility', 58, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (109001, 'Place of Worship', 59, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (109002, 'Cemetery', 60, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (110001, 'Other Use', 61, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (111001, 'Farm', 62, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (112001, 'Commercial Location', 63, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (113001, 'Industrial Location', 64, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (114001, 'Vacant Location', 65, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (115001, 'Unknown', 45, to_timestamp('06-10-2008 09:49:14', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('10-12-2014 11:50:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120001, 'Residential Singles', 66, to_timestamp('10-12-2014 11:41:28', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120002, 'Residential Townhouses', 67, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120003, 'Residential Apartments', 68, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120004, 'Commercial', 69, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120005, 'Industrial', 70, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120006, 'Institutional', 71, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120007, 'Utilities + Transportation', 72, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120008, 'Commercial Recreations', 73, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120009, 'Open Space', 74, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120010, 'Agricultural', 75, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120011, 'Vacant', 76, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
insert into DMN_OAR_GENERAL_USE (general_use, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values (120012, 'Other + NA', 77, to_timestamp('10-12-2014 11:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 2, -1);
--commit;
--PROMPT 77 records loaded

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
