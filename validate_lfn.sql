-- FUNCTION: code_src.validate_lfn(text)

-- DROP FUNCTION code_src.validate_lfn(text);

CREATE OR REPLACE FUNCTION code_src.validate_lfn(
	v_info text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  o_status text;
  o_json text;   
  o_message text; 
  v_duplicate_name boolean;
  v_duplicate_lfn boolean;
BEGIN 
/*
    Summary:
	  Validate the lfn, name + type + dir should be unique
    Testing:
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"abc","dir_part":"East","type_part":"Street"}')
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"dyas","dir_part":"","type_part":"Road"}')
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"dyas road","dir_part":"","type_part":""}')
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"dyas rd","dir_part":"","type_part":""}')
	  
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"finch","dir_part":"South","type_part":"avenue"}')
	  SELECT validate_lfn('{"linear_name_id":5589,"name_part":"finch","dir_part":"east","type_part":"avenue"}')	  
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"Ry%20Test%20Again","dir_part":null,"type_part":null}')

      SELECT validate_lfn('{"linear_name_id":null,"name_part":"Ry Test Again","dir_part":null,"type_part":null}')
	  select * from linear_name_evw where upper(name_part) like 'RY TEST%' 
	  select * from linear_name_evw where upper(name_part) like 'DYAS%' 
	  select * from linear_name_evw where upper(name_part) like 'FINCH%' 
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"finch avenue east","dir_part":"","type_part":""}') --duplicated lfn
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"finch ave east","dir_part":"","type_part":""}') --duplicated lfn
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"finch ave e","dir_part":"","type_part":""}') --duplicated lfn
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"finch avenue e","dir_part":"","type_part":""}') --duplicated lfn
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"finch ave e","dir_part":null,"type_part":null}') --duplicated lfn
	  
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"dyas road","dir_part":"","type_part":""}') --duplicated lfn
	  SELECT validate_lfn('{"linear_name_id":null,"name_part":"dyas rd","dir_part":"","type_part":""}') --duplicated lfn
  */
  o_status = 'OK';
  o_message = ''; 
  v_duplicate_name = false;
  v_duplicate_lfn = false;  
  SELECT row_to_json(c) INTO o_json
  FROM
  (
	  SELECT o_status status, 
	       o_message message,
	       CASE WHEN EXISTS 
	                 (SELECT 1
		              FROM linear_name_evw 
		              WHERE UPPER(name_part) = UPPER($1::json->>'name_part')
					    AND coalesce(($1::json->>'linear_name_id')::numeric,0) <> linear_name_id
		        ) THEN true ELSE false END duplicate_name,
	       CASE WHEN EXISTS 
	                 (SELECT 1
		              FROM linear_name_evw n
					  LEFT JOIN linear_name_type_evw nt ON n.type_part = nt.type_part
					  LEFT JOIN linear_name_direction_evw nd ON n.dir_part = nd.dir_part
		              WHERE 
					    (
					        format_string_to_validate(UPPER(n.name_part || coalesce(n.type_part,'') || coalesce(n.dir_part,''))) = 
					        format_string_to_validate(UPPER($1::json->>'name_part' || coalesce($1::json->>'type_part','') || coalesce($1::json->>'dir_part','')))
						 OR 
							format_string_to_validate(UPPER(n.name_part || coalesce(nt.type_part_code,'') || coalesce(n.dir_part,''))) = 
					        format_string_to_validate(UPPER($1::json->>'name_part' || coalesce($1::json->>'type_part','') || coalesce($1::json->>'dir_part','')))
						 OR
							format_string_to_validate(UPPER(n.name_part || coalesce(nt.type_part_code,'') || coalesce(nd.dir_part_code,''))) = 
					        format_string_to_validate(UPPER($1::json->>'name_part' || coalesce($1::json->>'type_part','') || coalesce($1::json->>'dir_part','')))
						 OR 
							format_string_to_validate(UPPER(n.name_part || coalesce(n.type_part,'') || coalesce(nd.dir_part_code,''))) = 
					        format_string_to_validate(UPPER($1::json->>'name_part' || coalesce($1::json->>'type_part','') || coalesce($1::json->>'dir_part','')))
						 OR 
							format_string_to_validate(UPPER(n.name_part || coalesce(nt.type_part_code,'') || coalesce(n.dir_part,''))) = 
					        format_string_to_validate(UPPER($1::json->>'name_part' || coalesce($1::json->>'type_part','') || coalesce($1::json->>'dir_part','')))
						)  
					    AND coalesce(($1::json->>'linear_name_id')::numeric,0) <> linear_name_id
		        ) THEN true ELSE false END duplicate_lfn
  ) c;		
  RETURN o_json; 
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;   
	o_status = SQLSTATE;
	o_message = SQLERRM;
	 
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	         o_message message,
		     null duplicate_name,
	         null duplicate_lfn
	) c;		
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION code_src.validate_lfn(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.validate_lfn(text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.validate_lfn(text) TO network;

REVOKE ALL ON FUNCTION code_src.validate_lfn(text) FROM PUBLIC;
