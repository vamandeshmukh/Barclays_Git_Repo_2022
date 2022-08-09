
-- SELECT * FROM --- 

-- common syntax 
-- dataypes 
-- operators 
-- functions 

-- constraints 
-- joins 
-- subqueires 

-- CRUD Ops -- - 
-- RETRIEVE  - select 
-- CREATE 	- insert 
-- UPDATE 	- update 
-- DELETE 	- delete 

-- DDL - create drop alter ... 
-- DML - insert update delete --- 

-- datatypes in MySQL
-- 	int varchar char date 

-- employees table     

-- waht is the name of the employee with highest salary 

-- ========================================== 
-- SQL Assignment Link: https://goo.gl/9uQuVY 
-- ========================================== 

-- Answers -- 
-- q1

create table programmers 
(emp_no int primary key, 
proj_id int, 
last_name varchar(30), 
first_name varchar(30), 
hire_date date, 
language varchar(15), 
task_no int, 
privilege varchar(25));

desc programmers; 

-- q2 
alter table programmers modify proj_id varchar(5);

insert into programmers values (201 , 'NPR' , 'Gupta' , 'Saurav', STR_TO_DATE('1-Jan-1995', '%d-%M-%Y'), 'VB',52 , 'Secret');
insert into programmers values (390 , 'KCW' , 'Ghosh' , 'Pinky' , STR_TO_DATE('5-Jan-1993' , '%d-%M-%Y'), 'JAVA',11 , 'TopSecret');
insert into programmers values (789 , 'RNC' , 'Agarwal' , 'Praveen' , STR_TO_DATE('3-Aug-1998' , '%d-%M-%Y'), 'VB',11 , 'Secret');
insert into programmers values (134 , 'TIPPS' , 'Chaudhury' , 'Supriyo' , STR_TO_DATE('15-Jul-1995' , '%d-%M-%Y'), 'C++',52 , 'Secret');
insert into programmers values (896 , 'KCW' , 'Jha' , 'Ranjit' , STR_TO_DATE('15-Jun-1997' , '%d-%M-%Y'), 'JAVA',10 , 'TopSecret');
insert into programmers values (345 , 'TIPPS' , 'John' , 'Peter' , STR_TO_DATE('15-Nov-1999' , '%d-%M-%Y'), 'JAVA',52 , null);
insert into programmers values (563 , 'NITTS' , 'Anderson' , 'Andy' , STR_TO_DATE('15-Aug-1994' , '%d-%M-%Y'), 'C++',89 , 'Confidential');

select * from programmers;

-- 3a
update programmers set proj_id='NTTS', language='C++' where last_name='Gupta' and first_name='Saurav';
update programmers set proj_id='NTTS', language='C++' where emp_no = 201;

-- 3b 
delete from programmers where last_name=’Chaudhury’ and first_name=’Supriyo’;

-- 3c  
alter table programmers drop column task_no;

-- 4
create table department (dept_no int primary key, dept_name varchar(20) not null, location varchar(20) not null);
desc department; 

-- 5 
alter table department modify dept_name varchar(50);
desc department; 

-- 6 
insert into department (dept_no, dept_name, location) values (10, 'ACCOUNTS', 'NEWYORK');
insert into department (dept_no, dept_name, location) values (20, 'MARKETING', 'NEWYORK');
insert into department (dept_no, dept_name, location) values (30, 'SALES', 'NEWYORK');
insert into department (dept_no, dept_name, location) values (40, 'RESEARCH', 'OHIO');
SELECT * FROM department; 

-- 7 
create table employee 
(emp_no int primary key, 
emp_name varchar(30) not null, 
job varchar(10) not null, 
salary double not null, 
hire_date date not null, 
dept_no int references department(dept_no));

-- SELECT 
select first_name, upper(first_name), lower(first_name) from programmers;

-- MySQL functions 

-- JOINs 
-- ANSI JOIN 
-- inner join 
-- outer join 
	-- left join 
	-- right join 
	-- full join 
    

SELECT * FROM employee;

insert into employee 
(emp_no, emp_name, job, salary, hire_date, dept_no) values 
(7001, 'JAMES', 'CLERK', 3000, str_to_date('6-May-2005', '%d-%M-%Y'), 10); 

insert into employee values (7002, 'MASON', 'PRESIDENT', 10000, str_to_date('6-May-2005', '%d-%M-%Y'), 20); 
insert into employee values (7003, 'CLARK', 'MANAGER', 5000, str_to_date('6-May-2004', '%d-%M-%Y'), 20); 
insert into employee values (7004, 'JOHN', 'MANAGER', 6000, str_to_date('6-Aug-2005', '%d-%M-%Y'), 10); 
insert into employee values (7005, 'BLAKE', 'CLERK', 3500, str_to_date('6-Sept-2005', '%d-%M-%Y'), 30); 

COMMIT;

SELECT * FROM employee;
SELECT * FROM department;




