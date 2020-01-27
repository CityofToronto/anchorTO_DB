select name, 
       --defn,
	   --pos_sum as pos_start,
	   --greatest(pos_sum, pos_test) as pos_end,
	   --pos_test,	  
	   --pos_def_start,
	   --pos_def_end,
	   replace(substring(defn, pos_def_start, pos_def_end - pos_def_start + 1), 'CREATE OR REPLACE FUNCTION code_src.','') as fun_def,
	   trim(regexp_replace(substring(defn, pos_sum, greatest(pos_sum, pos_test) - pos_sum), E'[\\n\\r\\t]+', ' ', 'g')) as summary
from (	   
    select name,
		   defn,
		   position('Summary:' in defn) + 8 as pos_sum,
		   position('Testing' in defn) - 1 as pos_test,
	       position('CREATE ' in defn) as pos_def_start,
		   position(')' in defn) as pos_def_end
	from
	(
	select 
		p.proname as name,
		--p.pronamespace::pg_catalog.regnamespace,
		pg_catalog.pg_get_functiondef(p.oid) as defn
	from pg_catalog.pg_proc p
	JOIN pg_catalog.pg_namespace AS ns ON p.pronamespace = ns.oid
	where p.proisagg is false
		and ns.nspname = 'code_src'
	order by 1
	) a
) b
where name not in ('create_transaction2', 'generate_insert_statement2','get_source_by_id2', 'search_ama2', 'search_ama3','update_source2','validate_test')