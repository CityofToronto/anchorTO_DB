-- FUNCTION: network.search_lfn(text)

-- DROP FUNCTION network.search_lfn(text);

CREATE OR REPLACE FUNCTION network.search_lfn(
	v_search_by text)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
/*
  Summary: Search LFN with different search criteria
  Testing:
    SELECT search_lfn('{"lfn_type":"Street","lfn_dir":"east", "activation_status": null,  "authorized": "",  "used_by": "",  "duplication_status":"", "usage_status":"",  "logic": "and"}')
	SELECT search_lfn('{"activation_status": "A",  "authorized": "",  "used_by": "L",  "usage_status":"",  "logic": "and"}')
  Return all: SELECT search_lfn('{"activation_status": null,  "authorized": "",  "used_by": "",  "usage_status":"",  "logic": "and"}')
	
*/
--SELECT to_json(r)
--FROM 
--(
--  SELECT 
--  (
   SELECT json_agg(row_to_json(c)) 
   FROM
   (
	 SELECT cm.*
	        --,UPPER(v_search_by::json->>'logic') AS r_logic
	 FROM
	 (
	   SELECT m.objectid,
			  m.linear_name_id,
			  m.name_part,
			  m.type_part,
			  m.dir_part,
		      m.activation_status,
			  m.activation_status_desc,
			  m.duplication_status,
			  m.duplication_desc,	          
			  m.used_by,
		      m.used_by_desc,
		      m.usage_status,
	          us.description AS usage_status_desc,
	          --CASE WHEN m.usage_status IN ('C', 'H') THEN 'Y' ELSE 'N' END AS authorized
		      m.authorized
	   FROM 
	   (
		   SELECT l.objectid,
				  l.linear_name_id,
				  l.name_part,
				  l.type_part,
				  l.dir_part,
		          l.activation_status,
				  a.description AS activation_status_desc,
				  l.duplication_status,
				  l.duplication_desc,
		          l.use_by AS used_by,
				  u.description AS used_by_desc,
		          l.authorized,
		          l.usage_status
				  --CASE WHEN EXISTS (SELECT 1 FROM authorized_municipal_address_evw WHERE linear_name_id = l.linear_name_id) THEN 'Y' ELSE 'N' END AS authorized,
				  /*CASE WHEN EXISTS (SELECT 1 FROM authorized_municipal_address_evw WHERE linear_name_id = l.linear_name_id) THEN 'C' -- Current
					   WHEN EXISTS (SELECT 1 FROM ama_dm WHERE linear_name_id = l.linear_name_id) THEN 'H' --Historical Only
					   ELSE 'N' END AS usage_status -- 'Not Referenced'*/
		   FROM linear_name_evw l
		   JOIN dmn_ln_activation_status a ON l.activation_status = a.activation_status
		   JOIN dmn_ln_use_by u ON l.use_by = u.use_by	
		   WHERE (
			   UPPER(v_search_by::json->>'logic') = 'OR' AND 
			   (
				   (is_blank_string(v_search_by::json->>'lfn_type') OR UPPER(l.type_part) = UPPER(v_search_by::json->>'lfn_type'))
				   OR
				   (is_blank_string(v_search_by::json->>'lfn_dir') OR UPPER(l.dir_part) = UPPER(v_search_by::json->>'lfn_dir'))
				   OR
				   (is_blank_string(v_search_by::json->>'activation_status') OR UPPER(l.activation_status) = UPPER(v_search_by::json->>'activation_status'))
				   OR 
				   (is_blank_string(v_search_by::json->>'duplication_status') OR UPPER(l.duplication_status) = UPPER(v_search_by::json->>'duplication_status'))
				   OR
                   (is_blank_string(v_search_by::json->>'authorized') OR UPPER(l.authorized) = UPPER(v_search_by::json->>'authorized'))
				   OR
				   (is_blank_string(v_search_by::json->>'used_by') OR UPPER(l.use_by) = UPPER(v_search_by::json->>'used_by'))
				   OR
				   (is_blank_string(v_search_by::json->>'usage_status') OR UPPER(l.usage_status) = UPPER(v_search_by::json->>'usage_status'))				   
			   )
			 ) 
	         OR 
	         (
			   UPPER(v_search_by::json->>'logic') = 'AND' AND 
			   (
				   (is_blank_string(v_search_by::json->>'lfn_type') OR UPPER(l.type_part) = UPPER(v_search_by::json->>'lfn_type'))
				   AND
				   (is_blank_string(v_search_by::json->>'lfn_dir') OR UPPER(l.dir_part) = UPPER(v_search_by::json->>'lfn_dir'))
				   AND
				   (is_blank_string(v_search_by::json->>'activation_status') OR UPPER(l.activation_status) = UPPER(v_search_by::json->>'activation_status'))
				   AND 
				   (is_blank_string(v_search_by::json->>'duplication_status') OR UPPER(l.duplication_status) = UPPER(v_search_by::json->>'duplication_status'))
				   AND
                   (is_blank_string(v_search_by::json->>'authorized') OR UPPER(l.authorized) = UPPER(v_search_by::json->>'authorized'))
				   AND
				   (is_blank_string(v_search_by::json->>'used_by') OR UPPER(l.use_by) = UPPER(v_search_by::json->>'used_by'))
				   AND
				   (is_blank_string(v_search_by::json->>'usage_status') OR UPPER(l.usage_status) = UPPER(v_search_by::json->>'usage_status'))				   
			   )
			 )
	   ) m
	   LEFT JOIN dmn_ln_usage_status us ON us.usage_status = m.usage_status
	  ) cm
	/*  WHERE (
			   UPPER(v_search_by::json->>'logic') = 'OR' AND 
			   (
				   (is_blank_string(v_search_by::json->>'activation_status') OR UPPER(activation_status) = UPPER(v_search_by::json->>'activation_status'))
				   OR 
				   (is_blank_string(v_search_by::json->>'duplication_status') OR UPPER(duplication_status) = UPPER(v_search_by::json->>'duplication_status'))
				   OR
                   (is_blank_string(v_search_by::json->>'authorized') OR UPPER(authorized) = UPPER(v_search_by::json->>'authorized'))
				   OR
				   (is_blank_string(v_search_by::json->>'used_by') OR UPPER(used_by) = UPPER(v_search_by::json->>'used_by'))
				   OR
				   (is_blank_string(v_search_by::json->>'usage_status') OR UPPER(usage_status) = UPPER(v_search_by::json->>'usage_status'))				   
			   )
			 ) 
	         OR 
	         (
			   UPPER(v_search_by::json->>'logic') = 'AND' AND 
			   (
				   (is_blank_string(v_search_by::json->>'activation_status') OR UPPER(activation_status) = UPPER(v_search_by::json->>'activation_status'))
				   AND 
				   (is_blank_string(v_search_by::json->>'duplication_status') OR UPPER(duplication_status) = UPPER(v_search_by::json->>'duplication_status'))
				   AND
                   (is_blank_string(v_search_by::json->>'authorized') OR UPPER(authorized) = UPPER(v_search_by::json->>'authorized'))
				   AND
				   (is_blank_string(v_search_by::json->>'used_by') OR UPPER(used_by) = UPPER(v_search_by::json->>'used_by'))
				   AND
				   (is_blank_string(v_search_by::json->>'usage_status') OR UPPER(usage_status) = UPPER(v_search_by::json->>'usage_status'))				   
			   )
			 ) */
    ) c	
--  ) AS search_result
--) r	
	;	
   $BODY$;

ALTER FUNCTION network.search_lfn(text)
    OWNER TO network;
