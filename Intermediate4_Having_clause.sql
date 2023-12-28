/*
Having Clause
*/


--The number of jobtitle
--can't use COUNT in the WHERE clause when it's not in a subquery of SELECT list or Having clause
--be after GROUP BY
SELECT JobTitle, COUNT(JobTitle)
FROM [SQL Tutorial].dbo.EmployeeDemographic
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

--average salary of each jobtitle that has more than 45000
SELECT JobTitle, AVG(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographic
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)