/*
Case Statement
*/

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographic


SELECT FirstName, LastName, Age,
CASE 
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM [SQL Tutorial].dbo.EmployeeDemographic
WHERE Age is NOT NULL
ORDER BY Age

--what the salary would be after they get the raise
SELECT FIrstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * 0.1)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * 0.05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * 0.00001)
	ELSE Salary + Salary * 0.03
END AS SalaryAfterRaise
FROM [SQL Tutorial].dbo.EmployeeDemographic
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
