/*
Aliasing
*/

--AS is optional
SELECT FirstName AS Fname
FROM [SQL Tutorial].dbo.EmployeeDemographic

SELECT FirstName Fname
FROM [SQL Tutorial].dbo.EmployeeDemographic

--FullName
SELECT FirstName + ' ' + LastName AS FullName
FROM [SQL Tutorial].dbo.EmployeeDemographic

SELECT Avg(Age) AS AvgAge
FROM [SQL Tutorial].dbo.EmployeeDemographic

--EmployeeID from Demo table and Salary from Sal table where EmployeeID is same in both tables
--TableName.ColumnName
SELECT Demo.EmployeeID, Sal.Salary
FROM [SQL Tutorial].dbo.EmployeeDemographic AS Demo
JOIN [SQL Tutorial].dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID


SELECT Demo.EmployeeID, Demo.FIrstName, Demo.FIrstName, Sal.JobTitle, Ware.Age
FROM [SQL Tutorial].dbo.EmployeeDemographic Demo
LEFT JOIN [SQL Tutorial].dbo.EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics Ware
	ON Demo.EmployeeID = Ware.EmployeeID