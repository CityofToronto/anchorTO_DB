-- FUNCTION: code_src.get_available_ama(text)

-- DROP FUNCTION code_src.get_available_ama(text);

CREATE OR REPLACE FUNCTION code_src.get_available_ama(
	v_search_by text)
    RETURNS json
    LANGUAGE 'sql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
  /*
    Summary:
	  Get available AMAs. 
	  v_search_by: 
	    {"lo_num_from": 1, "lo_num_to":100,"linear_name_id":5467, "address_type":0}
		linear_name_id is mandatory
	    address_type: 0: REGULAR; 1: RESERVED
    Testing:
	  SELECT get_available_ama('{"lo_num_from": null, "lo_num_to":null,"linear_name_id":5467, "address_type":0}');
	  SELECT get_available_ama('{"lo_num_from": null, "lo_num_to":null,"linear_name_id":3341, "address_type":0}');
	  SELECT get_available_ama('{"lo_num_from": 308, "lo_num_to":null,"linear_name_id":3341, "address_type":0}');
	  SELECT get_available_ama('{"lo_num_from": 308, "lo_num_to":441,"linear_name_id":3341, "address_type":0}');
	  SELECT get_available_ama('{"lo_num_from": "4", "lo_num_to":"300","linear_name_id":3341, "address_type":0}');
	  SELECT get_available_ama('{"lo_num_from": "4%", "lo_num_to":null,"linear_name_id":3341, "address_type":0}');
	  SELECT get_available_ama('{"lo_num_from": 1, "lo_num_to":10,"linear_name_id":5467, "address_type":0}'); 
	  SELECT get_available_ama('{"lo_num_from": 1, "lo_num_to":10,"linear_name_id":5467, "address_type":null}'); 
	  SELECT get_available_ama('{"lo_num_from": 90, "lo_num_to":95,"linear_name_id":4574, "address_type":null}'); 
	  SELECT get_available_ama('{"lo_num_from": 90, "lo_num_to":95,"linear_name_id":4574, "address_type":0}'); 
	  SELECT get_available_ama('{"lo_num_from": 90, "lo_num_to":95,"linear_name_id":4574, "address_type":1}'); 
  */
SELECT to_json(row)
FROM
(
 SELECT 
  (	
	SELECT json_agg(row_to_json(a)) 
	FROM 
	 (
		SELECT id, 
		       linear_name_full,
		       usage,
		       linear_name_id,
		       status,
		       maint_stage,
		       municipality
		FROM (
			SELECT r1.*,
				   ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) as idx
			FROM (
					SELECT a.address_string_id as id,
						   format_string(
								  UPPER(
									  a.lo_num::text ||
									  coalesce(a.lo_num_suf, '') ||
									  coalesce(' - ' || a.hi_num::text, '') ||
									  coalesce(a.hi_num_suf, '')
									  ) || ' ' ||
								  INITCAP(l.name_part || ' ' || 
									  coalesce(l.type_part,'') || ' ' || 
									  coalesce(l.dir_part,'')
								  )
						   ) AS linear_name_full,
						   u.description as usage,
						   a.linear_name_id,
						   d.description as status,
						   p.maint_stage,
						   l.description as municipality		       
					FROM authorized_municipal_address_evw a
					JOIN linear_name_evw l ON a.linear_name_id = l.linear_name_id
					JOIN dmn_ln_activation_status d ON l.activation_status = d.activation_status
					JOIN dmn_ln_usage_status u ON u.usage_status = a.usage_status
					LEFT JOIN address_point_evw p ON a.address_string_id = p.address_string_id
					WHERE a.trans_id_expire = -1
					 AND -- Search by linear_name_id
					  (v_search_by::json->>'linear_name_id')::integer = a.linear_name_id	
					/*  ( 
						 is_blank_string(v_search_by::json->>'linear_name_id') 
						 OR 
						 (
							NOT is_blank_string(v_search_by::json->>'linear_name_id') 			          
							AND (v_search_by::json->>'linear_name_id')::integer = a.linear_name_id	
						 )
					  )*/
					 AND -- Search by lo_num (from & to)
					 (
						 is_blank_string(v_search_by::json->>'lo_num_from')
						 OR 
						 (
							 NOT is_blank_string(v_search_by::json->>'lo_num_from')
							 AND 
							  (
							  CASE WHEN is_numeric((v_search_by::json->>'lo_num_from')::text) 
								  --THEN a.lo_num BETWEEN (v_search_by::json->>'lo_num_from')::integer AND coalesce((v_search_by::json->>'lo_num_to')::integer, 99999999) 
								   THEN lpad(a.lo_num::text,10,'0') BETWEEN lpad(coalesce((v_search_by::json->>'lo_num_from')::text, coalesce(v_search_by::json->>'lo_num_to')::text, '0'),10,'0') AND lpad(coalesce((v_search_by::json->>'lo_num_to')::text, coalesce(v_search_by::json->>'lo_num_from')::text, '999999999'),10,'0') 
								   ELSE coalesce((a.lo_num)::text, '') ||  coalesce(a.lo_num_suf, '') LIKE  (v_search_by::json->>'lo_num_from')::text
							  END
							  )
						  )
					  )
					  AND -- Search by address_type (0:Regular; 1:Reserved)
					  (
						  is_blank_string(v_search_by::json->>'address_type')
						  OR 
						  ((v_search_by::json->>'address_type')::integer = 0 AND p.maint_stage = 'REGULAR')
						  OR 
						  ((v_search_by::json->>'address_type')::integer = 1 AND p.maint_stage = 'RESERVED')
					  )
					 ORDER BY l.linear_name_id, a.lo_num, a.lo_num_suf, a.hi_num, a.hi_num_suf
				  ) r1
		 ) r2
	     WHERE r2.idx = 1
	 ) a
  ) AS ama  

) row
 ;
$BODY$;

ALTER FUNCTION code_src.get_available_ama(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_available_ama(text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_available_ama(text) TO network;

REVOKE ALL ON FUNCTION code_src.get_available_ama(text) FROM PUBLIC;
