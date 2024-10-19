create database projects;

use projects;

select * from hr limit 5

alter table
hr change column id emp_id varchar(20) null;

describe hr

SET SQL_SAFE_UPDATES = 0;

UPDATE hr
SET birthdate = CASE
WHEN birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'),
'%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'),
'%Y-%m-%d')
ELSE null
END;

alter table hr
modify column birthdate date;

select birthdate from hr;

UPDATE hr
SET hire_date = CASE
WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'),
'%Y-%m-%d')
WHEN hire_date LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'),
'%Y-%m-%d')
ELSE null
END;

alter table hr
modify column hire_date date;

select hire_date from hr;

UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

UPDATE hr
SET termdate = NULL
WHERE termdate = '';

alter table hr
modify column termdate date;

alter table hr add column age int;

update hr
set age = timestampdiff(YEAR,birthdate,CURDATE());

select min(age) as young, max(age) as old
from hr

select count(age) from hr where age<18
select age from hr;