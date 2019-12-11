-- FUNCTION: code_src.generate_delete_statement(text, text, text, text)

-- DROP FUNCTION code_src.generate_delete_statement(text, text, text, text);

CREATE OR REPLACE FUNCTION code_src.generate_delete_statement(
	p_schema text,
	p_table text,
	p_where text,
	p_keycolumn text)
    RETURNS SETOF text 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
	SECURITY DEFINER
    ROWS 1000
AS $BODY$
 DECLARE
     dumptype_0 text;
	 dumptype_reset text;
     dumpquery_0 text;
     dumpquery_1 text;
     selquery text;
     selvalue text;
     valrec record;
     colrec record;
	 o_json text;
	 p_val text;
	 mytype text;
	 errmsg text;

 BEGIN
     dumptype_0 := '';
	 dumptype_reset := '';

     -- ------ --
     -- GLOBAL --
     --   build base INSERT
     --   build SELECT array[ ... ]

     dumpquery_0 := 'DELETE FROM ' || quote_ident(p_table) || ' where ' || p_keycolumn || ' = ';
	 selquery    := 'SELECT array[';
     
     <<label0>>
	 
     FOR colrec IN SELECT table_schema, table_name, column_name, data_type
                   FROM information_schema.columns
                   WHERE table_name = p_table and table_schema = p_schema and column_name = p_keycolumn
                   ORDER BY ordinal_position
     LOOP
	     dumptype_reset := dumptype_reset || colrec.data_type || ',';
         --dumpquery_0 := dumpquery_0 || quote_ident(colrec.column_name) || ',';
		 p_val = colrec.column_name || ',' || colrec.data_type;
		 selquery := selquery    || 'CAST(' || quote_ident(colrec.column_name) || ' AS TEXT),';
		 raise notice '%',selquery;
     END LOOP label0;
     
     --dumpquery_0 := substring(dumpquery_0 ,1,length(dumpquery_0)-1) || ')';
     --dumpquery_0 := dumpquery_0 || ' VALUES (';
     selquery    := substring(selquery    ,1,length(selquery)-1)    || '] AS MYARRAY';
     selquery    := selquery    || ' FROM ' ||quote_ident(p_schema)||'.'||quote_ident(p_table);
     selquery    := selquery    || ' WHERE '||p_where;
     -- GLOBAL --
     -- ------ --

     -- ----------- --
     -- SELECT LOOP --
     --   execute SELECT built and loop on each row
	 raise notice 'datatype :%', dumptype_0;
     <<label1>>
	 
	 
     FOR valrec IN  EXECUTE  selquery
     LOOP
	     --raise notice 'valrec.%', valrec;
         dumpquery_1 := '';
         IF not found THEN
             EXIT ;
         END IF;

         -- ----------- --
         -- LOOP ARRAY (EACH FIELDS) --
		 dumptype_0 := dumptype_reset;
         <<label2>>
		 
         FOREACH selvalue in ARRAY valrec.MYARRAY
         LOOP
		     select substr(dumptype_0,0,position(',' in dumptype_0)) into mytype;
             select substr(dumptype_0,position(',' in dumptype_0) + 1) into dumptype_0;
			 raise notice 'type:%',mytype;
             IF selvalue IS NULL THEN
			    IF mytype in ('character varying','text') THEN
					selvalue := 'NULL';
				ELSE
		            selvalue := 'NULL';
			    END IF;
             ELSE 
				IF mytype in ('character varying','text') THEN
				    selvalue := quote_literal(selvalue);
				END IF;
				IF mytype in ('timestamp without time zone') THEN
					selvalue := 'TO_DATE ('||quote_literal(selvalue)||','||quote_literal('YYYY-MM-DD HH24:MI:SS')||')';							 
			    END IF;							 
             END IF;
             dumpquery_1 := dumpquery_1 || selvalue || ',';
         END LOOP label2;
         --dumpquery_1 := substring(dumpquery_1 ,1,length(dumpquery_1)-1) || ');';
		 dumpquery_1 := substring(dumpquery_1 ,1,length(dumpquery_1)-1) ;
         -- LOOP ARRAY (EACH FIELD) --
         -- ----------- --

         -- debug: RETURN NEXT dumpquery_0 || dumpquery_1 || ' --' || selquery;
         -- debug: RETURN NEXT selquery;
		 raise notice 'd0 :%', dumpquery_0;
		 raise notice 'd1 :%', dumpquery_1;
         RETURN NEXT dumpquery_0 || dumpquery_1;

     END LOOP label1 ;
     -- SELECT LOOP --
     -- ----------- --

 RETURN ;
EXCEPTION
 WHEN OTHERS THEN
   RAISE NOTICE '%', SQLERRM;
   errmsg := SQLERRM;
   RETURN QUERY SELECT p_schema || ' '|| p_table ||' ' || p_where || ' ' || errmsg;
 END;
 $BODY$;

ALTER FUNCTION code_src.generate_delete_statement(text, text, text, text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.generate_delete_statement(text, text, text, text) TO anchorto_run;

GRANT EXECUTE ON FUNCTION code_src.generate_delete_statement(text, text, text, text) TO network;

REVOKE ALL ON FUNCTION code_src.generate_delete_statement(text, text, text, text) FROM PUBLIC;
