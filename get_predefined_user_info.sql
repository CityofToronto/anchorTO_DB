-- FUNCTION: network.get_predefined_user_info()

-- DROP FUNCTION network.get_predefined_user_info();

CREATE OR REPLACE FUNCTION network.get_predefined_user_info(
	)
    RETURNS json
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
AS $BODY$
  /*
    Summary:
	  Get pre-defined user information
    Testing:
	  SELECT get_predefined_user_info()
  */
SELECT to_json(row)
FROM
(
 SELECT 
  (	
	SELECT json_agg(row_to_json(a)) 
	FROM 
	 (SELECT steward_group, 
			 description AS desc,
	         sort_sequence
	  FROM dmn_steward_group
	  where trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) a
  ) AS privilege,  
  (
	 SELECT json_agg(row_to_json(b)) 
	 FROM 
	 (SELECT steward_status AS name,sort_sequence
	  FROM dmn_steward_status
	  where trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) b
  ) AS status,	 
  (
	 SELECT json_agg(row_to_json(c)) 
	 FROM 
	 (SELECT business_unit AS name,sort_sequence
	  FROM dmn_business_unit
	  where trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) c
   ) AS bizunit
) row
 ;
$BODY$;

ALTER FUNCTION network.get_predefined_user_info()
    OWNER TO network;
