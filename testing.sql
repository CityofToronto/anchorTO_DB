select * from ige_user;
select get_user_by_id(55);
select get_users();
select get_user_by_name('sarzand');
select get_predefined_user_info();
select update_user_info('{"business_unit": "IT - SDS - GCC","email": "slee3@toronto.ca","fullname": "Steve lee","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","LINEARNAME_MAINT","STEWARD_MAINT","SOURCE_MAINT","CENTRELINE_ADDRESS_MAINT"],"user_id": null,"username": "slee33"
}');
select update_user_info('{"business_unit": "IT - SDS - GCC","email": "slee3@toronto.ca","fullname": "Steve lee","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","LINEARNAME_MAINT","STEWARD_MAINT","SOURCE_MAINT","CENTRELINE_ADDRESS_MAINT"],"user_id": 161,"username": "slee33"
}');
select update_user_info('{"business_unit": "IT - SDS - GCC","email": "slee3@toronto.ca","fullname": "Steve lee","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","LINEARNAME_MAINT","STEWARD_MAINT","SOURCE_MAINT","CENTRELINE_ADDRESS_MAINT"],"user_id": 99,"username": "slee3"
}');
select update_user_info('{"business_unit": "IT - SDS - GCC","email": "slee33@toronto.ca","fullname": "Steve lee3","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","LINEARNAME_MAINT","STEWARD_MAINT","SOURCE_MAINT","CENTRELINE_ADDRESS_MAINT"],"user_id": 99,"username": "slee3"
}');
select update_user_info('{"business_unit": "IT - SDS - GCC","email": "slee330@toronto.ca","fullname": "Steve lee330","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","LINEARNAME_MAINT","STEWARD_MAINT","SOURCE_MAINT","CENTRELINE_ADDRESS_MAINT"],"user_id": null,"username": "slee330"
}');
select update_user_info('{"business_unit": "IT - SDS - GCC","email": "slee3300@toronto.ca","fullname": "Steve lee3300","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","LINEARNAME_MAINT","STEWARD_MAINT"],"user_id": 100011,"username": "slee330"
}');

select updateuserinfo('{"business_unit": "IT - SDS - GCC","email": "slee88@toronto.ca","fullname": "Steve lee88","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","LINEARNAME_MAINT","STEWARD_MAINT","SOURCE_MAINT","CENTRELINE_ADDRESS_MAINT"],"user_id": null,"username": "slee88"
}');
select updateuserinfo('{"business_unit": "IT - SDS - GCC","email": "slee880@toronto.ca","fullname": "Steve lee880","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","LINEARNAME_MAINT","STEWARD_MAINT"],"user_id": 100013,"username": "slee880"
}');
select * from ige_source;
select to_timestamp('2019-01-21', 'YYYY-MM-DD')
select '2019-01-21'::timestamp
select * from ige_user_steward where user_id > 10000;
select * from ige_user where user_id > 10000;
delete from ige_user where user_id = 100009;
delete from ige_user_steward where user_id = 100009;
 INSERT INTO imaint_oracle.ige_user_steward
    SELECT user_id,
	       steward_group
	FROM ige_user_steward   
    WHERE user_id =100009; 
select * from sde.sde_version;
select create_task('slee33', 'some comments', 'anchorTO');
select create_transaction(1,'slee33', 'some comments', 'anchorTO');
select network.close_task('slee333', '3', 'uapp1', 'COMPLETED') 
select create_source_task('slee5', 'comments32010');
select create_source_task('slee5', '');
select case when length('') = 0 THEN 'CREATE SOURCE' else 'a' end;
select delete_task(1000000036)
select * from ige_task order by task_id desc;
select * from imaint_oracle.ige_task order by task_id desc limit 10;
select * from ige_transaction order by trans_id desc;
select * from imaint_oracle.ige_transaction order by trans_id desc limit 10;
select * from sde.sde_versions;
--select get_sources();
--select get_source_classes();
select get_predefined_source_info();
select get_new_task_type('PARCEL');
select get_new_task_type('STREET/ADDRESS');
select get_predefined_task_info_details('REPORT')
select get_predefined_task_info_details('Plan')
select get_predefined_task_info_details('CADAST_DOCUMENt')


SELECT source_class, description AS desc, CONTROL_TASK_TYPE, sort_sequence
	  FROM dmn_source_class
	  WHERE trans_id_expire = -1
	   AND  source_class = 'REPORT'
	  ORDER BY sort_sequence
	  
SELECT (sde.sde_parse_version_name(
	'SDEDEFAULT1'))[0]
	
delete from ige_transaction;
select * from ige_user where username = 'rli4';
select * from ige_user_steward where user_id = 55;
select * from dmn_steward_group;
select  * from ige_user_steward where user_id = 55 order by 2;
select  * from ige_user_steward where user_id = 56 order by 2;

insert into ige_user (username, email, business_unit, status, status_date, full_name)
values ('rli4', 'rli4@toronto.ca','IT - SDS - GCC','ACTIVE',now(), 'Ruiyang Li')

insert into ige_user (username, email, business_unit, status, status_date, full_name)
values ('slee5', 'slee5@toronto.ca','IT - SDS - GCC','ACTIVE',now(), 'Kegang Li')

insert into ige_user_steward -- (userid, steward_group)
select 55, steward_group from dmn_steward_group;

insert into ige_user_steward -- (userid, steward_group)
select 56, steward_group from dmn_steward_group t where sort_sequence in (7,3,4, 10);

select  * from ige_user;
 SELECT * FROM network.dmn_steward_group order by 2;
 
 delete from ige_user_steward 
 where user_id = 55 and steward_group in (select steward_group from dmn_steward_group where lower(description) like 'cadast%' or lower(description) like '%parcel %')

select * from ige_user 
--where user_id = 81 
where username = 'slee3';

select * from ige_user_steward where user_id = 99

select getuserbyname('slee3')

delete from ige_user_steward where user_id = 98;
delete from ige_user where username = 'slee3';

SELECT 55, value#>>'{}' FROM json_array_elements('["SITE_AREA_MAINT", "ABC_BBB"]');

SELECT 55, value#>>'{}' FROM json_array_elements('["SITE_AREA_MAINT","AMA_MAINT"]'); --i_steward_group);

select * from ige_source_evw;
select * from sde.sde_table_registry;
select get_registration_id('network', 'ige_source')
SELECT current_schema();
select session_user;
select * from configuration;
select get_configuration('anchorTO', 'ANCHORTO', 'sync_with_oracle')
select get_configuration('anchorTO', 'ANCHORTO', 'sync_schema')
select get_configuration('anchorTO', 'ANCHORTO', 'sync_schema', '0')
select get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle')
select get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_schema')
select get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_schema', null)
select get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_schema', true)
select get_configuration_int('anchorTO', 'ANCHORTO', 'sync_with_oracle')
select get_configuration_int('anchorTO', 'ANCHORTO', 'sync_schema', 1)
select get_configuration_int('anchorTO', 'ANCHORTO', 'sync_schema')
----------------------------------------------------------------------------
IF get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') THEN
----------------------------------------------------------------------------
select sde.sde_set_current_version('SDE.DEFAULT');
select * from sde.sde_versions;
select * from ige_source where source_id = 435
select * from ige_source_evw where source_id = 424
select * from ige_control_task where source_id = 424
select sde.sde_set_current_version('SDE.DEFAULT');
SELECT to_json(row) 
	  FROM
		(
		  SELECT t.*,
			     ct.control_task_id,
			     ct.control_task_status,
			     ct.control_task_type,
			     ct.control_task_comments
			     
		  FROM ige_source_evw t
		  LEFT JOIN ige_control_task ct ON t.source_id = ct.source_id		  
		  WHERE t.source_id = 424
		) row;
select sde.sde_set_default();
select get_source_by_id(424, 'SDE.DEFAULT');
select get_source_by_id(1699, 'sde.DEFAULT');
select get_source_by_id(1699, 'network.TRANS81');
select get_source_by_id(16999, 'network.TRANS81');
select get_source_by_id_core(16999);
SELECT sde.sde_set_current_version('TRANS1234');


			  FROM ige_task ts			   
			  limit 1;
			  
SELECT to_json(row)  
	  FROM
		(
		  SELECT t.*,
			     ct.control_task_id,
			     ct.control_task_status,
			     ct.control_task_type,
			     ct.control_task_comments,
			    (
				  SELECT json_agg(row_to_json(c))
				  FROM (	
				  SELECT *
				  FROM ige_task ts
				  WHERE ts.control_task_id = ct.control_task_id 
				  ORDER BY task_id
				  ) c
				) AS tasks
		  FROM ige_source_evw t
		  JOIN ige_control_task ct ON t.source_id = ct.source_id 		  
		  WHERE t.source_id = 1699
		) row;
		
select * from ige_source_evw
SELECT sde.set_default;
SELECT sde.sde_set_current_version('TRANS78')
SELECT set_current_version('network.TRANS000')
select get_sources();
select get_user_by_task_type('AMA')
select * from dmn_steward_group;
select is_null_string(null)
select is_null_string('null')
select is_null_string('')
select is_null_string('a')
select is_blank_id(null)
select is_blank_id('')
select is_blank_id('a')
select is_blank_id('0')
select get_message(50667,'ERR','SURCTSK', '0', 'ext_id')
select format_message('Source Id <srcId>  new external_source_id <externalNo> is not unique','888') 
select * from ige_source;
select * from sde.sde_versions;
select delete_source_task(1000000059);
select * from ige_task where task_id = 1000000059;
select * from ige_transaction where task_id = 1000000059;
select * from imaint_oracle.ige_task where task_id = 1000000059;
select * from imaint_oracle.ige_transaction where task_id = 1000000059;

SELECT set_current_version('TRANS1234');
SELECT sde.sde_edit_version('TRANS000', 1);
select update_source('{"object_id": null,"source_id":null,"control_task_type": "STREET/ADDRESS","class":"PLAN","type":"BOUNDARIES ACT PLAN","status":"APPROVED","int_id":"test","int_date":"2019-07-08","ext_id":"test ext302","ext_date":"2019-07-26","plan_name":"ry-plan-no","source_status":null,"comment":"Source comments","task":[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD" }],"attachment":null,"user_id":"rli4"}'
					 , 10000
					 ,-1
					 ,'TRANS1234');
select update_source2('{"object_id": null,"source_id":null,"control_task_type": "STREET/ADDRESS","class":"PLAN","type":"BOUNDARIES ACT PLAN","status":"APPROVED","int_id":"test","int_date":"2019-07-08","ext_id":"test ext302","ext_date":"2019-07-26","plan_name":"ry-plan-no","source_status":null,"comment":"Source comments","task":[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD" }],"attachment":null,"user_id":"rli4"}'
					 , 10000
					 ,-1
					 ,'TRANS81');
select update_source('{"source_id":1000000120,"class":"REPORT","type":"MUNICIPAL NUMBERING LETTER","control_task_type":"STREET/ADDRESS","status":"PREAPPROVAL","int_id":"Test Internal","int_date":"2019-07-17","ext_id":"Test External10","ext_date":"2019-07-24","plan_name":null,"maint_status":"READY","comment":null,"closed":false,"task":[{"task_id":1000000444,"task_type":"SITEAREA","source_id":1000000120,"assigned_to":"SITE_AREA_MAINT","taken_by":null,"task_sequence":10,"task_status":"READY","task_comments":"Create/adjust Site Area","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000445,"task_type":"LINEARNAME","source_id":1000000120,"assigned_to":"LINEARNAME_MAINT","taken_by":null,"task_sequence":20,"task_status":"READY","task_comments":"Add/adjust/delete Linear Name","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000446,"task_type":"AMA","source_id":1000000120,"assigned_to":"AMA_MAINT","taken_by":null,"task_sequence":30,"task_status":"READY","task_comments":"Add/adjust/delete AMA","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":true},{"task_id":1000000447,"task_type":"INTERSECTION","source_id":1000000120,"assigned_to":"INTERSECTION_MAINT","taken_by":null,"task_sequence":40,"task_status":"READY","task_comments":"Add/edit/delete Intersections","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000448,"task_type":"CENTRELINE","source_id":1000000120,"assigned_to":"SEGMENT_MAINT","taken_by":null,"task_sequence":50,"task_status":"READY","task_comments":"Add/edit/delete Segments","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000449,"task_type":"ADDRESSPOINT","source_id":1000000120,"assigned_to":"ADDRESS_MAINT","taken_by":null,"task_sequence":60,"task_status":"READY","task_comments":"Add/edit/delete Reserved Address Points","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000450,"task_type":"SITEAREA","source_id":1000000120,"assigned_to":"SITE_AREA_MAINT","taken_by":null,"task_sequence":70,"task_status":"READY","task_comments":"Close Site Area","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false}],"attachment":null,"user_id":"rli4"}'
					 , 1000000252
					 ,-1
					 );
select update_source2('{"source_id":1000000120,"class":"REPORT","type":"MUNICIPAL NUMBERING LETTER","control_task_type":"STREET/ADDRESS","status":"PREAPPROVAL","int_id":"Test Internal","int_date":"2019-07-17","ext_id":"Test External10","ext_date":"2019-07-24","plan_name":null,"maint_status":"READY","comment":null,"closed":false,"task":[{"task_id":1000000444,"task_type":"SITEAREA","source_id":1000000120,"assigned_to":"SITE_AREA_MAINT","taken_by":null,"task_sequence":10,"task_status":"READY","task_comments":"Create/adjust Site Area","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000445,"task_type":"LINEARNAME","source_id":1000000120,"assigned_to":"LINEARNAME_MAINT","taken_by":null,"task_sequence":20,"task_status":"READY","task_comments":"Add/adjust/delete Linear Name","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000446,"task_type":"AMA","source_id":1000000120,"assigned_to":"AMA_MAINT","taken_by":null,"task_sequence":30,"task_status":"READY","task_comments":"Add/adjust/delete AMA","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":true},{"task_id":1000000447,"task_type":"INTERSECTION","source_id":1000000120,"assigned_to":"INTERSECTION_MAINT","taken_by":null,"task_sequence":40,"task_status":"READY","task_comments":"Add/edit/delete Intersections","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000448,"task_type":"CENTRELINE","source_id":1000000120,"assigned_to":"SEGMENT_MAINT","taken_by":null,"task_sequence":50,"task_status":"READY","task_comments":"Add/edit/delete Segments","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000449,"task_type":"ADDRESSPOINT","source_id":1000000120,"assigned_to":"ADDRESS_MAINT","taken_by":null,"task_sequence":60,"task_status":"READY","task_comments":"Add/edit/delete Reserved Address Points","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000450,"task_type":"SITEAREA","source_id":1000000120,"assigned_to":"SITE_AREA_MAINT","taken_by":null,"task_sequence":70,"task_status":"READY","task_comments":"Close Site Area","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000436,"trans_id_expire":-1,"disabled":false,"deleted":false}],"attachment":null,"user_id":"rli4"}'
					 , 1000000252
					 ,-1
					 );					 
select * from ige_source_evw order by 1 desc limit 10 where 					 
select get_source_by_id(1000000113, 'network.TRANS1234');
select get_source_by_id(1000000113, 'network.TRANS81');
select get_source_by_id(1000000114, 'network.TRANS1234');
select get_source_by_id(1000000114, 'network.TRANS81');
select get_source_by_id(1000000114, 'sde.DEFAULT');

select get_source_by_id(1000000121, 'network.TRANS1234');
select get_source_by_id(1000000121, 'network.TRANS81');
select get_source_by_id(1000000121, 'sde.DEFAULT');

select get_source_by_id_core(1000000114);

SELECT sde.sde_edit_version('network.TRANS1234', 2);
SELECT set_edit_version('TRANS1234', 1);
SELECT set_edit_version('TRANS1234', 2);
SELECT set_edit_version('TRANS81', 2);
SELECT set_current_version('network.TRANS1234');
SELECT set_current_version('network.TRANS81');
SELECT sde.sde_set_default();
select * from ige_source_evw order by 1 desc limit 10;


SELECT update_control_task(0,10001,null,'some comments','STREET/ADDRESS',20000,-1);
select * from ige_control_task order by 1 desc limit 2;
select * from imaint_oracle.ige_control_task order by 1 desc ;
select json_agg(row_to_json(c)) from (select * from ige_task limit 2) c;
select * from ige_task_default
select * from ige_source_evw order by 1 desc limit 6;
select * from ige_task limit 10;
SELECT '{"object_id": null,"source_id":null,"control_task_type": "STREET/ADDRESS","class":"PLAN","type":"BOUNDARIES ACT PLAN","status":"APPROVED","int_id":"test","int_date":"2019-07-08","ext_id":"test ext2","ext_date":"2019-07-26","plan_name":"ry-plan-no","maint_status":null,"comment":"Source comments","task":[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD" }],"attachment":null,"user_id":"rli4"}'::json->'task'->2->>'task_sequence'
SELECT json_array_length('{"object_id": null,"control_task_type": "STREET/ADDRESS","source_id":null,"class":"PLAN","type":"BOUNDARIES ACT PLAN","status":"APPROVED","int_id":"test","int_date":"2019-07-08","ext_id":"test ext2","ext_date":"2019-07-26","plan_name":"ry-plan-no","maint_status":null,"comment":"Source comments","task":[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD" }],"attachment":null,"user_id":"rli4"}'::json->'task')
SELECT json_array_elements('[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD" }]'::json);

CREATE Temp table tmp_task AS
SELECT * from json_populate_recordset(null::ige_task,replace(replace(replace('[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD","deleted":false }]','"task_assigned_to"','"assigned_to"'),'"control_task_comments"','"task_comments"'),'"deleted"','"taken_by"')::json);
SELECT * from tmp_task;

SELECT '[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD" }]'::json#>;

SELECT update_tasks('[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD","deleted":false }]'::json,
						     10005,
						     20005,
						    'SUPERVISOR DEFINED',
						    10006,
						    -1);
SELECT update_tasks('[{"task_id":1000000444,"task_type":"SITEAREA","source_id":1000000120,"assigned_to":"SITE_AREA_MAINT","taken_by":null,"task_sequence":10,"task_status":"READY","task_comments":"Create/adjust Site Area","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000464,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000445,"task_type":"LINEARNAME","source_id":1000000120,"assigned_to":"LINEARNAME_MAINT","taken_by":null,"task_sequence":20,"task_status":"READY","task_comments":"Add/adjust/delete Linear Name","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000464,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000446,"task_type":"AMA","source_id":1000000120,"assigned_to":"AMA_MAINT","taken_by":null,"task_sequence":30,"task_status":"READY","task_comments":"Add/adjust/delete AMA","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000464,"trans_id_expire":-1,"disabled":false,"deleted":true},{"task_id":1000000447,"task_type":"INTERSECTION","source_id":1000000120,"assigned_to":"INTERSECTION_MAINT","taken_by":null,"task_sequence":40,"task_status":"READY","task_comments":"Add/edit/delete Intersections","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000464,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000448,"task_type":"CENTRELINE","source_id":1000000120,"assigned_to":"SEGMENT_MAINT","taken_by":null,"task_sequence":50,"task_status":"READY","task_comments":"Add/edit/delete Segments","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000464,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000449,"task_type":"ADDRESSPOINT","source_id":1000000120,"assigned_to":"ADDRESS_MAINT","taken_by":null,"task_sequence":60,"task_status":"READY","task_comments":"Add/edit/delete Reserved Address Points","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000464,"trans_id_expire":-1,"disabled":false,"deleted":false},{"task_id":1000000450,"task_type":"SITEAREA","source_id":1000000120,"assigned_to":"SITE_AREA_MAINT","taken_by":null,"task_sequence":70,"task_status":"READY","task_comments":"Close Site Area","control_task_id":1000000063,"task_category":"SUPERVISOR DEFINED","trans_id_create":1000000464,"trans_id_expire":-1,"disabled":false,"deleted":false}]'::json,
						     1000000120,
						     1000000063,
						    'SUPERVISOR DEFINED',
						    1000000464,
						    -1);
							
SELECT update_tasks('[{"task_id":1000000495,"task_type":"SITEAREA","task_sequence":10,"task_status":"READY","deleted":false,"disabled":false},{"task_id":1000000496,"task_type":"LINEARNAME","task_sequence":20,"task_status":"READY","deleted":true,"disabled":false},{"task_id":1000000497,"task_type":"SITEAREA","task_sequence":70,"task_status":"READY","deleted":false,"disabled":true}]'::json,
						     1000000126,
						     1000000068,
						    'SUPERVISOR DEFINED',
						    1000000494,
						    -1);
SELECT update_source_task_info('[{"task_id":1000000495,"task_type":"SITEAREA","task_sequence":10,"task_status":"READY","deleted":false,"disabled":false},{"task_id":1000000496,"task_type":"LINEARNAME","task_sequence":20,"task_status":"READY","deleted":true,"disabled":false},{"task_id":1000000497,"task_type":"SITEAREA","task_sequence":70,"task_status":"READY","deleted":false,"disabled":true}]',
							   1000000126,						     
						    1000000494,
						    -1);

SELECT * from ige_control_task where source_id = 1000000126  limit 10;

select * from ige_task where control_task_id = 20005 order by 1;

SELECT update_source_task_info
('{"object_id": null,"source_id":null,"control_task_type": "STREET/ADDRESS","class":"PLAN","type":"BOUNDARIES ACT PLAN","status":"APPROVED","int_id":"test","int_date":"2019-07-08","ext_id":"test ext2","ext_date":"2019-07-26","plan_name":"ry-plan-no","maint_status":null,"comment":"Source comments","task":[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD" }],"attachment":null,"user_id":"rli4"}',
 1000000062, --10006,
 1000000137, --20008,
 -1
);

SELECT update_source_task_info
('{"source_id":null,"control_task_type": "STREET/ADDRESS","class":"PLAN","type":"INHOUSE MAINTENANCE","status":"APPROVED","int_id":"Test Internal","int_date":"2019-07-16","ext_id":"Test External","ext_date":"2019-07-23","plan_name":"Test plan name","maint_status":null,"comment":"source comments - testing post","closed":null,"task":[{"task_id":null,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"emachyni","task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"slee5","task_comments":"Add/adjust/delete Linear Name","task_status":"READY","deleted":false,"disabled":false}],"attachment":null,"user_id":"rli4"}',
 1000000062, --10006,
 1000000137, --20008,
 -1
);


	  SELECT t.*,
			 ct.control_task_id,
			 ct.control_task_status,
			 ct.control_task_type,
			 ct.control_task_comments,
			(
			  SELECT json_agg(row_to_json(c))
			  FROM (	
			  SELECT *
			  FROM ige_task ts
			  WHERE ts.control_task_id = ct.control_task_id 
			  ORDER BY task_id
			  ) c
			) AS tasks
	  FROM ige_source_evw t
	  JOIN ige_control_task ct ON t.source_id = ct.source_id 		  
	  WHERE t.source_id = 1966
	  
select * from ige_control_task where source_id = 10006;
select * from ige_task where source_id = 10006 order by 1;

INSERT INTO ige_source_evw
		          (
					  objectid,
					  globalid,
					  source_id, 
					  source_class, 
					  source_type, 
					  internal_source_no, 
					  internal_source_date, 
					  external_source_no, 
					  external_source_date, 
					  plan_name, 
					  source_comments, 
					  source_status, 
					  parent_source_id, 
					  trans_id_create, 
					  trans_id_expire					  
				  )
		      VALUES 
			      (
					  sde.next_rowid(current_schema()::text, 'IGE_SOURCE'),
					  sde.next_globalid(),
					  nextval('ige_source_id_seq')::numeric(12,0),
					  'PLAN',
					  'BOUNDARIES ACT PLAN',
					  'test',
					  now(),
				      'test_ext',
					  now(),
					  'test_plan',
					  'comments',
					  'APPROVED',
					  0,
					  1000000059,
					  -1
				  );
SELECT sde.sde_edit_version('TRANS000', 2);

select * from ige_source_evw order by 1 desc;
select sde.SDE_get_edit_session_info()
select sde.next_rowid('NETWORK', 'IGE_SOURCE')
select next_rowid(current_schema()::text, 'IGE_SOURCE')
select 
select * from ige_source_evw;
select * from (
select t.*, row_number() over (partition by t.source_id order by t.source_id) idx from ige_source t
	) t 
	where idx > 1;

select version()
SELECT PostGIS_Version();
