CREATE OR REPLACE VIEW network.v_lfn AS  -- select * from v_lfn
SELECT cm.*	       
	 FROM
	 (
	   SELECT m.objectid,
			  m.linear_name_id,
			  m.name_part,
			  m.type_part,
			  m.dir_part,
		      m.description,
		      m.activation_status,
			  m.activation_status_desc,
			  m.duplication_status,
			  m.duplication_desc,	          
			  m.used_by,
		      m.used_by_desc,
		      m.usage_status,
	          us.description AS usage_status_desc,
		      m.authorized
	   FROM 
	   (
		   SELECT l.objectid,
				  l.linear_name_id,
				  l.name_part,
				  l.type_part,
				  l.dir_part,
		          l.description,
		          l.activation_status,
				  a.description AS activation_status_desc,
				  l.duplication_status,
				  l.duplication_desc,
		          l.use_by AS used_by,
				  u.description AS used_by_desc,
		          l.authorized,
		          l.usage_status			  
		   FROM linear_name_evw l
		   JOIN dmn_ln_activation_status a ON l.activation_status = a.activation_status
		   JOIN dmn_ln_use_by u ON l.use_by = u.use_by			   
	   ) m
	   LEFT JOIN dmn_ln_usage_status us ON us.usage_status = m.usage_status
	  ) cm