Installation of the data model in PostgreSQL - Execution order of SQL files:

1. 1_audit.sql - creates the trigger to log actions on tables
2. 2_qgep.sql - creates schema and empty tables
3. 3_is_dictionary_metadata_table.sql - translations of tables into different languages, incl. abbreviations
4. 4_is_oid_prefixes_table.sql - prefixes for the generation of OIDs
5. 5_indexes_core_model.sql - indexes for faster access
6. 6_generate_oid_function.sql - function for generating new OIDs
7. 7_vw_network_node.sql - view for network following
8. 8_vw_network_segment.sql - view for network following
