	-- create some table with date TYPE
CREATE TABLE date_test (
	id INT
	,day DATE
	);

	-- insert some data
INSERT INTO date_test
VALUES (
	1
	,'2016-02-02'
	);

INSERT INTO date_test
VALUES (
	2
	,'2.3.2016'
	);

	-- select in various formats
SELECT id
	,to_char(day, 'DD.MM.YYYY')
FROM date_test;

SELECT id
	,to_char(day, 'Day Mon YY')
FROM date_test;

	-- more here: http://www.postgresql.org/docs/8.2/static/functions-formatting.html
