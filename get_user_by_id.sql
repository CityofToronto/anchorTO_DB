-- FUNCTION: network.get_user_by_id(integer)

-- DROP FUNCTION network.get_user_by_id(integer);

CREATE OR REPLACE FUNCTION network.get_user_by_id(
	a integer)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
    ROWS 1000
AS 
$BODY$
  /*
    Summary:
	  Get user by user id
    Testing:
	  SELECT get_user_by_id(55)
  */
select to_json(row) 
from 
(select user_id,username,full_name fullname,email,business_unit,status,status_date,
  (select json_agg(row_to_json(c)) from ( select ige_user_steward.steward_group as steward_group,dmn_steward_group.description as description, dmn_steward_group.sort_sequence from ige_user_steward, dmn_steward_group where ige_user_steward.user_id = ige_user.user_id and ige_user_steward.steward_group = dmn_steward_group.steward_group and dmn_steward_group.trans_id_expire = -1 ORDER BY dmn_steward_group.sort_sequence) c) as steward_group 
 from ige_user where ige_user.user_id = a order by user_id) row;$BODY$;

ALTER FUNCTION network.get_user_by_id(integer)
    OWNER TO network;
