DROP VIEW IF EXISTS qgep.test;
DROP TABLE IF EXISTS qgep.test;
DROP TABLE IF EXISTS qgep.test_logger;
CREATE TABLE qgep.test (id serial NOT NULL,test VARCHAR);


SELECT logger_create('qgep','test','id');

INSERT INTO qgep.test (test) VALUES ('Hello');
UPDATE qgep.test SET test = 'Bye' WHERE id=1;
DELETE FROM qgep.test WHERE id=1;


SELECT * FROM qgep.test_logger;
