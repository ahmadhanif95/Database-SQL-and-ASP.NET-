CREATE TABLE director(
did [int] NOT NULL primary key,
name [varchar](50) NULL,
bestrev [varchar](50) NULL,
)
CREATE TABLE movie(
mid [int] NOT NULL,
mname [varchar](50) NULL,
directedby int 
constraint fk foreign key references director(did)
)

     alter table movie drop constraint fk
alter table director add sno int unique







