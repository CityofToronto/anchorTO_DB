-- FUNCTION: network.getpredefineduserinfo()

-- DROP FUNCTION network.getpredefineduserinfo();

CREATE OR REPLACE FUNCTION network.getpredefineduserinfo(
	) 
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

ALTER FUNCTION network.getpredefineduserinfo()
    OWNER TO network;
