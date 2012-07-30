CREATE TABLE qgep.is_oid_prefixes
(
  id serial NOT NULL,
  prefix character(8),
  active boolean,
  CONSTRAINT pkey_qgep_is_oid_prefixes_id PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
COMMENT ON TABLE qgep.is_oid_prefixes
  IS 'This table contains OID prefixes for different communities or organizations. The application or administrator changing this table has to make sure that only one record is set to active.';

CREATE INDEX in_qgep_is_oid_prefixes_active
  ON qgep.is_oid_prefixes
  USING btree
  (active );

