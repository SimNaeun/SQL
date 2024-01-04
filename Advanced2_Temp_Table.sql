/*
Temp Tables
*/

CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

SELECT *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES(
'1001', 'HR', '45000'
)

--way to quickly Insert values of EmployeeSalary table in temp table
INSERT INTO #temp_Employee
SELECT *
FROM [SQL Tutorial]..EmployeeSalary

--way to run query continuously without error that it already exists
DROP TABLE IF EXISTS #temp_Employee2
CREATE TABLE #temp_Employee2(
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #temp_Employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
FROM [SQL Tutorial]..EmployeeDemographic dem
JOIN [SQL Tutorial]..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee2

