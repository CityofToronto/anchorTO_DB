-- FUNCTION: network.v58_delete(integer, bigint)

-- DROP FUNCTION network.v58_delete(integer, bigint);

CREATE OR REPLACE FUNCTION network.v58_delete(
	o_objectid integer,
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
   SE_VERSION_HAS_MOVED  CONSTANT INTEGER NOT NULL DEFAULT -174; 
   SE_MVV_NOT_STD_EDIT_MODE  CONSTANT INTEGER NOT NULL DEFAULT -504; 
   SE_MVV_SET_DEFAULT       CONSTANT INTEGER NOT NULL DEFAULT -507; 
BEGIN 
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
        INSERT INTO network.d58(sde_state_id,sde_deletes_row_id,deleted_at) 
        VALUES (O_SDE_STATE_ID,O_objectid,current_state); 
      ELSE 
         DELETE FROM network.a58 
         WHERE objectid = O_objectid AND sde_state_id = O_sde_state_id;
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
      FROM   sde.sde_states 
      WHERE  state_id = 
         (SELECT state_id  
          FROM  sde.sde_versions 
           WHERE  name = 'DEFAULT' AND LOWER(owner) = 'sde'); 
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
            INSERT INTO network.d58(sde_state_id,sde_deletes_row_id,deleted_at) 
            VALUES (O_sde_state_id,O_objectid,current_state); 
         ELSE 
            DELETE FROM anchorto.network.authorized_municipal_address WHERE objectid = O_objectid; 
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
            INSERT INTO network.d58(sde_state_id,sde_deletes_row_id,deleted_at) 
            VALUES (O_SDE_STATE_ID,O_objectid,current_state); 
         ELSE 
            IF edit_cnt > 0 THEN 
               new_state := sde.SDE_new_branch_state(current_state,current_lineage); 
               IF new_state < SE_SUCCESS THEN 
                  RAISE EXCEPTION '% % (SDE error %).', 
                    'The DEFAULT version continues to be modified, commit,', 
                    'rollback or re-execute the last statement to proceed.', 
                    SE_VERSION_HAS_MOVED; 
               END IF; 
               current_state := new_state; 
               INSERT INTO network.d58(sde_state_id,sde_deletes_row_id,deleted_at) 
               VALUES (O_SDE_STATE_ID,O_objectid,current_state); 
            ELSE 
               DELETE FROM network.a58 
               WHERE objectid = O_objectid AND sde_state_id = O_sde_state_id;
            END IF; 
         END IF; 
      END IF; 
   END IF; 
 
   IF current_state <> 0 THEN 
      PERFORM sde.SDE_mvmodified_table_update (58,current_state);
   END IF; 
   RETURN 0; 
END;
$BODY$;

ALTER FUNCTION network.v58_delete(integer, bigint)
    OWNER TO network;
