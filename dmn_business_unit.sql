truncate table DMN_BUSINESS_UNIT;

insert into DMN_BUSINESS_UNIT (business_unit, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('IT - SDS - GCC', 'Geospatial Competency Centre', 1, to_timestamp('03-03-2009 14:26:29', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_BUSINESS_UNIT (business_unit, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('TS - S - MUN', 'Surveys and Mapping', 2, to_timestamp('03-03-2009 14:26:32', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);
insert into DMN_BUSINESS_UNIT (business_unit, description, sort_sequence, date_effective, date_expiry, trans_id_create, trans_id_expire)
values ('CLK-ERS-ELEC', 'Clerk ERS Elections Operations', 3, to_timestamp('26-01-2010 13:51:38', 'dd-mm-yyyy hh24:mi:ss'), to_timestamp('01-01-3000', 'dd-mm-yyyy'), 1, -1);

