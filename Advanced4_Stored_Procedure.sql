/*
Stored Procedures
*/

--create procedure called 'TEST'
CREATE PROCEDURE TEST
AS 
Select *
FROM EmployeeDemographic

--execute test
EXEC TEST

CREATE PROCEDURE Temp_Employee
AS
Create table #temp_employee(
JotTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
select JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
FROM [SQL Tutorial]..EmployeeDemographic dem
JOIN [SQL Tutorial]..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
group by JobTitle

SELECT *
FROM #temp_employee

--parameter @JobTitle
EXEC Temp_Employee @JobTitle = 'Salesman'