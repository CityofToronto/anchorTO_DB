-- FUNCTION: code_src.get_change_statements(text, text,text, numeric)

-- DROP FUNCTION code_src.get_change_statements(text, text, text,numeric);

CREATE OR REPLACE FUNCTION code_src.get_change_statements(
	v_version_owner text,
	v_schema_input text,
	v_schema_output text,
    v_trans_id_create numeric)
   RETURNS SETOF text 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE
  /*
    Summary:
	  Generate change statements from all versioned table except ige_source_evw:linear_name_evw, linear_name_type_evw, authorized_municipal_address
    Testing:
	  SELECT get_change_statements('anchorto_run', 'network', 'anchor_ige', 1000000915)
	  SELECT get_change_statements('anchorto_run', 'network', 'anchor_ige', 5)
	  SELECT get_versioned_table_change('anchorto_run', 'network', 'anchor_ige', 1000000915, 'ige_source_evw')
  */
  v_stmt text[];
  o_status text;
  o_message text;  
  v_ret text;
  v_returned boolean;
BEGIN
  v_returned = false;
  SELECT sde.sde_set_default() INTO o_message;
  raise notice '------------------Set to default version:%', o_message; 
  /*FOR v_ret IN SELECT get_versioned_table_change(v_version_owner, v_schema_input, v_schema_output, v_trans_id_create, 'ige_source_evw') LOOP
    --RAISE NOTICE '----------%', v_ret;   
	IF v_ret <> '' THEN 
	  v_returned = true;
      RETURN NEXT v_ret;
	END IF;
  END LOOP;*/
  FOR v_ret IN SELECT get_versioned_table_change(v_version_owner, v_schema_input, v_schema_output, v_trans_id_create, 'linear_name_evw') LOOP
    --RAISE NOTICE '----------%', v_ret;   
	IF v_ret <> '' THEN 
	  v_returned = true;
      RETURN NEXT v_ret;
	END IF;
  END LOOP;
  FOR v_ret IN SELECT get_versioned_table_change(v_version_owner, v_schema_input, v_schema_output, v_trans_id_create, 'linear_name_type_evw') LOOP
    --RAISE NOTICE '----------%', v_ret;   
    IF v_ret <> '' THEN 
	  v_returned = true;
      RETURN NEXT v_ret;
	END IF;
  END LOOP;
  FOR v_ret IN SELECT get_versioned_table_change(v_version_owner, v_schema_input, v_schema_output, v_trans_id_create, 'authorized_municipal_address_evw') LOOP
    --RAISE NOTICE '----------%', v_ret;   
    IF v_ret <> '' THEN 
	  v_returned = true;
      RETURN NEXT v_ret;
	END IF;
  END LOOP;
  
  IF NOT v_returned THEN
     RETURN NEXT ''; 
  END IF;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;   
	o_status = SQLSTATE;
	o_message = SQLERRM;
	RETURN NEXT 'Error message:%', o_message; 
	RETURN;
END;
$BODY$;

ALTER FUNCTION code_src.get_change_statements(text, text,text, numeric)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_change_statements(text, text, text,numeric) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.get_change_statements(text, text, text,numeric) TO network;

