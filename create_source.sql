-- FUNCTION: network.update_source(text, numeric, text)

-- DROP FUNCTION network.update_source(text, numeric, text);

CREATE OR REPLACE FUNCTION network.update_source(
	                                             v_info text,	                                            
	                                             v_trans_id_create numeric,	                                             
	                                             v_version text default 'SDE.DEFAULT'
	                                            )
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  sourceid numeric(12,0);
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
  retval integer;
  isnew boolean;
  v_user_id text;
  v_maint_status text;
BEGIN
    o_status = 'OK';
    o_message = '';
    sourceid = -1;
	isnew = false;
    SELECT sde.sde_set_current_version(v_version_name) INTO retval;
	  raise notice 'set version:%', retval;
	IF retval = 0 THEN 
	  SELECT $1::json->>'source_id',
             $1::json->>'class',
		     $1::json->>'type',
		     $1::json->>'status',
		     $1::json->>'int_id',
		     $1::json->'int_date',
		     $1::json->>'ext_id',
			 $1::json->>'ext_date',
			 $1::json->>'plan_name',
			 $1::json->>'source_status',
			 $1::json->>'comment',
			 $1::json->>'user_id'
    INTO sourceid,
	     v_source_class,
		 v_comment,
		 v_source_type,
		 v_source_status,
		 v_inter_id,
		 v_inter_date,
		 v_exter_id,
		 v_exter_date,
		 v_plan_name,
		 v_maint_status,
		 v_comment,
		 v_user_id;
	  isnew = is_blank_id(sourceid);
	  IF NOT is_blank_string(v_exter_id) THEN
	    SELECT count(*) INTO retval FROM ige_source_evw WHERE external_source_no = v_exter_id;
		IF retval > 0 THEN
		  o_status = 'Failed';
		  o_message = get_message(50667,'ERR','SURCTSK', 0, v_exter_id);
		ELSE
		  o_json = '';
		END IF;
	  END IF;
	ELSE
	  o_status = 'Failed';
      o_message = 'Failed to set the version to ' || v_version;
	END IF;
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   sourceid 
	) c;	
	RETURN o_json;
WHEN OTHERS THEN 
    o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   sourceid 
	) c;	
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION network.update_source(text, numeric, text)
    OWNER TO network;
