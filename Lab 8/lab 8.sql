a)	The HR Officer is concerned with database auditing so he decides to maintain a record of changes made to database. Create a table Auditing in database with columns AuditId, description and LastChangeOn using 
CREATE TABLE Auditing (
  AuditId INT IDENTITY,
  Description VARCHAR(100),
  LastChangeOn DATE
);

 Create trigger on employee table so that when ever any change is made to it via insert, update and delete events the date of change gets stored in the Auditing table.
use [L191316]
CREATE TABLE Auditing (
  AuditId INT IDENTITY,
  Description VARCHAR(100),
  LastChangeOn DATE
);
create trigger AuditEmployeeChanges
on Employee
after insert, update, delete
as
begin
  declare @ChangeDescription VARCHAR(100);
  set @ChangeDescription = '';
  IF EXISTS (SELECT * FROM inserted)
    SET @ChangeDescription = 'Employee Insert / Update';
  ELSE IF EXISTS (SELECT * FROM deleted)
    SET @ChangeDescription = 'Employee Deleted';
  insert into Auditing (Description, LastChangeOn)
  values (@ChangeDescription, GETDATE());
end;

 
Check whether your trigget worked by running
update employee set address='lahore' where ssn='666884444'

select * from auditing


 







b)	Though HR officer was pretty much satisfied with your last change but after few months he feels something is missing in auditing table so he ask to add more info about the event that changed the employee table . So now he want to store proper information like

2/09/23   employee updated with id=5
7/10/23   employee deleted with id=1

So make appropriate change in triggers to perform the operation.
alter trigger AuditEmployeeChanges
on Employee
after insert, update, delete
as
begin
  declare @ChangeDescription VARCHAR(100);
  set @ChangeDescription = '';
  IF EXISTS (SELECT * FROM inserted)
  BEGIN
    SELECT @ChangeDescription = 'Employee updated with id=' + CAST((SELECT ssn FROM inserted) AS VARCHAR(10));
  END
  ELSE IF EXISTS (SELECT * FROM deleted)
  BEGIN
    SELECT @ChangeDescription = 'Employee deleted with id=' + CAST((SELECT ssn FROM deleted) AS VARCHAR(10));
  END
  insert into Auditing (Description, LastChangeOn)
  values (@ChangeDescription, GETDATE());
end;
update employee set address='UK Umer kot Punjab Pakistan' where ssn='123456789'
select * from auditing

select *from employee

 
insert into Employee values ('Ahmed','B','Haf',333999333,'2001-02-06','uk umer kot','M',10000,333445555,5)

 
 


c)	The HR officer also wants to make sure no one insert, update or deletes project information from the database. So create a trigger that will not let anyone to change the project table.
 
CREATE TRIGGER PreventProjectChanges
ON Project
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
  PRINT 'you are not allowed to insert, update, or delete records in the Project';
  ROLLBACK;
END;


      Verify the trigget is working by running the following command
       delete from project where dnum=5
 

















































































