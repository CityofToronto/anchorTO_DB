-- FUNCTION: network.v58_update(numeric, numeric, numeric, numeric, integer, character varying, integer, character varying, integer, integer, character varying, bigint)

-- DROP FUNCTION network.v58_update(numeric, numeric, numeric, numeric, integer, character varying, integer, character varying, integer, integer, character varying, bigint);

CREATE OR REPLACE FUNCTION network.v58_update(
	n_address_string_id numeric,	
	n_trans_id_create numeric,
	n_trans_id_expire numeric,
	n_linear_name_id numeric,
	n_lo_num integer,
	n_lo_num_suf character varying,
	n_hi_num integer,
	n_hi_num_suf character varying,
	n_objectid integer,
	o_objectid integer,
	n_usage_status character varying,
	o_sde_state_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$ 
DECLARE 
   edit_session_info         RECORD; 
   current_state             BIGINT; 
   current_lineage           BIGINT; 
   default_version_set       BOOL default FALSE; 
   edit_cnt                  INTEGER; 
   new_state                 BIGINT; 
 
   SE_edit_mode_start        CONSTANT INTEGER NOT NULL DEFAULT 2; 
   SE_SUCCESS                CONSTANT INTEGER NOT NULL DEFAULT 0; 
   SE_VERSION_HAS_MOVED      CONSTANT INTEGER NOT NULL DEFAULT -174; 
   SE_MVV_ROWID_UPDATE       CONSTANT INTEGER NOT NULL DEFAULT -499; 
   SE_MVV_NOT_STD_EDIT_MODE  CONSTANT INTEGER NOT NULL DEFAULT -504; 
   SE_MVV_SET_DEFAULT        CONSTANT INTEGER NOT NULL DEFAULT -507; 
BEGIN 
   IF N_objectid <> O_objectid THEN 
      RAISE EXCEPTION '% (SDE error %).', 
                      'Cannot update multiversion view ROWID.', 
                      SE_MVV_ROWID_UPDATE;
   END IF; 
 
   -- Fetch global information. 
   edit_session_info := sde.SDE_get_edit_session_info();
 
   IF NOT edit_session_info.G_edit_mode_default THEN 
      -- "Old-style" versioned editing. 
      IF edit_session_info.G_edit_state <> SE_edit_mode_start THEN 
         RAISE EXCEPTION '% (SDE error %).', 
                    'User must call SDE_edit_version before editing the view.', 
                    SE_MVV_NOT_STD_EDIT_MODE; 
      END IF; 
 
      current_state := sde.SDE_get_current_state();
 
      IF O_sde_state_id != current_state THEN 
         INSERT INTO network.a58 (address_string_id, trans_id_create, trans_id_expire, linear_name_id, lo_num, lo_num_suf, hi_num, hi_num_suf, objectid, usage_status, sde_state_id)
         VALUES (N_address_string_id, N_trans_id_create, N_trans_id_expire, N_linear_name_id, N_lo_num, N_lo_num_suf, N_hi_num, N_hi_num_suf, O_objectid, n_usage_status, current_state);
         INSERT INTO network.d58 (sde_state_id,sde_deletes_row_id,deleted_at) 
         VALUES (O_SDE_STATE_ID,O_objectid,current_state); 
      ELSE 
         UPDATE network.a58
         SET    address_string_id = N_address_string_id, usage_status = n_usage_status, trans_id_create = N_trans_id_create, trans_id_expire = N_trans_id_expire, linear_name_id = N_linear_name_id, lo_num = N_lo_num, lo_num_suf = N_lo_num_suf, hi_num = N_hi_num, hi_num_suf = N_hi_num_suf, objectid = N_objectid
         WHERE  objectid = O_objectid AND sde_state_id = O_sde_state_id;
      END IF; 
 
   ELSE 
      -- "New-style" DEFAULT editing. 
      BEGIN 
         SELECT status INTO STRICT default_version_set
         FROM   sde_current_version_is_default;
      EXCEPTION WHEN undefined_table THEN
         default_version_set := FALSE;
      END;
      IF default_version_set THEN
         RAISE EXCEPTION '% % (SDE error %).',
            'Cannot call set_current_version before editing default version.',
            'Call SDE_set_default before editing. ',
            SE_MVV_SET_DEFAULT;
      END IF; 
 
      SELECT state_id,lineage_name 
      INTO   current_state,current_lineage 
      FROM  sde.sde_states 
      WHERE  state_id = 
         (SELECT state_id  
          FROM  sde.sde_versions 
           WHERE  name = 'DEFAULT' AND lower(owner) = 'sde'); 
      LOCK TABLE network.d58 IN EXCLUSIVE MODE; 
      SELECT COUNT(*) INTO edit_cnt 
      FROM  sde.sde_state_lineages 
      WHERE lineage_id = current_state AND lineage_id IN 
            (SELECT DISTINCT lineage_id 
             FROM  sde.sde_state_lineages 
             WHERE lineage_name IN 
                   (SELECT lineage_name 
                    FROM  sde.sde_state_lineages 
                    WHERE lineage_id IN 
                          (SELECT deleted_at 
                           FROM  network.d58 
                           WHERE sde_deletes_row_id = O_objectid AND 
                                  deleted_at > current_state))); 
      IF current_state = 0 THEN 
         IF edit_cnt > 0 THEN 
            new_state := sde.SDE_new_branch_state(current_state,current_lineage); 
            IF new_state < SE_SUCCESS THEN 
               RAISE EXCEPTION '% % (SDE error %).', 
                    'The DEFAULT version continues to be modified, commit,', 
                    'rollback or re-execute the last statement to proceed.', 
                    SE_VERSION_HAS_MOVED; 
            END IF; 
            current_state := new_state; 
            INSERT INTO network.a58(address_string_id, usage_status, trans_id_create, trans_id_expire, linear_name_id, lo_num, lo_num_suf, hi_num, hi_num_suf, objectid, sde_state_id)
            VALUES (N_address_string_id, n_usage_status, N_trans_id_create, N_trans_id_expire, N_linear_name_id, N_lo_num, N_lo_num_suf, N_hi_num, N_hi_num_suf, O_objectid, current_state);
            INSERT INTO network.d58(sde_state_id,sde_deletes_row_id,deleted_at) 
            VALUES (O_SDE_STATE_ID,O_objectid,current_state); 
         ELSE 
            UPDATE anchorto.network.authorized_municipal_address
            SET    address_string_id = N_address_string_id, usage_status = n_usage_status, trans_id_create = N_trans_id_create, trans_id_expire = N_trans_id_expire, linear_name_id = N_linear_name_id, lo_num = N_lo_num, lo_num_suf = N_lo_num_suf, hi_num = N_hi_num, hi_num_suf = N_hi_num_suf, objectid = N_objectid
            WHERE  objectid = O_objectid; 
         END IF; 
      ELSE 
         IF O_sde_state_id <> current_state THEN 
            IF edit_cnt > 0 THEN 
               new_state := sde.SDE_new_branch_state(current_state,current_lineage); 
               IF new_state < SE_SUCCESS THEN 
                  RAISE EXCEPTION '% % (SDE error %).', 
                    'The DEFAULT version continues to be modified, commit,', 
                    'rollback or re-execute the last statement to proceed.', 
                    SE_VERSION_HAS_MOVED; 
               END IF; 
               current_state := new_state; 
             END IF; 
             INSERT INTO network.a58(address_string_id, usage_status, trans_id_create, trans_id_expire, linear_name_id, lo_num, lo_num_suf, hi_num, hi_num_suf, objectid, sde_state_id)
             VALUES (N_address_string_id, n_usage_status, N_trans_id_create, N_trans_id_expire, N_linear_name_id, N_lo_num, N_lo_num_suf, N_hi_num, N_hi_num_suf, O_objectid, current_state);
             INSERT INTO network.d58(sde_state_id,sde_deletes_row_id,deleted_at) 
             VALUES (O_SDE_STATE_ID,O_objectid,current_state); 
          ELSE 
             UPDATE network.a58
             SET    address_string_id = N_address_string_id, usage_status = n_usage_status, trans_id_create = N_trans_id_create, trans_id_expire = N_trans_id_expire, linear_name_id = N_linear_name_id, lo_num = N_lo_num, lo_num_suf = N_lo_num_suf, hi_num = N_hi_num, hi_num_suf = N_hi_num_suf, objectid = N_objectid
             WHERE  objectid = O_objectid AND sde_state_id = O_sde_state_id;
         END IF; 
      END IF; 
   END IF; 
 
   IF current_state <> 0 THEN 
      PERFORM sde.SDE_mvmodified_table_update (58,current_state);
   END IF; 
   RETURN 0; 
END;
$BODY$;

ALTER FUNCTION network.v58_update(numeric, numeric, numeric, numeric, integer, character varying, integer, character varying, integer, integer, character varying, bigint)
    OWNER TO network;
