/*
	QGEP
	
	Function returning all translated elements (table names and value lists)
	
	To get the table, use SELECT * FROM qgep.translated_elements()
*/

CREATE OR REPLACE FUNCTION qgep.translated_elements() RETURNS TABLE (table_name varchar(50),value_en varchar(50),value_de varchar(50),value_fr varchar(50)) AS
$BODY$
DECLARE 
	tname varchar(50);
BEGIN
	CREATE TEMPORARY TABLE dictionary_table (table_name varchar(50),value_en varchar(50),value_de varchar(50),value_fr varchar(50));
	
	INSERT INTO dictionary_table (table_name,value_en,value_de,value_fr) SELECT tablename,name_en,name_de,name_fr FROM qgep.is_dictionary;
	
	FOR tname IN SELECT "tablename" FROM pg_tables WHERE schemaname = 'qgep' AND tablename LIKE 'vl%'
	LOOP
		EXECUTE 'INSERT INTO dictionary_table (table_name,value_en,value_de,value_fr) 
				SELECT '''||tname||''' AS table_name,value_en,value_de,value_fr FROM qgep.'||tname||';' ;
	END LOOP;
	RETURN QUERY SELECT * FROM dictionary_table;
END
$BODY$
LANGUAGE 'plpgsql' ;
COMMENT ON FUNCTION qgep.translated_elements() IS 'Function returning all translated elements (table names and value lists). To get the table, use SELECT * FROM qgep.translated_elements()';


