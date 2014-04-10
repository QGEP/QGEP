Installation of the data model in PostgreSQL - Execution order of SQL files:

Before installation: make sure you have the hstore extension installed ( CREATE EXTENSION hstore SCHEMA public VERSION "1.1"; ).

00_create_schema.sql - creates the QGEP schema

01_audit.sql - creates the trigger to log history on tables

02_is_dictionary_metadata_table.sql - translations of tables into different languages, incl. abbreviations

03_oid_generation.sql - infrastructure table and function for StandardOID generation, you should add entries to the table qgep.is_oid_prefixes for your own organization or check the entry into this file in github.

04_qgep_tables.sql - the core of the model: the empty tables

05_vsa_kek_extension.sql - optional extension for documenting results of channel-TV

06_vw_symbology_manhole_reach_specialstructure.sql - views for displaying/symbolizing the data

07_views_for_network_following.sql - 2 views for network following

08_qgep_functions.sql - plpgsql functions that work in collaboration with the QGEP plugin
