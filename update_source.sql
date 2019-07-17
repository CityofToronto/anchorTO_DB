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
  retval1 integer;
  isnew boolean;
  v_user_id text;
  v_maint_status text;
  the_inter_id text;
  the_exter_id text;
  dt_inter timestamp;
  dt_exter timestamp;
BEGIN
    o_status = 'OK';
    o_message = '';
    sourceid = -1;
	isnew = false;	
	retval = 0;
	retval1 = 0;
    SELECT sde.sde_set_current_version(v_version_name) INTO retval;
	--SELECT sde.sde_set_default() INTO retval;
	--raise notice 'set to default: %', retval;
	--SELECT set_current_version(v_version_name) INTO retval;
	SELECT sde.sde_edit_version(v_version_name, 1) INTO retval1;
	raise notice 'set version:%', retval;
	IF retval = 0 and retval1 = 0 THEN 	 
	  SELECT update_source_core(v_info, v_trans_id_create, v_trans_id_expire) INTO o_json;
	  RETURN o_json;
	ELSE
	  o_status = 'Failed';
      o_message = 'Failed to set the version to ' || v_version_name;
	END IF;
    SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   sourceid 
	) c;
	--raise notice 'Output json: %', o_json;
	SELECT sde.sde_edit_version(v_version_name, 2) INTO retval;
	SELECT sde.sde_set_default() INTO retval;
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
		   sourceid 
	) c;	
	SELECT sde.sde_edit_version(v_version_name, 2);
	SELECT sde.sde_set_default() INTO retval;
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION network.update_source(text, numeric, numeric, text)
    OWNER TO network;
