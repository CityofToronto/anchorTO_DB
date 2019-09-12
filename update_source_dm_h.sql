-- FUNCTION: network.update_source_dm_h(numeric, numeric)

-- DROP FUNCTION network.update_source_dm_h(numeric, numeric);

CREATE OR REPLACE FUNCTION network.update_source_dm_h(
	v_id numeric,
	v_trans_id_create numeric)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  v_object_id numeric;  
  o_status text;  
  o_message text;
  o_json text;   
  retval integer;
  isnew boolean;  
  isexpired boolean;
BEGIN
/*
Summary: 
  Update ige_source_h (History) & ige_source_dm (Current & History) table after updating ige_source (versioned) table successfully
Testing:
  SELECT update_source('{"source_id":null,"class":"REPORT","type":"INHOUSE MAINTENANCE","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"Test Internal69","int_date":"2019-07-18","ext_id":"","ext_date":null,"plan_name":null,"maint_status":null,"comment":null,"closed":null,"task":[{"task_id":null,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"emachyni","task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"rli4","task_comments":"Add/adjust/delete Linear Name","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"AMA","task_sequence":30,"assigned_to":"rli4","task_comments":"Add/adjust/delete AMA","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"INTERSECTION","task_sequence":40,"assigned_to":"INTERSECTION_MAINT","task_comments":"Add/edit/delete Intersections","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"CENTRELINE","task_sequence":50,"assigned_to":"SEGMENT_MAINT","task_comments":"Add/edit/delete Segments","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_comments":"Add/edit/delete Reserved Address Points","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"slee6111","task_comments":"Close Site Area - hold for now","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":null,"user_id":"rli4"}'
					 , 258
					 ,-1
					 ,'sde.DEFAULT');
  SELECT update_source_dm_h(2000008, 259)					 
  select * from ige_source_evw where source_id =2000008 ;
  select * from ige_source_h order by objectid desc;
  select * from ige_source_dm order by objectid desc;
  SELECT update_source('{"source_id":2000008,"class":"REPORT","type":"INHOUSE MAINTENANCE","control_task_type":"STREET/ADDRESS","status":"APPROVED","int_id":"Test Internal69","int_date":"2019-07-20","ext_id":"","ext_date":null,"plan_name":null,"maint_status":null,"comment":null,"closed":null,"task":[{"task_id":null,"task_type":"SITEAREA","task_sequence":10,"assigned_to":"emachyni","task_comments":"Create/adjust Site Area","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"LINEARNAME","task_sequence":20,"assigned_to":"rli4","task_comments":"Add/adjust/delete Linear Name","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"AMA","task_sequence":30,"assigned_to":"rli4","task_comments":"Add/adjust/delete AMA","task_status":"READY","deleted":false,"disabled":false},{"task_id":null,"task_type":"INTERSECTION","task_sequence":40,"assigned_to":"INTERSECTION_MAINT","task_comments":"Add/edit/delete Intersections","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"CENTRELINE","task_sequence":50,"assigned_to":"SEGMENT_MAINT","task_comments":"Add/edit/delete Segments","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"ADDRESSPOINT","task_sequence":60,"assigned_to":"ADDRESS_MAINT","task_comments":"Add/edit/delete Reserved Address Points","task_status":"READY","deleted":true,"disabled":false},{"task_id":null,"task_type":"SITEAREA","task_sequence":70,"assigned_to":"slee6111","task_comments":"Close Site Area - hold for now","task_status":"HOLD","deleted":false,"disabled":false}],"attachment":null,"user_id":"rli4"}'
					 , 258
					 ,-1
					 ,'sde.DEFAULT');
    
*/
    o_status = 'OK';
    o_message = '';   
	isnew = false;	
	retval = 0;  
	
	  IF NOT EXISTS 
	    (
			SELECT * 
			FROM ige_source_dm  
			WHERE source_id = v_id 
			AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS')
		) THEN 
		  isnew = true;
	  END IF; 
	  -- Append to _h table
	  IF NOT isnew THEN  
	    RAISE NOTICE 'Recording _h ...';
		INSERT INTO ige_source_h
			  (
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
				  trans_id_expire, 
				  objectid)
		  SELECT  source_id, 
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
				  v_trans_id_create, -- make it expired		
				  sde.next_rowid(current_schema()::text, 'ige_source_h')
		  FROM ige_source_dm  
		  WHERE source_id = v_id
		    AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS');		
	  END IF; -- End of Append to _h table
	  -- Update _dm table
	  -- 1. Expire the old one
	  IF NOT isnew THEN		  
		RAISE NOTICE 'Expire old _dm record ...';
		UPDATE ige_source_dm
		      SET date_expiry = current_timestamp,
			      trans_id_expire = v_trans_id_create
		      WHERE source_id = v_id 
			    AND date_expiry = TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS');		
	  END IF;		  
	  -- 2. Add a new record from linear_name table	  
	  RAISE NOTICE 'Creating new _dm record ...';
	  INSERT INTO ige_source_dm
				   (
					   objectid, 					   
					   source_id,					   
					   date_effective,
					   date_expiry,
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
			   SELECT	
					sde.next_rowid(current_schema()::text, 'ige_source_dm'),
					source_id,
					current_timestamp,
					TO_TIMESTAMP('3000-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),
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
			    FROM ige_source_evw
				WHERE source_id = v_id
				LIMIT 1;
	-- End of Update _dm table			
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   v_id AS source_id  
	) c;
	
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
		   null AS source_id 
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION network.update_source_dm_h(numeric, numeric)
    OWNER TO network;
