-- FUNCTION: network.fix_objectid_number(text)

-- DROP FUNCTION network.fix_objectid_number(text);

CREATE OR REPLACE FUNCTION network.fix_objectid_number(
	v_schema text DEFAULT current_schema::text 
	)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
    msg text := '';
	rec RECORD;
	tbl_rec RECORD;
	v_gap integer := 10000;
	dsql text;
	v_base_id integer;
	v_objectid integer;
	v_new_base_id integer;
	v_new_last_id integer;
BEGIN 
/*
Summary: 
  Issue: After registering table with ArcGIS, then importing data from other server, 
         the max(objectid) in the table might be greater than the next objectid (next_rowid), which would violate the unique object id constraint for the future
  Solution: Increase the next objectid manually to a bigger number		
Testing:
  SELECT fix_objectid_number()
*/  
  
  FOR rec IN SELECT t.schema,
                    coalesce(t.imv_view_name, t.table_name) AS table_name,
					t.registration_id,
					t.rowid_column
             FROM sde.sde_table_registry t
             WHERE schema = v_schema
	           AND database_name = current_database()
	         ORDER BY 1
  LOOP
      RAISE NOTICE 'Schema: %; Table_Name: %; Registration_id: %; Rowid_Column: %', 
	              rec.schema, 
				  rec.table_name, 
				  rec.registration_id,
				  rec.rowid_column;	   
	  dsql = 'SELECT LEAST(base_id, last_id) FROM i' || rec.registration_id;
	  EXECUTE dsql INTO v_base_id;
	  dsql = 'SELECT MAX(' || rec.rowid_column || ') FROM ' || rec.table_name;
	  EXECUTE dsql INTO v_objectid;	  
	  RAISE NOTICE 'BaseID: %; Max. Objectid: %', v_base_id, v_objectid;
	  IF v_base_id < v_objectid THEN 
	    RAISE NOTICE '******************************** Fixing ***************************';
	    -- Fix the value of row id column
		v_new_last_id = v_objectid + v_gap;
		v_new_base_id = v_new_last_id + 1;
		dsql = 'UPDATE i' || rec.registration_id || format(' SET base_id = %s, last_id = %s', v_new_base_id, v_new_last_id);		
		EXECUTE dsql;
		RAISE NOTICE 'SQL: %', dsql;
		RAISE NOTICE '******************************** Fixed ***************************';
	  END IF; 
	  RAISE NOTICE '---------------------------------------------------------------------';
  END LOOP;
  RETURN msg;
  EXCEPTION
  WHEN OTHERS THEN      
	RETURN SQLERRM;	
END
$BODY$;

ALTER FUNCTION network.fix_objectid_number(text)  OWNER TO network;
