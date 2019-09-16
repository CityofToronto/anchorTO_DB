-- FUNCTION: code_src.get_user_by_id(integer)

-- DROP FUNCTION code_src.get_user_by_id(integer);

CREATE OR REPLACE FUNCTION code_src.get_user_by_id(
	a integer)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
    ROWS 1000
	SECURITY DEFINER
AS $BODY$
/*
Summary:
  Get user information by id
Testing:
  SELECT get_user_by_id(60)
*/
select to_json(row) 
from 
(select user_id,username,full_name fullname,email,business_unit,status,status_date,
  (select json_agg(row_to_json(c)) from ( select ige_user_steward.steward_group as steward_group,dmn_steward_group.description as description, dmn_steward_group.sort_sequence from ige_user_steward, dmn_steward_group where ige_user_steward.user_id = ige_user.user_id and ige_user_steward.steward_group = dmn_steward_group.steward_group and dmn_steward_group.trans_id_expire = -1 ORDER BY dmn_steward_group.sort_sequence) c) as steward_group 
 from ige_user where ige_user.user_id = a order by user_id) row;$BODY$;

ALTER FUNCTION code_src.get_user_by_id(integer) OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.get_user_by_id(integer) TO anchorto_run