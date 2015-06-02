DROP TABLE IF EXISTS widgets;

CREATE TABLE widgets (
	id int NOT NULL AUTO_INCREMENT,
	dataId varchar(20) NOT NULL,
	dataView varchar(20) NOT NULL,
	dataTitle varchar(20) NOT NULL,
	dataText varchar(50),
	dataMoreinfo varchar(50),
	dataMin int,
	dataMax int,
	dataUnordered boolean,
	style varchar(50),
	dataPrefix varchar(1),
	dataRow int NOT NULL,
	dataCol int NOT NULL,
	dataSizex int NOT NULL,
	dataSizey int NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Yo", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataMin, dataMax, dataRow, dataCol, dataSizex, dataSizey) values
("synergy", "Meter", "Hola", 0, 100, 1, 1, 1, 1);