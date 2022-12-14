
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
delete from programmers where last_name=???Chaudhury??? and first_name=???Supriyo???;

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
insert into employee values (7006, 'SONY', 'ADMIN', 4000, str_to_date('6-May-2005', '%d-%M-%Y'), null); 


SELECT * FROM employee;
SELECT * FROM department;

-- join 

-- in which city does JAMES work?

-- SELECT emp_name, location 
-- FROM employee, department
-- WHERE emp_name = 'JAMES';

-- SELECT emp_name, location 
-- FROM employee
-- JOIN department
-- ON employee.dept_no = department.dept_no
-- WHERE emp_name = 'JAMES';

SELECT employee.emp_name, department.dept_no, department.location 
FROM employee
JOIN department
ON employee.dept_no = department.dept_no
WHERE employee.emp_name = 'JAMES';

SELECT e.emp_name, d.dept_no, d.location 
FROM employee e
JOIN department d
ON e.dept_no = d.dept_no
WHERE e.emp_name = 'JAMES';

SELECT * FROM employee;
SELECT * FROM department;

-- list of the employees with their locations 

-- inner join - fetches only matching records from both the tables 

SELECT e.emp_name, d.dept_no, d.location 
FROM employee e
JOIN department d
ON e.dept_no = d.dept_no
order by e.emp_no;

-- outer joins - 
-- left outer join - fetches matching records from from both the tables + non-matching records from left table 

SELECT e.emp_name, d.dept_no, d.location 
FROM employee e
LEFT JOIN department d
ON e.dept_no = d.dept_no
order by e.emp_no;

-- right outer join - fetches matching records from from both the tables + non-matching records from right table 

SELECT e.emp_name, d.dept_no, d.location 
FROM employee e
RIGHT JOIN department d
ON e.dept_no = d.dept_no
order by e.emp_no;

-- full outer join - fetches matching records + non-mathcing records from from both the tables 

-- SELECT e.emp_name, d.dept_no, d.location 
-- FROM employee e
-- FULL OUTER JOIN department d
-- ON e.dept_no = d.dept_no
-- order by e.emp_no;

SELECT e.emp_name, d.dept_no, d.location 
FROM employee e
LEFT JOIN department d
ON e.dept_no = d.dept_no
UNION 
SELECT e.emp_name, d.dept_no, d.location 
FROM employee e
RIGHT JOIN department d
ON e.dept_no = d.dept_no;
-- order by employee.emp_no;


	-- mi phone 
-- 	   left  right 
	-- mi    phone 
--     mi products - left 
--     other phones - right 

-- PK 
    
-- check constraint 

-- create table example - at least two columns - check constraint  
-- insert into example - test the constraint 

CREATE TABLE example (eid int primary key, ename varchar(10), esalary double check(esalary > 0));

insert into example values (101, 'Sonu', 10);
insert into example values (102, 'Monu', -10);
insert into example values (103, 'Sonu', 10);
insert into example values (104, 'Monu', -10);

select eid, ename, esalary from example; 

-- aadhhar 

-- -- subquery 
-- outer query <> (inner query)

-- database design approaches - 
-- top down approach - ER Model - for a completely new project, starting from scratch  
-- bottom up approach - Normalization - project with some existing data 

select * from employee;
-- IN, BETWEEN, OR, ... 
-- IS, IS NOT 

SELECT * FROM employee WHERE job IN ('CLERK', 'ADMIN');

-- SELECT * FROM employee WHERE job IS NOT 'PRESIDENT';

SELECT * FROM employee WHERE job != 'PRESIDENT';

-- SELECT * FROM employee WHERE dept_no == NULL;
-- SELECT * FROM employee WHERE dept_no != NULL;
SELECT * FROM employee WHERE dept_no IS NULL;
SELECT * FROM employee WHERE dept_no IS NOT NULL;

SELECT emp_no, emp_name, salary FROM employee order by salary;

SELECT emp_no, emp_name, salary, salary * 1.2 hike FROM employee order by salary;
SELECT emp_no, emp_name, salary, salary * 1.2 as hike FROM employee order by salary;
SELECT emp_no, emp_name, salary, salary * 1.2 "hike" FROM employee order by salary;


-- [employee] - <works in> - [department] 

SELECT * FROM employee;
SELECT * FROM department;

-- recursive foreign key 

-- [employee] - <is manager of> - [employee] 

desc employee;

-- q8.   In EMPLOYEE table add a new attribute MGR(Manager ID) consisting 4 Characters. 

alter table employee add mgr int references employee(emp_no);

update employee set mgr = 7001 where emp_no = 7005;
update employee set mgr = 7001 where emp_no = 7006;
update employee set mgr = 7002 where emp_no = 7004;

SELECT * FROM employee;

-- Who is Blake's manager? 

SELECT mgr, emp_name from employee where emp_no = 7005;

-- EMP    MGR 
-- BLAKE JAMES 

SELECT e.emp_no, e.emp_name, m.emp_no, m.emp_name
FROM employee e JOIN employee m ON e.mgr = m.emp_no 
WHERE e.emp_no = 7005;

SELECT e.emp_no eid, e.emp_name emp, m.emp_no bid, m.emp_name boss
FROM employee e JOIN employee m ON e.mgr = m.emp_no 
WHERE e.emp_no = 7005;


SELECT * FROM employee;
SELECT * FROM department;







