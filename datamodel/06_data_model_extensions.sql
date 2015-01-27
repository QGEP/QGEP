-- table od_manhole is extended to hold additional attributes necessary for symbology reasons
-- extended attributes are started with an underscore
-- _usage_current is necessary for coloring the manhole/cover symbols
-- _function_hierarchic is necessary for scale-based filtering (display minor manholes only at larger scales)
-- _orientation is necessary for certain symbols (e.g. oil separator)

-- TABLE od_manhole

ALTER TABLE qgep.od_manhole ADD COLUMN _usage_current integer;
COMMENT ON COLUMN qgep.od_manhole._usage_current IS 'not part of the VSA-DSS data model
added solely for QGEP
has to be updated by triggers';
ALTER TABLE qgep.od_manhole ADD COLUMN _function_hierarchic integer;
COMMENT ON COLUMN qgep.od_manhole._function_hierarchic IS 'not part of the VSA-DSS data model
added solely for QGEP
has to be updated by triggers';
ALTER TABLE qgep.od_manhole ADD COLUMN _orientation numeric;
COMMENT ON COLUMN qgep.od_manhole._orientation IS 'not part of the VSA-DSS data model
added solely for QGEP';
