-- FUNCTION: code_src.format_report(integer)

-- DROP FUNCTION code_src.format_report(integer);

CREATE OR REPLACE FUNCTION code_src.format_report(
	report_id integer)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval text;  
  v_rpt_data json;
  html_base text;
  v_title text;
  v_subtitle text;
  v_author text;
  v_data text;
  v_data_line text;
  rec v_report_daily_list%ROWTYPE;
  v_header text; 
  v_header_style text;
  v_rec_num integer;
  v_footer text;
  v_style text;
  v_row_style1 text;
  v_row_style2 text;
  v_title_array text[];
  v_row_array text[];
  v_cols integer;
  v_sql text;
BEGIN  
/*
  Summary: 
    Format a report in HTML;
  Testing:
    SELECT format_report(1); -- '[{"stats_type":"Source #","stats_count":0}, {"stats_type":"Task #","stats_count":0}, {"stats_type":"transaction #","stats_count":0}, {"stats_type":"Control task #","stats_count":0}, {"stats_type":"AMA #","stats_count":0}, {"stats_type":"LFN #","stats_count":0}]')	
    SELECT format_report(1);
	select json_array_length(rpt_daily())
	select json_each(rpt_daily()->0)
	select json_each_text(rpt_daily()->0)
	select json_object_keys(rpt_daily()->0)
	select * from json_populate_recordset(null::record, '[{"stats_type":"Source #","stats_count":0}, {"stats_type":"Task #","stats_count":0}, {"stats_type":"transaction #","stats_count":0}, {"stats_type":"Control task #","stats_count":0}, {"stats_type":"AMA #","stats_count":0}, {"stats_type":"LFN #","stats_count":0}]')
	  as 
	  ( stats_type text,
	    stats_count text
	  )
*/   
  html_base = '<style>
				   table 
				   {
				     border-collapse: collapse;
					 width:100%;
				   }
				   th, td 
				   {
					  padding: 2px;
				   }
				   th
				   {
				     [HEADER_STYLE]
				   }
				   .title
				   {
				     [TITLE_STYLE]
				   }
				   .subtitle
				   {
				     [SUBTITLE_STYLE]
				   }
				   .author
				   {
				     [AUTHOR_STYLE]
				   }
				   .footer
				   {
				     [FOOTER_STYLE]
				   }
				   .row_style1
				   {
				     [ROW_STYLE1]
				   }
				   .row_style2
				   {
				     [ROW_STYLE2]
				   }
				   .center
				   {
				     text-align:center;
				   }
				   .left
				   {
				     text-align:left;
				   }
				   .right
				   {
				     text-align:right;
				   }
				 </style>
				 <body>
				     <table>
					   [TITLE]
					   [SUBTITLE]
					   [AUTHOR]
					 </table>
					 <table border = 1>
					   <tr>
						 [REPORTHEADER]
					   </tr>					  
					   [DATA]					   
					 </table>
					 <table>
					   <tr><td>&nbsp;</td></tr>
					   <tr><td class=''footer''>[FOOTER]</td></tr> 					   
					 </table>
				 </body>
			 ';	
  retval = html_base;
  SELECT * INTO rec
  FROM v_report_daily_list
  WHERE id = report_id
  LIMIT 1;
  IF rec IS NOT NULL THEN
      v_sql = 'SELECT ' || rec.procedure_name || '()';
	  EXECUTE v_sql INTO v_rpt_data;
	  -- Generate title
	  v_title = rec.title;
	  IF v_title IS NOT NULL 
	    AND LENGTH(v_title) > 0 THEN
		v_title = REPLACE('<tr><td class=''title''>[TITLE]</td></tr>', '[TITLE]', v_title);
	  ELSE 
	    v_title = '';
	  END IF;
	  -- title style
	  SELECT coalesce(value, ' ') INTO v_style 
	  FROM configuration
	  WHERE category = 'report'
	    and type = 'settings'
		and name = 'title style';
	  IF v_style is null or length(trim(v_style)) = 0 THEN v_style = ''; END IF;	
	  retval = replace(retval,'[TITLE_STYLE]', v_style);
	  --raise notice 'After Title generation: %;', retval;
	  -- Generate subtitle
	  v_subtitle = rec.subtitle;
	  IF v_subtitle IS NOT NULL 
	    AND LENGTH(v_subtitle) > 0 THEN
		v_subtitle = REPLACE('<tr><td class=''subtitle''>[SUBTITLE]</td></tr>', '[SUBTITLE]', v_subtitle);
	  ELSE 
	    v_subtitle = '';
	  END IF;
	  -- subtitle style
	  SELECT coalesce(value, ' ') INTO v_style 
	  FROM configuration
	  WHERE category = 'report'
	    and type = 'settings'
		and name = 'subtitle style';
	  IF v_style is null or length(trim(v_style)) = 0 THEN v_style = ''; END IF;	
	  retval = replace(retval,'[SUBTITLE_STYLE]', v_style);
	  --raise notice 'After Subtitle generation: %;', retval;
	  -- Generate footer	  
	  IF rec.footer IS NOT NULL 
	    AND LENGTH(rec.footer) > 0 THEN
		v_footer = rec.footer;
	  ELSE 
	    v_footer = '';
	  END IF;
	  -- Generate author
	  v_author = rec.author;
	  IF v_author IS NOT NULL 
	    AND LENGTH(v_author) > 0 THEN
		v_author = REPLACE('<tr><td class=''author''>[AUTHOR]</td></tr>', '[AUTHOR]', v_author);
	  ELSE 
	    v_author = '';
	  END IF;
	  -- Author style
	  SELECT coalesce(value, ' ') INTO v_style 
	  FROM configuration
	  WHERE category = 'report'
	    and type = 'settings'
		and name = 'author style';
	  IF v_style is null or length(v_style) = 0 THEN v_style = ''; END IF;	
	  retval = replace(retval,'[AUTHOR_STYLE]', v_style);
	  --raise notice 'After Author generation: %;', retval;
	  -- Generate report data
	  --raise notice 'Title: %; Subtitle: %; Author: %', v_title, v_subtitle, v_author;
	  retval = replace(retval,'[TITLE]', v_title);
	  retval = replace(retval,'[SUBTITLE]', v_subtitle);
	  retval = replace(retval,'[FOOTER]', v_footer);
	  retval = replace(retval,'[AUTHOR]', v_author);
	  -- Generate table header
	  SELECT string_agg(f, '</th><th>') INTO v_header
	  FROM 
	    (
			SELECT json_object_keys(v_rpt_data->0) f
		) t;
	  v_header = '<th>' || v_header || '</th>';
	  retval = replace(retval,'[REPORTHEADER]', v_header);	
	  SELECT coalesce(value, ' ') INTO v_header_style 
	  FROM configuration
	  WHERE category = 'report'
	    and type = 'settings'
		and name = 'header style';
	  IF v_header_style is null or length(trim(v_header_style)) = 0 THEN v_header_style = ''; END IF;	
	  retval = replace(retval,'[HEADER_STYLE]', v_header_style);
	  -- Footer style
	  SELECT coalesce(value, ' ') INTO v_style 
	  FROM configuration
	  WHERE category = 'report'
	    and type = 'settings'
		and name = 'footer style';
	  IF v_style is null or length(trim(v_style)) = 0 THEN v_style = ''; END IF;	
	  retval = replace(retval,'[FOOTER_STYLE]', v_style);
	  -- Generate table data
	  SELECT json_array_length(v_rpt_data) INTO v_rec_num;
	  v_data = '';
	  -- Row style 1
	  SELECT coalesce(value, ' ') INTO v_row_style1 
	  FROM configuration
	  WHERE category = 'report'
	    and type = 'settings'
		and name = 'alternative row style 1';
	  IF v_row_style1 is null or length(trim(v_row_style1)) = 0 THEN v_row_style1 = ''; END IF;
	  retval = replace(retval, '[ROW_STYLE1]', v_row_style1);
	  -- Row style 2
	  SELECT coalesce(value, ' ') INTO v_row_style2 
	  FROM configuration
	  WHERE category = 'report'
	    and type = 'settings'
		and name = 'alternative row style 2';
	  IF v_row_style2 is null or length(trim(v_row_style2)) = 0 THEN v_row_style2 = ''; END IF;
	  retval = replace(retval, '[ROW_STYLE2]', v_row_style2);
	  -- Parse table data
	  SELECT ARRAY(SELECT json_object_keys(rpt_daily()->0)) INTO v_title_array;
	  
	  FOR row_num IN 0..v_rec_num -1 LOOP
	    v_data_line = '';
	    SELECT ARRAY
		    (
				SELECT value 
			    FROM json_each_text(v_rpt_data->row_num)
			) INTO v_row_array;
		--raise notice 'Header1:%; Col 1:%; Array length:%;', v_title_array[1], v_row_array[1], array_upper(v_title_array, 1);		
        FOR col_num IN 1..array_upper(v_title_array, 1) LOOP
		  --raise notice 'Header:%; Col:%; Array length:%;', v_title_array[col_num], v_row_array[col_num], array_upper(v_title_array, 1);		        
		  IF POSITION('[C]' IN v_title_array[col_num]) > 0 THEN
		    v_data_line = v_data_line || '<td class = ''center''>' || v_row_array[col_num] || '</td>';  
		  ELSIF POSITION('[L]' IN v_title_array[col_num]) > 0 THEN
		    v_data_line = v_data_line || '<td class = ''left''>' || v_row_array[col_num] || '</td>'; 
		  ELSIF POSITION('[R]' IN v_title_array[col_num]) > 0 THEN
		    v_data_line = v_data_line || '<td class = ''right''>' || v_row_array[col_num] || '</td>'; 	
	      END IF;		
		END LOOP;		
		-- Apply alternative row styles  
		IF row_num % 2 = 0 THEN 
		  v_data = v_data || '<tr class=''row_style1''>' || v_data_line || '</tr>';	
		ELSE 
		  v_data = v_data || '<tr class=''row_style2''>' || v_data_line || '</tr>';	
		END IF;  
	  END LOOP;
	  retval = replace(retval,'[DATA]', v_data);
	  -- Remove column alignment definiction
	  retval = format_report_placeholder(retval);	  
	  RETURN retval;
  ELSE 
	  RETURN '';
  END IF;	  
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;	
    RETURN 'Failed to format the report data: ' || SQLERRM;
END;  
$BODY$;

ALTER FUNCTION code_src.format_report(integer)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.format_report(integer) TO network;

REVOKE ALL ON FUNCTION code_src.format_report(integer) FROM PUBLIC;
