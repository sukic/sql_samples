create table pole (name text, day integer[]);
insert into pole values ('ahoj',array[2]);
update pole set day = array_append(day, 3);

