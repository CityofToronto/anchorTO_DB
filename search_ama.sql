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
  v_type_part text;
  v_dir_part text;
  v_linear_name text;
  v_search_txt text;
  v_search_txt_list text[];
  v_search_txt_part_number integer;
  v_cnt integer;
  v_lo_num_from integer;
  v_lo_num_to integer;
  v_lo_num_from_txt text;
  v_lo_num_to_txt text;
  v_suf_search boolean;
  v_suf_search_txt text;
  v_lo_num_to_default integer;
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
	
	SELECT search_ama('{"linear_name":"Sheppard", "usage_status":"C", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"Sheppard Ave", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"Sheppard Ave E", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"Sheppard Avenue E", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"Dyas Rd", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":null, "logicOP":"AND"}')
	SELECT search_ama('{"linear_name":"Sheppard Avenue East", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":12, "logicOP":"AND"}')
	
	SELECT search_ama('{"linear_name":"Sheppard Ave E", "usage_status":"", "municipality":"", "lo_num_from":1000, "lo_num_to":1000, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"Sheppard Ave", "usage_status":"", "municipality":"", "lo_num_from":"5097%", "lo_num_to":10000, "logicOP":"and"}')
	
	SELECT search_ama('{"linear_name":"Sheppard Ave", "usage_status":"", "municipality":"", "lo_num_from":"%A", "lo_num_to":100, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"Sheppard Ave", "usage_status":"", "municipality":"", "lo_num_from":"%a", "lo_num_to":100, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"Sheppard Ave", "usage_status":"", "municipality":"", "lo_num_from":"10A%", "lo_num_to":100, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"Sheppard Ave", "usage_status":"", "municipality":"", "lo_num_from":"10A", "lo_num_to":"100A", "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"Sheppard Ave", "usage_status":"", "municipality":"", "lo_num_from":"10A", "lo_num_to":"10A", "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"Sheppard Ave", "usage_status":"", "municipality":"", "lo_num_from":"99A%", "lo_num_to":0, "logicOP":"and"}')
	
	SELECT search_ama('{"linear_name":"Shep%A", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"Shepp% E", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"and"}')	
	SELECT search_ama('{"linear_name":"Sheppard% E", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"and"}')
	
	SELECT search_ama('{"linear_name":"Sheppard%E", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"Sheppard% %E", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"and"}')
	SELECT search_ama('{"linear_name":"Sheppard AV%", "usage_status":"", "municipality":"", "lo_num_from":1, "lo_num_to":2, "logicOP":"and"}')
	
	SELECT search_ama('{"linear_name":"dyas rd", "usage_status":"", "municipality":"", "lo_num_from":0, "lo_num_to":0, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"dyas", "usage_status":"", "municipality":"", "lo_num_from":0, "lo_num_to":0, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"shepp% E", "usage_status":"", "municipality":"", "lo_num_from":0, "lo_num_to":0, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"shepp% AvE", "usage_status":"", "municipality":"", "lo_num_from":0, "lo_num_to":0, "logicOP":"OR"}')
	SELECT search_ama('{"linear_name":"shepp% E", "usage_status":"", "municipality":"", "lo_num_from":"10A", "lo_num_to":"20B", "logicOP":"OR"}')
	
*/
   o_status = 'OK';
   o_message = '';   
   
   IF UPPER(v_search_by::json->>'logicOP') = 'OR' THEN
     v_lo_num_to_default = -9; 
   ELSE
     v_lo_num_to_default = 999999999;
   END IF;
   -- Parse search criteria: linear_name   
   v_search_txt = TRIM(UPPER(v_search_by::json->>'linear_name'));
   SELECT regexp_split_to_array(v_search_txt, ' ')
     INTO v_search_txt_list;
   SELECT array_length(v_search_txt_list,1) INTO v_search_txt_part_number;
   raise notice 'Parts #: %', v_search_txt_part_number;
   IF v_search_txt_part_number = 1 THEN 
     v_linear_name = v_search_txt_list[1];
	 v_type_part = '';
	 v_dir_part = '';
   ELSIF v_search_txt_part_number = 2 THEN 
     -- last part could be linear name type
     SELECT UPPER(type_part) INTO v_type_part
	 FROM linear_name_type_evw
	 WHERE UPPER(type_part) = v_search_txt_list[2]
	    OR UPPER(type_part_code) = v_search_txt_list[2];
	 raise notice 'v_type_part: %', v_type_part;	 
     -- last part could be linear name direction
     SELECT UPPER(dir_part) INTO v_dir_part
     FROM linear_name_direction_evw
     WHERE UPPER(dir_part) = v_search_txt_list[2]
	    OR UPPER(dir_part_code) = v_search_txt_list[2];
     raise notice 'v_dir_part: %', v_dir_part; 
	 -- Set search linear_name
	 v_linear_name = v_search_txt_list[1];
	 IF v_type_part is null AND v_dir_part is null THEN
	     v_linear_name = v_linear_name || ' ' || v_search_txt_list[2];	 
	 END IF;
	 v_linear_name = TRIM(v_linear_name);
	 raise notice 'v_linear_name: %', v_linear_name;
   ELSE -- More than 3 search parts
     -- The second last part could be linear name type
     SELECT UPPER(type_part) INTO v_type_part
	 FROM linear_name_type_evw
	 WHERE UPPER(type_part) = v_search_txt_list[v_search_txt_part_number - 1]
	    OR UPPER(type_part_code) = v_search_txt_list[v_search_txt_part_number - 1];
	 raise notice 'v_type_part: %', v_type_part;	      
	 -- Init search linear_name
	 v_linear_name = '';
	 FOR v_cnt IN 1 .. (v_search_txt_part_number - 2) LOOP
	   v_linear_name = v_linear_name || ' ' || v_search_txt_list[v_cnt];
	 END LOOP;	 
	 IF v_type_part is null THEN
	     v_linear_name = v_linear_name || ' ' || v_search_txt_list[v_search_txt_part_number - 1];	 
	 END IF;  
	 -- The last part could be linear name type
	 IF v_type_part is null THEN 
       SELECT UPPER(type_part) INTO v_type_part
	   FROM linear_name_type_evw
	   WHERE UPPER(type_part) = v_search_txt_list[v_search_txt_part_number]
	      OR UPPER(type_part_code) = v_search_txt_list[v_search_txt_part_number];	  
	   raise notice 'v_type_part: %', v_type_part;
	 END IF;
	 -- The last part could be linear name type
     SELECT UPPER(dir_part) INTO v_dir_part
	 FROM linear_name_direction_evw
	 WHERE UPPER(dir_part) = v_search_txt_list[v_search_txt_part_number]
	    OR UPPER(dir_part_code) = v_search_txt_list[v_search_txt_part_number];
	 raise notice 'v_dir_part: %', v_dir_part;
	 IF v_dir_part is null THEN
	     v_linear_name = v_linear_name || ' ' || v_search_txt_list[v_search_txt_part_number];	 
	 END IF;  
	 v_linear_name = TRIM(v_linear_name);
   END IF;
   raise notice 'v_linear_name:%; v_type_part:%; v_dir_part:%', v_linear_name, v_type_part, v_dir_part;
   -- Parse lo_num
   v_suf_search = false;
   IF UPPER(v_search_by::json->>'logicOP') = 'OR' THEN
     v_lo_num_from = 0;
     v_lo_num_to = -1 * v_lo_num_to_default;
   ELSE
     v_lo_num_from = 0;
     v_lo_num_to = v_lo_num_to_default;
   END IF;
   v_lo_num_from_txt = (v_search_by::json->>'lo_num_from')::text;
   v_lo_num_to_txt = (v_search_by::json->>'lo_num_to')::text;
   IF NOT is_blank_string(v_lo_num_from_txt) THEN
     IF is_integer(v_lo_num_from_txt) THEN 
	   v_lo_num_from = cast(v_lo_num_from_txt as integer);
	   IF is_integer(v_lo_num_to_txt) THEN 
	     v_lo_num_to = cast(v_lo_num_to_txt as integer);
	   END IF;
	 ELSE -- lo_num_from includes string 
	   v_lo_num_from = COALESCE(CAST(SUBSTRING(v_lo_num_from_txt, '^([0-9]{1,255})') AS integer), v_lo_num_from);   -- Extract the leading #   
	   v_lo_num_to = COALESCE(CAST(SUBSTRING(v_lo_num_to_txt, '^([0-9]{1,255})') AS integer), v_lo_num_to);   -- Extract the leading #	   
	   v_suf_search_txt = SUBSTRING(v_lo_num_from_txt, '(\D{1,255})'); -- Extract the suffix string
	   v_suf_search = NOT is_blank_string(v_suf_search_txt);
	 END IF;
   END IF;
   IF v_lo_num_to = 0 THEN 
     v_lo_num_to = v_lo_num_to_default;
   END IF;
   
   raise notice 'v_lo_num_from:%; v_lo_num_to:%; v_suf_search_txt:%; v_suf_search: %', v_lo_num_from, v_lo_num_to, v_suf_search_txt, v_suf_search;
   
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
			   /* LEFT JOIN linear_name_type_evw t ON l.type_part = t.type_part
			    LEFT JOIN linear_name_direction_evw d ON l.dir_part = d.dir_part*/
				WHERE NOT is_blank_string(v_search_by::json->>'linear_name') 
			          AND a.trans_id_expire = -1 
			          AND 
			          (
						    UPPER(l.name_part) LIKE v_linear_name || '%'
					    AND (is_blank_string(v_type_part) OR UPPER(l.type_part) = v_type_part)
						AND (is_blank_string(v_dir_part) OR UPPER(l.dir_part) = v_dir_part)
					  )
			          --AND position(format_string(UPPER(v_search_by::json->>'linear_name')) in format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(l.dir_part), ''))) > 0 -- or = 1 if checking start with 	         			 
			          --AND format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
			      /*    AND 
			           (
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
					     OR
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(t.type_part_code), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
						 OR 
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(d.dir_part_code), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
						 OR 
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(t.type_part_code), '') || ' ' || coalesce(UPPER(d.dir_part_code), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
					   )  */
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
			       AND a.lo_num BETWEEN v_lo_num_from AND v_lo_num_to
			       AND 
			       (
					  NOT v_suf_search OR
					  (v_suf_search AND UPPER(a.lo_num_suf) LIKE UPPER(v_suf_search_txt))
				   ) 
			       /*AND 
			        (
			        CASE WHEN is_numeric((v_search_by::json->>'lo_num_from')::text) THEN lpad(a.lo_num::text,10,'0') BETWEEN lpad(coalesce((v_search_by::json->>'lo_num_from')::text, coalesce(v_search_by::json->>'lo_num_to')::text, '0'),10,'0') AND lpad(coalesce((v_search_by::json->>'lo_num_to')::text, coalesce(v_search_by::json->>'lo_num_from')::text, '999999999'),10,'0') 
						 ELSE coalesce((a.lo_num)::text, '') ||  coalesce(a.lo_num_suf, '') LIKE  (v_search_by::json->>'lo_num_from')::text
					END
					)*/
			 ) cm
			 ORDER BY full_name, lo_num, lo_num_suf--address_string_id
		) c;		
   ELSE  -- logicOP = 'AND'
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
			   /* LEFT JOIN linear_name_type_evw t ON l.type_part = t.type_part
			    LEFT JOIN linear_name_direction_evw d ON l.dir_part = d.dir_part*/
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
						    UPPER(l.name_part) LIKE v_linear_name || '%'
					    AND (is_blank_string(v_type_part) OR UPPER(l.type_part) = v_type_part) -- OR UPPER(l.type_part) LIKE v_type_part || '%')
						AND (is_blank_string(v_dir_part) OR UPPER(l.dir_part) = v_dir_part) -- OR UPPER(l.dir_part) LIKE v_dir_part || '%')
					  ) 
			         /*  (
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
					     OR
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(t.type_part_code), '') || ' ' || coalesce(UPPER(l.dir_part), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
						 OR 
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(l.type_part), '') || ' ' || coalesce(UPPER(d.dir_part_code), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
						 OR 
						   format_string(UPPER(l.name_part) || ' ' || coalesce(UPPER(t.type_part_code), '') || ' ' || coalesce(UPPER(d.dir_part_code), '')) LIKE UPPER(v_search_by::json->>'linear_name') || '%'
					   )  */
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
			        a.lo_num BETWEEN v_lo_num_from AND v_lo_num_to
			      AND 
			      (
					  NOT v_suf_search OR
					  (v_suf_search AND UPPER(a.lo_num_suf) LIKE UPPER(v_suf_search_txt))
				  )
			   /*    (
					   is_blank_string(v_search_by::json->>'lo_num_from')
					OR
						(
						CASE WHEN is_numeric((v_search_by::json->>'lo_num_from')::text) THEN lpad(a.lo_num::text,10,'0') BETWEEN lpad(coalesce((v_search_by::json->>'lo_num_from')::text, coalesce(v_search_by::json->>'lo_num_to')::text, '0'),10,'0') AND lpad(coalesce((v_search_by::json->>'lo_num_to')::text, coalesce(v_search_by::json->>'lo_num_from')::text, '999999999'),10,'0') 
							 ELSE coalesce((a.lo_num)::text, '') ||  coalesce(a.lo_num_suf, '') LIKE  (v_search_by::json->>'lo_num_from')::text
						END
						)
				   )*/
			 ) cm
			 ORDER BY full_name, lo_num, lo_num_suf--address_string_id
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
