-- View: network.v2_ama
 
-- DROP VIEW network.v2_ama;

CREATE OR REPLACE VIEW network.v2_ama AS
 SELECT a.address_string_id,
    a.trans_id_create,
    a.trans_id_expire,
    a.linear_name_id,
    a.lo_num,
    a.lo_num_suf,
    a.hi_num,
    a.hi_num_suf,
    a.objectid,
    a.usage_status,
    u2.description AS ama_usage_status_desc,
    a.sde_state_id,
    l.linear_name_id AS linear_name_id2,
    l.trans_id_create AS trans_id_create2,
    l.trans_id_expire AS trans_id_expire2,
    l.record_type,
    l.use_by,
    l.name_part,
    l.type_part,
    l.dir_part,
    l.description,
    l.activation_status,
    s.description AS activation_status_desc,
    l.approval_status,
    l.duplication_status,
    l.duplication_desc,
    l.authorized,
    l.usage_status AS lfn_usage_status,
    l.sde_state_id AS sde_state_id2,
    u.usage_status AS usage_status3,
    u.description AS lfn_usage_status_desc,
    u.sort_sequence,
    u.date_effective,
    u.date_expiry,
    u.trans_id_create AS trnas_id_create3,
    u.trans_id_expire AS trans_id_expire3
   FROM authorized_municipal_address_evw a
     JOIN linear_name_evw l ON a.linear_name_id = l.linear_name_id
     JOIN dmn_ln_usage_status u ON u.usage_status::text = l.usage_status::text
     JOIN dmn_ln_usage_status u2 ON u2.usage_status::text = a.usage_status::text
     JOIN dmn_ln_activation_status s ON l.activation_status::text = s.activation_status::text;

ALTER TABLE network.v2_ama
    OWNER TO network;

