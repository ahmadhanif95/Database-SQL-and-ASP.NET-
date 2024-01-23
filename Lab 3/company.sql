use [your_db]
create table employee
(  fname varchar(15) not null,
   Minit  char,
   Lname varchar(15) not null,
   ssn char(9) not null,
   bdate  date,
   address  varchar(30),
   sex char,
   salary  decimal(10, 2) check (salary<100000),
   super_ssn   char(9),
   Dno int not null,
   constraint emppk primary key (ssn)
   )

create table department
   ( Dname  varchar(15)  not null,
   Dnumber  int not null,
   Mgr_ssn   char(9) ,
   mgr_start_date   date,
   primary key (dnumber),
   unique (dname),
   foreign key (mgr_ssn) references employee(ssn) on delete set null)

create table project
  ( Pname varchar(15) not null,
    Pnumber   int  not null,
    Plocation  varchar(15),
    Dnum  int not null,
    constraint projkey primary key (Pnumber),
    foreign key(Dnum) references department(Dnumber)
    )

create table works_on
    (essn char(9) not null,
    Pno  int not null,
    hours  decimal(3,1) not null,
    primary key (essn, Pno),
    foreign key(essn) references employee(ssn),
    foreign key (Pno)  references project(Pnumber)
    )

create table dependent
  ( essn  char(9) not null,
    dependent_name  varchar(15)  not null,
    sex char,
    bdate date,
    relationship varchar(8),
    primary key (essn, dependent_name),
    foreign key(essn) references employee(ssn)
    )

create table dept_locations
(  Dnumber  int ,
   dlocation varchar(20),
   primary key (dnumber, dlocation),
   foreign key (dnumber) references 
   department(dnumber) 
   )
/