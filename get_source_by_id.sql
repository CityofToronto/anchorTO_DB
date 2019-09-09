-- FUNCTION: network.get_source_by_id(integer, text)

-- DROP FUNCTION network.get_source_by_id(integer, text);

CREATE OR REPLACE FUNCTION network.get_source_by_id(
	v_source_id integer,
	v_version_name text DEFAULT 'SDE.DEFAULT'::text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE   
  transname text;
  o_status text;
  o_message text;  
  o_json text;  
  retval integer;
  
BEGIN
  /*
    Summary:
	  Get source information by source id
    Testing:
	  select get_source_by_id(1699, 'sde.DEFAULT');
  */
    o_status = 'OK';
    o_message = '';
	o_json = '';	
	retval = 0;
	--select sde.sde_set_default();
	SELECT sde.sde_set_current_version(v_version_name) INTO retval;	
	raise notice 'set version #1:%', retval;
	--SELECT set_edit_version(v_version_name, 1) INTO retval;
	--raise notice 'set_edit_version:%', retval;
	
	--SELECT set_edit_version(v_version_name, 2);
	--raise notice 'set_edit_version:%', retval;
	IF retval = 0 THEN 
	  SELECT get_source_by_id_core(v_source_id) INTO o_json;		
	ELSE 
	  SELECT row_to_json(c) INTO o_json
	  FROM
	  (
	    SELECT 'Version not found' return_status, 
	           'Version not fould' return_message		   
	  ) c;
	END IF;	
	raise notice 'json:%', o_json;	
	SELECT sde.sde_set_default() INTO retval;
	raise notice 'set_default #1:%',retval;
	--SELECT set_edit_version(v_version_name, 2) INTO retval;
	--raise notice 'set_edit_version:%', retval;
	RETURN o_json;
EXCEPTION 
  WHEN OTHERS THEN
    SELECT sde.sde_set_default() INTO retval;
	raise notice 'set_default #2:%',retval;
    o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status return_status, 
	       o_message return_message		   
	) c;
	
    RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION network.get_source_by_id(integer, text)
    OWNER TO network;
