DROP TABLE IF EXISTS widgets;
DROP TABLE IF EXISTS users;

CREATE TABLE widgets (
	widgetId int NOT NULL AUTO_INCREMENT,
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
	PRIMARY KEY (widgetId)
);

CREATE TABLE users (
	userId int NOT NULL AUTO_INCREMENT,
	email varchar(30) NOT NULL,
	data varchar(20),
	PRIMARY KEY (userId)
);

CREATE TABLE widget_accesses (
	userId int NOT NULL,
	widgetId int NOT NULL
);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Yo", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataMin, dataMax, dataRow, dataCol, dataSizex, dataSizey) values
("synergy", "Meter", "Hola", 0, 100, 1, 1, 1, 1);

INSERT INTO users (email, data) values
("eddie@leftfieldlabs.com", "testtesttest");
