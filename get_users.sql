-- FUNCTION: code_src.get_users()

-- DROP FUNCTION code_src.get_users();

CREATE OR REPLACE FUNCTION code_src.get_users(
	)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
    ROWS 1000
	SECURITY DEFINER
AS $BODY$
  /*
    Summary:
	  Get user list
    Testing:
	  SELECT get_users()
  */
select to_json(row) 
from 
(select user_id,username,full_name fullname,email,business_unit,status,status_date,
  (select json_agg(row_to_json(c)) from (select steward_group as steward_group from ige_user_steward where ige_user_steward.user_id = ige_user.user_id) c) as steward_group 
 from ige_user order by user_id) row;
   $BODY$;

ALTER FUNCTION code_src.get_users() OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.get_users() TO anchorto_run