----------############ Setup Oracle FDW -----------
-- ############  Run under admin user: 

-- Create two servers: imaint_anchor for tables in anchor_ige schema; imaint_anchor2 for tables in ige schema in Oracle
CREATE SERVER imaint_anchor FOREIGN DATA WRAPPER oracle_fdw
       OPTIONS (dbserver'//darlington.corp.toronto.ca:1521/IGEMA.CORP.TORONTO.CA');  -- QA Oracle
CREATE SERVER imaint_anchor2 FOREIGN DATA WRAPPER oracle_fdw
       OPTIONS (dbserver'//darlington.corp.toronto.ca:1521/IGEMA.CORP.TORONTO.CA');  -- QA Oracle	   
GRANT USAGE ON FOREIGN SERVER imaint_anchor to network;	
GRANT USAGE ON FOREIGN SERVER imaint_anchor2 to network;
-- ############  Run under network user:	
CREATE USER MAPPING FOR network SERVER imaint_anchor
       OPTIONS (user 'anchor_ige', password 'stage');
CREATE USER MAPPING FOR network SERVER imaint_anchor2
       OPTIONS (user 'ige', password 'stage');
CREATE SCHEMA imaint_anchor AUTHORIZATION network;
  -- Link tables from Oracle from both anchor_ige & ige schema
IMPORT FOREIGN SCHEMA "ANCHOR_IGE"
  LIMIT TO (linear_name_evw)
  FROM SERVER imaint_anchor INTO imaint_anchor; 
IMPORT FOREIGN SCHEMA "ANCHOR_IGE"
  LIMIT TO (linear_name_type_evw)
  FROM SERVER imaint_anchor INTO imaint_anchor;  
IMPORT FOREIGN SCHEMA "ANCHOR_IGE"
  LIMIT TO (ige_source_evw)
  FROM SERVER imaint_anchor INTO imaint_anchor;
  
IMPORT FOREIGN SCHEMA "IGE"
  LIMIT TO (ige_control_task, ige_task, ige_transaction)
  FROM SERVER imaint_anchor2 INTO imaint_anchor; 
-- Test imported tables
SELECT * FROM imaint_anchor.linear_name;  
SELECT * FROM imaint_anchor.ige_control_task limit 100; 
SELECT * FROM imaint_anchor.ige_source limit 100;
SELECT * FROM imaint_anchor.ige_task limit 100;
SELECT * FROM imaint_anchor.ige_transaction limit 100;
--SELECT oracle_diag();
-------------############--------------------------
CREATE TABLE  network.ige_control_task 
(	
	CONTROL_TASK_ID numeric(12,0) NOT NULL, 
	SOURCE_ID numeric(12,0) NOT NULL, 
	CONTROL_TASK_STATUS character varying(30) NOT NULL, 
	CONTROL_TASK_COMMENTS character varying(255), 
	CONTROL_TASK_TYPE character varying(30) NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
CREATE UNIQUE INDEX ige_control_task_pk ON ige_control_task (control_task_id);
CREATE INDEX ige_control_task_source_id_trans_expire_idx ON ige_control_task (source_id, trans_id_expire);
CREATE INDEX ige_control_task_status_expire_idx ON ige_control_task(control_task_status, trans_id_expire);
GRANT ALL ON TABLE network.ige_control_task TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.ige_control_task TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.ige_task
(
	TASK_ID numeric(12,0) PRIMARY KEY, 
	TASK_TYPE character varying(30) NOT NULL, 
	SOURCE_ID numeric(12,0), 
	ASSIGNED_TO character varying(30) NOT NULL, 
	TAKEN_BY character varying(32), 
	TASK_SEQUENCE numeric(4,1), 
	TASK_STATUS character varying(20) NOT NULL, 
	TASK_COMMENTS text, 
	CONTROL_TASK_ID numeric(12,0), 
	TASK_CATEGORY character varying(30), 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
); 
GRANT ALL ON TABLE network.ige_task TO network;
CREATE INDEX ige_task_control_task_id_trans_expire_idx ON ige_task (control_task_id, trans_id_expire);
CREATE INDEX ige_task_task_type_idx ON ige_task (task_type);
CREATE INDEX ige_task_task_status_expire__taken_by_assigned_idx ON ige_task (task_status, trans_id_expire, taken_by, assigned_to);
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.ige_task TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.ige_transaction
(
	TRANS_ID numeric(12,0) PRIMARY KEY, 
	TASK_ID numeric(12,0) NOT NULL, 
	SOURCE_ID numeric(12,0), 
	USERNAME character varying(15), 
	DATE_START TIMESTAMP, 
	DATE_END TIMESTAMP, 
	APPLICATION_CODE character varying(20), 
	TRANS_DESC character varying(500), 
	TRANS_NAME character varying(100), 
	TRANS_STATUS character varying(10)
);
GRANT ALL ON TABLE network.ige_transaction TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.ige_transaction TO sde;
CREATE INDEX ige_transaction_task_id_idx ON network.ige_transaction (task_id);
CREATE INDEX ige_transaction_task_trans_status_name_idx ON ige_transaction (trans_status,trans_name);
CREATE INDEX ige_transaction_task_trans_status_name_application_idx ON ige_transaction (trans_status,trans_name, application_code);
---------------------------------------------------------------------------------------------------------------------------
/*
CREATE TABLE network.linear_name
(
	LINEAR_NAME_ID numeric(12,0),	
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0), 
	RECORD_TYPE character varying(1), 	 
	NAME_PART character varying(60), 
	TYPE_PART character varying(15), 
	DIR_PART character varying(10), 
	DESCRIPTION character varying(20), 
	ACTIVATION_STATUS character varying(1), 
	APPROVAL_STATUS character varying(1), 
	DUPLICATION_STATUS character varying(1), 
	DUPLICATION_DESC character varying(30), 	 
	OBJECTID integer NOT NULL	
);
CREATE INDEX network.linear_name_id ON network.linear_name (linear_name_id);
CREATE UNIQUE INDEX network.linear_name_objectid_uk ON network.linear_name (objectid);
*/
CREATE INDEX linear_name_type_up_i ON network.linear_name(upper(type_part));
CREATE INDEX linear_name_dir_up_i ON network.linear_name(upper(dir_part));
CREATE INDEX linear_name_full_name_i ON network.linear_name(trim(UPPER(name_part) || ' ' || coalesce(UPPER(type_part), '') || ' ' || coalesce(UPPER(dir_part), '')));
CREATE INDEX LINEAR_NAME_CREATE_ID_IDX ON network.LINEAR_NAME (TRANS_ID_CREATE);
CREATE INDEX LINEAR_NAME_EXPIRED_ID_IDX ON network.LINEAR_NAME (TRANS_ID_EXPIRE);

GRANT ALL ON TABLE network.linear_name TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.linear_name TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.linear_name_dm
(
	LINEAR_NAME_ID numeric(12,0), 
	DATE_EFFECTIVE timestamp, 
	DATE_EXPIRY timestamp, 	 
	NAME_PART character varying(60), 
	TYPE_PART character varying(15), 
	DIR_PART character varying(10), 
	DESCRIPTION character varying(20), 
	ACTIVATION_STATUS character varying(1), 
	APPROVAL_STATUS character varying(1), 
	DUPLICATION_STATUS character varying(1), 
	DUPLICATION_DESC character varying(30), 
	LINEAR_NAME_FULL character varying(110),	
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0), 
	OBJECTID integer NOT NULL  -- Only when it's INTEGER type, it can be registered with GDB in ArcCatalog
);
--alter table network.linear_name_h add record_type character varying(1);
--alter table network.linear_name_h add use_by      text;
--alter table network.linear_name_h drop record_type;
--alter table network.linear_name_h drop use_by;
CREATE INDEX linear_name_dm_id ON network.linear_name_dm (linear_name_id);
CREATE INDEX linear_name_dm_name_type_part ON network.linear_name_dm (name_part, type_part); 
CREATE INDEX linear_name_dm_trans_id_create ON network.linear_name_dm (trans_id_create);
CREATE INDEX linear_name_dm_trans_id_expire ON network.linear_name_dm (trans_id_expire);
CREATE UNIQUE INDEX linear_name_dm_objectid_uk ON network.linear_name_dm (objectid);
CREATE INDEX linear_name_dm_name_type_dir_up_i ON network.linear_name_dm(upper(name_part), upper(type_part), upper(dir_part));
CREATE INDEX linear_name_dm_name_full_i ON network.linear_name_dm(linear_name_full);
CREATE INDEX linear_name_dm_name_full_up_i ON network.linear_name_dm(upper(linear_name_full));
CREATE INDEX linear_name_dm_name_up_i ON network.linear_name_dm(upper(name_part));
CREATE INDEX linear_name_dm_dir_up_i ON network.linear_name_dm(upper(dir_part));

GRANT ALL ON TABLE network.linear_name_dm TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.linear_name_dm TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.linear_name_h
(
	LINEAR_NAME_ID numeric(12,0), 
	RECORD_ID numeric(12,0),
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0), 
	NAME_PART character varying(60), 
	TYPE_PART character varying(15), 
	DIR_PART character varying(10), 
	DESCRIPTION character varying(20), 
	ACTIVATION_STATUS character varying(1), 
	APPROVAL_STATUS character varying(1), 
	DUPLICATION_STATUS character varying(1), 
	DUPLICATION_DESC character varying(30), 		
	OBJECTID integer NOT NULL -- Only when it's INTEGER type, it can be registered with GDB in ArcCatalog
);
--alter table network.linear_name_h add record_type character varying(1);
--alter table network.linear_name_h add use_by      text;
--alter table network.linear_name_h add language_code      text;
--alter table network.linear_name_h drop record_type;
--alter table network.linear_name_h drop use_by;
--alter table network.linear_name_h drop if exists record_id ;
--alter table network.linear_name_h drop language_code;	
CREATE UNIQUE INDEX linear_name_h_objectid_uk ON network.linear_name_h (objectid);
CREATE INDEX linear_name_h_type_up_i ON network.linear_name_h(upper(type_part));
CREATE INDEX linear_name_h_dir_up_i ON network.linear_name_h(upper(dir_part));

GRANT ALL ON TABLE network.linear_name_h TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.linear_name_h TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.linear_name_type
(
    linear_name_type_id numeric(12,0) PRIMARY KEY,
    trans_id_create numeric(12,0),
    trans_id_expire numeric(12,0),
    type_part character varying(15) ,
    type_part_code character varying(10) ,
    objectid integer NOT NULL
);
CREATE UNIQUE INDEX linear_name_type_objectid_uk ON network.linear_name_type (objectid);
CREATE UNIQUE INDEX linear_name_type_pk ON network.linear_name_type (linear_name_type_id);
CREATE UNIQUE INDEX linear_name_type_type_uk ON network.linear_name_type (UPPER(type_part));
CREATE UNIQUE INDEX linear_name_type_type_code_uk ON network.linear_name_type (UPPER(type_part_code));
CREATE INDEX LINEAR_NAME_TYPE_CREATE_ID_IDX ON network.LINEAR_NAME_TYPE (TRANS_ID_CREATE);
CREATE INDEX LINEAR_NAME_TYPE_EXPIRED_ID_IDX ON network.LINEAR_NAME_TYPE (TRANS_ID_EXPIRE);

GRANT ALL ON TABLE network.linear_name_type TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.linear_name_type TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.linear_name_type_dm
(
	LINEAR_NAME_TYPE_ID numeric(12,0), 
	DATE_EFFECTIVE timestamp, 
	DATE_EXPIRY timestamp, 	
	TYPE_PART character varying(15), 
	TYPE_PART_CODE character varying(10), 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0), 
	OBJECTID integer NOT NULL  -- Only when it's INTEGER type, it can be registered with GDB in ArcCatalog
);
--alter table network.linear_name_type_dm add record_type character varying(1);
--alter table network.linear_name_type_dm drop record_type;
CREATE UNIQUE INDEX linear_name_type_dm_objectid_uk ON network.linear_name_type_dm (objectid);

GRANT ALL ON TABLE network.linear_name_type_dm TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.linear_name_type_dm TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.linear_name_type_h
(
	LINEAR_NAME_TYPE_ID numeric(12,0), 
	RECORD_ID numeric(12,0),
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0), 	
	TYPE_PART character varying(15), 
	TYPE_PART_CODE character varying(10), 	
	OBJECTID integer NOT NULL  -- Only when it's INTEGER type, it can be registered with GDB in ArcCatalog
);
--alter table network.linear_name_type_h add record_type character varying(1);
--alter table network.linear_name_type_h drop record_type;
--alter table network.linear_name_type_h drop if exists record_id;
CREATE UNIQUE INDEX linear_name_type_h_objectid_uk ON network.linear_name_type_h (objectid);

GRANT ALL ON TABLE network.linear_name_type_h TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.linear_name_type_h TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.linear_name_direction_dm
(
    linear_name_dir_id numeric(12,0), 
	DATE_EFFECTIVE timestamp, 
	DATE_EXPIRY timestamp, 	
    trans_id_create numeric(12,0),
    trans_id_expire numeric(12,0),    
    dir_part character varying(15) ,
    dir_part_code character varying(10),
    objectid integer NOT NULL  -- Only when it's INTEGER type, it can be registered with GDB in ArcCatalog
);
--alter table network.linear_name_direction_dm add record_type character varying(1);
--alter table network.linear_name_direction_dm drop record_type;
CREATE UNIQUE INDEX linear_name_direction_dm_objectid_uk ON network.linear_name_direction_dm (objectid);

GRANT ALL ON TABLE network.linear_name_direction_dm TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.linear_name_direction_dm TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.linear_name_direction_h
(
    linear_name_dir_id numeric(12,0), 
	RECORD_ID numeric(12,0),	 	
    trans_id_create numeric(12,0),
    trans_id_expire numeric(12,0),    
    dir_part character varying(10) ,
    dir_part_code character varying(2),
    objectid integer NOT NULL  -- Only when it's INTEGER type, it can be registered with GDB in ArcCatalog
);
--alter table network.linear_name_direction_h add record_type character varying(1);
--alter table network.linear_name_direction_h drop record_type;
--alter table network.linear_name_direction_h drop if exists record_id;
CREATE UNIQUE INDEX linear_name_direction_h_objectid_uk ON network.linear_name_direction_h (objectid);

GRANT ALL ON TABLE network.linear_name_direction_h TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.linear_name_direction_h TO sde;
---------------------------------------------------------------------------------------------------------------------------
/*CREATE TABLE network.AUTHORIZED_MUNICIPAL_ADDRESS 
(
	ADDRESS_STRING_ID numeric(12,0) NOT NULL, 	
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0), 
	LINEAR_NAME_ID numeric(12,0), 
	LO_NUM numeric(6,0), 
	LO_NUM_SUF character varying(3), 
	HI_NUM numeric(6,0), 
	HI_NUM_SUF character varying(3), 
	OBJECTID integer NOT NULL -- Only when it's INTEGER type, it can be registered with GDB in ArcCatalog
);
--alter table network.AUTHORIZED_MUNICIPAL_ADDRESS add RECORD_ID numeric(12,0);
--alter table network.AUTHORIZED_MUNICIPAL_ADDRESS drop RECORD_ID;
CREATE INDEX AUTHORIZED_MUNICIPAL_ADDRESS_address_string_id_i ON network.AUTHORIZED_MUNICIPAL_ADDRESS (address_string_id);
CREATE INDEX AUTHORIZED_MUNICIPAL_ADDRESS_linear_name_id_i ON network.AUTHORIZED_MUNICIPAL_ADDRESS (linear_name_id);
CREATE UNIQUE INDEX AUTHORIZED_MUNICIPAL_ADDRESS_objectid_uk ON network.AUTHORIZED_MUNICIPAL_ADDRESS (objectid);

GRANT ALL ON TABLE network.AUTHORIZED_MUNICIPAL_ADDRESS TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.AUTHORIZED_MUNICIPAL_ADDRESS TO sde;*/

select * from authorized_municipal_address limit 10;
--DROP record_id column in ArcCatalog -------------ALTER TABLE authorized_municipal_address DROP record_id CASCADE;
--Add column usage_status in ArcCatalog ----------------------ALTER TABLE authorized_municipal_address ADD COLUMN IF NOT EXISTS USAGE_STATUS VARCHAR(1);
--drop index AUTHORIZED_MUNICIPAL_ADDRESS_usage_status_u;
CREATE INDEX AUTHORIZED_MUNICIPAL_ADDRESS_usage_status_u ON network.AUTHORIZED_MUNICIPAL_ADDRESS (UPPER(usage_status));
CREATE INDEX AUTHORIZED_MUNICIPAL_ADDRESS_lo_num_i ON network.AUTHORIZED_MUNICIPAL_ADDRESS (lo_num);
CREATE INDEX AUTHORIZED_MUNICIPAL_ADDRESS_TYPE_CREATE_ID_IDX ON network.AUTHORIZED_MUNICIPAL_ADDRESS (TRANS_ID_CREATE);
CREATE INDEX AUTHORIZED_MUNICIPAL_ADDRESS_TYPE_EXPIRED_ID_IDX ON network.AUTHORIZED_MUNICIPAL_ADDRESS (TRANS_ID_EXPIRE);
--drop index AUTHORIZED_MUNICIPAL_ADDRESS_lo_hi_num_i;

---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.ama_dm
(
	ADDRESS_STRING_ID numeric(12,0) NOT NULL, 
	DATE_EFFECTIVE timestamp, 
	DATE_EXPIRY timestamp, 
	LINEAR_NAME_ID numeric(12,0), 
	LO_NUM numeric(6,0), 
	LO_NUM_SUF character varying(3), 
	HI_NUM numeric(6,0), 
	HI_NUM_SUF character varying(3), 
	LINEAR_NAME character varying(60), 
	LINEAR_NAME_TYPE character varying(10), 
	LINEAR_NAME_DIR character varying(2), 
	LINEAR_NAME_ACT_STATUS character varying(1), 
	LINEAR_NAME_APPR_STATUS character varying(1), 
	LINEAR_NAME_DUP_STATUS character varying(1), 
	LINEAR_NAME_DUP_DESC character varying(30), 
	ADDRESS_numeric character varying(20), 
	LINEAR_NAME_FULL character varying(110), 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0), 
	OBJECTID integer NOT NULL -- Only when it's INTEGER type, it can be registered with GDB in ArcCatalog
);

CREATE INDEX ama_dm_address_string_id_i ON network.ama_dm (address_string_id);
CREATE INDEX ama_dm_linear_name_id_i ON network.ama_dm (linear_name_id);
CREATE INDEX ama_dm_linear_name_type_i ON network.ama_dm (linear_name, linear_name_type);
CREATE INDEX ama_dm_linear_name_full_i ON network.ama_dm (linear_name_full);
CREATE INDEX ama_dm_trans_id_create_i ON network.ama_dm (trans_id_create);
CREATE INDEX ama_dm_trans_id_expire_i ON network.ama_dm (trans_id_expire);
CREATE INDEX ama_dm_linear_name_up_i ON network.ama_dm (upper(linear_name));
CREATE INDEX ama_dm_linear_name_full_up_i ON network.ama_dm (upper(linear_name_full));
CREATE UNIQUE INDEX ama_dm_objectid_uk ON network.ama_dm (objectid);
-- select count(*) from ama_dm;
GRANT ALL ON TABLE network.ama_dm TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.ama_dm TO sde;

ALTER TABLE ama_dm ADD COLUMN IF NOT EXISTS LINEAR_NAME_AUTHORIZED VARCHAR(1); 
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ama_h
(
	ADDRESS_STRING_ID numeric(12,0) NOT NULL, 
	RECORD_ID numeric(12,0), 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0), 
	LINEAR_NAME_ID numeric(12,0), 
	LO_NUM numeric(6,0), 
	LO_NUM_SUF character varying(3), 
	HI_NUM numeric(6,0), 
	HI_NUM_SUF character varying(3), 
	OBJECTID integer NOT NULL -- Only when it's INTEGER type, it can be registered with GDB in ArcCatalog
);
CREATE UNIQUE INDEX ama_h_objectid_uk ON network.ama_h (objectid);
--alter table network.ama_h drop if exists record_id;
GRANT ALL ON TABLE network.ama_h TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.ama_h TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.dmn_business_unit
(
	BUSINESS_UNIT VARCHAR(20) PRIMARY KEY, 
	DESCRIPTION VARCHAR(500), 
	SORT_SEQUENCE numeric(12,2), 
	DATE_EFFECTIVE timestamp, 
	DATE_EXPIRY timestamp, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
GRANT ALL ON TABLE network.dmn_business_unit TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.dmn_business_unit TO sde;
CREATE INDEX dmn_business_unit_expire_idx ON dmn_business_unit(trans_id_expire);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_STEWARD_STATUS
(
	STEWARD_STATUS VARCHAR(10) PRIMARY KEY, 
	DECRIPTION VARCHAR(500), 
	SORT_SEQUENCE numeric(12,2), 
	DATE_EFFECTIVE timestamp NOT NULL, 
	DATE_EXPIRY timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
GRANT ALL ON TABLE network.DMN_STEWARD_STATUS TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.DMN_STEWARD_STATUS TO sde;
CREATE INDEX dmn_steward_status_expire_idx ON dmn_steward_status (trans_id_expire);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_STEWARD_GROUP
(
	STEWARD_GROUP VARCHAR(30) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	DATE_EFFECTIVE timestamp NOT NULL, 
	DATE_EXPIRY timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
CREATE UNIQUE INDEX DMN_STEWARD_GROUP_UK ON DMN_STEWARD_GROUP (UPPER(STEWARD_GROUP)); 
CREATE INDEX dmn_steward_group_expire_idx ON dmn_steward_group (trans_id_expire);
GRANT ALL ON TABLE network.DMN_STEWARD_GROUP TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.DMN_STEWARD_GROUP TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_BOOLEAN_VALUE
(
	BOOLEAN_VALUE VARCHAR(1) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	DATE_EFFECTIVE timestamp NOT NULL, 
	DATE_EXPIRY timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
GRANT ALL ON TABLE network.DMN_BOOLEAN_VALUE TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.DMN_BOOLEAN_VALUE TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_SOURCE_CLASS
(
	SOURCE_CLASS VARCHAR(50) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	CONTROL_TASK_TYPE VARCHAR(30), NOT NULL,
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
CREATE INDEX dmn_source_class_trans_id_expire_idx ON dmn_source_class (trans_id_expire);
CREATE INDEX dmn_source_class_class_expire_up_idx ON dmn_source_class (UPPER(source_class),trans_id_expire);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_PLAN_TYPE
(
	PLAN_TYPE VARCHAR(50) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SUBDIV_FABRIC VARCHAR(1) NOT NULL, 
	NAME_ABBREVIATION VARCHAR(15), 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
CREATE INDEX dmn_plan_type_expire_idx ON dmn_plan_type (trans_id_expire);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_PLAN_TYPE_EXT
(
	EXT_NAME VARCHAR(12) NOT NULL, 
	EXT_TYPE VARCHAR(6) NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	PLAN_TYPE VARCHAR(50) NOT NULL REFERENCES network.DMN_PLAN_TYPE(PLAN_TYPE), 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL	
);
-- run under admin: alter table network.dmn_plan_type_ext disable trigger all;
-- run under admin: alter table network.dmn_plan_type_ext enable trigger all;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_REPORT_TYPE
(
	REPORT_TYPE VARCHAR(50) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
CREATE INDEX dmn_report_type_expire_idx ON dmn_report_type (trans_id_expire);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_PLAN_STATUS
(
	PLAN_STATUS VARCHAR(30) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
CREATE INDEX dmn_plan_status_expire_idx ON dmn_plan_status (trans_id_expire);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_REPORT_STATUS
(
	REPORT_STATUS VARCHAR(30) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
CREATE INDEX dmn_report_status_expire_idx ON dmn_report_status (trans_id_expire);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_PRESENTATION_TYPE
(
	PRES_TYPE VARCHAR(30) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_TASK_TYPE
(
	TASK_TYPE VARCHAR(30) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
CREATE INDEX dmn_task_type_type_idx ON dmn_task_type (task_type);
CREATE INDEX dmn_task_type_type_trans_id_expire_idx ON dmn_task_type (task_type, trans_id_expire);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_TASK_STATUS
(
	TASK_STATUS VARCHAR(30) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE network.DMN_CONTROL_TASK_TYPE
(
	CONTROL_TASK_TYPE VARCHAR(30) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE network.DMN_CONTROL_TASK_STATUS
(
	CONTROL_TASK_STATUS VARCHAR(30) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
);
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE network.IGE_USER
(
	USER_ID numeric(6,0) PRIMARY KEY NOT NULL, 
	USERNAME VARCHAR(15) NOT NULL, 
	--FIRST_NAME VARCHAR(30) NOT NULL, 
	--LAST_NAME VARCHAR(30) NOT NULL, 
	FULL_NAME VARCHAR(50) NOT NULL,
	EMAIL VARCHAR(30) NOT NULL, 
	--PHONE VARCHAR(12), 
	BUSINESS_UNIT VARCHAR(200) NOT NULL, 
	STATUS VARCHAR(10) NOT NULL REFERENCES NETWORK.DMN_STEWARD_STATUS(STEWARD_STATUS), 
	STATUS_DATE timestamp NOT NULL
);
CREATE UNIQUE INDEX IGE_USER_NAME_UP_UK ON NETWORK.IGE_USER(UPPER(USERNAME));
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE network.IGE_USER_STEWARD
(
	USER_ID numeric(6,0) NOT NULL REFERENCES NETWORK.IGE_USER(USER_ID), 
	STEWARD_GROUP VARCHAR(30) NOT NULL 
	--SUPERVISOR VARCHAR(1) NOT NULL, 
	--ENABLED VARCHAR(1) NOT NULL
);
CREATE UNIQUE INDEX IGE_USER_STEWARD_ID_GROUP_UK ON NETWORK.IGE_USER_STEWARD(USER_ID, STEWARD_GROUP);
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE network.DMN_AMA_USAGE_STATUS
(
	USAGE_STATUS VARCHAR(1) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500), 
	SORT_SEQUENCE numeric(12,2), 
	date_effective timestamp, 
	date_expiry timestamp, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE network.DMN_LN_USE_BY
(
	USE_BY VARCHAR(1) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);

---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE network.DMN_LN_ACTIVATION_STATUS
(
	ACTIVATION_STATUS VARCHAR(1) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE network.DMN_LN_APPROVAL_STATUS
(
	APPROVAL_STATUS VARCHAR(1) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_LN_USAGE_STATUS
(
	USAGE_STATUS VARCHAR(1) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE network.DMN_NUMERIC_OPERATOR
(
	"operator" numeric(4,0) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_STRING_OPERATOR
(
	"operator" numeric(4,0) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_CL_FEATURE_CODE
(
	FEATURE_CODE numeric(6,0) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_CL_ONEWAY
(
	ONEWAY_DIR_CODE numeric(1,0) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_INT_CLASSIFICATION 
(
	CLASSIFICATION VARCHAR(20) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_INT_ELEV_FEATURE_CODE
(
	FEATURE_CODE VARCHAR(6) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_INT_ELEVATION_LEVEL
(
	ELEVATION_LEVEL numeric(2,0) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_INT_ELEVATION_UNIT
(
	ELEVATION_UNIT VARCHAR(2) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_INT_HEIGHT_UNIT
(
	HEIGHT_UNIT VARCHAR(2) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_OAR_MAINT_STAGE
(
	MAINT_STAGE VARCHAR(10) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(5,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_OAR_CENTRELINE_SIDE
(
	CENTRELINE_SIDE VARCHAR(1) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(5,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_OAR_GENERAL_USE
(
	GENERAL_USE numeric(6,0) NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_OAR_CLASS_FLAG
(
	ADDRESS_CLASS_FLAG numeric(5,0) NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	MAINT_STAGE VARCHAR(10) NOT NULL, 
	SORT_SEQUENCE numeric(5,2) NOT NULL, 
	ABBR_DESCRIPTION VARCHAR(20) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_OAR_NAME_RECORD_TYPE
(
	RECORD_TYPE VARCHAR(10) NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(12,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_OAR_ADDRESS_CLASS
(
	ADDRESS_CLASS VARCHAR(2) NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(5,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_OAR_CLASS
(
	ADDRESS_CLASS_FLAG numeric(5,0) NOT NULL, 
	ADDRESS_CLASS VARCHAR(2) NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	LINK_TO_CLASS VARCHAR(10), 
	SORT_SEQUENCE numeric(5,2) NOT NULL, 
	LINK_TO_POINT VARCHAR(20), 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_OAR_CLASS_CONFLICT
(
	REGULAR_ADDRESS_CLASS_FLAG numeric(5,0) NOT NULL, 
	RESERVED_ADDRESS_CLASS_FLAG numeric(5,0) NOT NULL, 
	RESERVE_CONFLICT VARCHAR(30) NOT NULL, 
	REGULAR_CONFLICT VARCHAR(30) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_OAR_CLASS_LINKAGE
(
	ADDRESS_CLASS_FLAG numeric(5,0) NOT NULL, 
	LINK_ADDRESS_CLASS numeric(5,0) NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(5,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_ADDRESS_UNIT_STATUS
(
	ADDRESS_UNIT_STATUS VARCHAR(1) PRIMARY KEY NOT NULL,
	DESCRIPTION VARCHAR(10) NOT NULL,
	SORT_SEQUENCE NUMERIC(5,2) NOT NULL,
	DATE_EFFECTIVE TIMESTAMP NOT NULL,
	DATE_EXPIRY TIMESTAMP NOT NULL,
	TRANS_ID_CREATE NUMERIC(12,0),
	TRANS_ID_EXPIRE NUMERIC(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_ADDRESS_UNIT_HOUSING
(
	ADDRESS_UNIT_HOUSING_TYPE VARCHAR(1) PRIMARY KEY NOT NULL,
	DESCRIPTION VARCHAR(10) NOT NULL,
	SORT_SEQUENCE NUMERIC(5,2) NOT NULL,
	DATE_EFFECTIVE TIMESTAMP NOT NULL,
	DATE_EXPIRY TIMESTAMP NOT NULL,
	TRANS_ID_CREATE NUMERIC(12,0),
	TRANS_ID_EXPIRE NUMERIC(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.DMN_SA_STATUS
(
	SITE_AREA_STATUS VARCHAR(2) PRIMARY KEY NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
	SORT_SEQUENCE numeric(5,2) NOT NULL, 
	date_effective timestamp NOT NULL, 
	date_expiry timestamp NOT NULL, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
);
---------------------------------------------------------------------------------------------------------------------------
-- DROP TABLE IGE_SOURCE;
CREATE TABLE network.IGE_SOURCE
(
	SOURCE_ID numeric(12,0) NOT NULL, 
	RECORD_ID numeric(12,0), 
	SOURCE_CLASS VARCHAR(30) NOT NULL, 
	SOURCE_TYPE VARCHAR(50) NOT NULL, 
	INTERNAL_SOURCE_NO VARCHAR(20), 
	INTERNAL_SOURCE_DATE timestamp, 
	EXTERNAL_SOURCE_NO VARCHAR(20), 
	EXTERNAL_SOURCE_DATE timestamp, 
	NAME_PREFIX VARCHAR(20), 
	DOCUMENT_NUMBER VARCHAR(20), 
	NAME_SUFFIX VARCHAR(20), 
	PLAN_NAME VARCHAR(100), 
	FORMER_MUNICIPALITY VARCHAR(20), 
	SOURCE_COMMENTS VARCHAR(255), 
	SOURCE_STATUS VARCHAR(30) NOT NULL, 
	PARENT_SOURCE_ID numeric(12,0), 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL, 
	OBJECTID INTEGER NOT NULL
);
--CREATE UNIQUE INDEX IGE_SOURCE_INTERNAL_SOURCE_NO_UK ON NETWORK.IGE_SOURCE(INTERNAL_SOURCE_NO);
--CREATE UNIQUE INDEX IGE_SOURCE_EXTERNAL_SOURCE_NO_UK ON NETWORK.IGE_SOURCE(EXTERNAL_SOURCE_NO);
CREATE UNIQUE INDEX IGE_SOURCE_OBJECTID_UK ON NETWORK.IGE_SOURCE(objectid);
CREATE INDEX IGE_SOURCE_ID_IDX ON network.IGE_SOURCE (SOURCE_ID);
CREATE INDEX IGE_SOURCE_CREATE_ID_IDX ON network.IGE_SOURCE (TRANS_ID_CREATE);
CREATE INDEX IGE_SOURCE_EXPIRED_ID_IDX ON network.IGE_SOURCE (TRANS_ID_EXPIRE);

GRANT ALL ON TABLE network.IGE_SOURCE TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_SOURCE TO sde;
---------------------------------------------------------------------------------------------------------------------------
--DROP TABLE network.IGE_SOURCE_DM
CREATE TABLE network.IGE_SOURCE_DM
(
	SOURCE_ID numeric(12,0) NOT NULL, 
	DATE_EFFECTIVE timestamp,
	DATE_EXPIRY timestamp,
	SOURCE_CLASS VARCHAR(30) NOT NULL, 
	SOURCE_TYPE VARCHAR(50) NOT NULL, 
	INTERNAL_SOURCE_NO VARCHAR(20), 
	INTERNAL_SOURCE_DATE timestamp, 
	EXTERNAL_SOURCE_NO VARCHAR(20), 
	EXTERNAL_SOURCE_DATE timestamp, 
	NAME_PREFIX VARCHAR(20), 
	DOCUMENT_NUMBER VARCHAR(20), 
	NAME_SUFFIX VARCHAR(20), 
	PLAN_NAME VARCHAR(100), 
	FORMER_MUNICIPALITY VARCHAR(20), 
	SOURCE_COMMENTS VARCHAR(255), 
	SOURCE_STATUS VARCHAR(30) NOT NULL, 
	PARENT_SOURCE_ID numeric(12,0), 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL, 
	OBJECTID INTEGER NOT NULL
);

CREATE INDEX IGE_SOURCE_DM_ID_IDX ON network.IGE_SOURCE_DM (SOURCE_ID);
CREATE INDEX IGE_SOURCE_DM_TYPE_IDX ON network.IGE_SOURCE_DM (SOURCE_TYPE);
CREATE INDEX IGE_SOURCE_DM_EXTERNAL_SOURCE_NO_IDX ON NETWORK.IGE_SOURCE_DM(EXTERNAL_SOURCE_NO);
CREATE INDEX IGE_SOURCE_DM_PLAN_NAME_IDX ON NETWORK.IGE_SOURCE_DM(PLAN_NAME);
CREATE INDEX IGE_SOURCE_DM_TRANS_ID_CREATE_IDX ON NETWORK.IGE_SOURCE_DM(TRANS_ID_CREATE);
CREATE INDEX IGE_SOURCE_DM_TRANS_ID_EXPIRE_IDX ON NETWORK.IGE_SOURCE_DM(TRANS_ID_EXPIRE);
CREATE UNIQUE INDEX IGE_SOURCE_DM_OBJECTID_UK ON NETWORK.IGE_SOURCE_DM(objectid);

GRANT ALL ON TABLE network.IGE_SOURCE_DM TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_SOURCE_DM TO sde;
---------------------------------------------------------------------------------------------------------------------------
-- DROP TABLE IGE_SOURCE_H;
CREATE TABLE network.IGE_SOURCE_H
(
	SOURCE_ID numeric(12,0) NOT NULL, 
	RECORD_ID numeric(12,0), 
	SOURCE_CLASS VARCHAR(30) NOT NULL, 
	SOURCE_TYPE VARCHAR(50) NOT NULL, 
	INTERNAL_SOURCE_NO VARCHAR(20), 
	INTERNAL_SOURCE_DATE timestamp, 
	EXTERNAL_SOURCE_NO VARCHAR(20), 
	EXTERNAL_SOURCE_DATE timestamp, 
	NAME_PREFIX VARCHAR(20), 
	DOCUMENT_NUMBER VARCHAR(20), 
	NAME_SUFFIX VARCHAR(20), 
	PLAN_NAME VARCHAR(100), 
	FORMER_MUNICIPALITY VARCHAR(20), 
	SOURCE_COMMENTS VARCHAR(255), 
	SOURCE_STATUS VARCHAR(30) NOT NULL, 
	PARENT_SOURCE_ID numeric(12,0), 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL, 
	OBJECTID INTEGER NOT NULL
);
CREATE UNIQUE INDEX IGE_SOURCE_H_OBJECTID_UK ON NETWORK.IGE_SOURCE_H(objectid);
CREATE INDEX IGE_SOURCE_H_ID_IDX ON network.IGE_SOURCE_H (SOURCE_ID);

GRANT ALL ON TABLE network.IGE_SOURCE_H TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_SOURCE_H TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.IGE_TRANS_CONFLICT_LOG
(
	REGISTRATION_ID numeric(12,0), 
	OWNER VARCHAR(30), 
	TABLE_NAME VARCHAR(30), 
	SDE_ROW_ID numeric(38,0), 
	VERSION1 VARCHAR(100), 
	VERSION2 VARCHAR(100), 
	CONFLICT_TYPE VARCHAR(20), 
	TRANS_ID numeric(12,0)
);
GRANT ALL ON TABLE network.IGE_TRANS_CONFLICT_LOG TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_TRANS_CONFLICT_LOG TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.IGE_TRANS_VALIDATE_LOG
(
	OWNER VARCHAR(30), 
	TABLE_NAME VARCHAR(30), 
	DB_ACTION VARCHAR(20), 
	ID_COLUMN VARCHAR(30), 
	ID_VALUE numeric(12,0), 
	CONFLICT_TYPE VARCHAR(20), 
	TRANS_ID numeric(12,0)
);
GRANT ALL ON TABLE network.IGE_TRANS_VALIDATE_LOG TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_TRANS_VALIDATE_LOG TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.IGE_TRANS_POST
(
	ID numeric(12,0), 
	TRANS_ID numeric(12,0), 
	TRANS_DATE timestamp
);
GRANT ALL ON TABLE network.IGE_TRANS_POST TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_TRANS_POST TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.IGE_FIELD_INFO
(
	OWNER VARCHAR(20), 
	TABLE_NAME VARCHAR(60), 
	FIELD_NAME VARCHAR(60), 
	DOMAIN VARCHAR(80), 
	REFERENCE_TABLE VARCHAR(60), 
	RELATED_FIELD VARCHAR(60), 
	GEOMETRY_COLUMN numeric(1,0), 
	DEPENDENT_TABLE VARCHAR(60), 
	ISCHECKED numeric(1,0), 
	ISKEYFIELD numeric(1,0), 
	NO_DATA VARCHAR(20), 
	NULL_DATA VARCHAR(1)
);
CREATE INDEX IGE_FIELD_INFO_TABLE_NAME_FIELD_NAME ON network.IGE_FIELD_INFO(TABLE_NAME,FIELD_NAME);
GRANT ALL ON TABLE network.IGE_FIELD_INFO TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_FIELD_INFO TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.IGE_TASK_DEFAULT
(
	CONTROL_TASK_TYPE VARCHAR(30) NOT NULL, 
	TASK_TYPE VARCHAR(30) NOT NULL, 
	ASSIGNED_TO VARCHAR(30), 
	TASK_SEQUENCE numeric(4,0), 
	CONTROL_TASK_COMMENTS VARCHAR(255)
);
GRANT ALL ON TABLE network.IGE_TASK_DEFAULT TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_TASK_DEFAULT TO sde;
CREATE INDEX ige_task_default_control_task_type_idx ON ige_task_default (control_task_type);
CREATE INDEX ige_task_default_task_type_idx ON ige_task_default (task_type);
CREATE INDEX ige_task_default_task_type_assigned_idx ON ige_task_default (task_type, assigned_to);
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.IGE_TASK_STEWARD
(
	TASK_TYPE VARCHAR(30) NOT NULL, 
	STEWARD_GROUP VARCHAR(30) NOT NULL
);
CREATE UNIQUE INDEX IGE_TASK_STEWARD_TYPE_GROUP_UK ON network.IGE_TASK_STEWARD (TASK_TYPE, STEWARD_GROUP); 

GRANT ALL ON TABLE network.IGE_TASK_STEWARD TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_TASK_STEWARD TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.IGE_TASK_COMMENT
(
	TASK_ID numeric(12,0) NOT NULL, 
	TASK_TYPE VARCHAR(20), 
	COMMENT_DATE VARCHAR(20), 
	COMMENT_USER VARCHAR(20), 
	COMMENT_ACTION VARCHAR(20)
);
CREATE INDEX IGE_TASK_COMMENT_ID ON network.IGE_TASK_COMMENT (TASK_ID);  
GRANT ALL ON TABLE network.IGE_TASK_COMMENT TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_TASK_COMMENT TO sde;
---------------------------------------------------------------------------------------------------------------------------
--DROP TABLE network.IGE_SOURCE_PRESENTATION
CREATE TABLE network.IGE_SOURCE_PRESENTATION
(
	SOURCE_PRES_ID numeric(12,0) NOT NULL, 
	--RECORD_ID numeric(12,0) NOT NULL, 
	SOURCE_ID numeric(12,0) NOT NULL, 
	SOURCE_PRES_TYPE VARCHAR(50) NOT NULL, 
	SOURCE_PRES_STATUS VARCHAR(30) NOT NULL, 
	SOURCE_PRES_DESC VARCHAR(255) NOT NULL, 
	GEO_REFERENCED VARCHAR(1) NOT NULL, 
	PRESENTATION BYTEA, 
	SOURCE_PRES_FILE_NAME VARCHAR(100), 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL, 
	OBJECTID INT NOT NULL
);
GRANT ALL ON TABLE network.IGE_SOURCE_PRESENTATION TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_SOURCE_PRESENTATION TO sde;
-- Import data
INSERT INTO network.IGE_SOURCE_PRESENTATION
           (SOURCE_PRES_ID, 
			SOURCE_ID, 
			SOURCE_PRES_TYPE, 
			SOURCE_PRES_STATUS, 
			SOURCE_PRES_DESC,
		    GEO_REFERENCED,
			PRESENTATION,
			SOURCE_PRES_FILE_NAME,
			TRANS_ID_CREATE,
			TRANS_ID_EXPIRE,
			OBJECTID
		   )
  SELECT SOURCE_PRES_ID, 
		SOURCE_ID, 
		SOURCE_PRES_TYPE, 
		SOURCE_PRES_STATUS, 
		SOURCE_PRES_DESC,
		GEO_REFERENCED,
		PRESENTATION,
		SOURCE_PRES_FILE_NAME,
		TRANS_ID_CREATE,
		TRANS_ID_EXPIRE,
		OBJECTID
  FROM imaint_oracle.IGE_SOURCE_PRESENTATION;	
CREATE UNIQUE INDEX IGE_SOURCE_PRESENTATION_OBJECT_ID_UK ON network.IGE_SOURCE_PRESENTATION(objectid);  
-- For table network.IGE_SOURCE_PRESENTATION
CREATE SEQUENCE network.IGE_SOURCE_PRESENTATION_id_seq;
ALTER TABLE network.IGE_SOURCE_PRESENTATION 
  ALTER COLUMN source_pres_id SET DEFAULT nextval('ige_source_presentation_id_seq')::numeric(12,0);
SELECT setval('network.ige_source_presentation_id_seq', 1000000000);
ALTER SEQUENCE network.ige_source_presentation_id_seq OWNED BY network.IGE_SOURCE_PRESENTATION.source_pres_id;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.IGE_SOURCE_PRESENTATION_DM
(
	SOURCE_PRES_ID numeric(12,0) NOT NULL, 
	DATE_EFFECTIVE timestamp, 
	DATE_EXPIRY timestamp, 
	SOURCE_ID numeric(12,0) NOT NULL, 
	SOURCE_PRES_TYPE VARCHAR(50) NOT NULL, 
	SOURCE_PRES_STATUS VARCHAR(30) NOT NULL, 
	SOURCE_PRES_DESC VARCHAR(255) NOT NULL, 
	GEO_REFERENCED VARCHAR(1) NOT NULL, 
	PRESENTATION BYTEA, 
	SOURCE_PRES_FILE_NAME VARCHAR(100), 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL, 
	OBJECTID INT NOT NULL
);
INSERT INTO network.IGE_SOURCE_PRESENTATION_DM
            (SOURCE_PRES_ID,
			 DATE_EFFECTIVE,
			 DATE_EXPIRY,
			 SOURCE_ID,
			 SOURCE_PRES_TYPE,
			 SOURCE_PRES_STATUS,
			 SOURCE_PRES_DESC,
			 GEO_REFERENCED,
			 PRESENTATION,
			 SOURCE_PRES_FILE_NAME,
			 TRANS_ID_CREATE,
			 TRANS_ID_EXPIRE,
			 OBJECTID
			)
  SELECT 
		 SOURCE_PRES_ID,
		 DATE_EFFECTIVE,--TO_TIMESTAMP(DATE_EFFECTIVE,'dd-mm-yyyy hh24:mi:ss'),
		 DATE_EXPIRY, --TO_TIMESTAMP(DATE_EXPIRY,'dd-mm-yyyy'),
		 SOURCE_ID,
		 SOURCE_PRES_TYPE,
		 SOURCE_PRES_STATUS,
		 SOURCE_PRES_DESC,
		 GEO_REFERENCED,
		 PRESENTATION,
		 SOURCE_PRES_FILE_NAME,
		 TRANS_ID_CREATE,
		 TRANS_ID_EXPIRE,
		 OBJECTID
  FROM imaint_oracle.IGE_SOURCE_PRESENTATION_DM;
 -- select * from network.IGE_SOURCE_PRESENTATION_DM limit 10
 -- select * from network.IGE_SOURCE_DM limit 10
CREATE UNIQUE INDEX IGE_SOURCE_PRESENTATION_DM_OBJECT_ID_UK ON network.IGE_SOURCE_PRESENTATION_DM(objectid); 
CREATE INDEX IGE_SOURCE_PRESENTATION_DM_ID_IDX ON network.IGE_SOURCE_PRESENTATION_DM(source_pres_id);
CREATE INDEX IGE_SOURCE_PRESENTATION_DM_SOURCE_ID_IDX ON network.IGE_SOURCE_PRESENTATION_DM(source_id);
CREATE INDEX IGE_SOURCE_PRESENTATION_DM_TRANS_ID_CREATE_IDX ON network.IGE_SOURCE_PRESENTATION_DM(trans_id_create);
CREATE INDEX IGE_SOURCE_PRESENTATION_DM_TRANS_ID_EXPIRE_IDX ON network.IGE_SOURCE_PRESENTATION_DM(trans_id_expire);
GRANT ALL ON TABLE network.IGE_SOURCE_PRESENTATION_DM TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_SOURCE_PRESENTATION_DM TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.IGE_SOURCE_PRESENTATION_H
(
	SOURCE_PRES_ID numeric(12,0) NOT NULL,	
	SOURCE_ID numeric(12,0) NOT NULL, 
	SOURCE_PRES_TYPE VARCHAR(50) NOT NULL, 
	SOURCE_PRES_STATUS VARCHAR(30) NOT NULL, 
	SOURCE_PRES_DESC VARCHAR(255) NOT NULL, 
	GEO_REFERENCED VARCHAR(1) NOT NULL, 
	PRESENTATION BYTEA, 
	TRANS_ID_CREATE numeric(12,0) NOT NULL, 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL, 
	OBJECTID INT NOT NULL
);
INSERT INTO network.IGE_SOURCE_PRESENTATION_H
            (SOURCE_PRES_ID,			 
			 SOURCE_ID,
			 SOURCE_PRES_TYPE,
			 SOURCE_PRES_STATUS,
			 SOURCE_PRES_DESC,
			 GEO_REFERENCED,
			 PRESENTATION,
			 SOURCE_PRES_FILE_NAME,
			 TRANS_ID_CREATE,
			 TRANS_ID_EXPIRE,
			 OBJECTID
			)
  SELECT 
		 SOURCE_PRES_ID,		 
		 SOURCE_ID,
		 SOURCE_PRES_TYPE,
		 SOURCE_PRES_STATUS,
		 SOURCE_PRES_DESC,
		 GEO_REFERENCED,
		 PRESENTATION,
		 SOURCE_PRES_FILE_NAME,
		 TRANS_ID_CREATE,
		 TRANS_ID_EXPIRE,
		 OBJECTID
  FROM imaint_oracle.IGE_SOURCE_PRESENTATION_H;
 -- select * from network.IGE_SOURCE_PRESENTATION_H limit 10
CREATE UNIQUE INDEX IGE_SOURCE_PRESENTATION_H_OBJECT_ID_UK ON network.IGE_SOURCE_PRESENTATION_H(objectid); 
GRANT ALL ON TABLE network.IGE_SOURCE_PRESENTATION_H TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.IGE_SOURCE_PRESENTATION_H TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.ige_messages
(
	MESSAGE_NUMBER integer PRIMARY KEY,
	MESSAGE_CATEGORY VARCHAR(7),
	MESSAGE_TYPE VARCHAR(4),
	MESSAGE VARCHAR(1000),
	DESCRIPTION VARCHAR(1000)
);
GRANT ALL ON TABLE network.ige_messages TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.ige_messages TO sde;
CREATE INDEX ige_messages_number_category_type_idx ON ige_messages (message_number, message_category, message_type);

INSERT INTO ige_messages (message_number, message_category, message_type, message)
       VALUES (50680, 'SURCTSK', 'ERR', 'Source Id <srcId>  new internal_source_id <interallNo> is not unique');
INSERT INTO ige_messages (message_number, message_category, message_type, message)
       VALUES (50681, 'SURCTSK', 'ERR', 'Source Id <srcId>  new plan name <planName> is not unique');
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.configuration
(
	ID integer primary key,
	CATEGORY varchar(10),
	TYPE varchar(10),
	NAME varchar(20),
	VALUE varchar(100)
);
GRANT ALL ON TABLE network.configuration TO network;
CREATE UNIQUE INDEX configuration_category_type_name_uk ON configuration (category, type, name);
CREATE UNIQUE INDEX configuration_category_type_name_up_uk ON configuration (upper(category), upper(type), upper(name));
CREATE UNIQUE INDEX configuration_category_type_name_lo_uk ON configuration (lower(category), lower(type), lower(name));
INSERT INTO configuration VALUES (1, 'anchorTO', 'anchorTO', 'SYNC_WITH_ORACLE', '1');
select * from configuration;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE NETWORK.DMN_CL_ADDRESS_PARITY 
   (	
    ADDRESS_PARITY VARCHAR(2) PRIMARY KEY, 
	DESCRIPTION VARCHAR(500), 
	SORT_SEQUENCE numeric(12,2), 
	date_effective timestamp, 
	date_expiry timestamp, 
	TRANS_ID_CREATE numeric(12,0), 
	TRANS_ID_EXPIRE numeric(12,0)
   );
GRANT ALL ON TABLE network.DMN_CL_ADDRESS_PARITY TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.DMN_CL_ADDRESS_PARITY TO sde;
---------------------------------------------------------------------------------------------------------------------------
CREATE TABLE network.
(
	
);
GRANT ALL ON TABLE network. TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network. TO sde;
---------------------------------------------------------------------------------------------------------------------------

/*
-- After creating tables and imported all data into those tables. 
-- Create sequence for the id filed of tables and bind it to the default value of tables
-- Change the initial value to the max of existing values
-- Update the owner of the sequence
	
-- for table address_class 
DROP SEQUENCE if exists network.address_class_id_seq cascade;
CREATE SEQUENCE network.address_id_seq;
ALTER TABLE network.address_class      
  ALTER COLUMN address_id SET DEFAULT nextval('address_id_seq')::numeric(12,0);
SELECT setval('network.address_id_seq', 1000000000, true);
ALTER SEQUENCE network.address_id_seq OWNED BY network.address_class.address_id;

-- for table address_name
CREATE SEQUENCE network.address_name_id_seq;
ALTER TABLE network.address_name      
  ALTER COLUMN address_name_id SET DEFAULT nextval('address_name_id_seq')::numeric(12,0);
SELECT setval('network.address_name_id_seq', 1000000000, true);
ALTER SEQUENCE network.address_name_id_seq OWNED BY network.address_name.address_name_id;

-- for table address_point
CREATE SEQUENCE network.address_point_id_seq;
ALTER TABLE network.address_point      
  ALTER COLUMN address_point_id SET DEFAULT nextval('address_point_id_seq')::numeric(12,0);
SELECT setval('network.address_point_id_seq', 1000000000, true);
ALTER SEQUENCE network.address_point_id_seq OWNED BY network.address_point.address_point_id;

-- for table authorized_municipal_address 
DROP SEQUENCE if exists network.ama_id_seq cascade;
CREATE SEQUENCE network.address_string_id_seq;
ALTER TABLE network.authorized_municipal_address      
  ALTER COLUMN address_string_id SET DEFAULT nextval('address_string_id_seq')::numeric(12,0);
SELECT setval('network.address_string_id_seq', 1000000000, true);
ALTER SEQUENCE network.address_string_id_seq OWNED BY network.authorized_municipal_address.address_string_id;

-- for table base_centreline
DROP SEQUENCE if exists network.base_centreline_id_seq cascade;
CREATE SEQUENCE network.centreline_id_seq;
ALTER TABLE network.base_centreline      
  ALTER COLUMN centreline_id SET DEFAULT nextval('centreline_id_seq')::numeric(12,0);
SELECT setval('network.centreline_id_seq', 1000000000, true);
ALTER SEQUENCE network.centreline_id_seq OWNED BY network.base_centreline.centreline_id;

-- for table base_connectivity
DROP SEQUENCE if exists network.base_connectivity_id_seq cascade;
CREATE SEQUENCE network.connectivity_id_seq;
ALTER TABLE network.base_connectivity      
  ALTER COLUMN connectivity_id SET DEFAULT nextval('connectivity_id_seq')::numeric(12,0);
SELECT setval('network.connectivity_id_seq', 1000000000, true);
ALTER SEQUENCE network.connectivity_id_seq OWNED BY network.base_connectivity.connectivity_id;

-- for table base_intersection
DROP SEQUENCE if exists network.base_intersection_id_seq cascade;
CREATE SEQUENCE network.intersection_id_seq;
ALTER TABLE network.base_intersection      
  ALTER COLUMN intersection_id SET DEFAULT nextval('intersection_id_seq')::numeric(12,0);
SELECT setval('network.intersection_id_seq', 1000000000, true);
ALTER SEQUENCE network.intersection_id_seq OWNED BY network.base_intersection.intersection_id;

-- for table base_intersection_elevation
DROP SEQUENCE if exists network.base_intersection_elevation_id_seq cascade;
CREATE SEQUENCE network.elevation_id_seq;
ALTER TABLE network.base_intersection_elevation      
  ALTER COLUMN elevation_id SET DEFAULT nextval('elevation_id_seq')::numeric(12,0);
SELECT setval('network.elevation_id_seq', 1000000000, true);
ALTER SEQUENCE network.elevation_id_seq OWNED BY network.base_intersection_elevation.elevation_id;

-- for table base_turn
DROP SEQUENCE if exists network.base_turn_id_seq cascade;
CREATE SEQUENCE network.turn_id_seq;
ALTER TABLE network.base_turn      
  ALTER COLUMN turn_id SET DEFAULT nextval('turn_id_seq')::numeric(12,0);
SELECT setval('network.turn_id_seq', 1000000000, true);
ALTER SEQUENCE network.turn_id_seq OWNED BY network.base_turn.turn_id;

-- for table centreline_geometry_lineage
DROP SEQUENCE if exists network.centreline_geometry_lineage_id_seq cascade;
CREATE SEQUENCE network.centreline_lineage_id_seq;
ALTER TABLE network.centreline_geometry_lineage      
  ALTER COLUMN centreline_lineage_id SET DEFAULT nextval('centreline_lineage_id_seq')::numeric(12,0);
SELECT setval('network.centreline_lineage_id_seq', 1000000000, true);
ALTER SEQUENCE network.centreline_lineage_id_seq OWNED BY network.centreline_geometry_lineage.centreline_lineage_id;

-- for table linear_name
CREATE SEQUENCE network.linear_name_id_seq;
ALTER TABLE network.linear_name      
  ALTER COLUMN linear_name_id SET DEFAULT nextval('linear_name_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_id_seq', 1000000000, true);
ALTER SEQUENCE network.linear_name_id_seq OWNED BY network.linear_name.linear_name_id;

ALTER TABLE network.linear_name 
  DROP COLUMN IF EXISTS RECORD_ID,
  DROP COLUMN IF EXISTS LANGUAGE_CODE,
  ADD COLUMN IF NOT EXISTS AUTHORIZED VARCHAR(1),
  ADD COLUMN IF NOT EXISTS USAGE_STATUS VARCHAR(1)
  ; 
CREATE INDEX i_linear_name ON linear_name(upper(name_part), upper(dir_part), upper(activation_status), upper(use_by), upper(usage_status), upper(authorized), upper(duplication_status));
CREATE INDEX i_linear_name_name_type_dir ON linear_name(UPPER(name_part || coalesce(type_part,'') || coalesce(dir_part,'')));

--drop INDEX i_linear_name_name_type_dir
---------- Data Migration ------------------
-- Fix typo "Cadatral" after loading data from Oracle 
    select * from network.dmn_ln_use_by order by 1

    UPDATE dmn_ln_use_by
      SET description = 'Cadastral Only'
    WHERE use_by = 'P';
-- Update 'Historic Only' to 'Historic' as requested
  UPDATE dmn_ln_usage_status
  SET description = 'Historic'
  WHERE usage_status = 'H';
-- LN01: ACTIVATION_STATUS
         Set 'P' to 'X' where there is no segment currently using the name.
         Set 'P' to 'A' where there are segments currently using the name.
         Set any incorrect LFN to 'X' to prevent them from showing up n the pick-list in future, e.g. 'ted rogers Way' (Sepideh to provide the list).
		 SELECT distinct ACTIVATION_STATUS FROM linear_name_evw;		 
		 
		 UPDATE linear_name_evw l
		   SET activation_status = 'B' --temporarily 'B' --> 'A'
		   WHERE activation_status = 'P'	 
		     AND EXISTS 
		     (SELECT linear_name_id FROM base_centreline_evw WHERE trans_id_expire = -1 AND linear_name_id = l.linear_name_id);
		 UPDATE linear_name_evw l
		   SET activation_status = 'W' --temporarily 'W' --> 'X'
		   WHERE activation_status = 'P'	 
		     AND NOT EXISTS 
		     (SELECT linear_name_id FROM base_centreline_evw WHERE trans_id_expire = -1 AND linear_name_id = l.linear_name_id);
		  -- Verify
		  SELECT linear_name_id 
		  FROM base_centreline_evw 
		  WHERE linear_name_id IN (SELECT linear_name_id FROM linear_name_evw WHERE activation_status = 'B')
		  
		  SELECT linear_name_id 
		  FROM base_centreline_evw 
		  WHERE linear_name_id IN (SELECT linear_name_id FROM linear_name_evw WHERE activation_status = 'W')
		  -- Final update:
		  UPDATE linear_name_evw l
		   SET activation_status = 'A' 
		   WHERE activation_status = 'B';
		  UPDATE linear_name_evw l
		   SET activation_status = 'X' 
		   WHERE activation_status = 'W';
		   
-- LN02: APPROVAL_STATUS: 
         Keep 'S' & 'A'; Change 'P' to 'A'
        SELECT distinct approval_status FROM linear_name_evw;

		UPDATE linear_name_evw 
		  SET approval_status = 'A'
		  WHERE approval_status = 'P';
		  
-- LN03: AUTHORIZED column: Update new Authorized column: select * from linear_name_evw where name_part ~ '^[0-9]'
		UPDATE linear_name_evw
		  SET authorized = CASE WHEN name_part ~ '^[0-9]'
								  OR UPPER(name_part) LIKE 'LN %' 
								  OR UPPER(name_part) LIKE 'WW %' 
								  OR UPPER(name_part) LIKE '% RAMP' 
								  OR UPPER(type_part) IN ('TRL','RAMP')
									 THEN 'N'
								ELSE 'Y'
						   END;
      -- For exception list:
	    SELECT linear_name_id, name_part, authorized, use_by
		FROM linear_name_evw
		WHERE upper(name_part) || coalesce(' ' || UPPER(type_part), '') IN 
		( 
		    'BED OF THE DON RIVER',
			'BLOOR STREET RAMP',
			'BRIMLEY ROAD RAMP',
			'CANADIAN NATIONAL RAILWAY',
			'CANADIAN PACIFIC RAILWAY',
			'DON RIVER CHANNEL',
			'DON VALLEY PARKWAY',
			'FERRY SLIP',
			'FREDERICK G GARDINER EXPRESSWAY',
			'HIGHWAY 27',
			'HIGHWAY 400',
			'HIGHWAY 401',
			'HIGHWAY 404',
			'HIGHWAY 409',
			'HIGHWAY 427',
			'LAGOON',
			'LAKE ONTARIO',
			'METROLINX',
			'POND',
			'PROGRESS AVENUE RAMP',
			'PUBLIC LANE',
			'PUBLIC ROAD',
			'PUBLIC WALKWAY',
			'QUEEN ELIZABETH WAY',
			'ROAD ALLOWANCE',
			'SCARBOROUGH BEACH BOULEVARD',
			'SHIP CHANNEL',
			'TORONTO HARBOUR',
			'TORONTO INNER HARBOUR',
			'VIKING LANE RAMP',
			'WATER',
			'WESTERN CHANNEL',
			'WILLIAM R ALLEN ROAD',
			'TORONTO ISLANDS LAGOON',
			'DORIS MCCARTHY TRAIL'
		) ORDER BY 1;
		
		UPDATE linear_name_evw
		  SET authorized = 'N'
		  WHERE upper(name_part) || coalesce(' ' || UPPER(type_part), '') IN 
		( 
		    'BED OF THE DON RIVER',
			'BLOOR STREET RAMP',
			'BRIMLEY ROAD RAMP',
			'CANADIAN NATIONAL RAILWAY',
			'CANADIAN PACIFIC RAILWAY',
			'DON RIVER CHANNEL',
			--'DON VALLEY PARKWAY',
			'FERRY SLIP',
			--'FREDERICK G GARDINER EXPRESSWAY',
			--'HIGHWAY 27',
			--'HIGHWAY 400',
			--'HIGHWAY 401',
			--'HIGHWAY 404',
			--'HIGHWAY 409',
			--'HIGHWAY 427',
			'LAGOON',
			'LAKE ONTARIO',
			'METROLINX',
			'POND',
			'PROGRESS AVENUE RAMP',
			'PUBLIC LANE',
			'PUBLIC ROAD',
			'PUBLIC WALKWAY',
			--'QUEEN ELIZABETH WAY',
			'ROAD ALLOWANCE',
			--'SCARBOROUGH BEACH BOULEVARD',
			'SHIP CHANNEL',
			'TORONTO HARBOUR',
			'TORONTO INNER HARBOUR',
			'VIKING LANE RAMP',
			'WATER',
			'WESTERN CHANNEL',
			--'WILLIAM R ALLEN ROAD',
			'TORONTO ISLANDS LAGOON'
			--'DORIS MCCARTHY TRAIL'
		)  
		UPDATE linear_name_evw
		  SET authorized = 'Y'
		  WHERE upper(name_part) || coalesce(' ' || UPPER(type_part), '') IN 
		( 
		    'DON VALLEY PARKWAY',			
			'FREDERICK G GARDINER EXPRESSWAY',
			'HIGHWAY 27',
			'HIGHWAY 400',
			'HIGHWAY 401',
			'HIGHWAY 404',
			'HIGHWAY 409',
			'HIGHWAY 427',			
			'QUEEN ELIZABETH WAY',			
			'SCARBOROUGH BEACH BOULEVARD',			
			'WILLIAM R ALLEN ROAD',			
			'DORIS MCCARTHY TRAIL'
		) 	
       
		SELECT * FROM linear_name_evw where upper(name_part) = 'BRIMLEY'
		SELECT * FROM linear_name_evw;
		SELECT * FROM linear_name_evw WHERE authorized is null
		SELECT linear_name_id, name_part, type_part, authorized FROM linear_name_evw WHERE authorized = 'N'

-- LN04: Update new Usage_status column: Initially, need to  get data from Oracle PROD NETWORK@...
		1. In Oracle, generate the table and export data: 
			--DROP TABLE SLEE_linear_name_usage
			CREATE TABLE SLEE_linear_name_usage AS
			SELECT
			LINEAR_NAME_ID
			,CASE WHEN EXISTS
			   ( select * from cityprj.corridor n
				where trim(n.CORRIDOR_NAME) = upper(trim(replace(name_part||' '||type_part||' '||DIR_part,'  ',' ')))
				) THEN 1 ELSE 0 END AS  PARCEL_USAGE_STATUS
			,CASE WHEN EXISTS
			   ( select * from cadast.corridor_wh n
				where trim(n.CORRIDOR_NAME) = upper(trim(replace(name_part||' '||type_part||' '||DIR_part,'  ',' ')))
				) THEN 1 ELSE 0 END AS  PARCEL_H_USAGE_STATUS
			,CASE WHEN EXISTS 
			   ( select * from network.base_centreline_gv n
				 where l.linear_name_id = n.linear_name_id
			   ) THEN 1 ELSE 0 END AS CENTRELINE_USAGE_STATUS 
			,CASE WHEN EXISTS 
			   (select * from network.base_centreline_h n
				where l.linear_name_id = n.linear_name_id
				) THEN 1 ELSE 0 END AS CENTRELINE_H_USAGE_STATUS 
			,CASE WHEN EXISTS
			   (select * 
				from ama_gv am
				where am.linear_name_id = l.LINEAR_NAME_ID
			   ) THEN 1 ELSE 0 END AS AMA_USAGE_STATUS
			,CASE WHEN EXISTS
			   (select * 
				from ama_h ah
				where ah.linear_name_id = l.LINEAR_NAME_ID
			   ) THEN 1 ELSE 0 END AS AMA_H_USAGE_STATUS
			,USE_BY
			,NAME_PART
			,TYPE_PART
			,DIR_PART
			from linear_name_gv l
			;
		2. Import data from slee_linear_name_usage.sql
		3. Update usage_status field in linear_name_evw
		  UPDATE linear_name_evw v
		  SET usage_status = 
			  CASE WHEN t.parcel_usage_status = 1 OR t.centreline_usage_status = 1 OR t.ama_usage_status = 1 THEN 'C'
				   WHEN t.parcel_h_usage_status = 1 OR t.centreline_h_usage_status = 1 OR t.ama_h_usage_status = 1 THEN 'H'
				   ELSE 'N'
			  END 
		FROM  SLEE_LINEAR_NAME_USAGE t
		WHERE v.linear_name_id = t.linear_name_id;
		-- Testing
		select * from SLEE_LINEAR_NAME_USAGE where linear_name_id = 12468;
		select * from linear_name_evw where linear_name_id = 12468;
-- LN05: Use_by column:
		UPDATE linear_name_evw
		  SET use_by = CASE WHEN authorized = 'Y' THEN 'B' 
							ELSE 'L'
					   END;
      -- For exception list:
	    SELECT linear_name_id, name_part, authorized, use_by
		FROM linear_name_evw
		WHERE upper(name_part) || coalesce(' ' || UPPER(type_part), '') IN 
		( 
		    'BED OF THE DON RIVER',
			'BLOOR STREET RAMP',
			'BRIMLEY ROAD RAMP',
			'CANADIAN NATIONAL RAILWAY',
			'CANADIAN PACIFIC RAILWAY',
			'DON RIVER CHANNEL',
			'DON VALLEY PARKWAY',
			'FERRY SLIP',
			'FREDERICK G GARDINER EXPRESSWAY',
			'HIGHWAY 27',
			'HIGHWAY 400',
			'HIGHWAY 401',
			'HIGHWAY 404',
			'HIGHWAY 409',
			'HIGHWAY 427',
			'LAGOON',
			'LAKE ONTARIO',
			'METROLINX',
			'POND',
			'PROGRESS AVENUE RAMP',
			'PUBLIC LANE',
			'PUBLIC ROAD',
			'PUBLIC WALKWAY',
			'QUEEN ELIZABETH WAY',
			'ROAD ALLOWANCE',
			'SCARBOROUGH BEACH BOULEVARD',
			'SHIP CHANNEL',
			'TORONTO HARBOUR',
			'TORONTO INNER HARBOUR',
			'VIKING LANE RAMP',
			'WATER',
			'WESTERN CHANNEL',
			'WILLIAM R ALLEN ROAD',
			'TORONTO ISLANDS LAGOON'
		) ORDER BY 1;
		UPDATE linear_name_evw
		  SET use_by = 'P'
		  WHERE upper(name_part) || coalesce(' ' || UPPER(type_part), '') IN 
		( 
		    'BED OF THE DON RIVER',
			'BLOOR STREET RAMP',
			'BRIMLEY ROAD RAMP',
			'CANADIAN NATIONAL RAILWAY',
			'CANADIAN PACIFIC RAILWAY',
			'DON RIVER CHANNEL',
			'DON VALLEY PARKWAY',
			'FERRY SLIP',
			'FREDERICK G GARDINER EXPRESSWAY',
			'HIGHWAY 27',
			'HIGHWAY 400',
			'HIGHWAY 401',
			'HIGHWAY 404',
			'HIGHWAY 409',
			'HIGHWAY 427',
			'LAGOON',
			'LAKE ONTARIO',
			'METROLINX',
			'POND',
			'PROGRESS AVENUE RAMP',
			'PUBLIC LANE',
			'PUBLIC ROAD',
			'PUBLIC WALKWAY',
			'QUEEN ELIZABETH WAY',
			'ROAD ALLOWANCE',
			'SCARBOROUGH BEACH BOULEVARD',
			'SHIP CHANNEL',
			'TORONTO HARBOUR',
			'TORONTO INNER HARBOUR',
			'VIKING LANE RAMP',
			'WATER',
			'WESTERN CHANNEL',
			'WILLIAM R ALLEN ROAD',
			'TORONTO ISLANDS LAGOON'
		)
-- LN06: DUPLICATION_STATUS & DUPLICATION_DESC columns in linear_name table
         Populate the two columns for all duplicated LFN names (e.g. Kelvin Ave is duplicate but one record is not flagged as duplicate).

	UPDATE linear_name_evw
	  SET duplication_status = 'D'
	WHERE linear_name_id IN 
	(
		SELECT linear_name_id -- c.*
		FROM
		(
			SELECT *
			FROM linear_name_evw s
			WHERE UPPER(name_part || coalesce(type_part,'') || coalesce(dir_part,'')) IN 
			  (
					SELECT full_name
					FROM
					(
					SELECT UPPER(name_part || coalesce(type_part,'') || coalesce(dir_part,'')) AS full_name,
						   ROW_NUMBER() OVER (PARTITION BY UPPER(name_part || coalesce(type_part,'') || coalesce(dir_part,'')) ORDER BY linear_name_id) AS rid,
						   t.* 
					FROM linear_name_evw t
					) tt
					WHERE rid > 1
				)
		) c
		 WHERE coalesce(duplication_status, '') <> 'D'
		--ORDER BY name_part, type_part, dir_part, linear_name_id	
	)  
-- LN07: LFN with ACTIVATION_STATUS set to 'Expired'
         Make the record expired by populating columns TRANS_ID_EXPIRE and EXPIREY_DATE


-- Update new-added authorized_municipal_address.USAGE_STATUS column: 
	UPDATE authorized_municipal_address a
	SET usage_status = 'N';

	UPDATE authorized_municipal_address a
	SET usage_status = 'C'
	WHERE  address_string_id IN 
	(SELECT address_string_id FROM address_point_evw WHERE trans_id_expire = -1);

	UPDATE authorized_municipal_address a
	SET usage_status = 'C'
	WHERE  usage_status = 'N' 
	AND address_string_id IN 
	(SELECT address_string_id FROM address_point_dm);
-- Remove RECORD_ID & add USAGE_STATUS column from table authorized_municipal_address in ArcCatalog
-- Remove RECORD_ID & RECORD_TYPE columns from table linear_name_direction in ArcCatalog
  

ALTER TABLE network.linear_name_type 
  DROP COLUMN IF EXISTS RECORD_ID,
  DROP COLUMN IF EXISTS RECORD_TYPE;
  

-- For table network.ige_user
-- Run under admin user to disable foreign key first 
--alter table network.ige_user disable trigger all;
--alter table network.ige_user_steward disable trigger all;
  

ALTER TABLE network.ige_user
    ADD COLUMN FULL_NAME VARCHAR(50);
UPDATE network.ige_user
    SET FULL_NAME = FIRST_NAME || ' ' || LAST_NAME;
ALTER TABLE network.ige_user
    ALTER COLUMN FULL_NAME SET NOT NULL;
	
ALTER TABLE ige_user 
DROP COLUMN IF EXISTS first_name,
DROP COLUMN IF EXISTS last_name,
DROP COLUMN IF EXISTS PHONE;
---------------------------------------------------------------------------
-- After changes, re-enable foreign keys
--alter table network.ige_user enable trigger all;
--alter table network.ige_user_steward enable trigger all;

----------------------------------------------------------------------------
ALTER TABLE ige_user_steward
DROP COLUMN IF EXISTS supervisor,
DROP COLUMN IF EXISTS enabled;
-----------------------------------------------------------------------------
ALTER TABLE ige_source
  DROP COLUMN IF EXISTS RECORD_ID,
  DROP COLUMN IF EXISTS NAME_PREFIX, 
  DROP COLUMN IF EXISTS DOCUMENT_NUMBER, 
  DROP COLUMN IF EXISTS NAME_SUFFIX, 	
  DROP COLUMN IF EXISTS FORMER_MUNICIPALITY; 


ALTER TABLE ige_source_dm
  DROP COLUMN IF EXISTS NAME_PREFIX, 
  DROP COLUMN IF EXISTS DOCUMENT_NUMBER, 
  DROP COLUMN IF EXISTS NAME_SUFFIX, 	
  DROP COLUMN IF EXISTS FORMER_MUNICIPALITY; 
  
ALTER TABLE ige_source_h
  DROP COLUMN IF EXISTS RECORD_ID,
  DROP COLUMN IF EXISTS NAME_PREFIX, 
  DROP COLUMN IF EXISTS DOCUMENT_NUMBER, 
  DROP COLUMN IF EXISTS NAME_SUFFIX, 	
  DROP COLUMN IF EXISTS FORMER_MUNICIPALITY;  


-- For table dmn_source_class
ALTER TABLE dmn_source_class
  ADD COLUMN CONTROL_TASK_TYPE VARCHAR(30);
UPDATE dmn_source_class
  SET CONTROL_TASK_TYPE = 'PARCEL'
  WHERE source_class = 'CADAST_DOCUMENT';
UPDATE dmn_source_class
  SET CONTROL_TASK_TYPE = 'STREET/ADDRESS'
  WHERE source_class IN ('PLAN', 'REPORT'); 
SELECT * from dmn_source_class;  
*/
-------------- Fix table sequence issue ------------------------
-- for table address_class
CREATE SEQUENCE IF NOT EXISTS network.address_class_id_seq;
ALTER TABLE network.address_class      
   ALTER COLUMN address_id SET DEFAULT nextval('address_class_id_seq')::numeric(12,0);  
SELECT setval('network.address_class_id_seq'::regclass, GREATEST(1000000000, max(address_id))::bigint, true) FROM address_class_evw;
ALTER SEQUENCE network.address_class_id_seq OWNED BY network.address_class.address_id;

-- for table address_name
CREATE SEQUENCE IF NOT EXISTS network.address_name_id_seq;
ALTER TABLE network.address_name      
  ALTER COLUMN address_name_id SET DEFAULT nextval('address_name_id_seq')::numeric(12,0);
SELECT setval('network.address_name_id_seq', GREATEST(1000000000, max(address_name_id))::bigint, true) FROM address_name_evw;
ALTER SEQUENCE network.address_name_id_seq OWNED BY network.address_name.address_name_id;

-- for table address_point
CREATE SEQUENCE IF NOT EXISTS network.address_point_id_seq;
ALTER TABLE network.address_point      
  ALTER COLUMN address_point_id SET DEFAULT nextval('address_point_id_seq')::numeric(12,0);
SELECT setval('network.address_point_id_seq', GREATEST(1000000000, max(address_point_id))::bigint, true) FROM address_point_evw;
ALTER SEQUENCE network.address_point_id_seq OWNED BY network.address_point.address_point_id;

-- for table authorized_municipal_address
CREATE SEQUENCE IF NOT EXISTS network.ama_id_seq;
ALTER TABLE network.authorized_municipal_address      
  ALTER COLUMN address_string_id SET DEFAULT nextval('ama_id_seq')::numeric(12,0);
SELECT setval('network.ama_id_seq', GREATEST(1000000000, max(address_string_id))::bigint, true) FROM authorized_municipal_address;
ALTER SEQUENCE network.ama_id_seq OWNED BY network.authorized_municipal_address.address_string_id;

-- for table base_centreline
CREATE SEQUENCE IF NOT EXISTS network.base_centreline_id_seq;
ALTER TABLE network.base_centreline      
  ALTER COLUMN centreline_id SET DEFAULT nextval('base_centreline_id_seq')::numeric(12,0);
SELECT setval('network.base_centreline_id_seq', GREATEST(1000000000, max(centreline_id))::bigint, true) FROM base_centreline_evw;
ALTER SEQUENCE network.base_centreline_id_seq OWNED BY network.base_centreline.centreline_id;

-- for table base_connectivity
CREATE SEQUENCE IF NOT EXISTS network.base_connectivity_id_seq;
ALTER TABLE network.base_connectivity      
  ALTER COLUMN connectivity_id SET DEFAULT nextval('base_connectivity_id_seq')::numeric(12,0);
SELECT setval('network.base_connectivity_id_seq', GREATEST(1000000000, max(connectivity_id))::bigint, true) FROM base_connectivity_evw;
ALTER SEQUENCE network.base_connectivity_id_seq OWNED BY network.base_connectivity.connectivity_id;

-- for table base_intersection
CREATE SEQUENCE IF NOT EXISTS network.base_intersection_id_seq;
ALTER TABLE network.base_intersection      
  ALTER COLUMN intersection_id SET DEFAULT nextval('base_intersection_id_seq')::numeric(12,0);
SELECT setval('network.base_intersection_id_seq', GREATEST(1000000000, max(intersection_id))::bigint, true) FROM base_intersection_evw;
ALTER SEQUENCE network.base_intersection_id_seq OWNED BY network.base_intersection.intersection_id;

-- for table base_intersection_elevation
CREATE SEQUENCE IF NOT EXISTS network.base_intersection_elevation_id_seq;
ALTER TABLE network.base_intersection_elevation      
  ALTER COLUMN elevation_id SET DEFAULT nextval('base_intersection_elevation_id_seq')::numeric(12,0);
SELECT setval('network.base_intersection_elevation_id_seq', GREATEST(1000000000, max(elevation_id))::bigint, true) FROM base_intersection_elevation_evw;
ALTER SEQUENCE network.base_intersection_elevation_id_seq OWNED BY network.base_intersection_elevation.elevation_id;

-- for table base_turn
CREATE SEQUENCE IF NOT EXISTS network.base_turn_id_seq;
ALTER TABLE network.base_turn      
  ALTER COLUMN turn_id SET DEFAULT nextval('base_turn_id_seq')::numeric(12,0);
SELECT setval('network.base_turn_id_seq', GREATEST(1000000000, max(turn_id))::bigint, true) FROM base_turn_evw;
ALTER SEQUENCE network.base_turn_id_seq OWNED BY network.base_turn.turn_id;

-- for table centreline_geometry_lineage
CREATE SEQUENCE IF NOT EXISTS network.centreline_geometry_lineage_id_seq;
ALTER TABLE network.centreline_geometry_lineage      
  ALTER COLUMN centreline_lineage_id SET DEFAULT nextval('centreline_geometry_lineage_id_seq')::numeric(12,0);
SELECT setval('network.centreline_geometry_lineage_id_seq', GREATEST(1000000000, max(centreline_lineage_id))::bigint, true) FROM centreline_geometry_lineage_evw;
ALTER SEQUENCE network.centreline_geometry_lineage_id_seq OWNED BY network.centreline_geometry_lineage.centreline_lineage_id;

-- for table linear_name
CREATE SEQUENCE IF NOT EXISTS network.linear_name_id_seq;
ALTER TABLE network.linear_name      
  ALTER COLUMN linear_name_id SET DEFAULT nextval('linear_name_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_id_seq', GREATEST(1000000000, max(linear_name_id))::bigint, true) FROM linear_name_evw;
ALTER SEQUENCE network.linear_name_id_seq OWNED BY network.linear_name.linear_name_id;

-- for table ige_control_task
CREATE SEQUENCE IF NOT EXISTS network.ige_control_task_id_seq;
ALTER TABLE network.ige_control_task
  ALTER COLUMN control_task_id SET DEFAULT nextval('ige_control_task_id_seq')::numeric(12,0);
--SELECT setval('network.ige_control_task_id_seq', MAX(t.control_task_id)::bigint, true) FROM network.ige_control_task t;
SELECT setval('network.ige_control_task_id_seq', GREATEST(2000000, max(control_task_id))::bigint, true) FROM ige_control_task;
ALTER SEQUENCE network.ige_control_task_id_seq OWNED BY network.ige_control_task.control_task_id;

-- for table ige_source
CREATE SEQUENCE IF NOT EXISTS network.ige_source_id_seq;
ALTER TABLE network.ige_source      
  ALTER COLUMN source_id SET DEFAULT nextval('ige_source_id_seq')::numeric(12,0);
--SELECT setval('network.ige_source_id_seq', MAX(t.source_id)::bigint, true) FROM network.ige_source t;
SELECT setval('network.ige_source_id_seq', GREATEST(2000000, max(source_id))::bigint, true) FROM ige_source_evw;
ALTER SEQUENCE network.ige_source_id_seq OWNED BY network.ige_source.source_id;

-- for table ige_task
CREATE SEQUENCE IF NOT EXISTS network.ige_task_id_seq;
ALTER TABLE network.ige_task
  ALTER COLUMN task_id SET DEFAULT nextval('ige_task_id_seq')::numeric(12,0);
--SELECT setval('network.ige_task_id_seq', MAX(t.task_id), true) FROM network.ige_task t;
SELECT setval('network.ige_task_id_seq', GREATEST(2000000, max(task_id))::bigint, true) FROM ige_task;
ALTER SEQUENCE network.ige_task_id_seq OWNED BY network.ige_task.task_id;

-- for table ige_transaction
CREATE SEQUENCE IF NOT EXISTS network.ige_transaction_id_seq;
ALTER TABLE network.ige_transaction   
  ALTER COLUMN trans_id SET DEFAULT nextval('ige_transaction_id_seq')::numeric(12,0);
--SELECT setval('network.ige_transaction_id_seq', MAX(t.trans_id), true) FROM network.ige_transaction t;
SELECT setval('network.ige_transaction_id_seq', GREATEST(2000000, max(trans_id))::bigint, true) FROM ige_transaction;
ALTER SEQUENCE network.ige_transaction_id_seq OWNED BY network.ige_transaction.trans_id;

-- for table ige_source_presentation
CREATE SEQUENCE IF NOT EXISTS network.ige_source_presentation_id_seq;
ALTER TABLE network.ige_source_presentation  
  ALTER COLUMN source_pres_id SET DEFAULT nextval('ige_source_presentation_id_seq')::numeric(12,0);
SELECT setval('network.ige_source_presentation_id_seq', GREATEST(1000000000, max(source_pres_id))::bigint, true) FROM ige_source_presentation_evw;
ALTER SEQUENCE network.ige_source_presentation_id_seq OWNED BY network.ige_source_presentation.source_pres_id;
-- for table ige_user 
CREATE SEQUENCE IF NOT EXISTS network.ige_user_id_seq;
ALTER TABLE network.ige_user  
  ALTER COLUMN user_id SET DEFAULT nextval('ige_user_id_seq')::numeric(12,0);
SELECT setval('network.ige_user_id_seq', GREATEST(2000000, max(user_id))::bigint, true) FROM ige_user;
ALTER SEQUENCE network.ige_user_id_seq OWNED BY network.ige_user.user_id;

-- for table linear_name_direction
CREATE SEQUENCE IF NOT EXISTS network.linear_name_direction_id_seq;
ALTER TABLE network.linear_name_direction  
  ALTER COLUMN linear_name_dir_id SET DEFAULT nextval('linear_name_direction_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_direction_id_seq', GREATEST(2000000, max(linear_name_dir_id))::bigint, true) FROM linear_name_direction_evw;
ALTER SEQUENCE network.linear_name_direction_id_seq OWNED BY network.linear_name_direction.linear_name_dir_id;
-- for table linear_name_group
CREATE SEQUENCE IF NOT EXISTS network.linear_name_group_id_seq;
ALTER TABLE network.linear_name_group  
  ALTER COLUMN group_id SET DEFAULT nextval('linear_name_group_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_group_id_seq', GREATEST(2000000, max(group_id))::bigint, true) FROM linear_name_group_evw;
ALTER SEQUENCE network.linear_name_group_id_seq OWNED BY network.linear_name_group.group_id;
-- for table linear_name_type
CREATE SEQUENCE IF NOT EXISTS network.linear_name_type_id_seq;
ALTER TABLE network.linear_name_type  
  ALTER COLUMN linear_name_type_id SET DEFAULT nextval('linear_name_type_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_type_id_seq', GREATEST(2000000, max(linear_name_type_id))::bigint, true) FROM linear_name_type_evw;
ALTER SEQUENCE network.linear_name_type_id_seq OWNED BY network.linear_name_type.linear_name_type_id;
-- for table linear_name_xref
CREATE SEQUENCE IF NOT EXISTS network.linear_name_xref_id_seq;
ALTER TABLE network.linear_name_xref  
  ALTER COLUMN linear_name_xref_id SET DEFAULT nextval('linear_name_xref_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_xref_id_seq', GREATEST(2000000, max(linear_name_xref_id))::bigint, true) FROM linear_name_xref_evw;
ALTER SEQUENCE network.linear_name_xref_id_seq OWNED BY network.linear_name_xref.linear_name_xref_id;
-- for table site_area
CREATE SEQUENCE IF NOT EXISTS network.site_area_id_seq;
ALTER TABLE network.site_area  
  ALTER COLUMN site_area_id SET DEFAULT nextval('site_area_id_seq')::numeric(12,0);
SELECT setval('network.site_area_id_seq', GREATEST(2000000, max(site_area_id))::bigint, true) FROM site_area_evw;
ALTER SEQUENCE network.site_area_id_seq OWNED BY network.site_area.site_area_id;
-------------- Fix objectid number issue ----------------
-- Issue: After registering table with ArcGIS, then importing data from other server, 
--        the max(objectid) in the table might be greater than the next objectid (next_rowid), which would violate the unique object id constraint for the future
SELECT network.fix_objectid_number()
-------------- Fix rowid_column issue -------------------
-- Find the incorrect rowid column for registered tables


SELECT * 
FROM sde.sde_table_registry 
WHERE schema = 'network'
  AND rowid_column <> 'objectid';
-- Fix it, run under admin
UPDATE sde.sde_table_registry
  SET rowid_column = 'objectid'
  WHERE schema = 'network'
    AND table_name = 'linear_name_dm'; 
	

--------------------------------------------------------  
-- Create new anchorTo tables
CREATE TABLE network.ige_task_active
(	
	USERNAME character varying(15) PRIMARY KEY, 
	TASK_ID numeric(12,0), 
	DATE_MODIFIED TIMESTAMP
);
GRANT ALL ON TABLE network.ige_task_active TO network;
CREATE INDEX ige_task_active_task_id_idx ON network.ige_task_active (task_id);
-- CREATE VIEWS
CREATE OR REPLACE VIEW v_dmn_plan_status AS
  SELECT plan_status AS source_status,
         description,
		 sort_sequence
  FROM dmn_plan_status
  WHERE trans_id_expire = -1
  ORDER BY sort_sequence;
--select * from v_dmn_plan_status
CREATE OR REPLACE VIEW v_dmn_cadast_document_status AS
  SELECT plan_status AS source_status,
         description,
		 sort_sequence
  FROM dmn_plan_status
  WHERE trans_id_expire = -1
  ORDER BY sort_sequence;
--select * from v_dmn_cadast_document_status
CREATE OR REPLACE VIEW v_dmn_report_status AS
  SELECT report_status AS source_status,
         description,
		 sort_sequence
  FROM dmn_report_status
  WHERE trans_id_expire = -1
  ORDER BY sort_sequence;
--select * from v_dmn_report_status
CREATE OR REPLACE VIEW v_dmn_plan_type AS
  SELECT plan_type AS source_type,
         description,
		 sort_sequence
  FROM dmn_plan_type
  WHERE trans_id_expire = -1
  ORDER BY sort_sequence;
--select * from v_dmn_plan_type
CREATE OR REPLACE VIEW v_dmn_cadast_document_type AS
  SELECT plan_type AS source_type,
         description,
		 sort_sequence
  FROM dmn_plan_type
  WHERE trans_id_expire = -1
  ORDER BY sort_sequence;
--select * from v_dmn_cadast_document_type
CREATE OR REPLACE VIEW v_dmn_report_type AS
  SELECT report_type AS source_type,
         description,
		 sort_sequence
  FROM dmn_report_type
  WHERE trans_id_expire = -1
  ORDER BY sort_sequence;
--select * from v_dmn_report_type
CREATE OR REPLACE VIEW v_ama AS
  SELECT a.*, 
         l.name_part, 
		 l.type_part, 
		 l.dir_part, 
		 l.activation_status, 
		 l.duplication_desc, 
		 l.usage_status AS lfn_usage_status,
		 u.description AS lfn_usage_status_desc		
  FROM authorized_municipal_address_evw a
  JOIN linear_name_evw l ON a.linear_name_id = l.linear_name_id
  JOIN dmn_ln_usage_status u ON u.usage_status = l.usage_status
-- SELECT * FROM v_ama;  

CREATE OR REPLACE VIEW network.v2_ama AS
 SELECT a.address_string_id,
    a.trans_id_create,
    a.trans_id_expire,
    a.linear_name_id,
    a.lo_num,
    a.lo_num_suf,
    a.hi_num,
    a.hi_num_suf,
    a.objectid,
    a.usage_status,
    a.sde_state_id,
    l.linear_name_id AS linear_name_id2,
    l.trans_id_create AS trans_id_create2,
    l.trans_id_expire AS trans_id_expire2,
    l.record_type,
    l.use_by,
    l.name_part,
    l.type_part,
    l.dir_part,
    l.description,
    l.activation_status,
    l.approval_status,
    l.duplication_status,
    l.duplication_desc,
   -- l.objectid AS objectid2,
    l.authorized,
    l.usage_status AS lfn_usage_status,
    l.sde_state_id AS sde_state_id2,
    u.usage_status AS usage_status3,
    u.description AS lfn_usage_status_desc,
    u.sort_sequence,
    u.date_effective,
    u.date_expiry,
    u.trans_id_create AS trnas_id_create3,
    u.trans_id_expire AS trans_id_expire3
   FROM authorized_municipal_address_evw a
     JOIN linear_name_evw l ON a.linear_name_id = l.linear_name_id
     JOIN dmn_ln_usage_status u ON u.usage_status::text = l.usage_status::text;
-- Remove objectid for tables after deployed from another server if using ArcCatalog
alter table ige_user drop column if exists objectid;
alter table ige_control_task drop column if exists objectid;
alter table ige_control_task_default drop column if exists objectid;
alter table ige_field_info drop column if exists objectid;
alter table ige_messages drop column if exists objectid;
alter table ige_task drop column if exists objectid;
alter table ige_task_active drop column if exists objectid;
alter table ige_task_comment drop column if exists objectid;
alter table ige_task_default drop column if exists objectid;
alter table ige_task_steward drop column if exists objectid;
alter table ige_trans_conflict_log drop column if exists objectid;
alter table ige_trans_post drop column if exists objectid;
alter table ige_trans_validate_log drop column if exists objectid;
alter table ige_transaction drop column if exists objectid;
alter table ige_user_steward drop column if exists objectid;
alter table dmn_address_unit_housing drop column if exists objectid;
alter table dmn_address_unit_status drop column if exists objectid;
alter table dmn_ama_usage_status drop column if exists objectid;
alter table dmn_boolean_value drop column if exists objectid;
alter table dmn_business_unit drop column if exists objectid;
alter table dmn_cl_address_parity drop column if exists objectid;
alter table dmn_cl_feature_code drop column if exists objectid;
alter table dmn_cl_oneway drop column if exists objectid;
alter table dmn_control_task_status drop column if exists objectid;
alter table dmn_control_task_type drop column if exists objectid;
alter table dmn_int_classification drop column if exists objectid;
alter table dmn_int_elev_feature_code drop column if exists objectid;
alter table dmn_int_elevation_level drop column if exists objectid;
alter table dmn_int_elevation_unit drop column if exists objectid;
alter table dmn_int_height_unit drop column if exists objectid;
alter table dmn_ln_activation_status drop column if exists objectid;
alter table dmn_ln_approval_status drop column if exists objectid;
alter table dmn_ln_usage_status drop column if exists objectid;
alter table dmn_ln_use_by drop column if exists objectid;
alter table dmn_numeric_operator drop column if exists objectid;
alter table dmn_oar_address_class drop column if exists objectid;
alter table dmn_oar_centreline_side drop column if exists objectid;
alter table dmn_oar_class drop column if exists objectid;
alter table dmn_oar_class_conflict drop column if exists objectid;
alter table dmn_oar_class_flag drop column if exists objectid;
alter table dmn_oar_class_linkage drop column if exists objectid;
alter table dmn_oar_general_use drop column if exists objectid;
alter table dmn_oar_maint_stage drop column if exists objectid;
alter table dmn_oar_name_record_type drop column if exists objectid;
alter table dmn_plan_status drop column if exists objectid;
alter table dmn_plan_type drop column if exists objectid;
alter table dmn_plan_type_ext drop column if exists objectid;
alter table dmn_presentation_type drop column if exists objectid;
alter table dmn_report_status drop column if exists objectid;
alter table dmn_report_type drop column if exists objectid;
alter table dmn_sa_status drop column if exists objectid;
alter table dmn_source_class drop column if exists objectid;
alter table dmn_steward_group drop column if exists objectid;
alter table dmn_steward_status drop column if exists objectid;
alter table dmn_string_operator drop column if exists objectid;
alter table dmn_task_status drop column if exists objectid;
alter table dmn_task_type drop column if exists objectid;
-------------------------------------------------------------------
-- For generating INSERT statement:
GRANT SELECT ON IGE_TASK TO anchorto_run;
GRANT SELECT ON IGE_CONTROL_TASK TO anchorto_run;
GRANT SELECT ON IGE_SOURCE_EVW TO anchorto_run;
GRANT SELECT ON IGE_SOURCE_PRESENTATION_EVW TO anchorto_run;
GRANT SELECT ON LINEAR_NAME_EVW TO anchorto_run;
GRANT SELECT ON LINEAR_NAME_TYPE_EVW TO anchorto_run;
GRANT SELECT ON AUTHORIZED_MUNICIPAL_ADDRESS_EVW TO anchorto_run;
-------------------------------------------------------------------
import foreign schema "IGE"
limit to (ige_user)
from server imaint_oracle into imaint_oracle;
--The following statement is necessary if using PostgreSQL foreign table to update data below  
ALTER FOREIGN TABLE imaint_oracle.ige_user ALTER COLUMN user_id OPTIONS (KEY 'true');


import foreign schema "IGE"
limit to (ige_user_steward)
from server imaint_oracle into imaint_oracle;
ALTER FOREIGN TABLE imaint_oracle.ige_user_steward ALTER COLUMN user_id OPTIONS (KEY 'true');
ALTER FOREIGN TABLE imaint_oracle.ige_user_steward ALTER COLUMN steward_group OPTIONS (KEY 'true');

import foreign schema "IGE"
limit to (ige_task, ige_transaction)
from server imaint_oracle into imaint_oracle;
ALTER FOREIGN TABLE imaint_oracle.ige_task ALTER COLUMN task_id OPTIONS (KEY 'true');
ALTER FOREIGN TABLE imaint_oracle.ige_transaction ALTER COLUMN trans_id OPTIONS (KEY 'true');

import foreign schema "IGE"
limit to (ige_control_task)
from server imaint_oracle into imaint_oracle;
ALTER FOREIGN TABLE imaint_oracle.ige_control_task ALTER COLUMN control_task_id OPTIONS (KEY 'true');

import foreign schema "IGE"
limit to (ige_messages)
from server imaint_oracle into imaint_oracle;

insert into ige_task (
task_id,task_type, source_id, assigned_to, taken_by, task_sequence, task_status,task_comments, control_task_id, task_category, trans_id_create, trans_id_expire)
select task_id,task_type, source_id, assigned_to, taken_by, task_sequence, task_status,task_comments, control_task_id, task_category, trans_id_create, trans_id_expire
from imaint_oracle.ige_task 
where task_id >= 25000 and task_id < 30000;

select count(*) from ige_task;
--select * from imaint_oracle.ige_source_presentation limit 10;
select * from imaint_oracle.ige_user;
select * from imaint_oracle.ige_user_steward;
select * from imaint_oracle.ige_task limit 10;
select * from imaint_oracle.ige_transaction limit 10;
select * from imaint_oracle.ige_control_task limit 10;
select * from imaint_oracle.ige_mesages;
---------------- Grant feature layer access to anchorto_run ------------------------------------------
-- 1. Use ArcCatalog tool to do it
https://desktop.arcgis.com/en/arcmap/10.3/manage-data/gdbs-in-oracle/grant-dataset-privileges.htm
ArcToolBox --> "Data Management Tools" --> "Geodatabase Administration" --> "Change Privileges"
"Input Dataset": "Database Connections\banf-network-lbm.sde\lbm.network.ADDRESS_NAME"
"User": "anchorto_run"
"View(Select)": "GRANT"
"Edit(Update/Insert/Delete)": "GRANT"
-- 2. Grant it in DB   
GRANT SELECT, INSERT, UPDATE, DELETE ON AUTHORIZED_MUNICIPAL_ADDRESS TO anchorto_run;
GRANT SELECT, INSERT, UPDATE, DELETE ON d23 TO anchorto_run;
GRANT SELECT, INSERT, UPDATE, DELETE ON a23 TO anchorto_run;
GRANT SELECT, INSERT, UPDATE, DELETE ON i23 TO anchorto_run;
---------------- Re-structure Setup schema code_src & user anchorto_run ------------------------------
-- Run under admin account for the DB
CREATE SCHEMA code_src AUTHORIZATION network; -- Schema to host functions
CREATE USER anchorto_run PASSWORD 'tsnine';   -- User for front-end
GRANT USAGE ON SCHEMA code_src TO anchorto_run;
GRANT USAGE ON SCHEMA network TO anchorto_run;
--GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA sde TO anchorto_run;
ALTER USER anchorto_run SET search_path TO '$user', code_src, network, sde;
ALTER USER network SET search_path TO '$user', code_src, public, sde;
--revoke execute on all functions in schema network from public;
 
-- Create all functions under code_src, make sure SECURITY DEFINER is added before AS $BODY$ part

-- After creating a function in code_src, need to grant execute to anchor_run user
grant execute on function code_src.get_lfn_by_id(numeric) to anchorto_run;
grant execute on function code_src.get_configuration (text, text, text, text) to anchorto_run;
...
-- Testing scripts under anchorto_run user:
SELECT get_lfn_by_id(1570)
SELECT get_configuration('anchorTO', 'ANCHORTO', 'sync_with_oracle')
select get_configuration_int('anchorTO', 'ANCHORTO', 'sync_with_oracle') 
SELECT format_string('ABC"DE')
SELECT is_blank_id('ABC')
SELECT is_blank_string('ABC')
SELECT update_lfn_type('{ "objectid": null,"linear_name_type_id": null,"type_part": "ABC","type_part_code": "a"}', 123);
SELECT update_lfn_type('{"objectid":null,"linear_name_type_id":null,"type_part":"Test","type_part_code":"Test","closed":null,"task_id":1000001331,"user_id":"rli4"}', 123);
SELECT update_lfn_type_dm_h(1000000003, 220)
SELECT format_message('Source Id <srcId>  new external_source_id <externalNo> is not unique','888')
SELECT validate_task_status('COMPLETED')
SELECT create_transaction(1,'slee33', 'some comments', 'anchorTO');
SELECT create_transaction2(1,'slee33', 'some comments', 'anchorTO');
SELECT create_task('slee330', 'some comments', 'anchorTO', 'SOURCE');
SELECT create_source_task('slee5', 'comments32010');
select close_task_by_trans_id('slee333', 296388,'ABORTED') 
select close_task_by_trans_id('slee333', 296388,'COMPLETED') 
SELECT get_task_id_by_trans_id(1000000682)
select code_src.update_trans_status(296388, 'COM')
select code_src.update_trans_status(296388, 'ABORTED')
select code_src.update_trans_status(296388, 'COMPLETED') 
select code_src.close_task('slee333', '3', 'uapp1', 'COMPLETED') 
select get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') 
SELECT get_message(50680,'ERR','SURCTSK', '0', '888');
SELECT get_users()
select get_user_by_task_type('PLANPARCEL')
SELECT get_user_by_name('rli4')
select get_new_task_type('STREET/ADDRESS');
select get_next_task_by_user_name('sarzand');
SELECT get_predefined_lfn();
SELECT get_predefined_source_info(); 
select get_predefined_task_info('REPORT')
select get_predefined_task_info_details('Plan')
SELECT get_predefined_user_info()
select get_source_by_id_core(1699);
select get_source_by_id(1699, 'sde.DEFAULT');
SELECT get_sources()
SELECT get_task_id_by_trans_id(1000000682)
SELECT get_user_by_id(60)
SELECT delete_transaction_by_trans_id(123);
SELECT delete_transaction_by_task_id(123);
SELECT delete_task(1000000036)
SELECT delete_source_task(1000000059);
SELECT start_user_task(1000001331, 'rli4')
SELECT search_lfn('{"activation_status": "A",  "authorized": "",  "used_by": "L",  "usage_status":"",  "logic": "and"}')
SELECT update_task_status(67092,'completed')
SELECT update_control_task_status_by_tasks(1000000016, TRUE);
SELECT set_edit_version('TRANS81',1)
SELECT sde.sde_set_current_version('myedits12111');
SELECT get_registration_id('network', 'linear_name')
SELECT update_control_task(0,10001,null,'some "comments','STREET/ADDRESS',20000,-1);
SELECT update_lfn('{ "objectid": null,"linear_name_id": null,"name_part": "test","type_part": "Street","dir_part": "South","description": "test test", "activation_status": "A","authorized": "Y","used_by": "L"}',123, -1);
SELECt update_lfn_dm_h(1000000010, 128);    
SELECT update_source('{"source_id":null,"class":"REPORT","type":"INHOUSE MAINTENANCE","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"Test Internal6","int_date":"2019-07-18","ext_id":"","ext_date":null,"plan_name":null,"maint_status":null,"comment":null,"closed":null,"task":[{"task_id":null,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"emachyni","task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"rli4","task_comments":"Add/adjust/delete Linear Name","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"AMA","task_sequence":30,"assigned_to":"rli4","task_comments":"Add/adjust/delete AMA","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"INTERSECTION","task_sequence":40,"assigned_to":"INTERSECTION_MAINT","task_comments":"Add/edit/delete Intersections","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"CENTRELINE","task_sequence":50,"assigned_to":"SEGMENT_MAINT","task_comments":"Add/edit/delete Segments","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_comments":"Add/edit/delete Reserved Address Points","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"slee6111","task_comments":"Close Site Area - hold for now","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":null,"user_id":"rli4"}'
					 , 10000
					 ,-1
					 ,'sde.DEFAULT');
SELECT update_source_dm_h(2000008, 259)
select update_source_task_info('{"objectid":133059,"source_id":11969,"class":"REPORT","type":"MUNICIPAL NUMBERING LETTER","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"em-13-19 Winchester","int_date":"2019-05-13","ext_id":"18164283STE28SA","ext_date":"2019-05-13","plan_name":null,"maint_status":"HOLD","comment":"amalg, Margaret''s House -test","closed":false,"task":[{"task_id":156824,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"EMACHYNI","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","status":"ACTIVE","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"EMACHYNI","status":"ACTIVE","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"JFLIGG","status":"ACTIVE","user_id":14,"full_name":"John Fligg"},{"username":"KPORTER","status":"LOCKED","user_id":30,"full_name":"Kevin Porter"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"}],"task_comments":"<13-May-2019 11:05 EMACHYNI: Complete Task: Submit job successfully, job request id 157971>rn<13-May-2019 11:03 EMACHYNI: Post Work: Submit job successfully, job request id 157968>rn<13-May-2019 11:02 EMACHYNI: Stop Work>rn<13-May-2019 11:01 EMACHYNI: Start Work>rn<13-May-2019 11:01 EMACHYNI: Taken>rn<13-May-2019 10:09 EMACHYNI: Updated>rnCreate/adjust Site Area","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":156829,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_assigned_to_user_list":[{"username":"ADDRESS_MAINT","status":"ACTIVE","user_id":0,"full_name":"ADDRESS_MAINT"},{"username":"CWDOWCZ","status":"ACTIVE","user_id":57,"full_name":"Carol Wdowczyk"},{"username":"HMARROW","status":"ACTIVE","user_id":49,"full_name":"Hisham Marrow"},{"username":"JELLIOTT","status":"ACTIVE","user_id":60,"full_name":"James Elliott"},{"username":"JCHONG","status":"ACTIVE","user_id":55,"full_name":"Joyce Chong"},{"username":"KMERREM","status":"ACTIVE","user_id":28,"full_name":"Karl Merrem"},{"username":"BURTON","status":"ACTIVE","user_id":61,"full_name":"Michael Burton"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"RLI4","status":"ACTIVE","user_id":67,"full_name":"Rui Yang Li"},{"username":"SSellia","status":"ACTIVE","user_id":56,"full_name":"Seeva Selliah"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"SHODGINS","status":"ACTIVE","user_id":51,"full_name":"Steve Hodgins"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"},{"username":"DJOKIC","status":"ACTIVE","user_id":54,"full_name":"Zivorad Djokic"}],"task_comments":"<24-May-2019 12:17 HMARROW: Complete Task: Submit job successfully, job request id 158301>rn<24-May-2019 12:16 HMARROW: Post Work: Submit job successfully, job request id 158300>rn<24-May-2019 12:16 HMARROW: Stop Work>rn<24-May-2019 12:15 HMARROW: Start Work>rn<13-May-2019 11:06 HMARROW: Taken>rnAdd/edit/delete Reserved Address Points","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":156830,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"EMACHYNI","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","status":"ACTIVE","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"EMACHYNI","status":"ACTIVE","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"JFLIGG","status":"ACTIVE","user_id":14,"full_name":"John Fligg"},{"username":"KPORTER","status":"LOCKED","user_id":30,"full_name":"Kevin Porter"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"}],"task_comments":"<28-May-2019 11:55 EMACHYNI: Hold>rn<13-May-2019 10:09 EMACHYNI: Updated>rnClose Site Area","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":[],"user_id":"rli4"}'
                              , 11969 
							  ,294338
							  ,-1)
SELECT update_tasks('[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD","deleted":false }]'::json,
						     10005,
						     20005,
						    'SUPERVISOR DEFINED',
						    10006,
						    -1);
select update_user_info('{"business_unit": "IT - SDS - GCC","email": "slee3300@toronto.ca","fullname": "Steve lee3300","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","CENTRELINE_ADDRESS_MAINT"],"user_id": null,"username": "Slee33000"}');
------------------------------------------------------------------------------- 
SELECT sde_set_current_version('anchorto_run.TRANS1000000751');
SELECT * FROM ige_source_evw 









 








