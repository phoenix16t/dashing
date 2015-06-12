DROP TABLE IF EXISTS widgets;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS widget_accesses;

CREATE TABLE widgets (
	widgetId int NOT NULL AUTO_INCREMENT,
	dataView varchar(20) NOT NULL,
	dataTitle varchar(20) NOT NULL,
	dataId varchar(20),
	dataText varchar(50),
	dataMoreinfo varchar(50),
	dataMin int,
	dataMax int,
	dataUnordered boolean,
	dataPrefix varchar(1),
	style varchar(50),
	parentId int NOT NULL DEFAULT 0,
	isParent boolean NOT NULL DEFAULT false,
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
	layout text,
	currentDash int NOT NULL DEFAULT 0,
	PRIMARY KEY (userId)
);

CREATE TABLE widget_accesses (
	accessId int NOT NULL AUTO_INCREMENT,
	userId int NOT NULL,
	widgetId int NOT NULL,
	activated boolean NOT NULL DEFAULT false,
	PRIMARY KEY (accessId),
	CONSTRAINT access UNIQUE (userId, widgetId)
);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text1", "blah blah blah", "even more blah blah balh", 1, 1, 2, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text2", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text3", "blah blah blah", "even more blah blah balh", 1, 1, 2, 3);

INSERT INTO widgets (dataId, dataView, dataTitle, dataMin, dataMax, dataRow, dataCol, dataSizex, dataSizey) values
("synergy", "Meter", "Hola1", 0, 100, 1, 1, 3, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataMin, dataMax, dataRow, dataCol, dataSizex, dataSizey) values
("synergy", "Meter", "Hola2", 0, 100, 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataMin, dataMax, dataRow, dataCol, dataSizex, dataSizey) values
("synergy", "Meter", "Hola3", 0, 100, 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text4", "blah blah blah", "even more blah blah balh", 1, 1, 2, 2);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text5", "blah blah blah", "even more blah blah balh", 1, 1, 1, 2);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text6", "blah blah blah", "even more blah blah balh", 1, 1, 3, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text7", "blah blah blah", "even more blah blah balh", 1, 1, 2, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text8", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text9", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text10", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text11", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text12", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text13", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text14", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text15", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text16", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text17", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text18", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text19", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text20", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text21", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text22", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text23", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text24", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("newWelcome", "Text", "Text25", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataView, dataTitle, dataRow, dataCol, dataSizex, dataSizey) values
("Myclock", "Clock", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("chuck", "Text", "Chuck Facts", "Team Member Facts", 1, 1, 2, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey) values
("t", "Text", "pt", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey, parentId) values
("t", "Text", "t stuff 1", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1, 31);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey, parentId) values
("t", "Text", "t stuff 2", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1, 31);

INSERT INTO widgets (dataId, dataView, dataTitle, dataText, dataMoreinfo, dataRow, dataCol, dataSizex, dataSizey, parentId) values
("t", "Text", "t stuff 3", "blah blah blah", "even more blah blah balh", 1, 1, 1, 1, 31);


INSERT INTO users (email, data) values
("eddie@leftfieldlabs.com", "testtesttest");

INSERT INTO users (email, data) values
("t", "testtesttest");



INSERT INTO widget_accesses (userId, widgetId) values
(1, 1);

INSERT INTO widget_accesses (userId, widgetId, activated) values
(1, 2, 1);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 3);

INSERT INTO widget_accesses (userId, widgetId) values
(2, 4);

INSERT INTO widget_accesses (userId, widgetId) values
(2, 5);

INSERT INTO widget_accesses (userId, widgetId) values
(2, 6);

INSERT INTO widget_accesses (userId, widgetId, activated) values
(1, 7, 1);

INSERT INTO widget_accesses (userId, widgetId, activated) values
(1, 8, 1);

INSERT INTO widget_accesses (userId, widgetId, activated) values
(1, 9, 1);

INSERT INTO widget_accesses (userId, widgetId, activated) values
(1, 10, 1);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 11);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 12);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 4);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 13);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 14);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 15);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 16);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 17);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 18);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 19);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 20);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 21);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 22);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 23);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 24);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 25);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 26);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 27);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 28);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 29);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 30);

INSERT INTO widget_accesses (userId, widgetId) values
(1, 31);

-- mark parent widgets as parent to reduce server workload
update widgets parent, widgets child
set parent.isParent = true
where parent.widgetId = child.parentId;

-- if a user has access to a parent widget, give that
-- user access to all its children
insert into widget_accesses (userId, widgetId)
	select u.userId, child.widgetId
	from users u, widget_accesses wa, widgets parent, widgets child
	where u.userId = wa.userId
	and wa.widgetId = parent.widgetId
	and parent.widgetId = child.parentId
	and not exists (select 1 from widget_accesses where userId = u.userId and widgetId = child.widgetId);

--select * from users u, widget_accesses wa, widgets w
--where u.userId = wa.userId
--and wa.widgetId = w.widgetId;

--select * from users u, widget_accesses wa, widgets w
    --where u.userId = wa.userId
    --and wa.widgetId = w.widgetId
    --and u.email ="eddie@leftfieldlabs.com";
