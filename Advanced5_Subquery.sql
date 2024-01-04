/*
Subqueries (in the Select, From, and Where Statement)
*/

Select * 
From EmployeeSalary

--Subquery in Select
--'Select AVG(Salary) From EmployeeSalary' shows avg salary of all employees
Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) AS AllAvgSalary
From EmployeeSalary

--How to do it with Partition By
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From EmployeeSalary

--Why Group By doesn't work
Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From EmployeeSalary
Group By EmployeeID, Salary
Order By 1,2

--Subquery in From
Select a.EmployeeID, AllAvgSalary
From (Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
	  From EmployeeSalary) a 

--Subquery in Where
--should select one specific column(EmployeeID) when using subquery in Where statement that is different from subquery in From Statement
Select EmployeeID, JobTitle, Salary
From EmployeeSalary
Where EmployeeID in (
		Select EmployeeID
		From EmployeeDemographic
		Where Age > 30)
