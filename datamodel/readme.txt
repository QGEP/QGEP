Installation of the data model in PostgreSQL - Execution order of SQL files:

1. qgep.sql - creates schema and empty tables
2. is_dictionary_metadata_table.sql - translations of tables into different languages, incl. abbreviations
3. is_oid_prefixes_table.sql - prefixes for the generation of OIDs
4. indexes_core_model.sql - indexes for faster access
5. generate_oid_function.sql - function for generating new OIDs
6. vw_network_node.sql - view for network following
7. vw_network_segment.sql - view for network following