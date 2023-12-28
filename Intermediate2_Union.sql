/*
Union, Union A11
*/


SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographic
Full Outer Join [SQL Tutorial].dbo.WareHouseEmployeeDemographics
	ON EmployeeDemographic.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

--two tables having same column
--UNION: remove duplicate
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographic
UNION
SELECT *
FROM [SQL Tutorial].dbo.WareHouseEmployeeDemographics

--UNION ALL: include duplicate
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographic
UNION ALL
SELECT *
FROM [SQL Tutorial].dbo.WareHouseEmployeeDemographics

--two tables having different column
--still working because of same data type, same amount of column
--but not the result that we want ex. salary values in the age column