-- FUNCTION: code_src.get_predefined_address_class(integer)

-- DROP FUNCTION code_src.get_predefined_address_class(integer);

CREATE OR REPLACE FUNCTION code_src.get_predefined_address_class(v_class_type integer
	)
    RETURNS json
    LANGUAGE 'sql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
  /*
    Summary:
	  Get pre-defined source information. v_class_type: 0: REGULAR; 1: RESERVED
    Testing:
	  SELECT get_predefined_address_class(0); 
	  SELECT get_predefined_address_class(1); 
  */
SELECT to_json(row)
FROM
(
 SELECT 
  (	
	SELECT json_agg(row_to_json(a)) 
	FROM 
	 (SELECT ABBR_DESCRIPTION as class, 
	         description
	     --, sort_sequence
	  FROM dmn_oar_class_flag
	  WHERe trans_id_expire = -1
	    AND 
	    (
			(v_class_type = 0 AND maint_stage = 'REGULAR' AND address_class_flag <> 11000)			
		  OR 
			(v_class_type = 1 AND maint_stage = 'RESERVED')
	    )
	  ORDER BY sort_sequence
	 ) a
  ) AS address_class 
	 

) row
 ;
$BODY$;

ALTER FUNCTION code_src.get_predefined_address_class(integer)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_predefined_address_class(integer) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_predefined_address_class(integer) TO network;

REVOKE ALL ON FUNCTION code_src.get_predefined_address_class(integer) FROM PUBLIC;
