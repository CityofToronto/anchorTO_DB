-- FUNCTION: network.get_message(integer, text, text, text, text, text, text, text, text, text, text, text)

-- DROP FUNCTION network.get_message(integer, text, text, text, text, text, text, text, text, text, text, text);

CREATE OR REPLACE FUNCTION network.get_message(
	msg_no integer,
	msg_type text,
	msg_cat text,
	custom_val1 text DEFAULT NULL::text,
	custom_val2 text DEFAULT NULL::text,
	custom_val3 text DEFAULT NULL::text,
	custom_val4 text DEFAULT NULL::text,
	custom_val5 text DEFAULT NULL::text,
	custom_val6 text DEFAULT NULL::text,
	custom_val7 text DEFAULT NULL::text,
	custom_val8 text DEFAULT NULL::text,
	custom_val9 text DEFAULT NULL::text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE    
  msg text;
BEGIN  
  msg = '';
  SELECT message INTO msg
  FROM ige_messages t
  WHERE t.message_number = msg_no
    AND t.message_category = msg_cat
	AND t.message_type = msg_type;
  msg = format_message(msg, custom_val1);
  msg = format_message(msg, custom_val2);
  msg = format_message(msg, custom_val3);
  msg = format_message(msg, custom_val4);
  msg = format_message(msg, custom_val5);
  msg = format_message(msg, custom_val6);
  msg = format_message(msg, custom_val7);
  msg = format_message(msg, custom_val8);
  msg = format_message(msg, custom_val9);
  IF msg_type <> 'INFO' THEN 
     msg := msg_cat||'-'||msg_no||': '||msg;
  END IF; 
  RETURN format_string(msg);
EXCEPTION 
  WHEN NO_DATA_FOUND THEN
    msg = 'Internal error: Invalid ' || message_type || ' message #: '|| message_cat||'-'||message_no||'.  ';
    RETURN msg;
  WHEN OTHERS THEN     
    RETURN SQLERRM;
END;  
$BODY$;

ALTER FUNCTION network.get_message(integer, text, text, text, text, text, text, text, text, text, text, text)
    OWNER TO network;
