-- FUNCTION: code_src.search_ama(text)

-- DROP FUNCTION code_src.search_ama(text);

CREATE OR REPLACE FUNCTION code_src.search_ama(
	v_search_by text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE   
  o_status text;  
  o_message text;
  o_json text; 
  v_lo_num integer;
  v_lo_num_str text;
BEGIN
/*
  Summary: Search AMA with different search criteria
  Testing:
    SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":null, "lo_num_from":null, "lo_num_to":null, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":"N", "municipality":null, "lo_num_from":null, "lo_num_to":null, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":"NY", "lo_num_from":null, "lo_num_to":null, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":"TO", "lo_num_from":null, "lo_num_to":null, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":"EY", "lo_num_from":null, "lo_num_to":null, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":null, "usage_status":null, "municipality":"EY", "lo_num_from":null, "lo_num_to":null, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"sheppard", "usage_status":"N", "municipality":null, "lo_num_from":null, "lo_num_to":null, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":null, "lo_num_from":1, "lo_num_to":2, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":null, "usage_status":null, "municipality":null, "lo_num_from":10, "lo_num_to":20, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":null, "lo_num_from":100, "lo_num_to":200, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":null, "lo_num_from":10, "lo_num_to":null, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":null, "lo_num_from":null, "lo_num_to":20, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":"N", "municipality":"EY", "lo_num_from":10, "lo_num_to":10, "logicOP":"OR"}')
	
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":null, "lo_num_from":1, "lo_num_to":2, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":null, "lo_num_from":"47%A", "lo_num_to":"48%A", "logicOP":"OR"}')
	
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":null, "lo_num_from":null, "lo_num_to":null, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":null, "usage_status":null, "municipality":"EY", "lo_num_from":null, "lo_num_to":null, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"hea", "usage_status":"c", "municipality":null, "lo_num_from":null, "lo_num_to":null, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":"c", "municipality":null, "lo_num_from":null, "lo_num_to":null, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":"n", "municipality":null, "lo_num_from":null, "lo_num_to":null, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"hea", "usage_status":"c", "municipality":"EY", "lo_num_from":null, "lo_num_to":null, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"hea", "usage_status":null, "municipality":"EY", "lo_num_from":18, "lo_num_to":null, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"hea", "usage_status":null, "municipality":"EY", "lo_num_from":null, "lo_num_to":18, "logicOP":"and"}')
	
	SELECT search_ama('{"linear_name":"dyas", "usage_status":null, "municipality":null, "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"hea", "usage_status":"c", "municipality":null, "lo_num_from":"47%A", "lo_num_to":null, "logicOP":"and"}')
	
	SELECT search_ama('{"linear_name":"dyas", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":"null", "municipality":"null", "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"dyas","usage_status":"null","municipality":"null","lo_num_from":null,"lo_num_to":null,"logicOP":"and"}')
	SELECT search_ama('{"linear_name":"","usage_status":"null","municipality":"null","lo_num_from":"%A","lo_num_to":null,"logicOP":"and"}')
	SELECT search_ama('{"linear_name":"","usage_status":"null","municipality":"null","lo_num_from":"%1/2","lo_num_to":null,"logicOP":"and"}')
	
	SELECT search_ama('{"linear_name":"Sheppard", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"Sheppard Ave", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"Sheppard Ave E", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"Sheppard Avenue E", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"Sheppard Avenue East", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":12, "logicOP":"AND"}')
*/
   o_status = 'OK';
   o_message = '';   
   IF UPPER(v_search_by::json->>'logicOP') = 'OR' THEN       
	   SELECT json_agg(row_to_json(c)) INTO o_json
	   FROM
	   (	 
		   SELECT cm.*		        
		   FROM 
		   (
			   -- search by linear_name
			   SELECT a.address_string_id,
			          a.linear_name_id,
					   a.lo_num,
					   a.lo_num_suf,
					   a.hi_num,
					   a.hi_num_suf,
					   a.objectid,
					   a.usage_status AS ama_usage_status,
					   a.trans_id_create,
					   a.trans_id_expire,
					   format_string(l.name_part || ' ' || coalesce(l.type_part, '') || ' ' || coalesce(l.dir_part, '')) AS full_name,
					   l.name_part,
					   l.dir_part,
					   l.type_part,
					   l.duplication_desc	   
				FROM authorized_municipal_address_evw a
				JOIN linear_name_evw l ON a.linear_name_id = l.linear_name_id	
			    LEFT JOIN linear_name_type_evw t ON l.type_part = t.type_part
			    LEFT JOIN linear_name_direction_evw d ON l.dir_part = d.dir_part
				WHERE NOT is_blank_string(v_search_by::json->>'linear_name') 
			          AND a.trans_id_expire = -1 
			          --AND position(format_string(UPPER(v_search_by::json->>'linear_name')) in format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(l.dir_part), ''))) > 0 -- or = 1 if checking start with 	         			 
			          --AND format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
			          AND 
			           (
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
					     OR
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(t.type_part_code), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
						 OR 
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(d.dir_part_code), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
						 OR 
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(t.type_part_code), '') || ' ' || coalesce(UPPER(d.dir_part_code), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
					   )  
		     UNION -- Search by usage_status
		        SELECT a.address_string_id,
			           a.linear_name_id,
					   a.lo_num,
					   a.lo_num_suf,
					   a.hi_num,
					   a.hi_num_suf,
					   a.objectid,
					   a.usage_status AS ama_usage_status,
					   a.trans_id_create,
					   a.trans_id_expire,
					   format_string(l.name_part || ' ' || coalesce(l.type_part, '') || ' ' || coalesce(l.dir_part, '')) AS full_name,
					   l.name_part,
					   l.dir_part,
					   l.type_part,
					   l.duplication_desc	   
				FROM authorized_municipal_address_evw a
				JOIN linear_name_evw l ON a.linear_name_id = l.linear_name_id
			    WHERE NOT is_blank_string(v_search_by::json->>'usage_status')
		          AND a.trans_id_expire = -1 
		          AND UPPER(a.usage_status) = UPPER(v_search_by::json->>'usage_status')
		   
		      UNION -- Search by municipality
		        SELECT a.address_string_id,
			           a.linear_name_id,
					   a.lo_num,
					   a.lo_num_suf,
					   a.hi_num,
					   a.hi_num_suf,
					   a.objectid,
					   a.usage_status AS ama_usage_status,
					   a.trans_id_create,
					   a.trans_id_expire,
					   format_string(l.name_part || ' ' || coalesce(l.type_part, '') || ' ' || coalesce(l.dir_part, '')) AS full_name,
					   l.name_part,
					   l.dir_part,
					   l.type_part,
					   l.duplication_desc	   
				FROM authorized_municipal_address_evw a
				JOIN linear_name_evw l ON a.linear_name_id = l.linear_name_id
			    WHERE  NOT is_blank_string(v_search_by::json->>'municipality')
		          AND a.trans_id_expire = -1
		          AND UPPER(l.duplication_desc) LIKE '%' || UPPER(v_search_by::json->>'municipality') || '%'	   
		   
		     UNION -- Search by lo_num range
		        SELECT a.address_string_id,
			           a.linear_name_id,
					   a.lo_num,
					   a.lo_num_suf,
					   a.hi_num,
					   a.hi_num_suf,
					   a.objectid,
					   a.usage_status AS ama_usage_status,
					   a.trans_id_create,
					   a.trans_id_expire,
					   format_string(l.name_part || ' ' || coalesce(l.type_part, '') || ' ' || coalesce(l.dir_part, '')) AS full_name,
					   l.name_part,
					   l.dir_part,
					   l.type_part,
					   l.duplication_desc	   
				FROM authorized_municipal_address_evw a
				JOIN linear_name_evw l ON a.linear_name_id = l.linear_name_id
			    WHERE a.trans_id_expire = -1
		          --AND a.lo_num BETWEEN coalesce((v_search_by::json->>'lo_num_from')::integer, coalesce(v_search_by::json->>'lo_num_to')::integer, -1) AND coalesce((v_search_by::json->>'lo_num_to')::integer, coalesce(v_search_by::json->>'lo_num_from')::integer, -1)		          
			       AND NOT is_blank_string(v_search_by::json->>'lo_num_from')
			       AND 
			        (
			        CASE WHEN is_numeric((v_search_by::json->>'lo_num_from')::text) THEN lpad(a.lo_num::text,10,'0') BETWEEN lpad(coalesce((v_search_by::json->>'lo_num_from')::text, coalesce(v_search_by::json->>'lo_num_to')::text, '0'),10,'0') AND lpad(coalesce((v_search_by::json->>'lo_num_to')::text, coalesce(v_search_by::json->>'lo_num_from')::text, '999999999'),10,'0') 
						 ELSE coalesce((a.lo_num)::text, '') ||  coalesce(a.lo_num_suf, '') LIKE  (v_search_by::json->>'lo_num_from')::text
					END
					)
			 ) cm
			 ORDER BY full_name, address_string_id
		) c;		
   ELSE
     SELECT json_agg(row_to_json(c)) INTO o_json
	   FROM
	   (	 
		   SELECT cm.*		        
		   FROM 
		   (
				SELECT a.address_string_id,
			       a.linear_name_id,
				   a.lo_num,
				   a.lo_num_suf,
				   a.hi_num,
				   a.hi_num_suf,
				   a.objectid,
				   a.usage_status AS ama_usage_status,
				   a.trans_id_create,
				   a.trans_id_expire,
				   format_string(l.name_part || ' ' || coalesce(l.type_part, '') || ' ' || coalesce(l.dir_part, '')) AS full_name,
				   l.name_part,
				   l.dir_part,
				   l.type_part,
				   l.duplication_desc	   
				FROM authorized_municipal_address_evw a
				JOIN linear_name_evw l ON a.linear_name_id = l.linear_name_id	
			    LEFT JOIN linear_name_type_evw t ON l.type_part = t.type_part
			    LEFT JOIN linear_name_direction_evw d ON l.dir_part = d.dir_part
				WHERE a.trans_id_expire = -1 
				  AND -- Search by linear_name
				  ( 
					 is_blank_string(v_search_by::json->>'linear_name') 
					 OR 
					 (
					    NOT is_blank_string(v_search_by::json->>'linear_name') 			          
					    --AND position(format_string(UPPER(v_search_by::json->>'linear_name')) in format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(l.dir_part), ''))) > 0 -- or = 1 if checking start with 	         			 
					   -- AND format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
					    AND 
			           (
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
					     OR
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(t.type_part_code), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
						 OR 
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(d.dir_part_code), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
						 OR 
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(t.type_part_code), '') || ' ' || coalesce(UPPER(d.dir_part_code), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
					   )  
					 )
				  )
			      AND -- Search by usage_status
			      (
				      is_blank_string(v_search_by::json->>'usage_status') 
				    OR   
					(  
				      NOT is_blank_string(v_search_by::json->>'usage_status')		           
		              AND UPPER(a.usage_status) = UPPER(v_search_by::json->>'usage_status')
					)
				  )
			      AND -- Search by municipality
			      (
				      is_blank_string(v_search_by::json->>'municipality')
				    OR   
					(  
				      NOT is_blank_string(v_search_by::json->>'municipality')		           
		              AND UPPER(l.duplication_desc) LIKE '%' || UPPER(v_search_by::json->>'municipality') || '%'
					)
				  )
			      AND -- Search by lo_num range
			       (
					   is_blank_string(v_search_by::json->>'lo_num_from')
					OR
						(
						CASE WHEN is_numeric((v_search_by::json->>'lo_num_from')::text) THEN lpad(a.lo_num::text,10,'0') BETWEEN lpad(coalesce((v_search_by::json->>'lo_num_from')::text, coalesce(v_search_by::json->>'lo_num_to')::text, '0'),10,'0') AND lpad(coalesce((v_search_by::json->>'lo_num_to')::text, coalesce(v_search_by::json->>'lo_num_from')::text, '999999999'),10,'0') 
							 ELSE coalesce((a.lo_num)::text, '') ||  coalesce(a.lo_num_suf, '') LIKE  (v_search_by::json->>'lo_num_from')::text
						END
						)
				   )
			 ) cm
			 ORDER BY full_name, address_string_id
		) c;	
   END IF;  	
   RETURN o_json;
EXCEPTION
  WHEN OTHERS THEN 
    o_status = SQLSTATE;
	o_message = format_string(SQLERRM);	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message		
	) c;		
	RETURN o_json;
END;  
   $BODY$;

ALTER FUNCTION code_src.search_ama(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.search_ama(text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.search_ama(text) TO network;

REVOKE ALL ON FUNCTION code_src.search_ama(text) FROM PUBLIC;
