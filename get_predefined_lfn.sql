-- FUNCTION: network.get_predefined_lfn()

-- DROP FUNCTION network.get_predefined_lfn();

CREATE OR REPLACE FUNCTION network.get_predefined_lfn()
    RETURNS json
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
AS $BODY$
SELECT to_json(row)
FROM
(
 SELECT 
  (	
	SELECT json_agg(row_to_json(a)) 
	FROM 
	 (
		 SELECT type_part AS name,
		        type_part_code AS code
		 FROM linear_name_type 
		 WHERE trans_id_expire = -1
		 ORDER BY 1		 
	 ) a
  ) AS lfn_type,  
  (
	 SELECT json_agg(row_to_json(b)) 
	 FROM 
	 (
		  SELECT dir_part AS name,
		         dir_part_code AS code
	      FROM linear_name_direction
	      WHERE trans_id_expire = -1
	      ORDER BY linear_name_dir_id
	 ) b
  ) AS lfn_direction,
  (
	 SELECT json_agg(row_to_json(c)) 
	 FROM 
	 (
		  SELECT activation_status AS status,
		         description AS desc
	      FROM dmn_ln_activation_status
	      WHERE trans_id_expire = -1
	      ORDER BY sort_sequence
	 ) c
  ) AS activation_status,
  (
	 SELECT json_agg(row_to_json(d)) 
	 FROM 
	 (
		  SELECT approval_status AS status,
		         description AS desc
	      FROM dmn_ln_approval_status
	      WHERE trans_id_expire = -1
	      ORDER BY sort_sequence
	 ) d
  ) AS approval_status,
  (
	 SELECT json_agg(row_to_json(g)) 
	 FROM 
	 (
		  SELECT use_by,
		         description AS desc
	      FROM dmn_ln_use_by
	      WHERE trans_id_expire = -1
	      ORDER BY sort_sequence
	 ) g
  ) AS used_by,
  (
	 SELECT json_agg(row_to_json(f)) 
	 FROM 
	 (
		  SELECT usage_status AS status,
		         description AS desc
	      FROM dmn_ama_usage_status
	      WHERE trans_id_expire = -1
	      ORDER BY sort_sequence
	 ) f
  ) AS usage_status	
) row
 ;
$BODY$;

ALTER FUNCTION network.get_predefined_lfn()
    OWNER TO network;
