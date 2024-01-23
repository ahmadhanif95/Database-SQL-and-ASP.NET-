1.	Create a store procedure called p_getManagers_with_Deps that outputs the names of managers who have a dependent.

 




2.	Modify the above procedure (question 3) to display the salaries of such employees as well as their names.
alter procedure p_getManagers_with_Deps 
as
select distinct fname, lname, salary
from dbo.department, dbo.employee, dbo.dependent
where essn=Mgr_ssn and ssn=Mgr_ssn;
 
 


3.	Create a stored procedure that returns the maximum salary earner of the department whose name is given as parameter.

 
exec getmaxsallery @Dname='Administration'

 





4.	Create a stored procedure called “SP_NewEmployeeDetail” which should insert the following details from Employee table in to a new table “T_EmployeeDetail” .The table can be manually created with the selection of following attributes.  

Employee (SSN,  Name,  salary, Address)


create table T_EmployeeDetail(
ssn int not null,
name varchar(20),
salary int,
address varchar(250),
constraint pkssn primary key(ssn)
)

create procedure SP_NewEmployeeDetail
as insert into T_EmployeeDetail 
select ssn,fname,salary,address from employee
 exec SP_NewEmployeeDetail
 select *from T_EmployeeDetail

 

CREATE VIEW v_employeeNames
As
SELECT fname, lnameFROM employee

which will create a View with the name customerData that will only contain customerNmae.

Get result from a View:

This is similar to a Select statement:
select * from v_employeeNames

Modify an existing View
Alter  VIEW v_employeeNames
As
SELECT ssn, fname, lname FROM employee

Drop a View
DROP VIEW v_employeeNames







