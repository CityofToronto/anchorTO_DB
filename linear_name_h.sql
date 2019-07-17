--prompt PL/SQL Developer Export Tables for user NETWORK@MTB_LITSUP
--prompt Created by slee5 on June 3, 2019


--prompt Truncating LINEAR_NAME_H...
truncate table LINEAR_NAME_H;
--prompt Loading LINEAR_NAME_H...
insert into LINEAR_NAME_H (linear_name_id, record_id, trans_id_create, trans_id_expire, record_type, use_by, name_part, type_part, dir_part, description, activation_status, approval_status, duplication_status, duplication_desc, language_code, objectid)
values (19237, 14373, 202297, 202336, 'P', 'L', 'ln 2 e weston s lippincott', null, null, null, 'P', 'A', null, null, null, 17);
insert into LINEAR_NAME_H (linear_name_id, record_id, trans_id_create, trans_id_expire, record_type, use_by, name_part, type_part, dir_part, description, activation_status, approval_status, duplication_status, duplication_desc, language_code, objectid)
values (19236, 14372, 202297, 202336, 'P', 'L', 'ln 1 e weston s lippincott', null, null, null, 'P', 'A', null, null, null, 18);
insert into LINEAR_NAME_H (linear_name_id, record_id, trans_id_create, trans_id_expire, record_type, use_by, name_part, type_part, dir_part, description, activation_status, approval_status, duplication_status, duplication_desc, language_code, objectid)
values (19492, 14627, 214521, 214522, 'P', 'L', 'Kelvin2', 'Avenue', null, 'North York', 'A', 'A', null, null, null, 673);
insert into LINEAR_NAME_H (linear_name_id, record_id, trans_id_create, trans_id_expire, record_type, use_by, name_part, type_part, dir_part, description, activation_status, approval_status, duplication_status, duplication_desc, language_code, objectid)
values (19147, 14281, 200589, 200592, 'P', 'L', 'Pythagoras', 'Drive', null, null, 'P', 'P', null, null, null, 1);
insert into LINEAR_NAME_H (linear_name_id, record_id, trans_id_create, trans_id_expire, record_type, use_by, name_part, type_part, dir_part, description, activation_status, approval_status, duplication_status, duplication_desc, language_code, objectid)
values (19146, 14280, 200589, 200592, 'P', 'L', 'Archimedes', 'Court', null, null, 'P', 'P', null, null, null, 2);
insert into LINEAR_NAME_H (linear_name_id, record_id, trans_id_create, trans_id_expire, record_type, use_by, name_part, type_part, dir_part, description, activation_status, approval_status, duplication_status, duplication_desc, language_code, objectid)
values (19324, 14462, 205798, 205810, 'P', 'L', 'ted rogers', 'Way', null, null, 'A', 'A', null, null, null, 33);
commit;
--prompt 6 records loaded


--prompt Done
