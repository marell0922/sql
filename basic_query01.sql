
drop table pet;

create table pet (
	name varchar(20),
    owner varchar(20),
    species varchar(20),
    gender char(1),
    birth date,
    death date
);


desc pet; describe pet;

insert into pet values('마음이', '대혁', 'dog', 'f', '2018-10-10', null);

select * from pet;

select name, owner from pet;

-- load data
load data local infile "c:\\Download\pet.txt" into table pet;

select * from pet where name='Bowser';
select * from pet where birth>'1998'; -- range including the standard.
select * from pet where gender='f';
select * from pet where species ='snake' or species='bird';
select name, birth from pet;

-- select + order by
 -- why use together? in delete command, the row in table is empty 
				   -- and after insert, data is inserted in that position of table.
				   -- in that case, data of table is not sort. 
				   -- so recommand to use order by command with select.
 -- order : 1.from 2.where 3.select
select name, birth from pet order by birth desc; -- from high(big) to low(small)
select name, gender, birth from pet order by gender asc, birth desc; 

-- use the null
select * from pet where gender is null;
select * from pet where gender is not null;

-- sql pattern matching
 -- like
select * from pet where name like "b%";
select * from pet where name like "b_____";
select * from pet where name like "%fy";
select * from pet where name like "%w%";
select * from pet where name like "_____";
select * from pet where length(name) = 5;

-- count 
select count(*) from pet;
select owner, count(*) as 'amount' from pet group by owner;
-- having
select owner, count(*) from pet where death is null or death ='0000-00-00' 
	group by owner having count(*)>1;

