select * from configuration;
UPDATE configuration
  SET value = 0 --1
  WHERE id = 1
  
select * from ige_user;
select get_user_by_id(55);
select get_users();
select get_user_by_name('sarzand');
select get_user_by_name('rli4');
select get_predefined_user_info();
select update_user_info('{"business_unit": "IT - SDS - GCC","email": "slee3300@toronto.ca","fullname": "Steve lee3300","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","CENTRELINE_ADDRESS_MAINT"],"user_id": null,"username": "Slee33000"
}');
select * from ige_user order by 1 desc;
select * from imaint_oracle.ige_user order by 1 desc;
select update_user_info('{"business_unit": "IT - SDS - GCC","email": "slee33@toronto.ca", "fullemail":"slee2300@toronto.ca", "fullname": "Steve lee230","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","LINEARNAME_MAINT","STEWARD_MAINT","SOURCE_MAINT","CENTRELINE_ADDRESS_MAINT"],"user_id": 100033,"username": "Slee3300"
}');
select * from ige_user where user_id = 100033
  
select get_configuration_bool('anchorTO', 'ANCHORTO', 'sync_with_oracle') 
select updateuserinfo('{"business_unit": "IT - SDS - GCC","email": "slee88@toronto.ca","fullname": "Steve lee88","status": "ACTIVE","steward_group": ["SITE_AREA_MAINT","AMA_MAINT","LINEARNAME_MAINT","STEWARD_MAINT","SOURCE_MAINT","CENTRELINE_ADDRESS_MAINT"],"user_id": null,"username": "slee88"
}');
select updateuserinfo('{"username":"Test","status":"ACTIVE","user_id":160,"steward_group":["LINEARNAME_MAINT","AMA_MAINT","SITE_AREA_MAINT"],"status_date":"2019-06-28T09:12:05.504665","business_unit":"IT - SDS - GCC","fullname":"Test","email":"test.test@toronto.ca","user_privilege":"LINEARNAME_MAINT, AMA_MAINT","last_updated":"2019-06-28 09:12:05.504665"}');
select * from ige_user;
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
select create_task('slee330', 'some comments', 'anchorTO', 'SOURCE');
select * from ige_task where task_id = 2000002
select * from ige_transaction where trans_id = 2000002
select create_transaction(1,'slee33', 'some comments', 'anchorTO');
select network.close_task('slee333', '3', 'uapp1', 'COMPLETED') 
select create_source_task('slee5', 'comments32010');
select * from ige_task where task_id = 2000003
select * from ige_transaction where trans_id = 2000003
select create_source_task('slee5', '');

select * from ige_task order by 1 desc
select * from imaint_oracle.ige_task order by 1 desc limit 1000;
select case when length('') = 0 THEN 'CREATE SOURCE' else 'a' end;
select delete_task(1000000036)
select * from ige_task order by task_id desc;
select * from imaint_oracle.ige_task order by task_id desc limit 10;
select * from ige_transaction order by trans_id desc;
select * from imaint_oracle.ige_transaction order by trans_id desc limit 10;
select * from sde.sde_versions;
select get_sources();
select * from ige_source_evw order by 1 limit 10;
select get_predefined_source_info();
select get_new_task_type('PARCEL');
select get_new_task_type('STREET/ADDRESS');
select get_predefined_task_info('REPORT')
select get_predefined_task_info_details('REPORT')
select get_predefined_task_info_details('Plan')
select get_predefined_task_info_details('CADAST_DOCUMENt')

select format_string('Look at "new story and ""me."')
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

select * from ige_source_evw where source_id > 1000000; 
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
select get_source_by_id(10737, 'sde.DEFAULT');
select get_source_by_id(10754, 'sde.DEFAULT');
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
select get_user_by_task_type('PLANPARCEL')
select get_user_by_task_type('MUNICIPALPARCEL')
select get_user_by_task_type('EASEMENT')
select get_user_by_task_type('PRIVATEROAD')
select get_user_by_task_type('ADJUSTMENT')
select get_user_by_task_type('SITEAREA')
select get_user_by_task_type('LINEARNAME')
select get_user_by_task_type('AMA')
select get_user_by_task_type('CENTRELINE')
select get_user_by_task_type('INTERSECTION')
select get_user_by_task_type('ADDRESSPOINT')
select * from ige_task_default
SELECT * FROM ige_task_default t
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
select * from ige_messages where message_number between 50650 and 50700
SELECT set_current_version('TRANS1234');
SELECT sde.sde_edit_version('TRANS000', 1);
select * from ige_task where source_id = 1000000136
select count(*) from ige_source_evw where source_id <> 1000000138 and internal_source_no = 'test101'
select update_source('{"object_id": null,"source_id":1000000137,"control_task_type": "STREET/ADDRESS","class":"PLAN","type":"BOUNDARIES ACT PLAN","status":"APPROVED","int_id":"test102","int_date":"2019-07-08","ext_id":"test ext102","ext_date":"2019-07-26","plan_name":"ry-plan-no102","source_status":null,"comment":"Source comments","task":[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD" }],"attachment":null,"user_id":"rli4"}'
					 , 10000
					 ,-1
					 ,'TRANS81');
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
select update_source('{"source_id":null,"class":"REPORT","type":"INHOUSE MAINTENANCE","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"Test Internal6","int_date":"2019-07-18","ext_id":"","ext_date":null,"plan_name":null,"maint_status":null,"comment":null,"closed":null,"task":[{"task_id":null,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"emachyni","task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"rli4","task_comments":"Add/adjust/delete Linear Name","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"AMA","task_sequence":30,"assigned_to":"rli4","task_comments":"Add/adjust/delete AMA","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"INTERSECTION","task_sequence":40,"assigned_to":"INTERSECTION_MAINT","task_comments":"Add/edit/delete Intersections","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"CENTRELINE","task_sequence":50,"assigned_to":"SEGMENT_MAINT","task_comments":"Add/edit/delete Segments","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_comments":"Add/edit/delete Reserved Address Points","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"slee6111","task_comments":"Close Site Area - hold for now","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":null,"user_id":"rli4"}'
					 , 10000
					 ,-1
					 ,'sde.DEFAULT');
SELECT network.update_source(
                '{"objectid":133059,"source_id":11969,"class":"REPORT","type":"MUNICIPAL NUMBERING LETTER","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"em-13-19 Winchester","int_date":"2019-05-13","ext_id":"18164283STE28SA","ext_date":"2019-05-13","plan_name":null,"maint_status":"HOLD","comment":"amalg, Margaret''s House -test","closed":false,"task":[{"task_id":156824,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"EMACHYNI","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","status":"ACTIVE","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"EMACHYNI","status":"ACTIVE","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"JFLIGG","status":"ACTIVE","user_id":14,"full_name":"John Fligg"},{"username":"KPORTER","status":"LOCKED","user_id":30,"full_name":"Kevin Porter"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"}],"task_comments":"<13-May-2019 11:05 EMACHYNI: Complete Task: Submit job successfully, job request id 157971>rn<13-May-2019 11:03 EMACHYNI: Post Work: Submit job successfully, job request id 157968>rn<13-May-2019 11:02 EMACHYNI: Stop Work>rn<13-May-2019 11:01 EMACHYNI: Start Work>rn<13-May-2019 11:01 EMACHYNI: Taken>rn<13-May-2019 10:09 EMACHYNI: Updated>rnCreate/adjust Site Area","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":156829,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_assigned_to_user_list":[{"username":"ADDRESS_MAINT","status":"ACTIVE","user_id":0,"full_name":"ADDRESS_MAINT"},{"username":"CWDOWCZ","status":"ACTIVE","user_id":57,"full_name":"Carol Wdowczyk"},{"username":"HMARROW","status":"ACTIVE","user_id":49,"full_name":"Hisham Marrow"},{"username":"JELLIOTT","status":"ACTIVE","user_id":60,"full_name":"James Elliott"},{"username":"JCHONG","status":"ACTIVE","user_id":55,"full_name":"Joyce Chong"},{"username":"KMERREM","status":"ACTIVE","user_id":28,"full_name":"Karl Merrem"},{"username":"BURTON","status":"ACTIVE","user_id":61,"full_name":"Michael Burton"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"RLI4","status":"ACTIVE","user_id":67,"full_name":"Rui Yang Li"},{"username":"SSellia","status":"ACTIVE","user_id":56,"full_name":"Seeva Selliah"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"SHODGINS","status":"ACTIVE","user_id":51,"full_name":"Steve Hodgins"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"},{"username":"DJOKIC","status":"ACTIVE","user_id":54,"full_name":"Zivorad Djokic"}],"task_comments":"<24-May-2019 12:17 HMARROW: Complete Task: Submit job successfully, job request id 158301>rn<24-May-2019 12:16 HMARROW: Post Work: Submit job successfully, job request id 158300>rn<24-May-2019 12:16 HMARROW: Stop Work>rn<24-May-2019 12:15 HMARROW: Start Work>rn<13-May-2019 11:06 HMARROW: Taken>rnAdd/edit/delete Reserved Address Points","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":156830,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"EMACHYNI","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","status":"ACTIVE","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"EMACHYNI","status":"ACTIVE","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"JFLIGG","status":"ACTIVE","user_id":14,"full_name":"John Fligg"},{"username":"KPORTER","status":"LOCKED","user_id":30,"full_name":"Kevin Porter"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"}],"task_comments":"<28-May-2019 11:55 EMACHYNI: Hold>rn<13-May-2019 10:09 EMACHYNI: Updated>rnClose Site Area","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":[],"user_id":"rli4"}', 
                1000000619, 
                -1, 
                'TRANS1000000619'
);
					 
select is_blank_string('');					 
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


SELECT update_control_task(0,10001,null,'some "comments','STREET/ADDRESS',20000,-1);
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
('{"source_id":1000000128,"class":"PLAN","type":"BYLAW","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"Test Internal10","int_date":"2019-07-17","ext_id":"Test External12","ext_date":"2019-07-17","plan_name":"Test plan name1","maint_status":"READY","comment":"add source comments","closed":false,"task":[{"task_id":1000000507,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"jfligg","task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":1000000508,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"slee5","task_comments":"Add/adjust/delete Linear Name","task_status":"READY","deleted":false,"disabled":false},{"task_id":1000000513,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"rli4","task_comments":"Close Site Area","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":null,"user_id":"rli4"}',
 1000000128, 
 1000000526, 
 -1
);


select * from ige_task where source_id = 1000000128 
select * from ige_control_task where source_id = 1000000128
order by 1;
and trans_id_expire = -1; 

SELECT update_tasks('[{"task_id":1000000507,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"jfligg","task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":1000000508,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"slee5","task_comments":"Add/adjust/delete Linear Name","task_status":"READY","deleted":false,"disabled":false},{"task_id":1000000513,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"rli4","task_comments":"Close Site Area","task_status":"HOLD","deleted":false,"disabled":false}]'::json, 
					1000000128, 1000000070, 'SUPERVISOR DEFINED', 1000000526, -1) 


SELECT update_source_task_info
('{"object_id": null,"source_id":null,"control_task_type": "STREET/ADDRESS","class":"PLAN","type":"BOUNDARIES ACT PLAN","status":"APPROVED","int_id":"test","int_date":"2019-07-08","ext_id":"test ext2","ext_date":"2019-07-26","plan_name":"ry-plan-no","maint_status":null,"comment":"Source comments","task":[{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Create/adjust Site Area","task_sequence":10,"assign_to":"rli4","task_status":null },{"task_assigned_to":"LINEARNAME_MAINT","task_type":"LINEARNAME","task_type_desc":"Linear Name","control_task_type":"STREET/ADDRESS","control_task_comments":"Add/adjust/delete Linear Name","task_sequence":20,"assign_to":"slee5","task_status":null },{"task_assigned_to":"SITE_AREA_MAINT","task_type":"SITEAREA","task_type_desc":"Site Area","control_task_type":"STREET/ADDRESS","control_task_comments":"Close Site Area","task_sequence":70,"assign_to":"rli4","task_status":"HOLD" }],"attachment":null,"user_id":"rli4"}',
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
SELECT PostGIs_version();

select * from ige_source_evw order by 1 desc limit 10;
select  * from ige_messages where message like '%complete%';

SELECT min(task_sequence)  
			FROM ige_task 
	        WHERE control_task_id = 1000000059
	          AND trans_id_expire = -1
			  AND task_status <> 'COMPLETED';
select * from ige_control_task where control_task_id = 1000000016;
select * from ige_task where control_task_id = 1000000016;
select * from ige_task where task_status <> 'READY' AND control_task_id > 1000000000
SELECT update_control_task_status_by_tasks(1000000016);
select * from ige_task where task_id > 10000000 and source_id > 0;

select validate_task_status('COMPLETED')
select * from ige_task where task_id = 1; 
select * from imaint_oracle.ige_task where task_id = 1;
SELECT update_task_status(1,'work started')
SELECT update_task_status(1,'completed')
select * from dmn_task_status
select distinct task_status from ige_task;
select * from ige_user_steward;

SELECT tt.control_task_id, min(tt.task_sequence) min_seq
			 FROM ige_task tt
			 WHERE tt.task_status <> 'COMPLETED' 
			   AND tt.taken_by is null
		       AND tt.trans_id_expire = -1
			 GROUP BY tt.control_task_id
			 order by control_task_id
select get_next_task_by_user_name('sarzand');
select get_next_task_by_user_name('slee5');
select * from ige_source_evw
select * from dmn_task_status
select * from ige_task where task_id = 1000001331 limit 10
select * from ige_source_evw where source_id = 1000000253
select * from ige_control_task where source_id = 1000000253
select * from ige_transaction where task_id = 1000001331; -- source_id = 1000000253 ;
select * from dmn_control_task_status
select * from ige_task where source_id = 1000000228 order by task_sequence;
--select * from ige_control_task where source_id = 1000000227
select * from ige_control_task WHERE control_task_id = 1000000161
select * from ige_source_evw where source_id = 1000000228
select update_control_task_status_by_tasks(1000000161)

select update_source_task_info('{"objectid":122138,"source_id":1000000228,"class":"PLAN","type":"SKETCH","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"RY-TEST-0730-1","int_date":"2019-07-30","ext_id":null,"ext_date":null,"plan_name":"RY-TEST-0730-1","maint_status":"HOLD","comment":"Delete default tasks when creating sourcen; more comment added on July 30, 2019","closed":false,"task":[{"task_id":1000001051,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"SARZAND","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"anchorto","user_id":100014,"full_name":"anchorTO Test"},{"username":"emachyni","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"jfligg","user_id":14,"full_name":"John Fligg"},{"username":"slee5","user_id":56,"full_name":"Kegang Li"},{"username":"NEWTEST","user_id":100034,"full_name":"new test"},{"username":"SARZAND","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"slee33","user_id":161,"full_name":"Steve lee"},{"username":"SLEE3300","user_id":100033,"full_name":"Steve lee230"},{"username":"slee330","user_id":100011,"full_name":"Steve lee330"},{"username":"SLEE33000","user_id":100046,"full_name":"Steve lee3300"},{"username":"slee6","user_id":99,"full_name":"Steve lee6"},{"username":"slee68","user_id":139,"full_name":"Steve lee6"},{"username":"slee880","user_id":100013,"full_name":"Steve lee880"},{"username":"slee6111","user_id":157,"full_name":"Test"},{"username":"TEST","user_id":160,"full_name":"Test"}],"task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":1000001099,"task_type":"AMA","task_sequence":50,"assigned_to":"AMA_MAINT","task_assigned_to_user_list":[{"username":"AMA_MAINT","user_id":0,"full_name":"AMA_MAINT"},{"username":"anchorto","user_id":100014,"full_name":"anchorTO Test"},{"username":"emachyni","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"jfligg","user_id":14,"full_name":"John Fligg"},{"username":"slee5","user_id":56,"full_name":"Kegang Li"},{"username":"RLI4","user_id":55,"full_name":"Ruiyang Li111"},{"username":"SARZAND","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"slee33","user_id":161,"full_name":"Steve lee"},{"username":"SLEE3300","user_id":100033,"full_name":"Steve lee230"},{"username":"slee330","user_id":100011,"full_name":"Steve lee330"},{"username":"SLEE33000","user_id":100046,"full_name":"Steve lee3300"},{"username":"slee880","user_id":100013,"full_name":"Steve lee880"},{"username":"TEST","user_id":160,"full_name":"Test"},{"username":"slee6111","user_id":157,"full_name":"Test"},{"username":"TestJuly2","user_id":100026,"full_name":"Test July2"}],"task_comments":null,"task_status":"READY","deleted":false,"disabled":false},{"task_id":1000001052,"task_type":"CENTRELINE","task_sequence":50,"assigned_to":"SEGMENT_MAINT","task_assigned_to_user_list":[{"username":"SEGMENT_MAINT","user_id":0,"full_name":"SEGMENT_MAINT"}],"task_comments":"Add/edit/delete Segments","task_status":"READY","deleted":false,"disabled":false},{"task_id":1000001053,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"SARZAND","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"anchorto","user_id":100014,"full_name":"anchorTO Test"},{"username":"emachyni","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"jfligg","user_id":14,"full_name":"John Fligg"},{"username":"slee5","user_id":56,"full_name":"Kegang Li"},{"username":"NEWTEST","user_id":100034,"full_name":"new test"},{"username":"SARZAND","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"slee33","user_id":161,"full_name":"Steve lee"},{"username":"SLEE3300","user_id":100033,"full_name":"Steve lee230"},{"username":"slee330","user_id":100011,"full_name":"Steve lee330"},{"username":"SLEE33000","user_id":100046,"full_name":"Steve lee3300"},{"username":"slee6","user_id":99,"full_name":"Steve lee6"},{"username":"slee68","user_id":139,"full_name":"Steve lee6"},{"username":"slee880","user_id":100013,"full_name":"Steve lee880"},{"username":"slee6111","user_id":157,"full_name":"Test"},{"username":"TEST","user_id":160,"full_name":"Test"}],"task_comments":"Close Site Area","task_status":"READY","deleted":false,"disabled":false}],"attachment":[],"user_id":"rli4"}',
							   1000000228, 1000001050, -1)
select * from ige_source_evw where source_id = 1671		
select * from ige_control_task where source_id = 1671
select * from ige_control_task where source_id = 1681

--select * from ige_control_task where source_id = 1000000227
select * from ige_control_task WHERE control_task_id = 1000000160
select * from ige_source_evw where source_id = 1000000228
select * from imaint_oracle.ige_task limit 10;
select update_source_task_info('{"objectid":122137,"source_id":1000000227,"class":"CADAST_DOCUMENT","type":"CANADA LAND PLAN","control_task_type":"PARCEL","status":"PREAPPROVAL","int_id":"RY-TEST-07291","int_date":"2019-07-29","ext_id":null,"ext_date":null,"plan_name":"RY-TEST-07291","maint_status":"HOLD","comment":"Deleted some tasks","closed":false,"task":[{"task_id":1000001041,"task_type":"PLANPARCEL","task_sequence":110,"assigned_to":"PLAN_PARCEL_MAINT","task_assigned_to_user_list":[{"username":"PLAN_PARCEL_MAINT","user_id":0,"full_name":"PLAN_PARCEL_MAINT"}],"task_comments":"Create Plan Parcel","task_status":"READY","deleted":false,"disabled":false},{"task_id":1000001042,"task_type":"MUNICIPALPARCEL","task_sequence":120,"assigned_to":"MUNICIPAL_PARCEL_MAINT","task_assigned_to_user_list":[{"username":"MUNICIPAL_PARCEL_MAINT","user_id":0,"full_name":"MUNICIPAL_PARCEL_MAINT"}],"task_comments":"Create Municipal Parcel","task_status":"READY","deleted":false,"disabled":false},{"task_id":1000001043,"task_type":"EASEMENT","task_sequence":130,"assigned_to":"EASEMENT_MAINT","task_assigned_to_user_list":[{"username":"EASEMENT_MAINT","user_id":0,"full_name":"EASEMENT_MAINT"},{"username":"SARZAND","user_id":7,"full_name":"Sepideh Arzandeh"}],"task_comments":"Create Easement","task_status":"READY","deleted":false,"disabled":false},{"task_id":1000001044,"task_type":"PRIVATEROAD","task_sequence":140,"assigned_to":"PRIVATE_ROAD_MAINT","task_assigned_to_user_list":[{"username":"PRIVATE_ROAD_MAINT","user_id":0,"full_name":"PRIVATE_ROAD_MAINT"}],"task_comments":"Create Private Road","task_status":"HOLD","deleted":false,"disabled":false},{"task_id":1000001045,"task_type":"ADJUSTMENT","task_sequence":150,"assigned_to":"ADJUSTMENT_MAINT","task_assigned_to_user_list":[{"username":"ADJUSTMENT_MAINT","user_id":0,"full_name":"ADJUSTMENT_MAINT"}],"task_comments":"Adjust Parcel","task_status":"READY","deleted":false,"disabled":false}],"attachment":[],"user_id":"rli4"}'
			                    ,1000000227
							    ,1000001040
							   ,-1
							  )
select * from ige_task where source_id = 1684 order by task_sequence; 
select * from ige_task where task_id IN (67088, 67091, 67092)
select update_source_task_info('{"objectid":121027,"source_id":1681,"class":"PLAN","type":"PLAN OF SUBDIVISION","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"Sep-test","int_date":"2011-07-12","ext_id":"6550Lawrence","ext_date":"2011-07-12","plan_name":null,"maint_status":"IN PROGRESS","comment":null,"closed":false,"task":[{"task_id":67086,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"SARZAND","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"anchorto","user_id":100014,"full_name":"anchorTO Test"},{"username":"EMACHYNI","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"jfligg","user_id":14,"full_name":"John Fligg"},{"username":"slee5","user_id":56,"full_name":"Kegang Li"},{"username":"NEWTEST","user_id":100034,"full_name":"new test"},{"username":"SARZAND","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"slee33","user_id":161,"full_name":"Steve lee"},{"username":"SLEE3300","user_id":100033,"full_name":"Steve lee230"},{"username":"slee330","user_id":100011,"full_name":"Steve lee330"},{"username":"SLEE33000","user_id":100046,"full_name":"Steve lee3300"},{"username":"slee6","user_id":99,"full_name":"Steve lee6"},{"username":"slee68","user_id":139,"full_name":"Steve lee6"},{"username":"slee880","user_id":100013,"full_name":"Steve lee880"},{"username":"TEST","user_id":160,"full_name":"Test"},{"username":"slee6111","user_id":157,"full_name":"Test"}],"task_comments":"<14-Jul-2011 13:56 SARZAND: Complete Task: Submit job successfully, job request id 16562>rn<12-Jul-2011 14:52 SARZAND: Post Work: Submit job successfully, job request id 16552>rn<12-Jul-2011 14:52 SARZAND: Stop Work>rn<12-Jul-2011 14:49 SARZAND: Start Work>rn<12-Jul-2011 14:49 SARZAND: Taken>rn<12-Jul-2011 14:48 SARZAND: Updated>rnCreate/adjust Site Area","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":67087,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"LINEARNAME_MAINT","task_assigned_to_user_list":[{"username":"LINEARNAME_MAINT","user_id":0,"full_name":"LINEARNAME_MAINT"},{"username":"anchorto","user_id":100014,"full_name":"anchorTO Test"},{"username":"hmarrow","user_id":52,"full_name":"Hisham Marrow"},{"username":"slee5","user_id":56,"full_name":"Kegang Li"},{"username":"RLI4","user_id":55,"full_name":"Ruiyang Li111"},{"username":"SARZAND","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"shodgins","user_id":51,"full_name":"Steve Hodgins"},{"username":"slee33","user_id":161,"full_name":"Steve lee"},{"username":"SLEE3300","user_id":100033,"full_name":"Steve lee230"},{"username":"slee6","user_id":99,"full_name":"Steve lee6"},{"username":"slee68","user_id":139,"full_name":"Steve lee6"},{"username":"slee880","user_id":100013,"full_name":"Steve lee880"},{"username":"TEST","user_id":160,"full_name":"Test"},{"username":"slee6111","user_id":157,"full_name":"Test"},{"username":"TestJuly2","user_id":100026,"full_name":"Test July2"}],"task_comments":"<02-Aug-2011 10:04 SARZAND: Complete Task: Submit job successfully, job request id 16598>rn<02-Aug-2011 09:58 SARZAND: Post Work: Submit job successfully, job request id 16596>rn<02-Aug-2011 09:57 SARZAND: Stop Work>rn<14-Jul-2011 15:23 SARZAND: Start Work>rn<14-Jul-2011 15:18 SARZAND: Stop Work>rn<14-Jul-2011 15:17 SARZAND: Start Work>rn<14-Jul-2011 15:17 SARZAND: Taken>rnAdd/adjust/delete Linear Name","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":67088,"task_type":"AMA","task_sequence":30,"assigned_to":"AMA_MAINT","task_assigned_to_user_list":[{"username":"AMA_MAINT","user_id":0,"full_name":"AMA_MAINT"},{"username":"anchorto","user_id":100014,"full_name":"anchorTO Test"},{"username":"EMACHYNI","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"jfligg","user_id":14,"full_name":"John Fligg"},{"username":"slee5","user_id":56,"full_name":"Kegang Li"},{"username":"RLI4","user_id":55,"full_name":"Ruiyang Li111"},{"username":"SARZAND","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"slee33","user_id":161,"full_name":"Steve lee"},{"username":"SLEE3300","user_id":100033,"full_name":"Steve lee230"},{"username":"slee330","user_id":100011,"full_name":"Steve lee330"},{"username":"SLEE33000","user_id":100046,"full_name":"Steve lee3300"},{"username":"slee880","user_id":100013,"full_name":"Steve lee880"},{"username":"slee6111","user_id":157,"full_name":"Test"},{"username":"TEST","user_id":160,"full_name":"Test"},{"username":"TestJuly2","user_id":100026,"full_name":"Test July2"}],"task_comments":"<30-Sep-2011 13:02 SARZAND: Hold>rnAdd/adjust/delete AMA","task_status":"HOLD","deleted":false,"disabled":false},{"task_id":67091,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_assigned_to_user_list":[{"username":"ADDRESS_MAINT","user_id":0,"full_name":"ADDRESS_MAINT"}],"task_comments":"Add/edit/delete Reserved Address Points","task_status":"READY","deleted":false,"disabled":false},{"task_id":67092,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"SITE_AREA_MAINT","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"anchorto","user_id":100014,"full_name":"anchorTO Test"},{"username":"EMACHYNI","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"jfligg","user_id":14,"full_name":"John Fligg"},{"username":"slee5","user_id":56,"full_name":"Kegang Li"},{"username":"NEWTEST","user_id":100034,"full_name":"new test"},{"username":"SARZAND","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"slee33","user_id":161,"full_name":"Steve lee"},{"username":"SLEE3300","user_id":100033,"full_name":"Steve lee230"},{"username":"slee330","user_id":100011,"full_name":"Steve lee330"},{"username":"SLEE33000","user_id":100046,"full_name":"Steve lee3300"},{"username":"slee6","user_id":99,"full_name":"Steve lee6"},{"username":"slee68","user_id":139,"full_name":"Steve lee6"},{"username":"slee880","user_id":100013,"full_name":"Steve lee880"},{"username":"TEST","user_id":160,"full_name":"Test"},{"username":"slee6111","user_id":157,"full_name":"Test"}],"task_comments":"Close Site Area","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":[],"user_id":"rli4"}'
                              , 1684 
							  ,213268
							  ,-1)
select * from ige_control_task where source_id = 1671
select * from ige_task where source_id = 1671 and trans_id_expire = -1 order by task_sequence;
select update_source_task_info('{"objectid":120067,"source_id":1671,"class":"REPORT","type":"MUNICIPAL NUMBERING LETTER","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"10 Harlandale Ave","int_date":"2011-03-25","ext_id":"10 Harlandale Ave","ext_date":"2011-03-25","plan_name":null,"maint_status":"CLOSED","comment":"mm-10 Harlandale Ave fix addr loc/NyLet-Mar01/1994","closed":true,"task":[{"task_id":66984,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_assigned_to_user_list":[{"username":"ADDRESS_MAINT","user_id":0,"full_name":"ADDRESS_MAINT"}],"task_comments":"<25-Mar-2011 14:35 MMINDA: Complete Task: Submit job successfully, job request id 16416>rn<25-Mar-2011 08:22 MMINDA: Post Work: Submit job successfully, job request id 16386>rn10 Harlandale Ave fix locrn<25-Mar-2011 08:17 MMINDA: Stop Work>rn<25-Mar-2011 08:12 MMINDA: Start Work>rn<25-Mar-2011 08:12 MMINDA: Taken>rnAdd/edit/delete Reserved Address Points","task_status":"COMPLETED","deleted":false,"disabled":true}],"attachment":[],"user_id":"rli4"}'
                              , 1671 
							  ,213149
							  ,-1)					 
select update_source_task_info('{"objectid":133059,"source_id":11969,"class":"REPORT","type":"MUNICIPAL NUMBERING LETTER","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"em-13-19 Winchester","int_date":"2019-05-13","ext_id":"18164283STE28SA","ext_date":"2019-05-13","plan_name":null,"maint_status":"HOLD","comment":"amalg, Margaret''s House -test","closed":false,"task":[{"task_id":156824,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"EMACHYNI","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","status":"ACTIVE","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"EMACHYNI","status":"ACTIVE","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"JFLIGG","status":"ACTIVE","user_id":14,"full_name":"John Fligg"},{"username":"KPORTER","status":"LOCKED","user_id":30,"full_name":"Kevin Porter"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"}],"task_comments":"<13-May-2019 11:05 EMACHYNI: Complete Task: Submit job successfully, job request id 157971>rn<13-May-2019 11:03 EMACHYNI: Post Work: Submit job successfully, job request id 157968>rn<13-May-2019 11:02 EMACHYNI: Stop Work>rn<13-May-2019 11:01 EMACHYNI: Start Work>rn<13-May-2019 11:01 EMACHYNI: Taken>rn<13-May-2019 10:09 EMACHYNI: Updated>rnCreate/adjust Site Area","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":156829,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_assigned_to_user_list":[{"username":"ADDRESS_MAINT","status":"ACTIVE","user_id":0,"full_name":"ADDRESS_MAINT"},{"username":"CWDOWCZ","status":"ACTIVE","user_id":57,"full_name":"Carol Wdowczyk"},{"username":"HMARROW","status":"ACTIVE","user_id":49,"full_name":"Hisham Marrow"},{"username":"JELLIOTT","status":"ACTIVE","user_id":60,"full_name":"James Elliott"},{"username":"JCHONG","status":"ACTIVE","user_id":55,"full_name":"Joyce Chong"},{"username":"KMERREM","status":"ACTIVE","user_id":28,"full_name":"Karl Merrem"},{"username":"BURTON","status":"ACTIVE","user_id":61,"full_name":"Michael Burton"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"RLI4","status":"ACTIVE","user_id":67,"full_name":"Rui Yang Li"},{"username":"SSellia","status":"ACTIVE","user_id":56,"full_name":"Seeva Selliah"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"SHODGINS","status":"ACTIVE","user_id":51,"full_name":"Steve Hodgins"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"},{"username":"DJOKIC","status":"ACTIVE","user_id":54,"full_name":"Zivorad Djokic"}],"task_comments":"<24-May-2019 12:17 HMARROW: Complete Task: Submit job successfully, job request id 158301>rn<24-May-2019 12:16 HMARROW: Post Work: Submit job successfully, job request id 158300>rn<24-May-2019 12:16 HMARROW: Stop Work>rn<24-May-2019 12:15 HMARROW: Start Work>rn<13-May-2019 11:06 HMARROW: Taken>rnAdd/edit/delete Reserved Address Points","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":156830,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"EMACHYNI","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","status":"ACTIVE","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"EMACHYNI","status":"ACTIVE","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"JFLIGG","status":"ACTIVE","user_id":14,"full_name":"John Fligg"},{"username":"KPORTER","status":"LOCKED","user_id":30,"full_name":"Kevin Porter"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"}],"task_comments":"<28-May-2019 11:55 EMACHYNI: Hold>rn<13-May-2019 10:09 EMACHYNI: Updated>rnClose Site Area","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":[],"user_id":"rli4"}'
                              , 11969 
							  ,294338
							  ,-1)
select * from ige_source where source_id = 11969;							  
SELECT update_task_status(67088,'completed')
SELECT update_task_status(67091,'completed')
SELECT update_task_status(67092,'completed')
---- Test attachment ------
select sde.next_rowid('network', 'ige_source__attach')

select  * from ige_source__attach_evw
select * from ige_source_evw where globalid = '{AAD9699F-7221-4A08-803E-CC8D5B34AADE}'
--select * from ige_source_presentation_evw

select presentation, source_pres_file_name
from ige_source_presentation_evw
where source_pres_id = 4 

select sde.sde_set_default();
INSERT INTO ige_source__attach_evw (attachmentid, rel_globalid, content_type, att_name, data_size, data, globalid, sde_state_id)
 values
 (
   sde.next_rowid('network', 'ige_source__attach'),
  '{AAD9699F-7221-4A08-803E-CC8D5B34AADE}',
  'application/pdf',
  (select source_pres_file_name from ige_source_presentation_evw where source_pres_id = 4),
  1000,
  (select presentation from ige_source_presentation_evw where source_pres_id = 4),	 
   sde.next_globalid(),
	sde.sde_get_current_state() 
 )
 
select * from ige_task k2 
where k2.task_id in
(
  select min(task_id) from ige_task k 
	where k.trans_id_expire = -1 and k.source_id in
      (select c.source_id from ige_control_task c where c.source_id > 99 and c.control_task_status = 'READY')
       group by k.source_id
)  
order by k2.task_status;

select * from ige_source_evw
select * from dmn_task_status
select * from dmn_task_type
select * from ige_task where task_id = 1000001331 limit 10
select * from ige_source_evw where source_id = 1000000253
select * from ige_control_task where source_id = 1000000253
select * from ige_transaction where task_id = 1000001331; -- source_id = 1000000253 ;
SELECT start_user_task(1000001331, 'sarzand')
SELECT start_user_task(1000001331, 'rli4')
select * from ige_task_active
delete from ige_task_active where task_id = 1000001331
select * from ige_task where task_id  = 1000001331
SELECT get_predefined_lfn();
SELECT * FROM network.base_centreline
select * from linear_name_evw where duplication_status is not null;
SELECT * FROM network.dmn_ln_usage_status
select * from authorized_municipal_address
--SELECT search_lfn('{"activation_status": "Active",  "duplication_status":"D",  "authorized": "Y",  "used_by": "Centreline Only",  "usage_status":"Current",  "logic": "and"}')
--SELECT search_lfn('{"activation_status": "Active",  "authorized": "",  "used_by": "Centreline Only",  "usage_status":"",  "logic": "and"}')
SELECT search_lfn('{"activation_status": "A",  "authorized": "",  "used_by": "L",  "usage_status":"",  "logic": "and"}')
SELECT search_lfn('{"activation_status": null,  "authorized": "",  "used_by": "",  "usage_status":"",  "logic": "and"}')
SELECT * FROM linear_name_evw
SELECT * FROM base_centreline_evw
select * from ige_task where task_status LIKE 'START%';
select * from DMN_CL_ONEWAY t
select * from dmn_ln_use_by
select * from dmn_ln_activation_status
select * from DMN_CL_ADDRESS_PARITY t
select * from DMN_LN_USAGE_STATUS
SELECT get_lfn_by_id(1570)
------------------------------

					 
					 
					 
					 