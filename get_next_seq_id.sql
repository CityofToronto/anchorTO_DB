-- FUNCTION: code_src.get_next_seq_id(text)

-- DROP FUNCTION code_src.get_next_seq_id(text);

CREATE OR REPLACE FUNCTION code_src.get_next_seq_id(seqname text)
	 
    RETURNS numeric(12,0)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$
DECLARE 
  retval numeric(12,0);  
BEGIN  
/*
    Summary:
	  Get next sequence id
    Testing:
	  select get_next_seq_id('address_string_id_seq'); 
  */
  SELECT nextval(seqname)::numeric(12,0) INTO retval;    
  
  RETURN retval;
EXCEPTION 
  WHEN OTHERS THEN
    RAISE NOTICE '%', SQLERRM;
    RETURN -1;
END;  
$BODY$;

ALTER FUNCTION code_src.get_next_seq_id(text)
    OWNER TO network;

GRANT EXECUTE ON FUNCTION code_src.get_next_seq_id(text) TO anchorto_run;


GRANT EXECUTE ON FUNCTION code_src.get_next_seq_id(text) TO network;

