
CREATE TABLE Account (
       Acct_no              CHAR(18) NOT NULL,
       Type                 CHAR(18),
       branch_no            CHAR(18),
       code                 CHAR(18),
       _Balance             CHAR(18)
);

CREATE UNIQUE INDEX XPKAccount ON Account
(
       Acct_no                        ASC
);


ALTER TABLE Account
       ADD PRIMARY KEY (Acct_no);


CREATE TABLE Bank (
       Addr                 CHAR(18),
       code                 CHAR(18) NOT NULL,
       _name                CHAR(18)
);

CREATE UNIQUE INDEX XPKBank ON Bank
(
       code                           ASC
);


ALTER TABLE Bank
       ADD PRIMARY KEY (code);


CREATE TABLE bank_branch (
       branch_no            CHAR(18) NOT NULL,
       addr                 CHAR(18),
       code                 CHAR(18) NOT NULL
);

CREATE UNIQUE INDEX XPKbank_branch ON bank_branch
(
       branch_no                      ASC,
       code                           ASC
);


ALTER TABLE bank_branch
       ADD PRIMARY KEY (branch_no, code);


CREATE TABLE Customer (
       name                 CHAR(18),
       addr                 CHAR(18),
       phone                CHAR(18),
       ssn                  CHAR(18) NOT NULL
);

CREATE UNIQUE INDEX XPKCustomer ON Customer
(
       ssn                            ASC
);


ALTER TABLE Customer
       ADD PRIMARY KEY (ssn);


ALTER TABLE Account
       ADD FOREIGN KEY (branch_no, code)
                             REFERENCES bank_branch
                             ON DELETE SET NULL;


ALTER TABLE bank_branch
       ADD FOREIGN KEY (code)
                             REFERENCES Bank
                             ON DELETE RESTRICT;




create trigger tI_Account after INSERT on Account
   REFERENCING NEW AS NEW for each row mode db2sql
    update Account
      set
        branch_no = NULL,
        code = NULL
      where
        not exists (
          select * from bank_branch
            where
              new.branch_no = bank_branch.branch_no and
              new.code = bank_branch.code
        )
 !!

create trigger tU_Account after UPDATE on Account
     for each row mode db2sql
    update Account
      set
        branch_no = NULL,
        code = NULL
      where
        not exists (
          select * from bank_branch
            where
              new.branch_no = bank_branch.branch_no and
              new.code = bank_branch.code
        ) 
 !!

create trigger tD_Bank after DELETE on Bank
   REFERENCING OLD AS OLD for each row mode db2sql
   WHEN (0 < (select count(*) from bank_branch where bank_branch.code = 
old.code))
 BEGIN ATOMIC
     SIGNAL SQLSTATE '75001' ('Cannot DELETE Bank because bank_branch 
exists.');
 END
 !!

create trigger tU_Bank after UPDATE on Bank
     for each row mode db2sql
   WHEN (0 < ((select count(*) from Bank where Bank.code <> old.code)) 
AND
     (0 < (select count(*) from bank_branch where bank_branch.code = 
old.code)))
 BEGIN ATOMIC
       SIGNAL SQLSTATE '75001' ('Cannot UPDATE Bank because bank_branch 
exists.');
 END
 !!

create trigger tD_bank_branch after DELETE on bank_branch
   REFERENCING OLD AS OLD for each row mode db2sql
    update Account
      set
        branch_no = NULL,
        code = NULL
      where
        Account.branch_no = old.branch_no and
        Account.code = old.code
 !!

create trigger tI_bank_branch after INSERT on bank_branch
   REFERENCING NEW AS NEW for each row mode db2sql
   WHEN ((0 = (select count(*) from Bank where new.code = Bank.code))
     )
 BEGIN ATOMIC
       SIGNAL SQLSTATE '75001' ('Cannot INSERT bank_branch because Bank 
does not exist.');
 END
 !!

create trigger tU_bank_branch after UPDATE on bank_branch
     for each row mode db2sql
   WHEN (0 < (select count(*) from bank_branch where 
bank_branch.branch_no <> old.branch_no or 
                                                     bank_branch.code 
<> old.code))
     update Account
       set
         branch_no = NULL,
         code = NULL
       where
         Account.branch_no = old.branch_no and
         Account.code = old.code
 !!

create trigger tU_bank_branch2 after UPDATE on bank_branch
     for each row mode db2sql
   WHEN (0 = ((select count(*) from Bank where new.code = Bank.code))
     )
 BEGIN ATOMIC
       SIGNAL SQLSTATE '75001' ('Cannot UPDATE bank_branch because Bank 
does not exist.');
 END
 !!

