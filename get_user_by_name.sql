-- FUNCTION: code_src.get_user_by_name(text)

-- DROP FUNCTION code_src.get_user_by_name(text);

CREATE OR REPLACE FUNCTION code_src.get_user_by_name(
	a text)
    RETURNS SETOF json 
    LANGUAGE 'sql'

    COST 100
    VOLATILE 
    ROWS 1000
	SECURITY DEFINER
AS $BODY$
 /*
    Summary:
	  Get user information by user name
    Testing:
	  SELECT get_user_by_name('rli4')
  */
select to_json(row) 
from 
(
	select user_id,
	       username,
	       full_name fullname,
	       email,
	       business_unit,
	       status,
	       status_date,
	       (
			   SELECT t.task_type 
			   FROM ige_task_active ta
			   JOIN ige_task t ON ta.task_id = t.task_id
			   WHERE ta.username = a
		   ) AS active_task_type,
	       (
			   SELECT ta.task_id 
			   FROM ige_task_active ta			   
			   WHERE ta.username = a
		   ) AS active_task_id,
          (
		    select json_agg(row_to_json(c)) 
		    from 
		    ( 
			  select ige_user_steward.steward_group as steward_group,
			         dmn_steward_group.description as description,
			         dmn_steward_group.sort_sequence
			  from ige_user_steward, dmn_steward_group 
			  where ige_user_steward.user_id = ige_user.user_id 
			  and ige_user_steward.steward_group = dmn_steward_group.steward_group 
			  and dmn_steward_group.trans_id_expire = -1
			  ORDER BY dmn_steward_group.sort_sequence
		    ) c
     ) as steward_group 	
    from ige_user where upper(ige_user.username) = upper(a) 
	order by user_id
) row;
$BODY$;

ALTER FUNCTION code_src.get_user_by_name(text) OWNER TO network;
GRANT EXECUTE ON FUNCTION code_src.get_user_by_name(text) TO anchorto_run
