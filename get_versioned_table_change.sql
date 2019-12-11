-- FUNCTION: code_src.get_versioned_table_change(text, text, text, numeric, text)

-- DROP FUNCTION code_src.get_versioned_table_change(text, text, text, numeric, text);

CREATE OR REPLACE FUNCTION code_src.get_versioned_table_change(
	v_version_owner text,
	v_schema_input text,
	v_schema_output text,
	v_trans_id_create numeric,
	v_table_name text)
    RETURNS SETOF text 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
    ROWS 1000
AS $BODY$
DECLARE
  /* select json_agg(row_to_json(c)) from (select source_id from network.ige_source_evw where trans_id_create = 1000000915 or trans_id_expire = 1000000915) c
    Summary:
	  Generate change statements from a versioned table
    Testing: SELECT sde.sde_edit_version('anchorto_run.TRANS1000000915', 1) ;
	  SELECT get_versioned_table_change('anchorto_run', 'network', 'anchor_ige', 1000000915, 'ige_source_evw')
	  SELECT get_versioned_table_change('anchorto_run', 'network', 'anchor_ige', 1000000915, 'linear_name_evw')
	  SELECT get_versioned_table_change('anchorto_run', 'network', 'anchor_ige', 5, 'ige_source_evw')
  */
  v_stmt text;
  o_status text;
  o_message text;
  v_version_name text;
  v_version text;
  v_sql_base text;
  v_sql text;
  v_sql_src text;
  v_sql_tgt text;
  v_json text;
  v_json_default text;
  v_json_result text;
  v_json_data text;
  v_pk text;
  v_input_view_name text;
  v_input_view_name_full text;
  v_input_base_table_name text;
  v_output_view_name text;
  v_output_view_name_full text;
  v_suf_pg text;
  v_suf_oracle text;
  v_col_list_insert text;
  v_col_list_update text;
  v_sql_col_insert text;
  v_sql_col_update text;
  v_sql_insert_base text;
  v_sql_update_base text;
  v_sql_insert_val text;
  v_sql_update_val text;
  v_insert_data text;
  v_update_data text;
  v_data text[];
  rec record;
  recary record;
  v_ret text;
  v_sql_all_cols text;
  v_all_col_list text;
BEGIN
  v_suf_pg = ''; --'_evw';
  v_suf_oracle = ''; --'_gv';
  v_input_view_name = v_table_name || v_suf_pg;
  v_input_base_table_name = replace(lower(v_table_name), '_evw', '');
  v_input_view_name_full = v_schema_input || '.' || v_input_view_name;
  v_output_view_name = v_table_name || v_suf_oracle;
  v_output_view_name_full = v_schema_output || '.' || v_output_view_name;
  IF lower(v_output_view_name_full) = 'authorized_municipal_address_evw' THEN -- this view name is too long in Oracle
    v_output_view_name_full = 'ama_evw';
  END IF;
  v_stmt = '';
  v_version_name = 'TRANS' || v_trans_id_create::text;
  v_version = v_version_owner || '.' || v_version_name;
  v_pk = get_table_primary_key(v_schema_input, v_table_name);
  raise notice 'Table PK:%', v_pk;
  -- Get data from default view 
  --SELECT sde.SDE_set_current_version ('sde.DEFAULT') into o_message;
  
  --v_sql = 'select json_agg(row_to_json(c)) from (select * from ige_source_evw where trans_id_create = 00000000 or trans_id_expire = 00000000) c';
  v_sql_base = 'select [source_id] from ige_source_evw where trans_id_create = 00000000 or trans_id_expire = 00000000';
  v_sql_base = REPLACE(v_sql_base, '[source_id]', v_pk);
  v_sql_base = REPLACE(v_sql_base, 'ige_source_evw', v_input_view_name_full);
  v_sql_base = REPLACE(v_sql_base, '00000000', v_trans_id_create::text);
  v_sql = 'select json_agg(row_to_json(c)) from ([SQL_BASE]) c';
  v_sql = REPLACE(v_sql, '[SQL_BASE]', v_sql_base);
  raise notice 'SQL1: %', v_sql;  
  SELECT sde.sde_set_default() INTO o_message;
  --SELECT sde.SDE_SET_CURRENT_VERSION('sde.DEFAULT') INTO o_message;
  raise notice 'Set to the default version:%', o_message;
  EXECUTE v_sql INTO v_json_default;
  raise notice 'JSON Default: %', v_json_default;
  SELECT SDE.SDE_SET_CURRENT_VERSION(v_version) INTO o_message;
 -- SELECT sde.sde_edit_version('anchorto_run.TRANS1000000915', 2) ;
  raise notice 'Set to the specific version:%', o_message;
  -- Get updated data from versioned view 
  -- Compare to the data in default view, get action
  EXECUTE v_sql INTO v_json;
  raise notice 'JSON Specific: %', v_json;
  
  IF v_json is null THEN 
    RETURN NEXT '';
	RETURN;
  END IF;
  -- Get all columns concated again the input base table  
  v_sql_all_cols = 'SELECT string_agg(column_name, '','') FROM (select * from information_schema.columns ORDER BY ordinal_position) s WHERE table_name = lower(''[ige_source_evw]'') and table_schema = lower(''[network]'') ';      
  v_sql_all_cols = REPLACE(v_sql_all_cols, '[ige_source_evw]', v_input_base_table_name);
  v_sql_all_cols = REPLACE(v_sql_all_cols, '[network]', v_schema_input);
  RAISE NOTICE 'v_sql_all_cols: %', v_sql_all_cols;  
  EXECUTE v_sql_all_cols INTO v_all_col_list;
  RAISE NOTICE 'v_all_col_list: %', v_all_col_list;
  v_all_col_list = REPLACE(v_all_col_list, ',', '||''@@@''||s.');
  RAISE NOTICE 're-formatted v_all_col_list: %', v_all_col_list;
  
  --v_sql_src = 'select case when t.[source_id] is null then ''INSERT'' when s.trans_id_create = s.trans_id_expire then ''DELETE'' ELSE ''UPDATE'' END as myaction, s.* from json_populate_recordset(null::ige_source_evw, ''[JSON]'') s' ||
  --v_sql_src = 'select case when t.[source_id] is null then ''INSERT'' ELSE ''UPDATE'' END as myaction, cast(s.[source_id] as text) from json_populate_recordset(null::ige_source_evw, ''[JSON]'') s' ||
  v_sql_src = 'select case when t.[source_id] is null then ''INSERT'' when s.trans_id_create = s.trans_id_expire then ''DELETE'' ELSE ''UPDATE'' END as myaction, cast(s.[source_id] as text) from json_populate_recordset(null::ige_source_evw, ''[JSON]'') s' ||
  ' left join json_populate_recordset(null::ige_source_evw, ''[JSONDEFAULT]'') t on t.[source_id] = s.[source_id] and t.[T_ALL_COL_VALS]  <> s.[S_ALL_COL_VALS] ORDER BY s.[source_id]'; 
  v_sql_src = REPLACE(v_sql_src, '[source_id]', v_pk ); 
  v_sql_src = REPLACE(v_sql_src, '[JSON]', v_json); -- quote_literal(v_json));
  v_sql_src = REPLACE(v_sql_src, '[JSONDEFAULT]', v_json_default);
  v_sql_src = REPLACE(v_sql_src,'null::ige_source_evw', 'null::' || v_input_view_name_full);
  v_sql_src = REPLACE(v_sql_src, '[S_ALL_COL_VALS]', v_all_col_list ); 
  v_sql_src = REPLACE(v_sql_src, '[T_ALL_COL_VALS]', replace(v_all_col_list, 's.', 't.' )); 
  raise notice 'SQL_src:%', v_sql_src;  
  v_sql_tgt = 'select json_agg(row_to_json(d)) from ([NEWSQL]) d';
  v_sql_tgt = REPLACE(v_sql_tgt, '[NEWSQL]', v_sql_src );
  raise notice 'SQL_tgt:%', v_sql_tgt;
  EXECUTE v_sql_tgt INTO o_message;
  raise notice 'msg:%', o_message; 
  
  -- Get columns list for inserting
  v_sql_col_insert = 'SELECT string_agg(column_name, '','') FROM (select * from information_schema.columns ORDER BY ordinal_position) s WHERE table_name = lower(''[ige_source_evw]'') and table_schema = lower(''[network]'') ';      
  v_sql_col_insert = REPLACE(v_sql_col_insert, '[ige_source_evw]', v_input_view_name);
  v_sql_col_insert = REPLACE(v_sql_col_insert, '[network]', v_schema_input);
  RAISE NOTICE 'sql_col_insert: %', v_sql_col_insert;  
  EXECUTE v_sql_col_insert INTO v_col_list_insert;
  RAISE NOTICE 'col_insert: %', v_col_list_insert;
  -- Get values
  v_sql_base = 'select * from ige_source_evw where trans_id_create = 00000000 or trans_id_expire = 00000000';
  v_sql_base = REPLACE(v_sql_base, '[source_id]', v_pk);
  v_sql_base = REPLACE(v_sql_base, 'ige_source_evw', v_input_view_name_full);
  v_sql_base = REPLACE(v_sql_base, '00000000', v_trans_id_create::text);
  v_sql_tgt = 'SELECT d.myaction||''@@@''||[s.***] as vals from ([NEWSQL]) d LEFT JOIN ([SQL_BASE]) s ON d.[source_id] = s.[source_id]::text';
  v_sql_tgt = REPLACE(v_sql_tgt, '[NEWSQL]', v_sql_src );
  v_sql_tgt = REPLACE(v_sql_tgt, '[SQL_BASE]', v_sql_base);
  v_sql_tgt = REPLACE(v_sql_tgt, '[source_id]', v_pk);
  v_sql_tgt = REPLACE(v_sql_tgt, '[s.***]', 's.' ||REPLACE(v_col_list_insert, ',', '||''@@@''||'));
  raise notice 'SQL_tgt:%', v_sql_tgt;  
  EXECUTE v_sql_tgt INTO o_message;
  RAISE NOTICE 'Values: %', o_message;
  v_sql_insert_base = 'INSERT INTO [ige_source_evw] (action, [COLS]) VALUES ([VALS])';
  v_sql_insert_base = REPLACE(v_sql_insert_base, '[ige_source_evw]', v_output_view_name_full );
  v_sql_insert_base = REPLACE(v_sql_insert_base, '[COLS]', v_col_list_insert );
  RAISE NOTICE 'sql_insert_base: %', v_sql_insert_base;
  --EXECUTE v_sql_tgt INTO v_data;
  FOR rec IN EXECUTE v_sql_tgt LOOP
    v_ret = convert_date_string(rec.vals);
	v_ret = '''' || REPLACE(v_ret, '@@@', ''',''') || '''';
	v_ret = REPLACE(v_ret, '''TO_DATE(', 'TO_DATE(');
	v_ret = REPLACE(v_ret, 'HH24:MI:SS'')''', 'HH24:MI:SS'')');
    raise notice 'Value:%', v_ret; 
	v_ret = REPLACE(v_sql_insert_base, '[VALS]', v_ret);
	raise notice 'INSERT STMT:%', v_ret; 
	RETURN NEXT v_ret;
  END LOOP;
 
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;   
	o_status = SQLSTATE;
	o_message = SQLERRM;	
	RETURN NEXT ''; 
	RETURN;
END;
$BODY$;

ALTER FUNCTION code_src.get_versioned_table_change(text, text, text, numeric, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_versioned_table_change(text, text, text, numeric, text) TO anchorto_run;

REVOKE EXECUTE ON FUNCTION code_src.get_versioned_table_change(text, text, text, numeric, text) FROM PUBLIC;

GRANT EXECUTE ON FUNCTION code_src.get_versioned_table_change(text, text, text, numeric, text) TO network;

