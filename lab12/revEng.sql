CREATE TABLE Department (
       dnumber     int primary key,
       dname       VARCHAR2(10) 
);


CREATE TABLE Employee (
       ssn               VARCHAR2(10) primary key,
       fname             VARCHAR2(10) NULL,
       dnumber           int
);


ALTER TABLE Employee
       ADD  ( FOREIGN KEY (dnumber)
                             REFERENCES Department ) ;







