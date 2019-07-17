-- FUNCTION: network.updateuserinfo(text)

-- DROP FUNCTION network.updateuserinfo(text);

CREATE OR REPLACE FUNCTION network.updateuserinfo(
	info text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE 
  o_status text;
  o_userid text;
  v_user_id bigint;
  o_message text;
  i_business_unit text;
  i_email text;
  i_full_name text;
  i_status text;
  i_steward_group json;
  i_user_name text;
  o_json text;  
  isnew boolean;
BEGIN  
  o_status = 'OK';
  o_message = '';
  o_userid = -1;
  isnew = false;
  SELECT $1::json->>'user_id',
         $1::json->>'business_unit',
		 $1::json->>'email',
		 $1::json->>'fullname',
		 $1::json->>'status',
		 $1::json->'steward_group',
		 $1::json->>'username'
    INTO o_userid,
         i_business_unit,
		 i_email,
		 i_full_name,
		 i_status,
		 i_steward_group,
		 i_user_name;
  IF o_userid IS null 
    OR o_userid = '0'
	OR o_userid = ''
	OR o_userid = 'null' THEN
	isnew = true;		
  END IF;
  RAISE NOTICE 'BU %', i_business_unit;
  RAISE NOTICE 'UID %', o_userid;
  RAISE NOTICE 'email %', i_email;
  RAISE NOTICE 'fullName %', i_full_name;
  RAISE NOTICE 'Status %', i_status;
  RAISE NOTICE 'GRP %', i_steward_group;
  RAISE NOTICE 'UName %', i_user_name; 
  --BEGIN TRANSACTION;
  IF isnew THEN       
    INSERT INTO ige_user (username, email, business_unit, status, status_date, full_name)	            
	  VALUES 	  
	  (
		  i_user_name,
		  i_email,
		  i_business_unit,
		  i_status,
		  now(),
		  i_full_name
	  )
	  RETURNING user_id::text INTO o_userid;
	  -- Beginning of updating Oracle to sync
	  INSERT INTO imaint_oracle.ige_user(user_id, username, email, business_unit, status, status_date, first_name, last_name)
	  VALUES 	  
	  (
		  o_userid::int,
		  i_user_name,
		  i_email,
		  i_business_unit,
		  i_status,
		  now(),
		  split_part(i_full_name, ' ', 1),
		  split_part(i_full_name, ' ', 2)
	  );
	  -- End of updating Oracle to sync
	  RAISE NOTICE 'Updated Oracle ige_user table: %', o_userid;
  ELSE    
    UPDATE ige_user
	  SET username = i_user_name,
		  email = i_email,
		  business_unit = i_business_unit,
		  status = i_status,
		  status_date = now(),
		  full_name = i_full_name
	WHERE user_id = o_userid::bigint;
	DELETE FROM ige_user_steward WHERE user_id = o_userid::bigint;
	-- Beginning of updating Oracle to sync
	UPDATE imaint_oracle.ige_user
	  SET username = i_user_name,
		  email = i_email,
		  business_unit = i_business_unit,
		  status = i_status,
		  status_date = now(),
		  first_name = split_part(i_full_name, ' ', 1),
		  last_name = split_part(i_full_name, ' ', 1)
	WHERE user_id = o_userid::bigint;
	DELETE FROM imaint_oracle.ige_user_steward WHERE user_id = o_userid::bigint;
	-- End of updating Oracle to sync
  END IF;
  
  INSERT INTO ige_user_steward
    SELECT o_userid::bigint, 
	       json_array_elements_text(i_steward_group);
	--       value#>>'{}' 
	--FROM json_array_elements('["SITE_AREA_MAINT","AMA_MAINT"]');
	--FROM json_array_elements_text(i_steward_group);
	
  -- Beginning of updating Oracle to sync
  INSERT INTO imaint_oracle.ige_user_steward
    SELECT user_id,
	       steward_group,
		   'N',
		   'Y'
	FROM ige_user_steward   
    WHERE user_id = o_userid::int; 
--	       json_array_elements_text(i_steward_group);   
  RAISE NOTICE 'Updated Oracle ige_user_steward table: %', o_userid; 
  -- End of updating Oracle to sync
  SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   o_userid userid
	) c;
	--COMMIT;
	RETURN o_json;
  EXCEPTION 
  WHEN unique_violation THEN
    o_status = SQLSTATE;
	o_message = 'Duplicate user name';	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   o_userid userid
	) c;
	RETURN o_json;
  WHEN 	foreign_key_violation THEN
    o_status = SQLSTATE;
	o_message = 'Invalid status';	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   o_userid userid
	) c;
	RETURN o_json;
  WHEN OTHERS THEN 
    o_status = SQLSTATE;
	o_message = SQLERRM;	
	SELECT row_to_json(c) INTO o_json
	FROM
	(
	  SELECT o_status status, 
	       o_message message,
		   o_userid userid
	) c;
	--ROLLBACK;
	RETURN o_json;
END;  
$BODY$;

ALTER FUNCTION network.updateuserinfo(text)
    OWNER TO network;
