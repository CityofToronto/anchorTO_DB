-- FUNCTION: network.get_predefined_source_info()

-- DROP FUNCTION network.get_predefined_source_info();

CREATE OR REPLACE FUNCTION network.get_predefined_source_info(
	)
    RETURNS json
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
AS 
$BODY$
  /*
    Summary:
	  Get pre-defined source information
    Testing:
	  SELECT get_predefined_source_info(); 
  */
SELECT to_json(row)
FROM
(
 SELECT 
  (	
	SELECT json_agg(row_to_json(a)) 
	FROM 
	 (SELECT source_class AS name, description AS desc, CONTROL_TASK_TYPE, sort_sequence
	  FROM dmn_source_class
	  where trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) a
  ) AS source_class 
	 

) row
 ;
$BODY$;

ALTER FUNCTION network.get_predefined_source_info()
    OWNER TO network;
