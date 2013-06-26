Installation of the data model in PostgreSQL - Execution order of SQL files:

00_create_schema.sql - creates the QGEP schema
01_audit.sql - creates the trigger to log history on tables
02_is_dictionary_metadata_table.sql - translations of tables into different languages, incl. abbreviations
03_oid_generation.sql - infrastructure table and function for StandardOID generation
04_qgep_tables.sql - the core of the model: the empty tables
05_indexes - indexes for faster access
06_vw_symbology_manhole_reach_specialstructure.sql - views for displaying/symbolizing the data
07_views_for_network_following.sql - 2 views for network following
