/*
String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/

CREATE TABLE EmployeeErrors(
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors values
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

SELECT *
FROM EmployeeErrors

--Using Trim, LTRIM, RTRIM
--TRIM: remove blank spaces on both sides
Select EmployeeID, TRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

Select EmployeeID, LTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

Select EmployeeID, RTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

--Using Replace
--replace '- Fired' with ''(blank)
Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors

--Using Substring
--show 3 characters starting from first character
Select SUBSTRING(FirstName,1,3)
FROM EmployeeErrors


--Fuzzy Matching(FirstName, LastName, Gender, Age...)
Select err.FirstName, SUBSTRING(err.FirstName, 1, 3), dem.FirstName, SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographic dem
	ON SUBSTRING(err.FirstName, 1, 3) = SUBSTRING(dem.FirstName,1,3)

--Using Upper and Lower
Select FirstName, LOWER(FirstName)
FROM EmployeeErrors

Select FirstName, UPPER(FirstName)
FROM EmployeeErrors