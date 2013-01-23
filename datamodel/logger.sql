/*
	QGEP
	
	Logger
	
	Denis Rouzaud
	Jan. 2013
*/

BEGIN;

CREATE OR REPLACE FUNCTION table_fields(_schema varchar,_table varchar,VARIADIC exclude varchar[]) RETURNS VARCHAR[] AS
$BODY$
	DECLARE
		field_names VARCHAR[];
	BEGIN
		SELECT
			array_agg(column_name::varchar) INTO field_names
		FROM
			information_schema.columns
		WHERE
			table_schema = _schema
			AND _table = _table 
			AND column_name != all(exclude)
		;
		RETURN field_names ;
	END
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION table_fields(varchar,varchar,varchar[]) IS 'table_fields(_schema varchar,_table varchar,VARIADIC exclude varchar[]) returns field names from a table except those listed in arguments.';


CREATE OR REPLACE FUNCTION logger_create(_schema VARCHAR,_table VARCHAR, id_column VARCHAR) RETURNS void AS
$BODY$
	DECLARE
		_view  VARCHAR := _table ;
		_table VARCHAR := _table || '_logger';
	BEGIN
		/* rename table */
		EXECUTE 'ALTER TABLE '||_schema||'.'||_view||' RENAME TO '||_table||';';
		
		/* add specific logger columns */
		EXECUTE 'ALTER TABLE '||_schema||'.'||_table||' ADD COLUMN logger_id                    SERIAL ;                 ';
		EXECUTE 'ALTER TABLE '||_schema||'.'||_table||' ADD COLUMN logger_creation_date         timestamp DEFAULT now(); ';
		EXECUTE 'ALTER TABLE '||_schema||'.'||_table||' ADD COLUMN logger_creation_user         varchar(25) ;            ';
		EXECUTE 'ALTER TABLE '||_schema||'.'||_table||' ADD COLUMN logger_archive_date          timestamp DEFAULT NULL;  ';
		EXECUTE 'ALTER TABLE '||_schema||'.'||_table||' ADD COLUMN logger_archive_user          varchar(25) ;            ';
		EXECUTE 'ALTER TABLE '||_schema||'.'||_table||' ADD COLUMN logger_last_action           varchar(12);             ';
		EXECUTE 'ALTER TABLE '||_schema||'.'||_table||' ADD COLUMN logger_archive_modif_columns varchar(255);            ';
		
		PERFORM logger_create_view(_schema,_table,_view,id_column);
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION logger_create(varchar,varchar,varchar) IS 'logger_create(_schema VARCHAR,_table VARCHAR, id_column VARCHAR) enables history logging for the table.';


CREATE OR REPLACE FUNCTION logger_create_view(_schema VARCHAR, _table VARCHAR, _view VARCHAR, id_column VARCHAR) RETURNS void AS
$BODY$
	DECLARE
		field						 VARCHAR;
		field_list                   VARCHAR[];	
		field_list_comma_sep         VARCHAR;
		field_list_comma_sep_new     VARCHAR;
		field_list_with_id           VARCHAR[];	
		field_list_with_id_comma_sep VARCHAR;
		_sql						 TEXT;
	BEGIN
		/* get all the fields of the table except logger specific columns */
		EXECUTE 'SELECT table_fields('''||_schema||''','''||_table||''','''||id_column||''',''logger_id'',''logger_creation_user'',''logger_archive_user'',''logger_creation_date'',''logger_archive_date'',''logger_last_action'',''logger_archive_modif_columns'');' INTO field_list ;
		EXECUTE 'SELECT table_fields('''||_schema||''','''||_table||''',                    ''logger_id'',''logger_creation_user'',''logger_archive_user'',''logger_creation_date'',''logger_archive_date'',''logger_last_action'',''logger_archive_modif_columns'');' INTO field_list_with_id ;
		field_list_comma_sep         :=           array_to_string(field_list,         ', '    );
		field_list_comma_sep_new     := 'NEW.' || array_to_string(field_list,         ', NEW.');
		field_list_with_id_comma_sep :=           array_to_string(field_list_with_id, ', '    );
		
		/* creates the view */
		EXECUTE 'DROP VIEW IF EXISTS '||_schema||'.'||_view||';';
		EXECUTE 'CREATE VIEW '||_schema||'.'||_view||' AS SELECT ' || field_list_with_id_comma_sep || ' FROM '||_schema||'.'||_table||' WHERE logger_archive_date IS NULL;';
		
		/* insert rule */
		EXECUTE ' CREATE RULE logger_'||_view||'_insert_rule 
				  AS ON INSERT TO '||_schema||'.'||_view||' DO INSTEAD 
			      INSERT INTO '||_schema||'.'||_table||' ('||field_list_comma_sep||'    ,logger_creation_user,logger_creation_date) 
												  VALUES ('||field_list_comma_sep_new||',current_user        ,now()               );';
												  
		/* delete rule */
		EXECUTE ' CREATE RULE logger_'||_view||'_delete_rule
				  AS ON DELETE TO '||_schema||'.'||_view||' DO INSTEAD
				  UPDATE '||_schema||'.'||_table||' SET logger_archive_date = now(), logger_archive_user = current_user, logger_last_action =''delete'' WHERE '||id_column||'=OLD.'||id_column||' AND logger_archive_date IS NULL;';

		
		/* update trigger */
		_sql := 'CREATE OR REPLACE FUNCTION '||_schema||'.logger_'||_view||'_update() RETURNS TRIGGER AS 
				''
					DECLARE
						modified_columns VARCHAR[] := ''''{}'''' ;
					BEGIN
						/* list the mofified columns */
						';
		FOREACH field IN ARRAY field_list LOOP
			_sql := _sql || 'IF OLD.'||field||'<>NEW.'||field||' THEN modified_columns := array_append(modified_columns,'''''||field||'''''); END IF;';
		END LOOP;
		_sql := _sql ||'
						/* set archive date for previous state and specify modified columns */
						UPDATE '||_schema||'.'||_table||' SET 
							logger_archive_date = now(), 
							logger_archive_user = current_user, 
							logger_last_action  = ''''update'''', 
							logger_archive_modif_columns = array_to_string(modified_columns,'''','''')
							WHERE logger_archive_date IS NULL AND '||id_column||'=NEW.'||id_column||';
						/* add new line to logger table */
						INSERT INTO '||_schema||'.'||_table||' ('||field_list_comma_sep||'    ,'||id_column||'    ,logger_creation_user,logger_last_action) 
														VALUES ('||field_list_comma_sep_new||',NEW.'||id_column||',   current_user     ,''''update''''    );
						RETURN NEW;
					END;
				''
				LANGUAGE ''plpgsql'';
		';
		EXECUTE _sql;
				
		EXECUTE 'CREATE TRIGGER logger_'||_view||'_update_trigger INSTEAD OF UPDATE ON '||_schema||'.'||_view||'
				FOR EACH ROW
				EXECUTE PROCEDURE '||_schema||'.logger_'||_view||'_update();';
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION logger_create_view(varchar,varchar,varchar,varchar) IS 'logger_create_view(_schema VARCHAR, _table VARCHAR, _view VARCHAR, id_column VARCHAR) creates the view and the corresponding trigger and rule for insert/update/delete on view.';


COMMIT;
