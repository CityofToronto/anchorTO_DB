-- FUNCTION: network.update_source(text, numeric, numeric, text)

-- DROP FUNCTION network.update_source(text, numeric, numeric, text);

CREATE OR REPLACE FUNCTION network.update_source(
	v_info text,
	v_trans_id_create numeric,
	v_trans_id_expire numeric DEFAULT '-1'::integer,
	v_version_name text DEFAULT 'SDE.DEFAULT'::text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
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
    o_status = 'OK';
    o_message = '';
    sourceid = -1;
	isnew = false;	
	
    --SELECT sde.sde_set_current_version(v_version_name) INTO retval;
	--SELECT sde.sde_set_default() INTO retval;
	--raise notice 'set to default: %', retval;
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
	    IF cnt_int_id + cnt_ext_id + cnt_plan_name > 0 THEN		 
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
			SELECT objectid INTO v_object_id FROM ige_source_evw WHERE source_id = sourceid;	
		  END IF;
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
	SELECT sde.sde_edit_version(v_version_name, 2);
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION network.update_source(text, numeric, numeric, text)
    OWNER TO network;
