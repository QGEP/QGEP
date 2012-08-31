Installation of the data model in PostgreSQL - Execution order of SQL files:

1. qgep.sql - creates schema and empty tables
2. is_dictionalry_metadata_table.sql
3. is_oid_prefixes_table.sql
4. indexes_core_model.sql
5. generate_oid_function.sql