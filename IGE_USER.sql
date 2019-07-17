--PROMPT PL/SQL Developer Export Tables for user IGE@MTB_LITSUP
--PROMPT Created by slee5 on June 5, 2019
-- SET FEEDBACK off
-- SET DEFINE off

--PROMPT Disabling foreign key constraints for IGE_USER...
--alter table IGE_USER disable constraint IGE_USER_FK;
--PROMPT Truncating IGE_USER...
truncate table IGE_USER;
--PROMPT Loading IGE_USER...
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (37, 'tashour', 'Tawfik', 'Ashour', 'tashour@toronto.ca', '416-338-1905', 'TS - S - MUN', 'LOCKED', to_timestamp('01-06-2009 10:11:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (49, 'chau', 'Ron', 'Chau', 'chau@toronto.ca', '416-338-3962', 'TS - S - MUN', 'ACTIVE', to_timestamp('29-09-2011 10:50:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (51, 'shodgins', 'Steve', 'Hodgins', 'shodgins@toronto.ca', '416-338-3963', 'TS - S - MUN', 'ACTIVE', to_timestamp('29-09-2011 10:52:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (53, 'dchristo', 'Desmond', 'Christopher', 'dchristo@toronto.ca', '416-392-1831', 'TS - S - MUN', 'ACTIVE', to_timestamp('29-09-2011 10:54:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (54, 'wtang', 'Waisan', 'Tang', 'wtang@toronto.ca', '416-392-3366', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('12-04-2016', 'dd-mm-yyyy'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (36, 'jthorne', 'Jennifer', 'Thorne', 'jthorne@toronto.ca', '416-338-1300', 'TS - S - MUN', 'LOCKED', to_timestamp('01-06-2009 10:09:37', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (28, 'kmerrem', 'Karl', 'Merrem', 'kmerrem@toronto.ca', '416-397-9024', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('06-01-2009 14:06:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (26, 'tburridg', 'Travis', 'Burridge', 'tburridg@toronto.ca', '416-392-9128', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('06-01-2009 10:18:30', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (27, 'sdale', 'Steve', 'Dale', 'sdale@toronto.ca', '416-392-8339', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('06-01-2009 11:41:07', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (29, 'lostoma', 'Loriano', 'Ostoma', 'lostoma@toronto.ca', '416-392-2516', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('15-01-2009 09:59:48', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (31, 'tcorreia', 'Tony', 'Correia', 'TCorreia@toronto.ca', '416-397-7551', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('25-02-2009 08:00:28', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (38, 'lle', 'Loan', 'Le', 'lle@toronto.ca', '416-338-5021', 'TS - S - MUN', 'LOCKED', to_timestamp('04-06-2009 09:04:34', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (39, 'lli3', 'David', 'Li', 'lli3@toronto.ca', '416-397-0000', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('02-09-2009 15:55:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (12, 'bhall1', 'Brian', 'Hall', 'bhall1@toronto.ca', '416-338-5034', 'TS - S&M - MUN', 'ACTIVE', to_timestamp('19-12-2008 17:50:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (15, 'ldiaz', 'Lucy', 'Diaz', 'ldiaz@toronto.ca', '416-397-7672', 'TS - S&M - MUN', 'ACTIVE', to_timestamp('19-12-2008 17:54:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (17, 'dmorgan', 'Dave', 'Morgan', 'dmorgan@toronto.ca', '416-397-7552', 'IT - SDS - GCC', 'EXPIRED', to_timestamp('19-12-2008 17:56:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (19, 'kamin', 'Khairul', 'Amin', 'kamin@toronto.ca', '416-338-5042', 'IT - SDS - GCC', 'LOCKED', to_timestamp('19-12-2008 17:57:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (22, 'emachyni', 'Elizabeth', 'Machynia', 'emachyni@toronto.ca', '416-338-5029', 'TS - S&M - MUN', 'ACTIVE', to_timestamp('19-12-2008 18:04:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (32, 'smortime', 'Stephen', 'Mortimer', 'smortime@toronto.ca', '416-397-7545', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('25-02-2009 08:01:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (10, 'bsevigny', 'Bob', 'Sevigny', 'bsevigny@toronto.ca', '416-392-8451', 'IT - SDS - GCC', 'LOCKED', to_timestamp('17-12-2008 11:14:06', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (41, 'swebb', 'Scott', 'Webb', 'swebb@toronto.ca', '416-392-2999', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('26-01-2010 13:53:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (43, 'rdembins', 'Ray', 'Dimbinski', 'rdembins@toronto.ca', '416-395-7362', 'CLK-ERS-ELEC', 'ACTIVE', to_timestamp('26-01-2010 13:55:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (30, 'kporter', 'Kevin', 'Porter', 'kporter@toronto.ca', '416-392-9075', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('19-01-2009 09:30:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (47, 'mpawlows', 'Marta', 'Pawlowski', 'mpawlows@toronto.ca', '416-338-5025', 'TS - S - MUN', 'ACTIVE', to_timestamp('29-09-2011 10:48:47', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (34, 'jcapizza', 'Joe', 'Capizzano', 'jcapizza@toronto.ca', '416-392-2997', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('02-03-2009 08:49:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (52, 'hmarrow', 'Hisham', 'Marrow', 'hmarrow@toronto.ca', '416-338-3961', 'TS - S - MUN', 'ACTIVE', to_timestamp('29-09-2011 10:53:28', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (35, 'Loan Le', 'loan', 'le', 'lle@toronto.ca', '416-338-5021', 'TS - S - MUN', 'EXPIRED', to_timestamp('01-06-2009 09:01:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (42, 'zmiddle', 'Zoe', 'Middleton', 'zmiddle@toronto.ca', '416-395-7322', 'CLK-ERS-ELEC', 'ACTIVE', to_timestamp('26-01-2010 13:54:47', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (44, 'jmeragli', 'John', 'Meraglia', 'jmeragli@toronto.ca', '416-395-1303', 'CLK-ERS-ELEC', 'ACTIVE', to_timestamp('26-01-2010 13:56:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (45, 'jhouse', 'John', 'House', 'jhouse@toronto.ca', '416-392-8338', 'TS - S - MUN', 'ACTIVE', to_timestamp('10-02-2010 10:43:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (48, 'vkemelm', 'Valery', 'Kemelman', 'vkemelm@toronto.ca', '416-392-2509', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('01-09-2011', 'dd-mm-yyyy'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (8, 'zwang', 'Joy', 'Wang', 'zwang@toronto.ca', '416-392-4525', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('24-06-2008 14:00:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (7, 'sarzand', 'Sepideh', 'Arzandeh', 'sarzand@toronto.ca', '416-397-7567', 'IT - SDS - GCC', 'ACTIVE', to_timestamp('24-06-2008 14:00:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (21, 'mminda', 'Maria', 'Minda', 'mminda@toronto.ca', '416-397-7558', 'IT - SDS - GCC', 'EXPIRED', to_timestamp('19-12-2008 18:03:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (14, 'jfligg', 'John', 'Fligg', 'jfligg@toronto.ca', '416-338-5031', 'TS - S&M - MUN', 'ACTIVE', to_timestamp('19-12-2008 17:53:19', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (23, 'ilaw', 'Ian', 'Law', 'ilaw@toronto.ca', '416-338-1302', 'IT - SDS - GCC', 'LOCKED', to_timestamp('19-12-2008 18:05:21', 'dd-mm-yyyy hh24:mi:ss'));
insert into IGE_USER (user_id, username, first_name, last_name, email, phone, business_unit, status, status_date)
values (25, 'vgomes', 'Virgil', 'Gomes', 'gomes@toronto.ca', '416-338-5033', 'IT - SDS - GCC', 'LOCKED', to_timestamp('19-12-2008 18:17:05', 'dd-mm-yyyy hh24:mi:ss'));
--commit;
--PROMPT 37 records loaded
--PROMPT Enabling foreign key constraints for IGE_USER...
--alter table IGE_USER enable constraint IGE_USER_FK;

-- SET FEEDBACK on
-- SET DEFINE on
--PROMPT Done
