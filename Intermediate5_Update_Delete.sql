/*
Updating/Deleting Data
*/

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographic

UPDATE [SQL Tutorial].dbo.EmployeeDemographic
SET Age = 31, Gender = 'Female'
WHERE FIrstName = 'Holly' AND LastName = 'Flax'

--cannot get back the data removed 
DELETE FROM [SQL Tutorial].dbo.EmployeeDemographic
WHERE EmployeeID = 1005

--Using select can make you see what you will delete
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographic
WHERE EmployeeID = 1004