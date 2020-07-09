ALTER TABLE network.base_centreline
    ADD COLUMN shape_length numeric(38, 3);

--drop table network.DMN_PLAN_TYPE_EXT;
CREATE TABLE network.DMN_PLAN_TYPE_EXT 
   (EXT_NAME varchar(12) NOT NULL , 
	EXT_TYPE varchar(6) NOT NULL , 
	DESCRIPTION varchar(500) NOT NULL , 
	PLAN_TYPE varchar(50) NOT NULL , 
	SORT_SEQUENCE numeric(7,2) NOT NULL , 
	BIZ_EFFECTIVE_DATE timestamp NOT NULL , 
	BIZ_EXPIRY_DATE timestamp NOT NULL , 
	TRANS_ID_CREATE numeric(12,0) NOT NULL , 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL , 
	 CONSTRAINT DMN_PLAN_TYPE_EXT_FK FOREIGN KEY (PLAN_TYPE)
	  REFERENCES network.DMN_PLAN_TYPE (PLAN_TYPE) 
   );
GRANT ALL ON TABLE network.DMN_PLAN_TYPE_EXT TO network;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.DMN_PLAN_TYPE_EXT TO sde;   

CREATE TABLE network.DMN_CONTROL_TASK_TYPE 
   (	CONTROL_TASK_TYPE varchar(30) NOT NULL primary key, 
	DESCRIPTION varchar(500) NOT NULL , 
	SORT_SEQUENCE numeric(5,2) NOT NULL , 
	BIZ_EFFECTIVE_DATE timestamp NOT NULL , 
	BIZ_EXPIRY_DATE timestamp NOT NULL , 
	TRANS_ID_CREATE numeric(12,0) NOT NULL , 
	TRANS_ID_EXPIRE numeric(12,0) NOT NULL
   );

 CREATE UNIQUE INDEX DMN_CONTROL_TASK_TYPE_PK ON network.DMN_CONTROL_TASK_TYPE (CONTROL_TASK_TYPE);
 GRANT ALL ON TABLE network.DMN_CONTROL_TASK_TYPE TO network;
 GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE network.DMN_CONTROL_TASK_TYPE TO sde; 
 --insert into DMN_CONTROL_TASK_TYPE values ('PARCEL', 'Cadastral', 1, current_timestamp, '3000-01-01 00:00:00'::timestamp, 1, -1);
 --insert into DMN_CONTROL_TASK_TYPE values ('STREET/ADDRESS', 'Centreline/Address', 2, current_timestamp, '3000-01-01 00:00:00'::timestamp, 1, -1);
 select * from DMN_CONTROL_TASK_TYPE;
 -----------------------------------------------------------

