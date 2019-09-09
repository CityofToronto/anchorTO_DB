-- FUNCTION: network.get_users()

-- DROP FUNCTION network.get_users();

CREATE OR REPLACE FUNCTION network.get_users(
	)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
    ROWS 1000
AS 
$BODY$
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

ALTER FUNCTION network.get_users()
    OWNER TO network;
