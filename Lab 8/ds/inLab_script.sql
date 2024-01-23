use[your database]

----------Inlab Trigger exercise for lecture---------------
create table TriggerEmployee
	(
	 Name		varchar(max),
	 EmployeeID		int,
	 ContactID		int,
	 ManagerID		int,
	 Gender			varchar(10),
	 Description		varchar(max),
	 primary key (EmployeeID)
	);
	
insert into TriggerEmployee (Name, EmployeeID,ContactID,ManagerID,Gender,Description) values ('Ahmed',1,2,2,'M','xyz')
insert into TriggerEmployee (Name, EmployeeID,ContactID,ManagerID,Gender,Description) values ('Osama',2,1,2,'M','sadsd')
insert into TriggerEmployee (Name, EmployeeID,ContactID,ManagerID,Gender,Description) values ('Qasim',3,1,2,'M','sadsff')
