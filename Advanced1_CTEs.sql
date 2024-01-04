/*
CTEs(common table expression)
*/

WITH CTE_Employee as 
(SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender,
AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
FROM [SQL Tutorial].dbo.EmployeeDemographic dem
JOIN [SQL Tutorial].dbo.EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)

--temp table so you cannot run only this query
SELECT  FirstName, AvgSalary
FROM CTE_Employee

--it can only be run right after CTE
SELECT *
FROM CTE_Employee
