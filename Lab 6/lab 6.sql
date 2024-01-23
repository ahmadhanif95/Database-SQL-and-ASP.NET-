1.	Give the name(s) of employees who work either on project “ProductX” or on project “ProductY”
select e.fname, e.Lname 
from employee as e
where e.ssn in
(
select won.essn
from works_on as won

where won.Pno in
(
select P.Pnumber
from project P
where P.Pname='ProductX' or P.Pname='ProductY'
)

)





2.	Give the name(s) of employees who work both on project “ProductX” or on project “ProductY”
select e.fname, e.Lname 
from employee as e
where e.ssn in
(
select won.essn
from works_on as won

where won.Pno in
(
select P.Pnumber
from project P
where P.Pname='ProductX'
)
)

intersect

select e.fname, e.Lname
from employee as e
where e.ssn in
(
select won.essn
from works_on as won

where won.Pno in
(
select P.Pnumber
from project P
where P.Pname='ProductY'
)
)








3.	Give the name(s) of employees who work on project “ProductY” but not on project “ProductX”
select e.fname, e.Lname 
from employee as e
where e.ssn in
(
select won.essn
from works_on as won

where won.Pno in
(
select P.Pnumber
from project P
where P.Pname='ProductY'
)
)

except

select e.fname, e.Lname
from employee as e
where e.ssn in
(
select won.essn
from works_on as won

where won.Pno in
(
select P.Pnumber
from project P
where P.Pname='ProductX'
)
)






4.	Give the name(s) of employees who earn the minimum salary.

select e.fname, e.lname from employee as e
where salary in (select min(e.salary) from employee as e)
 



5.	Give the names(s) of employees who work on as many projects as “Jennifer Wallace”. Please exclude “Jennifer Wallace” from the list.
select e.fname,e.Lname
from employee as e
where e.ssn in 
(

select won.essn
from works_on as won
group by won.essn
having count(won.essn)<=all(
select count(won.essn)
from works_on as won
where won.essn=999887777
)
)
except

select employee.fname, employee.Lname
from employee
where employee.fname='Jennifer' and employee.Lname='Wallace'
 


6.	Give the names(s) of employees who work on a project which is not controlled by their own department.
select distinct e.fname, e.Lname 
from employee as e
inner join works_on as won
on e.ssn=won.essn
inner join project as p
on won.Pno=p.Pnumber
inner join department as d
on p.Dnum=d.Dnumber
where d.Dname not in (

select dep.Dname
from department as dep
where e.Dno=dep.Dnumber

)







7.	Give the name(s) of guest who have booking either for Watergate or Latham hotel.



 

8.	Give the name(s) of guest who have booking both for Watergate and Latham hotel.


 



9.	Give the name(s) of guest who have booking for Latham but not for Watergate hotel.


 




10.	Display the name of the guest who has stayed in maximum number of hotels
SELECT TOP 1 G.guestname
FROM guest G
JOIN booking B ON G.guestno = B.guestno
GROUP BY G.guestname
ORDER BY COUNT(DISTINCT B.hotelno) DESC;
 



11.	Display the name of the hotel with as many rooms as Latham hotel
SELECT H.hotelname
FROM hotel H
WHERE (
  SELECT COUNT(*)
  FROM room R
  WHERE R.hotelno = H.hotelno
) = (
  SELECT COUNT(*)
  FROM room R2
  WHERE R2.hotelno = 'ch01'
)
 

12.	Display the name of the hotel with the most expensive room
SELECT H.hotelname
FROM hotel H
WHERE (
  SELECT MAX(price)
  FROM room R
  WHERE R.hotelno = H.hotelno
) = (
  SELECT MAX(price)
  FROM room R2
);







