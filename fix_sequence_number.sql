-- FUNCTION: network.fix_sequence_number()

-- DROP FUNCTION network.fix_sequence_number();

CREATE OR REPLACE FUNCTION network.fix_sequence_number(
	)
    RETURNS void
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$	
DECLARE
  start_id integer = 50000000; --1,000,000,000; 2,000,000
  v_sql text;
BEGIN 
/*
Summary: 
  Issue: After importing data from other server, 
         the max. of the id in the table might be greater than the next sequence #, which would violate the unique id constraint for the future
  Solution: Increase the next sequence manually to a bigger number		
Testing:
  SELECT fix_sequence_number()
  
Get all sequences value:  
 -- Generate scripts:
select sequence_name, replace('SELECT ''[SEQ]'', last_value FROM ', '[SEQ]',sequence_name) || sequence_name || ' UNION ALL ' as scripts
from information_schema.sequences t
where sequence_schema = 'network'
order by 1;

SELECT 'address_class_id_seq', last_value FROM address_class_id_seq UNION ALL 
SELECT 'address_id_seq', last_value FROM address_id_seq UNION ALL 
SELECT 'address_name_id_seq', last_value FROM address_name_id_seq UNION ALL 
SELECT 'address_point_id_seq', last_value FROM address_point_id_seq UNION ALL 
SELECT 'address_string_id_seq', last_value FROM address_string_id_seq UNION ALL 
SELECT 'ama_id_seq', last_value FROM ama_id_seq UNION ALL 
SELECT 'base_centreline_id_seq', last_value FROM base_centreline_id_seq UNION ALL 
SELECT 'base_connectivity_id_seq', last_value FROM base_connectivity_id_seq UNION ALL 
SELECT 'base_intersection_elevation_id_seq', last_value FROM base_intersection_elevation_id_seq UNION ALL 
SELECT 'base_intersection_id_seq', last_value FROM base_intersection_id_seq UNION ALL 
SELECT 'base_turn_id_seq', last_value FROM base_turn_id_seq UNION ALL 
SELECT 'centreline_geometry_lineage_id_seq', last_value FROM centreline_geometry_lineage_id_seq UNION ALL 
SELECT 'centreline_lineage_id_seq', last_value FROM centreline_lineage_id_seq UNION ALL 
SELECT 'elevation_id_seq', last_value FROM elevation_id_seq UNION ALL 
SELECT 'ige_control_task_id_seq', last_value FROM ige_control_task_id_seq UNION ALL 
SELECT 'ige_source_id_seq', last_value FROM ige_source_id_seq UNION ALL 
SELECT 'ige_source_presentation_id_seq', last_value FROM ige_source_presentation_id_seq UNION ALL 
SELECT 'ige_task_id_seq', last_value FROM ige_task_id_seq UNION ALL 
SELECT 'ige_transaction_id_seq', last_value FROM ige_transaction_id_seq UNION ALL 
SELECT 'ige_user_id_seq', last_value FROM ige_user_id_seq UNION ALL 
SELECT 'linear_name_direction_id_seq', last_value FROM linear_name_direction_id_seq UNION ALL 
SELECT 'linear_name_group_id_seq', last_value FROM linear_name_group_id_seq UNION ALL 
SELECT 'linear_name_id_seq', last_value FROM linear_name_id_seq UNION ALL 
SELECT 'linear_name_type_id_seq', last_value FROM linear_name_type_id_seq UNION ALL 
SELECT 'linear_name_xref_id_seq', last_value FROM linear_name_xref_id_seq UNION ALL 
SELECT 'site_area_id_seq', last_value FROM site_area_id_seq UNION ALL 
SELECT 'task_status_flow_flow_id_seq', last_value FROM task_status_flow_flow_id_seq 
  
*/    
    v_sql =
	 'CREATE SEQUENCE IF NOT EXISTS network.address_class_id_seq;
	ALTER TABLE network.address_class      
	   ALTER COLUMN address_id SET DEFAULT nextval(''address_class_id_seq'')::numeric(12,0);  
	SELECT setval(''network.address_class_id_seq''::regclass, GREATEST(1000000000, max(address_id))::bigint + 1, true) FROM address_class_evw;
	ALTER SEQUENCE network.address_class_id_seq OWNED BY network.address_class.address_id;
	-- for table address_name
	CREATE SEQUENCE IF NOT EXISTS network.address_name_id_seq;
	ALTER TABLE network.address_name      
	  ALTER COLUMN address_name_id SET DEFAULT nextval(''address_name_id_seq'')::numeric(12,0);
	SELECT setval(''network.address_name_id_seq'', GREATEST(1000000000, max(address_name_id))::bigint +1, true) FROM address_name_evw;
	ALTER SEQUENCE network.address_name_id_seq OWNED BY network.address_name.address_name_id;

	-- for table address_point
	CREATE SEQUENCE IF NOT EXISTS network.address_point_id_seq;
	ALTER TABLE network.address_point      
	  ALTER COLUMN address_point_id SET DEFAULT nextval(''address_point_id_seq'')::numeric(12,0);
	SELECT setval(''network.address_point_id_seq'', GREATEST(1000000000, max(address_point_id))::bigint +1, true) FROM address_point_evw;
	ALTER SEQUENCE network.address_point_id_seq OWNED BY network.address_point.address_point_id;

	-- for table authorized_municipal_address
	CREATE SEQUENCE IF NOT EXISTS network.ama_id_seq;
	ALTER TABLE network.authorized_municipal_address      
	  ALTER COLUMN address_string_id SET DEFAULT nextval(''ama_id_seq'')::numeric(12,0);
	SELECT setval(''network.ama_id_seq'', GREATEST(1000000000, max(address_string_id))::bigint + 1, true) FROM authorized_municipal_address;
	ALTER SEQUENCE network.ama_id_seq OWNED BY network.authorized_municipal_address.address_string_id;

	-- for table base_centreline
	CREATE SEQUENCE IF NOT EXISTS network.base_centreline_id_seq;
	ALTER TABLE network.base_centreline      
	  ALTER COLUMN centreline_id SET DEFAULT nextval(''base_centreline_id_seq'')::numeric(12,0);
	SELECT setval(''network.base_centreline_id_seq'', GREATEST(1000000000, max(centreline_id))::bigint +1, true) FROM base_centreline_evw;
	ALTER SEQUENCE network.base_centreline_id_seq OWNED BY network.base_centreline.centreline_id;

	-- for table base_connectivity
	CREATE SEQUENCE IF NOT EXISTS network.base_connectivity_id_seq;
	ALTER TABLE network.base_connectivity      
	  ALTER COLUMN connectivity_id SET DEFAULT nextval(''base_connectivity_id_seq'')::numeric(12,0);
	SELECT setval(''network.base_connectivity_id_seq'', GREATEST(1000000000, max(connectivity_id))::bigint +1, true) FROM base_connectivity_evw;
	ALTER SEQUENCE network.base_connectivity_id_seq OWNED BY network.base_connectivity.connectivity_id;

	-- for table base_intersection
	CREATE SEQUENCE IF NOT EXISTS network.base_intersection_id_seq;
	ALTER TABLE network.base_intersection      
	  ALTER COLUMN intersection_id SET DEFAULT nextval(''base_intersection_id_seq'')::numeric(12,0);
	SELECT setval(''network.base_intersection_id_seq'', GREATEST(1000000000, max(intersection_id))::bigint+1, true) FROM base_intersection_evw;
	ALTER SEQUENCE network.base_intersection_id_seq OWNED BY network.base_intersection.intersection_id;

	-- for table base_intersection_elevation
	CREATE SEQUENCE IF NOT EXISTS network.base_intersection_elevation_id_seq;
	ALTER TABLE network.base_intersection_elevation      
	  ALTER COLUMN elevation_id SET DEFAULT nextval(''base_intersection_elevation_id_seq'')::numeric(12,0);
	SELECT setval(''network.base_intersection_elevation_id_seq'', GREATEST(1000000000, max(elevation_id))::bigint +1, true) FROM base_intersection_elevation_evw;
	ALTER SEQUENCE network.base_intersection_elevation_id_seq OWNED BY network.base_intersection_elevation.elevation_id;

	-- for table base_turn
	CREATE SEQUENCE IF NOT EXISTS network.base_turn_id_seq;
	ALTER TABLE network.base_turn      
	  ALTER COLUMN turn_id SET DEFAULT nextval(''base_turn_id_seq'')::numeric(12,0);
	SELECT setval(''network.base_turn_id_seq'', GREATEST(1000000000, max(turn_id))::bigint + 1, true) FROM base_turn_evw;
	ALTER SEQUENCE network.base_turn_id_seq OWNED BY network.base_turn.turn_id;

	-- for table centreline_geometry_lineage
	CREATE SEQUENCE IF NOT EXISTS network.centreline_geometry_lineage_id_seq;
	ALTER TABLE network.centreline_geometry_lineage      
	  ALTER COLUMN centreline_lineage_id SET DEFAULT nextval(''centreline_geometry_lineage_id_seq'')::numeric(12,0);
	SELECT setval(''network.centreline_geometry_lineage_id_seq'', GREATEST(1000000000, max(centreline_lineage_id))::bigint +1, true) FROM centreline_geometry_lineage_evw;
	ALTER SEQUENCE network.centreline_geometry_lineage_id_seq OWNED BY network.centreline_geometry_lineage.centreline_lineage_id;

	-- for table linear_name
	CREATE SEQUENCE IF NOT EXISTS network.linear_name_id_seq;
	ALTER TABLE network.linear_name      
	  ALTER COLUMN linear_name_id SET DEFAULT nextval(''linear_name_id_seq'')::numeric(12,0);
	SELECT setval(''network.linear_name_id_seq'', GREATEST(1000000000, max(linear_name_id))::bigint + 1, true) FROM linear_name_evw;
	ALTER SEQUENCE network.linear_name_id_seq OWNED BY network.linear_name.linear_name_id;

	-- for table ige_control_task
	CREATE SEQUENCE IF NOT EXISTS network.ige_control_task_id_seq;
	ALTER TABLE network.ige_control_task
	  ALTER COLUMN control_task_id SET DEFAULT nextval(''ige_control_task_id_seq'')::numeric(12,0);
	--SELECT setval(''network.ige_control_task_id_seq'', MAX(t.control_task_id)::bigint + 1, true) FROM network.ige_control_task t;
	SELECT setval(''network.ige_control_task_id_seq'', GREATEST(2000000, max(control_task_id))::bigint + 1, true) FROM ige_control_task;
	ALTER SEQUENCE network.ige_control_task_id_seq OWNED BY network.ige_control_task.control_task_id;

	-- for table ige_source
	CREATE SEQUENCE IF NOT EXISTS network.ige_source_id_seq;
	ALTER TABLE network.ige_source      
	  ALTER COLUMN source_id SET DEFAULT nextval(''ige_source_id_seq'')::numeric(12,0);
	--SELECT setval(''network.ige_source_id_seq'', MAX(t.source_id)::bigint + 1, true) FROM network.ige_source t;
	SELECT setval(''network.ige_source_id_seq'', GREATEST(2000000, max(source_id))::bigint + 1, true) FROM ige_source_evw;
	ALTER SEQUENCE network.ige_source_id_seq OWNED BY network.ige_source.source_id;

	-- for table ige_task
	CREATE SEQUENCE IF NOT EXISTS network.ige_task_id_seq;
	ALTER TABLE network.ige_task
	  ALTER COLUMN task_id SET DEFAULT nextval(''ige_task_id_seq'')::numeric(12,0);
	--SELECT setval(''network.ige_task_id_seq'', MAX(t.task_id) + 1, true) FROM network.ige_task t;
	SELECT setval(''network.ige_task_id_seq'', GREATEST(2000000, max(task_id))::bigint + 1, true) FROM ige_task;
	ALTER SEQUENCE network.ige_task_id_seq OWNED BY network.ige_task.task_id;

	-- for table ige_transaction
	CREATE SEQUENCE IF NOT EXISTS network.ige_transaction_id_seq;
	ALTER TABLE network.ige_transaction   
	  ALTER COLUMN trans_id SET DEFAULT nextval(''ige_transaction_id_seq'')::numeric(12,0);
	--SELECT setval(''network.ige_transaction_id_seq'', MAX(t.trans_id) + 1, true) FROM network.ige_transaction t;
	SELECT setval(''network.ige_transaction_id_seq'', GREATEST(2000000, max(trans_id))::bigint + 1, true) FROM ige_transaction;
	ALTER SEQUENCE network.ige_transaction_id_seq OWNED BY network.ige_transaction.trans_id;

	-- for table ige_source_presentation
	CREATE SEQUENCE IF NOT EXISTS network.ige_source_presentation_id_seq;
	ALTER TABLE network.ige_source_presentation  
	  ALTER COLUMN source_pres_id SET DEFAULT nextval(''ige_source_presentation_id_seq'')::numeric(12,0);
	SELECT setval(''network.ige_source_presentation_id_seq'', GREATEST(1000000000, max(source_pres_id))::bigint + 1, true) FROM ige_source_presentation_evw;
	ALTER SEQUENCE network.ige_source_presentation_id_seq OWNED BY network.ige_source_presentation.source_pres_id;
	-- for table ige_user 
	CREATE SEQUENCE IF NOT EXISTS network.ige_user_id_seq;
	ALTER TABLE network.ige_user  
	  ALTER COLUMN user_id SET DEFAULT nextval(''ige_user_id_seq'')::numeric(12,0);
	SELECT setval(''network.ige_user_id_seq'', GREATEST(2000000, max(user_id))::bigint + 1, true) FROM ige_user;
	ALTER SEQUENCE network.ige_user_id_seq OWNED BY network.ige_user.user_id;

	-- for table linear_name_direction
	CREATE SEQUENCE IF NOT EXISTS network.linear_name_direction_id_seq;
	ALTER TABLE network.linear_name_direction  
	  ALTER COLUMN linear_name_dir_id SET DEFAULT nextval(''linear_name_direction_id_seq'')::numeric(12,0);
	SELECT setval(''network.linear_name_direction_id_seq'', GREATEST(2000000, max(linear_name_dir_id))::bigint + 1, true) FROM linear_name_direction_evw;
	ALTER SEQUENCE network.linear_name_direction_id_seq OWNED BY network.linear_name_direction.linear_name_dir_id;
	-- for table linear_name_group
	CREATE SEQUENCE IF NOT EXISTS network.linear_name_group_id_seq;
	ALTER TABLE network.linear_name_group  
	  ALTER COLUMN group_id SET DEFAULT nextval(''linear_name_group_id_seq'')::numeric(12,0);
	SELECT setval(''network.linear_name_group_id_seq'', GREATEST(2000000, max(group_id))::bigint + 1, true) FROM linear_name_group_evw;
	ALTER SEQUENCE network.linear_name_group_id_seq OWNED BY network.linear_name_group.group_id;
	-- for table linear_name_type
	CREATE SEQUENCE IF NOT EXISTS network.linear_name_type_id_seq;
	ALTER TABLE network.linear_name_type  
	  ALTER COLUMN linear_name_type_id SET DEFAULT nextval(''linear_name_type_id_seq'')::numeric(12,0);
	SELECT setval(''network.linear_name_type_id_seq'', GREATEST(2000000, max(linear_name_type_id))::bigint + 1, true) FROM linear_name_type_evw;
	ALTER SEQUENCE network.linear_name_type_id_seq OWNED BY network.linear_name_type.linear_name_type_id;
	-- for table linear_name_xref
	CREATE SEQUENCE IF NOT EXISTS network.linear_name_xref_id_seq;
	ALTER TABLE network.linear_name_xref  
	  ALTER COLUMN linear_name_xref_id SET DEFAULT nextval(''linear_name_xref_id_seq'')::numeric(12,0);
	SELECT setval(''network.linear_name_xref_id_seq'', GREATEST(2000000, max(linear_name_xref_id))::bigint + 1, true) FROM linear_name_xref_evw;
	ALTER SEQUENCE network.linear_name_xref_id_seq OWNED BY network.linear_name_xref.linear_name_xref_id;
	-- for table site_area
	CREATE SEQUENCE IF NOT EXISTS network.site_area_id_seq;
	ALTER TABLE network.site_area  
	  ALTER COLUMN site_area_id SET DEFAULT nextval(''site_area_id_seq'')::numeric(12,0);
	SELECT setval(''network.site_area_id_seq'', GREATEST(2000000, max(site_area_id))::bigint + 1, true) FROM site_area_evw;
	ALTER SEQUENCE network.site_area_id_seq OWNED BY network.site_area.site_area_id';
  v_sql = replace(v_sql, '1000000000', start_id::text);
  v_sql = replace(v_sql, '2000000', start_id::text);
  EXECUTE v_sql;
END
$BODY$;

ALTER FUNCTION network.fix_sequence_number()
    OWNER TO network;
