-- FUNCTION: code_src.get_table_primary_key(text, text)

-- DROP FUNCTION code_src.get_table_primary_key(text, text);

CREATE OR REPLACE FUNCTION code_src.get_table_primary_key(
	v_schema_name text,
	v_table_name text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text;   
BEGIN  
/*
  Summary: 
    Get the primary key of the specified table
  Testing:
    SELECT get_table_primary_key('network', 'ige_task') -- task_id
	SELECT get_table_primary_key('network', 'ige_source') -- source_id
	SELECT get_table_primary_key('network', 'ige_source_evw') -- source_id
	SELECT get_table_primary_key('network', 'linear_name') -- linear_name_id
	SELECT get_table_primary_key('network', 'linear_name_evw') -- linear_name_id
	SELECT get_table_primary_key('network', 'linear_name_type') -- linear_name_type_id
	SELECT get_table_primary_key('network', 'linear_name_type_evw') -- linear_name_type_id
	SELECT get_table_primary_key('network', 'authorized_municipal_address') -- address_string_id
	SELECT get_table_primary_key('network', 'authorized_municipal_address_evw') -- address_string_id
*/

	SELECT a.attname INTO retval
	FROM  pg_index i
	JOIN  pg_attribute a ON a.attrelid = i.indrelid
	  AND a.attnum = ANY(i.indkey)
	WHERE  i.indrelid = lower(v_table_name)::regclass
	AND    i.indisprimary;
	IF is_blank_string(retval) THEN
	    SELECT column_name INTO retval
		FROM information_schema.columns
		WHERE table_name = lower(v_table_name) and table_schema = lower(v_schema_name)
		ORDER BY ordinal_position 
		LIMIT 1;
	END IF;
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN '';
END;  
$BODY$;

ALTER FUNCTION code_src.get_table_primary_key(text,text)
    OWNER TO network;
