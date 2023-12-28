/*
Inner Joins, Full/Left/Right Outer Joins
*/

Select *
FROM [SQL Tutorial].dbo.EmployeeDemographic

Select *
FROM [SQL Tutorial].dbo.EmployeeSalary

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographic
Inner Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographic
Full Outer Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographic
Left Outer Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographic
Right Outer Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

-- select particular column instead of *
SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographic
Inner Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographic
Inner Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

--Michael wants to know who is the highest paid employee except himself?
--step1: combine two table with EmployeeID(foreign key)
--step2: exclude Michael and arrange salary in the highest order
SELECT EmployeeDemographic.EmployeeID, FirstName, LastName, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographic
Inner Join [SQL Tutorial].dbo.EmployeeSalary
	ON  EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
WHERE FIrstName <> 'Michael'
ORDER BY Salary DESC

--average salary of salesman
SELECT JobTitle, AVG(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographic
Inner Join [SQL Tutorial].dbo.EmployeeSalary
	ON  EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle
