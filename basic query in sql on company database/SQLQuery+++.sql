/*1Display the Department id, name and id and the name of its manager*/
 select Dnum ,Dname, MGRSSN, Fname,Lname
 from Departments , Employee 
 where Departments.MGRSSN=Employee.SSN


/*2splay the name of the departments and the name of the projects under its control.*/
select  Dname ,Pname 
from Departments ,Project
where Project.Dnum=Departments.Dnum


/*3Display the full data about all the dependence associated with the name of the employee they depend on him/her.*/
select* 
from Dependent ,Employee
where Dependent.ESSN = Employee.SSN


/*4#\\Display the Id, name and location of the projects in Cairo or Alex city##.,*/

select Pnumber ,Plocation ,Pname from Project
where Project.City in ('Cairo', 'Alex')



/*5##splay the Projects full data of the projects with a name starts with "a" letter.*/

select* from Project where Pname like 'a%'

/*6# display all the employees in department 30 whose salary from 1000 to 2000 LE monthly*/

select* from Employee where  Salary  BETWEEN 1000 and 2000

/*7the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project. */
select Fname,Lname
from Employee ,Departments
where  Departments.Dnum=10 and Employee.Dno=Departments.Dnum


/*8ind the names of the employees who directly supervised with Kamel Mohamed*/

select Fname,Lname
from Employee
where  Employee.Superssn  in(select Employee.SSN 
from Employee 
where Fname='Kamel' and Lname='Mohamed') 



/*9Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.*/

select Employee.Fname,Employee.Lname,Project.Pname 
from Employee,Project 
where Employee.Dno=Project.Dnum order by Project.Pname

/*10each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.*/



SELECT
  project.Pnumber,Departments.Dname ,Employee.Lname,Employee.Address,Employee.Bdate
FROM Employee
join Departments
  ON Employee.Dno = Departments.Dnum
join Works_for
  ON Works_for.ESSn = Employee.SSN
 join Project
  on Project.Pnumber=Works_for.Pno
  where Project.City in ('cairo');

/*11Display All Data of the mangers*/

select* from Employee ,Departments where Departments.MGRSSN=Employee.SSN

/*Display All Employees data and the data of their dependents even if they have no dependent */


select* from  Employee left outer join Dependent on Employee.SSN=Dependent.ESSN











