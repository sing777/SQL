-- SQL-----------------------------------------------------------------
----------------------------------- SQL----------------------------------
------------------------------------ SQL----------------------------------

create database chetak;
use chetak;

create table che(id int,fname varchar(10),lname varchar(10),sal int);
select * from che;

insert into che(id,fname,lname,sal) values(1,'chetak','deore',10000),
(2,'sagar','deore',20000),(3,'rana','rajput',12000),(4,'sing','sahab',11000);
----------------------------------------------------------------------------
select * from che;
alter table che add column contact varchar(10); 
insert into che(contact) values(9158);
-----------------------------------------------------------------------------
select distinct id from che;
select distinct fname from che;
-----------------------------------------------------------------------------
select * from che where id=1;
select * from che where lname='deore' and id=2;
select sal from che where lname='deore' and id=2;
select * from che where id>2;
select * from che where lname='deore' or id=2;
select * from che where id IN (1,4);
select * from che where id not IN (1,4);
select * from che where id BETWEEN 2 AND 4;
select * from che where not id=1;
select * from che where id is null;
-----------------------------------------------------------------------------
select count(*) from che;
select * from che;
select count(2) from che;
------------------------------------------------------------------------------
select * from emp e;
select max(id) as max_empid from che;
select min(id) as min_empid from che;
select avg(id) from che;
select max(fname) as min_empid from che;
select min(sal) as min_sal from che;
select max(sal) as max_sal from che;
select avg(sal) as avg_sal from che;
-------------------------------------------------------------------------------
select * from che;
create table che_bkp as (select * from che);
select * from che_bkp;
-------------------------------------------------------------------------------
create view new_view as (select lname,fname from che);
select * from new_view;
--------------------------------------------------------------------------------
select id,lname from che;
delete from che where id=null and lname='null'; -- delete particular record
select * from che;
delete from che where id=2 and lname='deore'; -- delete particular record
--------------------------------------------------------------------------------
update che set contact='pune';
update che set fname='pune' where id=4;
update che set contact='2008' where id=2;
update che set sal=50000 where fname='chetak';
update che set sal=40000,fname='jaichand' where id=4;
----------------------------------------------------------------------------------
select lname,
case 
when fname='chetak' then 'sing'
when lname='deore' then 777
else 0
end as che1
from che;
-----------------------------------------------------------------------------------
select fname, case when fname='jaichand' then 'jaising1' else 0 end as che2 from che;

select * from che order by id desc;
select * from che order by fname;
select * from che order by id, sal desc;
--------------------------------------------------------------------------------

select * from che limit 2;
select * from che order by sal limit 1;
select * from che order by sal limit 3;
select * from che limit 2,1;
 -- 2 - rows to skip, 1 is rows to fetch after skipping offset
 select * from che limit 1,1;
 select * from che limit 0,2;
 select * from che limit 0,1;
 ------------------------------------------------------------------------------
 select distinct sal from che;
 
 
select max(sal) from che;
select min(sal) from che;
select sum(sal) from che;
select avg(sal) from che;
select count(sal) from che;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- like operator : pattern matching
-- _ : checks for single char
-- % : 0 or more char
select * from che where fname='chetak';
select * from che;
select * from che where fname like 'c%';
select * from che where fname like '%a';
select * from che where fname like '____a';
--------------------------------------------------------------------------------
---------------------------------------------------------------------------------
-- constraints : rules
-- ==========================
-- not null
create table emp_nn(empid int NOT NULL,fname varchar(10));
select * from emp_nn;
insert into emp_nn values(1001,'virat'),(1002,'virat1'),('1002',null),('1003',null);
alter table emp_nn modify column empid int NOT NULL;

-- unique constraint : you can not have duplicates, you can have NULLs
create table emp_unq (empid int,fname varchar(10),
             CONSTRAINT MY_UNQ UNIQUE(empid));
insert into emp_unq values(1001,'sagar');
select * from emp_unq;
insert into emp_unq values(1001,'sagar');
insert into emp_unq values(1002,'sagar');
alter table emp_unq DROP CONSTRAINT my_unq;



alter table che ADD CONSTRAINT UNIQUE(ID);


create table emp_chk (empid int ,age int,CONSTRAINT  emp_chk CHECK(age>20));
insert into emp_chk values(1001,25);
select * from emp_chk;
insert into emp_chk values(1002,18);
create table emp_chk1 (empid int ,age int,CONSTRAINT  CHECK(age>21));
insert into emp_chk1 values(1002,18);

-- DEAFULT CONSTRAINT
create table ch_dflt (empid int, dept varchar(10) DEFAULT 'bench');
insert into ch_dflt values(1001,'HR');
select * from ch_dflt;
insert into ch_dflt (empid) values(1002);
insert into ch_dflt (empid) values(1003);
insert into ch_dflt (empid) values(1004);
------------------------------------------------------------------------------

-- alter table emp alter dept SET DEFAULT 'Bench';

-- alter table emp alter dept DROP DEFAULT;


create table ch_dflt1 (empid int auto_increment, dept varchar(10),PRIMARY KEY (empid));

insert into ch_dflt1 (dept) values('HR');

select * from ch_dflt1;
insert into ch_dflt1 (dept) values('manager');
insert into ch_dflt1 (dept) values('ds');
insert into ch_dflt1 (dept) values('sp');
alter table emp_inc AUTO_INCREMENT=100;
-------------------------------------------------------------------------------
-- PRIMARY KEY : unique values and NOT NULL
-- ===============================================
---------------------------------------------------------------------------------
create table emp_pk2 (empid int ,fname varchar(10),
CONSTRAINT MY_PK primary key(empid));  
select * from emp_pk2;
desc emp_pk2;
select * from emp_pk2;

insert into emp_pk2 (empid,fname) values( 10001,'dhoni');

insert into emp_pk2 (empid,fname) values( 1001,'virat');
select * from emp_pk2;
insert into emp_pk2 (empid,fname) values( 1002,'veer');
--------------------------------------------------------------------
/* NOT NULL: NULL not allowed
UNIQUE : unique values and NULLs are allowed
CHECK : giving condition for insrting data
DEFAULT : used to give default value,works like default argument
AUTO_INCREMENT : used to auto increment a value by 1
PRIMARY KEY : unique values and NULL not allowed
*/
--------------------------------------------------------------------

select * from che;

select distinct id from che;
select count(id) from che where id=1;
select count(id) from che where id=2;
select count(id) from che where id=3;

select * from emp_data;

select distinct dept_id from emp_data;
select count(empid) from emp_data where dept_id=10;
select count(empid) from emp_data where dept_id=20;
select count(empid) from emp_data where dept_id=30;
-------------------------------------------------------------------------------
-- group by  : groups rows which are having same values
 select  dept_id,count(empid) from emp_data group by dept_id;
select count(empid) from emp_data;
select * from emp_data;
select gender,count(salary) from emp_data group by gender;
select fname,count(lname) from emp_data group by fname;
-------------------------------------------------------------------------------

 -- query to display avg salary of emp from each loc
select loc,avg(salary) from emp_data group by loc;
select loc,avg(salary),count(empid) from emp_data group by loc;
-----------------------------------------------------------------------------
 -- query to display count of emp from each dept and avg salary where salary >40000
 select dept_id,count(empid),avg(salary) from emp_data where salary>40000 group by dept_id;
 
   select dept_id,count(empid),avg(salary) from emp_data where salary>40000 
   group by dept_id having dept_id>10;

select dept_id,count(empid),avg(salary) from emp_data where salary>40000 
group by dept_id having dept_id>10 order by dept_id desc;

 select dept_id,count(empid),avg(salary) from emp_data where salary>40000 
 group by dept_id having dept_id>10 order by dept_id desc limit 1;
--------------------------------------------------------------------------------
 /* where == works on row level
 having == group level */
 
 -- query to fetch duplicate records
 select * from emp_data order by fname;
 
 select fname,count(fname) from emp_data group by fname having count(fname)>1;
--------------------------------------------------------------------------------
-- sequence of execution
-- select from where group by having order by limit
-- from where group by having select order by limit
---------------------------------------------------------------------------------
 -- subquery: query within query
 -- =================================
 ---------------------------------------------------------------------------------
select fname from emp_data where empid >1001;

select * from emp_data;


-- fetch the emp having salary <max salary
select max(salary) from emp_data;
select salary from emp_data where salary < (select max(salary) from emp_data);
select * from emp_data where salary < (select max(salary) from emp_data);

-- second highest salary
select * from emp_data order by salary desc;
select max(salary) from emp_data where salary < (select max(salary) from emp_data);

-- 3rd highest salary
select salary from emp_data order by salary desc limit 3;
select distinct salary from emp_data order by salary desc limit 3;


select max(salary) from 
(select distinct salary from emp_data order by salary desc limit 3) as t;
select min(salary) from (
select distinct salary from emp_data order by salary desc limit 3) as emp_new;

-- nth highest salary
select min(salary) from (
select distinct salary from emp_data order by salary desc limit 4) as emp_new;

-- nth highest salary
select min(salary) from (
select distinct salary from emp_data order by salary desc limit 3) as emp_new;

-- nth highest salary
select min(salary) from (
select distinct salary from emp_data order by salary desc limit 2) as emp_new;

select * from emp_data where salary in 
(select min(salary) from (
select distinct salary from emp_data order by salary desc limit 5) as emp_new);

select count(distinct(empid)) from emp_data;
------------------------------------------------------------------------------------
/*JOINS
======/*
------------------------------------------------------------------------------------
-- joins: used to combine the data from different tables 
-- inner join : intersection, only matching rows from both tables 
-- left join  : all rows from left table and only matching rows from right table
-- right join : all rows from right table and only matching rows from left table
-- self join  : joining a table with itself

/* X.    Y
   a     a.     inner join == aa,aa,aa,aa,bb,dd
   a.    a.     left join  == aa,aa,aa,aa,bb,c NULL,NULL NULL,dd
   b.    d.     right join == aa,aa,aa,aa,dd,bb,NULL NULL,f NULL
   c.    b
   NULL NULL
   d.    f */
   ------------------------------------------------------------------------------
   ------------------------------------------------------------------------------
   
create database sing;
use sing;
create table t1(id int,fname varchar(10),lname varchar(10),sal int,contact int);
select * from t1;
insert into t1(id,fname,lname,sal) values(1,'chetak','deore',10000,8989),
(2,'sagar','deore',20000,3453),(3,'rana','rajput',12000,57657),(4,'sing','sahab',11000,7888);
select * from t1;
alter table t1 drop column contact;
create table t2(id int,fnam varchar(10),lnam varchar(10),addr int,phone int);
insert into t2(id,fnam,lnam,addr,phone) values(1,'chetak','deore',10000,1111),
(2,'sagar','deore',20000,4444),(3,'rana','rajput',12000,33333),(4,'sing','sahab',11000,22222);
select * from t2;
----------------------------------------------------------------------
-- inner
select * from t1,t2 where t1.id=t2.id;
select * from t1 join t2 on t1.id=t2.id;

 select * from t1 inner join t2 on t1.id=t2.id
inner join t3 on t2.id=t3.id ;
-----------------------------------------------------------------------------

-- left
select * from t1 right join t2 on t1.id=t2.id;
select * from t1 left join t2 on t1.id=t2.id;
---------------------------------------------------------------------

create table e (eid int,efname varchar(10),elname varchar(10),phone int,addre varchar(10),cid varchar(10));
insert into e (eid,efname,elname,phone,addre,cid) values(1,'suresh','deore',2008,'male',11),
(2,'ramesh','patil',20011,'aug',12),(3,'sachin','raput',3908,'asta',13),(4,'shekhar','rao',5678,'jal',14);
select * from e;

create table p (eid int,pfname varchar(10),project varchar(10),phon int,clientid int);
insert into p (eid,pfname,project,phon, clientid) values(100,'resh','ore',20,5),
(101,'mesh','til',211,6),(102,'chin','put',08,7),(104,'khar','raosaheb',5678,8);
----------------------------------------------------------------------
select * from e;
select * from p;

select e.eid,e.efname,e.elname,p.eid,p.project,p.phon from e inner join p on e.eid=p.eid;
select e.eid,e.efname,e.elname,p.eid,p.project,p.phon from e,p where e.eid=p.eid;
------------------------------- INNER--------------------------------------------
select e.eid,e.efname,e.elname,p.eid,p.project,p.phon from e inner join p on e.eid=p.eid;
-------------------------------- RIGHT-------------------------------------------
select e.eid,e.efname,e.elname,p.eid,p.project,p.phon from e right join p on e.eid=p.eid;
-------------------------------- LEFT---------------------------------------------
select e.eid,e.efname,e.elname,p.eid,p.project,p.phon from e left join p on e.eid=p.eid;
--------------------------------- UNION------------------------------------------
select e.eid,e.efname,e.elname,p.eid,p.project,p.phon from e left join  p on e.eid=p.eid
union
select e.eid,e.efname,e.elname,p.eid,p.project,p.phon from e right join p on e.eid=p.eid;

-- full join is not working in my sequel so we use union istead of that betn left and right table
-----------------------------------------------------------------------------------
-------------------------------------  SOME QUERIES---------------------------------
-- ================================================================================


-- List all the employees in ascending order by their salaries and desc order of their dept.
 select salary,dept_id,fname,lname from emp_data  order by  salary asc, dept_id desc;
---------------------------------------------------------------------------------

 -- List the employees who are working in dept 10 and 20.
 select fname,dept_id from emp_data where dept_id in(10,20);
---------------------------------------------------------------------------------
 -- List the emp names having length 5 and third char is ‘h’.
 select lanme from emp_data where length(fname)=5 and  lname like'__h%';
----------------------------------------------------------------------------------
 -- List the employees who’s id is starting with 10 
 select dept_id, fname from emp_data where dept_id like '10%';
-------------------------------------------------------------------------------------
 -- Write a query to get a list of employees who are female.
select distinct fname,gender from emp_data where gender='f';
select fname ,count(fname) from emp_data group by fName;
-------------------------------------------------------------------------------------
-- highest salary
select max(salary) from emp_data;
select distinct salary from emp_data order by salary desc limit 1;
--------------------------------------------------------------------------------------

-- second highest sal
select max(salary) from emp_data where salary <  (select max(salary) from emp_data);
select distinct salary from emp_data order by salary desc limit 1,1;

------------------------------------------------------------------------------------
-- 3rd highest sal
select salary from emp_data order by salary desc limit 3;
select distinct salary from emp_data order by salary desc limit 3;
select distinct salary from emp_data order by salary desc limit 2,1;

-----------------------------------------------------------------------------------

-- Find out 5th highest salary from a table using limit.
select distinct salary from emp_data order by salary desc limit 5;
select distinct salary from emp_data order by salary desc limit 4,1;

------------------------------------------------------------------------------------
--  Write a query to get the count of employees from each locations from table
select loc ,count(loc) from emp_data group by loc;

---------------------------------------------------------------------------------------
-- How will you fetch distinct locations from a table?
select distnct gender from emp_data;
------------------------------------------------------------------------------------

--  Write a query to replace ‘a’ from string ‘Data science’ with @
select replace('data science','a','@');
------------------------------------------------------------------------------------
-- Find out the first 5 characters of string ‘Python and Data science’.
select substr('Python and Data science',1,5);
-----------------------------------------------------------------------------------
-- Mask/replace the last 4 char of your contact number (8983456789) with *
select replace ('91585420026','0026','****');
-------------------------------------------------------------------------------------
select * from emp_data;

-- extract last 4 char
select right('1749203',4);
-----------------------------------------------------------------------------------
-- delet employee from dallas
delete from emp_data where loc='dallas';
-------------------------------------------------------------------------------------
-- emp who are working in chicago
select fname,lname,loc from emp_data where loc='chicago'; 

-----------------------------------------------------------------------------------
-- list out dep_id having atleast 30 emp
select dept_id,count(dept_id) from emp_data group by dept_id having count(dept_id)>10;

------------------------------------------------------------------------------------
-- list out emp who are working in dept_id=10 and having sal>10000;
select fname,dept_id from emp_data where salary>10000;
select * from emp_data where salary>150000 and dept_id=10;
------------------------------------------------------------------------------------

-- list out emp whoes sal lies between 120000 to 150000
select * from emp_data where salary  between 120000 and 150000;
----------------------------------------------------------------------------------

-- find max min avg sal of emp
select avg(salary) from emp_data;
----------------------------------------------------------------------------------