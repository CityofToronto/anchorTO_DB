-- FUNCTION: network.getpredefineduserinfo()

-- DROP FUNCTION network.getpredefinedsourceinfo();

CREATE OR REPLACE FUNCTION network.getpredefinedsourceinfo(
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
	 (SELECT source_class AS name, description AS desc, sort_sequence
	  FROM dmn_source_class
	  where trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) a
  ) AS source_class,  
  (
	 SELECT json_agg(row_to_json(b)) 
	 FROM 
	 (SELECT report_status AS name,description AS desc, sort_sequence
	  FROM dmn_report_status
	  where trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) b
  ) AS report_status,	 
  (
	 SELECT json_agg(row_to_json(c)) 
	 FROM 
	 (SELECT report_type AS name,description AS desc, sort_sequence
	  FROM dmn_report_type
	  where trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) c
   ) AS report_type,	 
  (
	 SELECT json_agg(row_to_json(d)) 
	 FROM 
	 (SELECT plan_status AS name,description AS desc, sort_sequence
	  FROM dmn_plan_status
	  where trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) d
   ) AS plan_status,	 
  (
	 SELECT json_agg(row_to_json(d)) 
	 FROM 
	 (SELECT plan_type AS name,description AS desc, sort_sequence
	  FROM dmn_plan_type
	  where trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) d
   ) AS plan_type
) row
 ;
$BODY$;

ALTER FUNCTION network.getpredefinedsourceinfo()
    OWNER TO network;
