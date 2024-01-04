/*
Partition By
*/

SELECT FIrstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM [SQL Tutorial].dbo.EmployeeDemographic dem
JOIN [SQL Tutorial].dbo.EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID

--compare with Group By to see total number of each gender 
SELECT Gender, COUNT(Gender) as TotalGender
FROM [SQL Tutorial].dbo.EmployeeDemographic dem
JOIN [SQL Tutorial].dbo.EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY Gender

