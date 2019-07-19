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
	OBJECTID numeric(38,0) NOT NULL	
);
CREATE INDEX network.linear_name_id ON network.linear_name (linear_name_id);
CREATE UNIQUE INDEX network.linear_name_objectid_uk ON network.linear_name (objectid);
*/
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
	OBJECTID numeric(38,0) NOT NULL
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
	OBJECTID numeric(38,0) NOT NULL
);
--alter table network.linear_name_h add record_type character varying(1);
--alter table network.linear_name_h add use_by      text;
--alter table network.linear_name_h add language_code      text;
--alter table network.linear_name_h drop record_type;
--alter table network.linear_name_h drop use_by;
--alter table network.linear_name_h drop if exists record_id ;
--alter table network.linear_name_h drop language_code;	
CREATE UNIQUE INDEX linear_name_h_objectid_uk ON network.linear_name_h (objectid);

GRANT ALL ON TABLE network.linear_name_h TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.linear_name_h TO sde;
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
	OBJECTID numeric(38,0) NOT NULL 
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
	OBJECTID numeric(38,0) NOT NULL 
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
    objectid numeric(38,0) NOT NULL
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
    objectid numeric(38,0) NOT NULL
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
	OBJECTID numeric(38,0) NOT NULL
);
--alter table network.AUTHORIZED_MUNICIPAL_ADDRESS add RECORD_ID numeric(12,0);
--alter table network.AUTHORIZED_MUNICIPAL_ADDRESS drop RECORD_ID;
CREATE INDEX AUTHORIZED_MUNICIPAL_ADDRESS_address_string_id_i ON network.AUTHORIZED_MUNICIPAL_ADDRESS (address_string_id);
CREATE INDEX AUTHORIZED_MUNICIPAL_ADDRESS_linear_name_id_i ON network.AUTHORIZED_MUNICIPAL_ADDRESS (linear_name_id);
CREATE UNIQUE INDEX AUTHORIZED_MUNICIPAL_ADDRESS_objectid_uk ON network.AUTHORIZED_MUNICIPAL_ADDRESS (objectid);

GRANT ALL ON TABLE network.AUTHORIZED_MUNICIPAL_ADDRESS TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.AUTHORIZED_MUNICIPAL_ADDRESS TO sde;*/

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
	OBJECTID numeric(38,0) NOT NULL
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
	OBJECTID numeric(38,0) NOT NULL
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
	SOURCE_PRES_FILE_NAME VARCHAR(100), 
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
CREATE TABLE network.
(
	
);
GRANT ALL ON TABLE network. TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network. TO sde;
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
CREATE SEQUENCE network.address_class_id_seq;
ALTER TABLE network.address_class      
  ALTER COLUMN address_id SET DEFAULT nextval('address_class_id_seq')::numeric(12,0);
SELECT setval('network.address_class_id_seq', 1000000000, true);
ALTER SEQUENCE network.address_class_id_seq OWNED BY network.address_class.address_id;

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
CREATE SEQUENCE network.ama_id_seq;
ALTER TABLE network.authorized_municipal_address      
  ALTER COLUMN address_string_id SET DEFAULT nextval('ama_id_seq')::numeric(12,0);
SELECT setval('network.ama_id_seq', 1000000000, true);
ALTER SEQUENCE network.ama_id_seq OWNED BY network.authorized_municipal_address.address_string_id;

-- for table base_centreline
CREATE SEQUENCE network.base_centreline_id_seq;
ALTER TABLE network.base_centreline      
  ALTER COLUMN centreline_id SET DEFAULT nextval('base_centreline_id_seq')::numeric(12,0);
SELECT setval('network.base_centreline_id_seq', 1000000000, true);
ALTER SEQUENCE network.base_centreline_id_seq OWNED BY network.base_centreline.centreline_id;

-- for table base_connectivity
CREATE SEQUENCE network.base_connectivity_id_seq;
ALTER TABLE network.base_connectivity      
  ALTER COLUMN connectivity_id SET DEFAULT nextval('base_connectivity_id_seq')::numeric(12,0);
SELECT setval('network.base_connectivity_id_seq', 1000000000, true);
ALTER SEQUENCE network.base_connectivity_id_seq OWNED BY network.base_connectivity.connectivity_id;

-- for table base_intersection
CREATE SEQUENCE network.base_intersection_id_seq;
ALTER TABLE network.base_intersection      
  ALTER COLUMN intersection_id SET DEFAULT nextval('base_intersection_id_seq')::numeric(12,0);
SELECT setval('network.base_intersection_id_seq', 1000000000, true);
ALTER SEQUENCE network.base_intersection_id_seq OWNED BY network.base_intersection.intersection_id;

-- for table base_intersection_elevation
CREATE SEQUENCE network.base_intersection_elevation_id_seq;
ALTER TABLE network.base_intersection_elevation      
  ALTER COLUMN elevation_id SET DEFAULT nextval('base_intersection_elevation_id_seq')::numeric(12,0);
SELECT setval('network.base_intersection_elevation_id_seq', 1000000000, true);
ALTER SEQUENCE network.base_intersection_elevation_id_seq OWNED BY network.base_intersection_elevation.elevation_id;

-- for table base_turn
CREATE SEQUENCE network.base_turn_id_seq;
ALTER TABLE network.base_turn      
  ALTER COLUMN turn_id SET DEFAULT nextval('base_turn_id_seq')::numeric(12,0);
SELECT setval('network.base_turn_id_seq', 1000000000, true);
ALTER SEQUENCE network.base_turn_id_seq OWNED BY network.base_turn.turn_id;

-- for table centreline_geometry_lineage
CREATE SEQUENCE network.centreline_geometry_lineage_id_seq;
ALTER TABLE network.centreline_geometry_lineage      
  ALTER COLUMN centreline_lineage_id SET DEFAULT nextval('centreline_geometry_lineage_id_seq')::numeric(12,0);
SELECT setval('network.centreline_geometry_lineage_id_seq', 1000000000, true);
ALTER SEQUENCE network.centreline_geometry_lineage_id_seq OWNED BY network.centreline_geometry_lineage.centreline_lineage_id;

-- for table linear_name
CREATE SEQUENCE network.linear_name_id_seq;
ALTER TABLE network.linear_name      
  ALTER COLUMN linear_name_id SET DEFAULT nextval('linear_name_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_id_seq', 1000000000, true);
ALTER SEQUENCE network.linear_name_id_seq OWNED BY network.linear_name.linear_name_id;

-- for table linear_name_direction
CREATE SEQUENCE network.linear_name_direction_id_seq;
ALTER TABLE network.linear_name_direction      
  ALTER COLUMN linear_name_dir_id SET DEFAULT nextval('linear_name_direction_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_direction_id_seq', 1000000000, true);
ALTER SEQUENCE network.linear_name_direction_id_seq OWNED BY network.linear_name_direction.linear_name_dir_id;

-- for table linear_name_group
CREATE SEQUENCE network.linear_name_group_id_seq;
ALTER TABLE network.linear_name_group      
  ALTER COLUMN group_id SET DEFAULT nextval('linear_name_group_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_group_id_seq', 1000000000, true);
ALTER SEQUENCE network.linear_name_group_id_seq OWNED BY network.linear_name_group.group_id;

-- for table linear_name_type
CREATE SEQUENCE network.linear_name_type_id_seq;
ALTER TABLE network.linear_name_type      
  ALTER COLUMN linear_name_type_id SET DEFAULT nextval('linear_name_type_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_type_id_seq', 1000000000, true);
ALTER SEQUENCE network.linear_name_type_id_seq OWNED BY network.linear_name_type.linear_name_type_id;

-- for table linear_name_xref
CREATE SEQUENCE network.linear_name_xref_id_seq;
ALTER TABLE network.linear_name_xref      
  ALTER COLUMN linear_name_xref_id SET DEFAULT nextval('linear_name_xref_id_seq')::numeric(12,0);
SELECT setval('network.linear_name_xref_id_seq', 1000000000, true);
ALTER SEQUENCE network.linear_name_xref_id_seq OWNED BY network.linear_name_xref.linear_name_xref_id;

-- for table site_area
CREATE SEQUENCE network.site_area_id_seq;
ALTER TABLE network.site_area      
  ALTER COLUMN site_area_id SET DEFAULT nextval('site_area_id_seq')::numeric(12,0);
SELECT setval('network.site_area_id_seq', 1000000000, true);
ALTER SEQUENCE network.site_area_id_seq OWNED BY network.site_area.site_area_id;

-- For table network.ige_user
-- Run under admin user to disable foreign key first 
--alter table network.ige_user disable trigger all;
--alter table network.ige_user_steward disable trigger all;
  
CREATE SEQUENCE network.ige_user_id_seq;
ALTER TABLE network.ige_user   
  ALTER COLUMN user_id SET DEFAULT nextval('ige_user_id_seq')::numeric(12,0);
--SELECT setval('network.ige_user_id_seq', MAX(t.user_id)::bigint, true) FROM network.ige_user t;
SELECT setval('network.ige_user_id_seq', 100000, true);
ALTER SEQUENCE network.ige_user_id_seq OWNED BY network.ige_user.user_id;

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

CREATE SEQUENCE network.ige_source_id_seq;
ALTER TABLE network.ige_source      
  ALTER COLUMN source_id SET DEFAULT nextval('ige_source_id_seq')::numeric(12,0);
--SELECT setval('network.ige_source_id_seq', MAX(t.source_id)::bigint, true) FROM network.ige_source t;
SELECT setval('network.ige_source_id_seq', 1000000000, true);
ALTER SEQUENCE network.ige_source_id_seq OWNED BY network.ige_source.source_id;

CREATE SEQUENCE network.ige_task_id_seq;
ALTER TABLE network.ige_task
  ALTER COLUMN task_id SET DEFAULT nextval('ige_task_id_seq')::numeric(12,0);
--SELECT setval('network.ige_task_id_seq', MAX(t.task_id), true) FROM network.ige_task t;
SELECT setval('network.ige_task_id_seq', 1000000000, true);
ALTER SEQUENCE network.ige_task_id_seq OWNED BY network.ige_task.task_id;

CREATE SEQUENCE network.ige_transaction_id_seq;
ALTER TABLE network.ige_transaction   
  ALTER COLUMN trans_id SET DEFAULT nextval('ige_transaction_id_seq')::numeric(12,0);
--SELECT setval('network.ige_transaction_id_seq', MAX(t.trans_id), true) FROM network.ige_transaction t;
SELECT setval('network.ige_transaction_id_seq', 1000000000, true);
ALTER SEQUENCE network.ige_transaction_id_seq OWNED BY network.ige_transaction.trans_id;

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

CREATE SEQUENCE network.ige_control_task_id_seq;
ALTER TABLE network.ige_control_task
  ALTER COLUMN control_task_id SET DEFAULT nextval('ige_control_task_id_seq')::numeric(12,0);
--SELECT setval('network.ige_control_task_id_seq', MAX(t.control_task_id)::bigint, true) FROM network.ige_control_task t;
SELECT setval('network.ige_control_task_id_seq', 1000000000, true);
ALTER SEQUENCE network.ige_control_task_id_seq OWNED BY network.ige_control_task.control_task_id;

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
limit to (ige_mesages)
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













