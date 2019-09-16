-- FUNCTION: code_src.get_lfn_by_id(numeric)

-- DROP FUNCTION code_src.get_lfn_by_id(numeric);

CREATE OR REPLACE FUNCTION code_src.get_lfn_by_id(
	v_linear_name_id numeric)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE SECURITY DEFINER 
    ROWS 1000
AS $BODY$
/*
  Summary:
    Get LFN by id
  Testing:
    SELECT get_lfn_by_id(1570)
*/
   SELECT row_to_json(c) 
   FROM
   (	 
	   SELECT m.objectid,
			  m.linear_name_id,
			  m.name_part,
			  m.type_part,
			  m.dir_part,
	          m.description,
			  m.activation_status,
	          m.activation_status_desc,
	          m.use_by,
			  m.duplication_status,
			  m.duplication_desc,
	          m.usage_status,
	          us.description AS usage_status_desc,	          
	          --CASE WHEN m.usage_status IN ('C', 'H') THEN 'Y' ELSE 'N' END AS authorized,
	          m.authorized,
	          m.segment
	   FROM 
	   (
		   SELECT l.objectid,
				  l.linear_name_id,
				  l.name_part,
				  l.type_part,
				  l.dir_part,
		          l.description,
		          l.activation_status,
				  a.description AS activation_status_desc,
				  l.duplication_status,
				  l.duplication_desc,
		          l.use_by,
		          l.authorized,
		          l.usage_status,
				  --u.description AS used_by,
				  --CASE WHEN EXISTS (SELECT 1 FROM authorized_municipal_address_evw WHERE linear_name_id = l.linear_name_id) THEN 'Y' ELSE 'N' END AS authorized,
				  /*CASE WHEN EXISTS (SELECT 1 FROM authorized_municipal_address_evw WHERE linear_name_id = l.linear_name_id) THEN 'C' -- Current
					   WHEN EXISTS (SELECT 1 FROM ama_dm WHERE linear_name_id = l.linear_name_id) THEN 'H' --Historical Only
					   ELSE 'N' END AS usage_status, -- 'Not Referenced'*/
		          (
					  SELECT json_agg(row_to_json(cc)) 
					  FROM 
					  ( 
						  SELECT b.centreline_id AS id,
								 b.linear_name_id,
								 CASE WHEN b.lo_num_l IS NOT NULL AND b.hi_num_l IS NOT NULL THEN b.lo_num_l::text || ' - ' || b.hi_num_l::text
									  WHEN b.lo_num_l IS NOT NULL THEN b.lo_num_l::text
									  WHEN b.hi_num_l IS NOT NULL THEN b.hi_num_l::text
									  ELSE ''
								 END AS left_range,
								 CASE WHEN b.lo_num_r IS NOT NULL AND b.hi_num_r IS NOT NULL THEN b.lo_num_r::text || ' - ' || b.hi_num_r::text
									  WHEN b.lo_num_r IS NOT NULL THEN b.lo_num_r::text
									  WHEN b.hi_num_r IS NOT NULL THEN b.hi_num_r::text
									  ELSE ''
								 END AS right_range,
								 b.parity_l AS left_parity,
								 pl.description AS left_parity_desc,
								 b.parity_r AS right_parity,
								 pr.description AS right_parity_desc,
								 b.feature_code,
								 b.jurisdiction,
								 b.jurisdiction AS ownership,
								 b.oneway_dir_code AS one_way,
								 ow.description AS one_way_desc
						  FROM base_centreline_evw b 
						  JOIN DMN_CL_ADDRESS_PARITY pl ON pl.address_parity = b.parity_l
						  JOIN DMN_CL_ADDRESS_PARITY pr ON pr.address_parity = b.parity_r
						  JOIN DMN_CL_ONEWAY ow ON ow.oneway_dir_code = b.oneway_dir_code
						  WHERE b.linear_name_id = l.linear_name_id
						  ORDER BY 1
						) cc
				  ) AS segment
		   FROM linear_name_evw l
		   JOIN dmn_ln_activation_status a ON l.activation_status = a.activation_status
		   --JOIN dmn_ln_use_by u ON l.use_by = u.use_by	
		   WHERE l.linear_name_id = v_linear_name_id
	   ) m
	   JOIN dmn_ln_usage_status us ON us.usage_status = m.usage_status	  
    ) c	
	;	
   $BODY$;

ALTER FUNCTION code_src.get_lfn_by_id(numeric)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_lfn_by_id(numeric) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_lfn_by_id(numeric) TO network;

