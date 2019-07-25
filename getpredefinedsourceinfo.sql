-- FUNCTION: network.getpredefinedsourceinfo()

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
	 (SELECT source_class AS name, description AS desc, CONTROL_TASK_TYPE, sort_sequence
	  FROM dmn_source_class
	  where trans_id_expire = -1
	  ORDER BY sort_sequence
	 ) a
  ) AS source_class 
	 

) row
 ;
$BODY$;

ALTER FUNCTION network.getpredefinedsourceinfo()
    OWNER TO network;
