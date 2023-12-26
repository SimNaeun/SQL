/*
Where Statement 
=, <>, <, >, And, Or, Like, Null, Not Null, In
*/

--SELECT *
--FROM EmployeeDemographic
--WHERE FirstName = 'Jim'

--SELECT *
--FROM EmployeeDemographic
--WHERE FirstName <> 'Jim'

--SELECT *
--FROM EmployeeDemographic
--WHERE Age <= 30 AND Gender ='Male'

--SELECT *
--FROM EmployeeDemographic
--WHERE Age <= 30 OR Gender ='Male'

--SELECT *
--FROM EmployeeDemographic
--WHERE LastName Like 'S%'
----starts only with S

--SELECT *
--FROM EmployeeDemographic
--WHERE LastName Like '%S%'
----S is anywhere

--SELECT *
--FROM EmployeeDemographic
--WHERE LastName Like 'S%o%'
--start with S and after S, o is anywhere(order)

--SELECT *
--FROM EmployeeDemographic
--WHERE FirstName is NOT NULL

--SELECT *
--FROM EmployeeDemographic
--WHERE FirstName IN ('Jim', 'Michael')
--whenn including equal and multiple values

