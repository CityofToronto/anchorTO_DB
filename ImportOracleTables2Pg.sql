import foreign schema "IGE"
limit to (ige_user)
from server imaint_oracle into imaint_oracle;

import foreign schema "IGE"
limit to (ige_user_steward)
from server imaint_oracle into imaint_oracle;

import foreign schema "IGE"
limit to (ige_task, ige_transaction)
from server imaint_oracle into imaint_oracle;

import foreign schema "IGE"
limit to (ige_mesages)
from server imaint_oracle into imaint_oracle;

insert into ige_task (
task_id,task_type, source_id, assigned_to, taken_by, task_sequence, task_status,task_comments, control_task_id, task_category, trans_id_create, trans_id_expire)
select task_id,task_type, source_id, assigned_to, taken_by, task_sequence, task_status,task_comments, control_task_id, task_category, trans_id_create, trans_id_expire
from imaint_oracle.ige_task 
where task_id >= 25000 and task_id < 30000;

select count(*) from ige_task;
--select * from imaint_oracle.ige_source_presentation limit 10;
select * from imaint_oracle.ige_user;
select * from imaint_oracle.ige_user_steward;
select * from imaint_oracle.ige_task limit 10;
select * from imaint_oracle.ige_transaction limit 10;
select * from imaint_oracle.ige_mesages;


