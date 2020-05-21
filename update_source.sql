-- FUNCTION: code_src.update_source(text, numeric, numeric, text)

-- DROP FUNCTION code_src.update_source(text, numeric, numeric, text);

CREATE OR REPLACE FUNCTION code_src.update_source(
	v_info text,
	v_trans_id_create numeric,
	v_trans_id_expire numeric DEFAULT '-1'::integer,
	v_version_name text DEFAULT 'SDE.DEFAULT'::text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
/*
    Summary:
	  Update source information
    Testing:
	  SELECT update_source('{"source_id":null,"class":"REPORT","type":"INHOUSE MAINTENANCE","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"Test Internal6","int_date":"2019-07-18","ext_id":"","ext_date":null,"plan_name":null,"maint_status":null,"comment":null,"closed":null,"task":[{"task_id":null,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"emachyni","task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"rli4","task_comments":"Add/adjust/delete Linear Name","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"AMA","task_sequence":30,"assigned_to":"rli4","task_comments":"Add/adjust/delete AMA","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"INTERSECTION","task_sequence":40,"assigned_to":"INTERSECTION_MAINT","task_comments":"Add/edit/delete Intersections","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"CENTRELINE","task_sequence":50,"assigned_to":"SEGMENT_MAINT","task_comments":"Add/edit/delete Segments","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_comments":"Add/edit/delete Reserved Address Points","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"slee6111","task_comments":"Close Site Area - hold for now","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":null,"user_id":"rli4"}'
					 , 10000
					 ,-1
					 ,'sde.DEFAULT');
      SELECT code_src.update_source(
                '{"objectid":133059,"source_id":11969,"class":"REPORT","type":"MUNICIPAL NUMBERING LETTER","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"em-13-19 Winchester","int_date":"2019-05-13","ext_id":"18164283STE28SA","ext_date":"2019-05-13","plan_name":null,"maint_status":"HOLD","comment":"amalg, Margaret''s House -test","closed":false,"task":[{"task_id":156824,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"EMACHYNI","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","status":"ACTIVE","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"EMACHYNI","status":"ACTIVE","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"JFLIGG","status":"ACTIVE","user_id":14,"full_name":"John Fligg"},{"username":"KPORTER","status":"LOCKED","user_id":30,"full_name":"Kevin Porter"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"}],"task_comments":"<13-May-2019 11:05 EMACHYNI: Complete Task: Submit job successfully, job request id 157971>rn<13-May-2019 11:03 EMACHYNI: Post Work: Submit job successfully, job request id 157968>rn<13-May-2019 11:02 EMACHYNI: Stop Work>rn<13-May-2019 11:01 EMACHYNI: Start Work>rn<13-May-2019 11:01 EMACHYNI: Taken>rn<13-May-2019 10:09 EMACHYNI: Updated>rnCreate/adjust Site Area","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":156829,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_assigned_to_user_list":[{"username":"ADDRESS_MAINT","status":"ACTIVE","user_id":0,"full_name":"ADDRESS_MAINT"},{"username":"CWDOWCZ","status":"ACTIVE","user_id":57,"full_name":"Carol Wdowczyk"},{"username":"HMARROW","status":"ACTIVE","user_id":49,"full_name":"Hisham Marrow"},{"username":"JELLIOTT","status":"ACTIVE","user_id":60,"full_name":"James Elliott"},{"username":"JCHONG","status":"ACTIVE","user_id":55,"full_name":"Joyce Chong"},{"username":"KMERREM","status":"ACTIVE","user_id":28,"full_name":"Karl Merrem"},{"username":"BURTON","status":"ACTIVE","user_id":61,"full_name":"Michael Burton"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"RLI4","status":"ACTIVE","user_id":67,"full_name":"Rui Yang Li"},{"username":"SSellia","status":"ACTIVE","user_id":56,"full_name":"Seeva Selliah"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"SHODGINS","status":"ACTIVE","user_id":51,"full_name":"Steve Hodgins"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"},{"username":"DJOKIC","status":"ACTIVE","user_id":54,"full_name":"Zivorad Djokic"}],"task_comments":"<24-May-2019 12:17 HMARROW: Complete Task: Submit job successfully, job request id 158301>rn<24-May-2019 12:16 HMARROW: Post Work: Submit job successfully, job request id 158300>rn<24-May-2019 12:16 HMARROW: Stop Work>rn<24-May-2019 12:15 HMARROW: Start Work>rn<13-May-2019 11:06 HMARROW: Taken>rnAdd/edit/delete Reserved Address Points","task_status":"COMPLETED","deleted":false,"disabled":true},{"task_id":156830,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"EMACHYNI","task_assigned_to_user_list":[{"username":"SITE_AREA_MAINT","status":"ACTIVE","user_id":0,"full_name":"SITE_AREA_MAINT"},{"username":"EMACHYNI","status":"ACTIVE","user_id":22,"full_name":"Elizabeth Machynia"},{"username":"JFLIGG","status":"ACTIVE","user_id":14,"full_name":"John Fligg"},{"username":"KPORTER","status":"LOCKED","user_id":30,"full_name":"Kevin Porter"},{"username":"PSINGH5","status":"ACTIVE","user_id":66,"full_name":"Pradeep Singh"},{"username":"SARZAND","status":"ACTIVE","user_id":7,"full_name":"Sepideh Arzandeh"},{"username":"SDALE","status":"ACTIVE","user_id":27,"full_name":"Steve Dale"},{"username":"TBURRIDG","status":"ACTIVE","user_id":26,"full_name":"Travis Burridge"}],"task_comments":"<28-May-2019 11:55 EMACHYNI: Hold>rn<13-May-2019 10:09 EMACHYNI: Updated>rnClose Site Area","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":[],"user_id":"rli4"}', 
                1000000619, 
                -1, 
                'TRANS1000000619'
  */
  sourceid numeric(12,0);
  v_object_id numeric(12,0) = -1;
  o_status text;  
  o_message text;
  o_json text; 
  v_source_class text;
  v_source_type text;
  v_source_status text;
  v_inter_id text;
  v_inter_date text; --'YYYY-MM-DD' format
  v_exter_id text;
  v_exter_date text; --'YYYY-MM-DD' format
  v_plan_name text;
  v_comment text;
  v_parent_source_id numeric;
  retval integer = 0;
  retval1 integer = 0;
  isnew boolean;
  v_user_id text;
  v_maint_status text;
  the_inter_id text;
  the_exter_id text;
  dt_inter timestamp;
  dt_exter timestamp;
  cnt_ext_id integer = 0;
  cnt_int_id integer = 0;
  cnt_plan_name integer = 0;
BEGIN
/*
  Create source
  Sample testing case:
    1. Create: 
	        SELECT update_source('{"source_id":null,"class":"REPORT","type":"INHOUSE MAINTENANCE","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"Test Internal6","int_date":"2019-07-18","ext_id":"","ext_date":null,"plan_name":null,"maint_status":null,"comment":null,"closed":null,"task":[{"task_id":null,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"emachyni","task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"rli4","task_comments":"Add/adjust/delete Linear Name","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"AMA","task_sequence":30,"assigned_to":"rli4","task_comments":"Add/adjust/delete AMA","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"INTERSECTION","task_sequence":40,"assigned_to":"INTERSECTION_MAINT","task_comments":"Add/edit/delete Intersections","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"CENTRELINE","task_sequence":50,"assigned_to":"SEGMENT_MAINT","task_comments":"Add/edit/delete Segments","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_comments":"Add/edit/delete Reserved Address Points","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"slee6111","task_comments":"Close Site Area - hold for now","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":null,"user_id":"rli4"}'
					 , 10000
					 ,-1
					 ,'sde.DEFAULT');
    --Create source with id 2000003	
	SELECT * FROM ige_source_evw WHERE source_id = 2000003;
	SELECT * FROM ige_source_h order by objectid DESC
    SELECT * FROM ige_source_dm order by 1 DESC, 2 DESC
	2. Update: 
	    SELECT update_source('{"source_id":2000003,"class":"REPORT","type":"INHOUSE MAINTENANCE","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"Test Internal7","int_date":"2019-07-18","ext_id":"","ext_date":null,"plan_name":null,"maint_status":null,"comment":null,"closed":null,"task":[{"task_id":null,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"emachyni","task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"rli4","task_comments":"Add/adjust/delete Linear Name","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"AMA","task_sequence":30,"assigned_to":"rli4","task_comments":"Add/adjust/delete AMA","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"INTERSECTION","task_sequence":40,"assigned_to":"INTERSECTION_MAINT","task_comments":"Add/edit/delete Intersections","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"CENTRELINE","task_sequence":50,"assigned_to":"SEGMENT_MAINT","task_comments":"Add/edit/delete Segments","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_comments":"Add/edit/delete Reserved Address Points","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"slee6111","task_comments":"Close Site Area - hold for now","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":null,"user_id":"rli4"}'
					 , 10001
					 ,-1
					 ,'sde.DEFAULT');
*/
    o_status = 'OK';
    o_message = '';
    sourceid = -1;
	isnew = false;	
	
    --SELECT sde.sde_set_current_version(v_version_name) INTO retval;
	--SELECT sde.sde_set_default() INTO retval;
	--raise notice 'set to default: %', retval;
	--SELECT sde.sde_set_current_version(v_version_name) INTO retval;
	--SELECT set_current_version(v_version_name) INTO retval;
	--SELECT sde.sde_edit_version(v_version_name, 1) INTO retval1;
	raise notice 'set version:%', retval;
	IF retval = 0 AND retval1 = 0 THEN 
	  SELECT $1::json->>'source_id',
             $1::json->>'class',
		     $1::json->>'type',
		     $1::json->>'status',
		     $1::json->>'int_id',
		     $1::json->>'int_date',
		     $1::json->>'ext_id',
			 $1::json->>'ext_date',
			 $1::json->>'plan_name',
			 $1::json->>'parent_source_id',
			 $1::json->>'maint_status',
			 $1::json->>'comment',
			 $1::json->>'user_id'
		INTO sourceid,
			 v_source_class,			
			 v_source_type,
			 v_source_status,
			 v_inter_id,
			 v_inter_date,
			 v_exter_id,
			 v_exter_date,
			 v_plan_name,
			 v_parent_source_id,
			 v_maint_status,
			 v_comment,
			 v_user_id;
	  SELECT is_blank_id(sourceid::text) INTO isnew; 
	  raise notice 'Is New? %', isnew;
	  raise notice 'source id: %', sourceid;
	  raise notice 'Source Class: %', v_source_class;
	  raise notice 'Comment: %', v_comment;
	  raise notice 'Source Type: %', v_source_type;
	  raise notice 'Source Status: %', v_source_status;
	  raise notice 'Inter ID: %', v_inter_id;
	  raise notice 'Inter Date: %', v_inter_date;
	  raise notice 'Exter ID: %', v_exter_id;
	  raise notice 'Exter Date: %', v_exter_date;
	  raise notice 'Plan Name: %', v_plan_name;
	  raise notice 'Parent ID: %', v_parent_source_id;
	  raise notice 'Maint Status: %', v_maint_status;
	  raise notice 'User ID: %', v_user_id;
	    the_inter_id = format_string(replace(v_inter_id, '`',''''));
		the_exter_id = format_string(replace(v_exter_id, '`',''''));
	    -- Check unique external id
	    IF NOT is_blank_string(the_exter_id) THEN
		  IF isnew THEN 
		    SELECT count(*) INTO cnt_ext_id FROM ige_source_evw WHERE external_source_no = the_exter_id;		
		  ELSE 
		    SELECT count(*) INTO cnt_ext_id FROM ige_source_evw WHERE external_source_no = the_exter_id and source_id <> sourceid;
		  END IF;
	    END IF;
		-- Check unique internal id
		IF NOT is_blank_string(the_inter_id) THEN
		  IF isnew THEN 
		    SELECT count(*) INTO cnt_int_id FROM ige_source_evw WHERE internal_source_no = the_inter_id;		
		  ELSE 
		    SELECT count(*) INTO cnt_int_id FROM ige_source_evw WHERE internal_source_no = the_inter_id and source_id <> sourceid;
		  END IF;
	    END IF;
		-- Check unique plan name
		IF NOT is_blank_string(v_plan_name) THEN
		  IF isnew THEN 
		    SELECT count(*) INTO cnt_plan_name FROM ige_source_evw WHERE plan_name = v_plan_name;		
		  ELSE 
		    SELECT count(*) INTO cnt_plan_name FROM ige_source_evw WHERE plan_name = v_plan_name and source_id <> sourceid;
		  END IF;
	    END IF;
	    IF cnt_plan_name > 0 THEN		
		--IF cnt_int_id + cnt_ext_id + cnt_plan_name > 0 THEN		 
		  o_status = 'Failed';
		  IF cnt_int_id > 0 THEN 
		    o_message = get_message(50680,'ERR','SURCTSK', '0', v_inter_id);
		  END IF;
		  IF cnt_plan_name > 0 THEN 
		    IF length(o_message) > 0 THEN 
			  o_message = o_message || '; ';
			END IF;
		    o_message = o_message || get_message(50681,'ERR','SURCTSK', '0', v_plan_name);
		  END IF;
		  IF cnt_ext_id > 0 THEN 
		    IF length(o_message) > 0 THEN 
			  o_message = o_message || '; ';
			END IF;
		    o_message = o_message || get_message(50667,'ERR','SURCTSK', '0', v_exter_id);
		  END IF;		  	  
		ELSE		  
		  IF is_blank_id(v_parent_source_id::text) THEN
		    v_parent_source_id = 0;
		  END IF;
		  IF is_blank_string(v_inter_date) THEN
		    dt_inter = NULL;
		  ELSE 
		    SELECT to_timestamp(v_inter_date, 'YYYY-MM-DD') INTO dt_inter; 
			--SELECT v_inter_date::timestamp INTO dt_inter;
		  END IF;
		  raise notice 'InterDate: %', dt_inter;
		  IF is_blank_string(v_exter_date) THEN
		    dt_exter = NULL;
		  ELSE 
		    SELECT to_timestamp(v_exter_date, 'YYYY-MM-DD') INTO dt_exter; 
			--SELECT v_exter_date::timestamp INTO dt_exter;
		  END IF;
		  
		  raise notice 'ExterDate: %', dt_exter;
		  raise notice 'New?: %', isnew;
		  IF (isnew) THEN
		    SELECT nextval('ige_source_id_seq')::numeric(12,0) INTO sourceid; 
			raise notice 'source_id: %', sourceid;
			SELECT sde.next_rowid(current_schema()::text, 'IGE_SOURCE') INTO v_object_id;
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
					  v_object_id, --sde.next_rowid(current_schema()::text, 'IGE_SOURCE'),
					  sde.next_globalid(),
					  sourceid,
					  v_source_class,
					  v_source_type,
					  the_inter_id,
					  dt_inter,
				      the_exter_id,
					  dt_exter,
					  format_string(v_plan_name),
					  format_string(v_comment),
					  v_source_status,
					  v_parent_source_id,
					  v_trans_id_create,
					  v_trans_id_expire
				  );
			  --RETURNING source_id INTO sourceid;
			  raise notice 'source_id #2: %', sourceid;
		  ELSE -- Update source info 		    
			RAISE NOTICE 'Updating ...';  
		    UPDATE ige_source_evw 
			    SET  source_class = v_source_class, 
					 source_type = v_source_type, 
					 internal_source_no = the_inter_id, 
					 internal_source_date = dt_inter, 
					 external_source_no = the_exter_id, 
					 external_source_date = dt_exter, 
					 plan_name = format_string(v_plan_name), 
					 source_comments = format_string(v_comment), 
					 source_status = v_source_status, 
					 parent_source_id = v_parent_source_id, 
					 trans_id_create = v_trans_id_create, 
					 trans_id_expire = v_trans_id_expire 
				WHERE source_id = sourceid;
			raise notice 'Updated...1';
			SELECT objectid INTO v_object_id FROM ige_source_evw WHERE source_id = sourceid;	
			raise notice 'Updating...2';	
		  END IF; -- End of update source		  
		END IF;	 		
	ELSE
	  o_status = 'Failed';
      o_message = 'Failed to set the version to ' || v_version_name;
	END IF;
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   sourceid,
		   v_object_id objectid
	) c;
	--raise notice 'Output json: %', o_json;
	--SELECT sde.sde_edit_version(v_version_name, 2) INTO retval;
	RETURN o_json;
EXCEPTION
  WHEN OTHERS THEN 
    o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   sourceid,
		   v_object_id objectid
	) c;	
	--SELECT sde.sde_edit_version(v_version_name, 2);
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.update_source(text, numeric, numeric, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.update_source(text, numeric, numeric, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.update_source(text, numeric, numeric, text) TO network;

REVOKE ALL ON FUNCTION code_src.update_source(text, numeric, numeric, text) FROM PUBLIC;
