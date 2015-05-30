-- table od_wastewater_structure is extended to hold additional attributes necessary for symbology reasons
-- extended attributes are started with an underscore
-- _usage_current is necessary for coloring the wastewater_structure/cover symbols
-- _function_hierarchic is necessary for scale-based filtering (display minor wastewater_structures only at larger scales)
-- _orientation is necessary for certain symbols (e.g. oil separator)

-- TABLE od_wastewater_structure

ALTER TABLE qgep.od_wastewater_structure ADD COLUMN _usage_current integer;
COMMENT ON COLUMN qgep.od_wastewater_structure._usage_current IS 'not part of the VSA-DSS data model
added solely for QGEP
has to be updated by triggers';
ALTER TABLE qgep.od_wastewater_structure ADD COLUMN _function_hierarchic integer;
COMMENT ON COLUMN qgep.od_wastewater_structure._function_hierarchic IS 'not part of the VSA-DSS data model
added solely for QGEP
has to be updated by triggers';
ALTER TABLE qgep.od_manhole ADD COLUMN _orientation numeric;
COMMENT ON COLUMN qgep.od_manhole._orientation IS 'not part of the VSA-DSS data model
added solely for QGEP';

-- this column is an extension to the VSA data model and puts the _function_hierarchic in order
ALTER TABLE qgep.vl_channel_function_hierarchic ADD COLUMN order_fct_hierarchic smallint;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=5 WHERE code=5062;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=7 WHERE code=5063;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=6 WHERE code=5064;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=8 WHERE code=5065;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=10 WHERE code=5066;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=13 WHERE code=5067;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=1 WHERE code=5068;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=3 WHERE code=5069;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=2 WHERE code=5070;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=4 WHERE code=5071;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=9 WHERE code=5072;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=12 WHERE code=5073;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=11 WHERE code=5074;
UPDATE qgep.vl_channel_function_hierarchic SET order_fct_hierarchic=14 WHERE code=5075;

-- this column is an extension to the VSA data model and puts the _usage_current in order
ALTER TABLE qgep.vl_channel_usage_current ADD COLUMN order_usage_current smallint;
UPDATE qgep.vl_channel_usage_current SET order_usage_current=5 WHERE code = 4514;
UPDATE qgep.vl_channel_usage_current SET order_usage_current=3 WHERE code = 4516;
UPDATE qgep.vl_channel_usage_current SET order_usage_current=7 WHERE code = 4518;
UPDATE qgep.vl_channel_usage_current SET order_usage_current=6 WHERE code = 4520;
UPDATE qgep.vl_channel_usage_current SET order_usage_current=2 WHERE code = 4522;
UPDATE qgep.vl_channel_usage_current SET order_usage_current=4 WHERE code = 4524;
UPDATE qgep.vl_channel_usage_current SET order_usage_current=1 WHERE code = 4526;
UPDATE qgep.vl_channel_usage_current SET order_usage_current=8 WHERE code = 4571;
UPDATE qgep.vl_channel_usage_current SET order_usage_current=9 WHERE code = 5322;


