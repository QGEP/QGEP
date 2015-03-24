-- this file generates a new SQL function to create StandardOIDs for all the qgep.od_* tables.
-- you need to add entries for your organizations into the table qgep.is_oid_prefixes
-- questions regarding this function should be directed to Andreas Neumann, Stadt Uster

CREATE TABLE qgep.is_oid_prefixes
(
  id serial NOT NULL,
  prefix character(8),
  organization text,
  active boolean,
  CONSTRAINT pkey_qgep_is_oid_prefixes_id PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
COMMENT ON TABLE qgep.is_oid_prefixes
  IS 'This table contains OID prefixes for different communities or organizations. The application or administrator changing this table has to make sure that only one record is set to active.';

-- sample entry for the City of Uster - you need to adapt this entry later for your own organization
INSERT INTO qgep.is_oid_prefixes (prefix,organization,active) VALUES ('ch11h8mw','Stadt Uster',TRUE);

CREATE INDEX in_qgep_is_oid_prefixes_active
  ON qgep.is_oid_prefixes
  USING btree
  (active );

CREATE UNIQUE INDEX in_qgep_is_oid_prefixes_id
  ON qgep.is_oid_prefixes
  USING btree
  (id );
  
-- function for generating StandardOIDs

CREATE OR REPLACE FUNCTION qgep.generate_oid(table_name text)
  RETURNS text AS
$BODY$
DECLARE
  myrec_prefix record;
  myrec_shortcut record;
  myrec_seq record;
BEGIN
  -- first we have to get the OID prefix
  BEGIN
    SELECT prefix::text INTO myrec_prefix FROM qgep.is_oid_prefixes WHERE active = TRUE;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
           RAISE EXCEPTION 'no active record found in table qgep.is_oid_prefixes';
        WHEN TOO_MANY_ROWS THEN
	   RAISE EXCEPTION 'more than one active records found in table qgep.is_oid_prefixes';
  END;
  -- test if prefix is of correct length
  IF char_length(myrec_prefix.prefix) != 8 THEN
    RAISE EXCEPTION 'character length of prefix must be 8';
  END IF;
  --get table 2char shortcut
  BEGIN
    SELECT shortcut_en INTO STRICT myrec_shortcut FROM qgep.is_dictionary_od_table WHERE tablename = table_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE EXCEPTION 'dictionary entry for table % not found', table_name;
        WHEN TOO_MANY_ROWS THEN
            RAISE EXCEPTION 'dictonary entry for table % not unique', table_name;
  END;
  --get sequence for table
  SELECT nextval('qgep.seq_' || table_name || '_oid') AS seqval INTO myrec_seq;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'sequence for table % not found', table_name;
  END IF;
  RETURN myrec_prefix.prefix || myrec_shortcut.shortcut_en || to_char(myrec_seq.seqval,'FM000000');
END;
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;