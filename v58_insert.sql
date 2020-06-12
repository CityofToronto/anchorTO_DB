-- FUNCTION: network.v58_insert(numeric, numeric, numeric, numeric, integer, character varying, integer, character varying, integer,character varying)

-- DROP FUNCTION network.v58_insert(numeric, numeric, numeric, numeric, integer, character varying, integer, character varying, integer,character varying);

CREATE OR REPLACE FUNCTION network.v58_insert(
	n_address_string_id numeric,	
	n_trans_id_create numeric,
	n_trans_id_expire numeric,
	n_linear_name_id numeric,
	n_lo_num integer,
	n_lo_num_suf character varying,
	n_hi_num integer,
	n_hi_num_suf character varying,
	n_objectid integer,
    n_usage_status character varying)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE SECURITY DEFINER 
AS $BODY$ 
DECLARE 
   next_rowid                INTEGER; 
   edit_session_info         RECORD; 
   row_id_info               RECORD; 
   default_version_set       BOOL default FALSE; 
   current_state             BIGINT; 
 
   SE_edit_mode_start        CONSTANT INTEGER NOT NULL DEFAULT 2; 
   SE_ROWID_GENERATOR        CONSTANT INTEGER NOT NULL DEFAULT 2; 
   SE_SUCCESS                CONSTANT INTEGER NOT NULL DEFAULT 0; 
   SE_MVV_NOT_STD_EDIT_MODE  CONSTANT INTEGER NOT NULL DEFAULT -504; 
   SE_MVV_SET_DEFAULT        CONSTANT INTEGER NOT NULL DEFAULT -507; 
BEGIN 
   -- Determine the rowid. 
   IF N_objectid IS NOT NULL THEN 
      next_rowid := N_objectid; 
   ELSE 
      row_id_info := network.i58_get_ids (SE_ROWID_GENERATOR,1);
      IF row_id_info.sql_code <> 0 THEN
         RAISE EXCEPTION 'Unable to obtain ROWID value (SQL code %)',
                         row_id_info.sql_code;
      END IF;
      IF row_id_info.o_num_obtained_ids > 1 THEN
         PERFORM network.i58_return_ids (SE_ROWID_GENERATOR,
                                         row_id_info.o_base_id + 1,
                                         row_id_info.o_num_obtained_ids - 1);
      END IF;
      next_rowid := row_id_info.o_base_id;
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
 
      INSERT INTO network.a58(address_string_id, usage_status, trans_id_create, trans_id_expire, linear_name_id, lo_num, lo_num_suf, hi_num, hi_num_suf, objectid, sde_state_id)
      VALUES (N_address_string_id, n_usage_status, N_trans_id_create, N_trans_id_expire, N_linear_name_id, N_lo_num, N_lo_num_suf, N_hi_num, N_hi_num_suf, next_rowid, current_state);
 
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
 
      SELECT state_id INTO STRICT current_state 
      FROM sde.sde_versions
      WHERE  name = 'DEFAULT' AND LOWER(owner) = 'sde'; 
 
      IF current_state = 0 THEN 
         INSERT INTO anchorto.network.authorized_municipal_address(address_string_id, usage_status, trans_id_create, trans_id_expire, linear_name_id, lo_num, lo_num_suf, hi_num, hi_num_suf, objectid)
         VALUES (N_address_string_id,n_usage_status,N_trans_id_create,N_trans_id_expire,N_linear_name_id,N_lo_num,N_lo_num_suf,N_hi_num,N_hi_num_suf,next_rowid);
      ELSE 
         INSERT INTO network.a58(address_string_id, usage_status, trans_id_create, trans_id_expire, linear_name_id, lo_num, lo_num_suf, hi_num, hi_num_suf, objectid, sde_state_id)
         VALUES (N_address_string_id, n_usage_status, N_trans_id_create, N_trans_id_expire, N_linear_name_id, N_lo_num, N_lo_num_suf, N_hi_num, N_hi_num_suf, next_rowid, current_state);
      END IF; 
   END IF; 
 
   PERFORM sde.SDE_mvmodified_table_update (58,current_state);
   RETURN 0; 
END;
$BODY$;

ALTER FUNCTION network.v58_insert(numeric, numeric, numeric, numeric, integer, character varying, integer, character varying, integer,character varying)
    OWNER TO network;
