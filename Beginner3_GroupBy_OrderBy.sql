/*
Group By, Order By
*/

SELECT Gender, Age, Count(Gender) AS CountGender
From EmployeeDemographic
Where Age > 30
GROUP BY Gender, AGE
ORDER BY Gender DESC, AGE DESC

Gender 대신에 1, AGE 대신에 2로 표현가능
SELECT Gender, Age, Count(Gender) AS CountGender
From EmployeeDemographic
Where Age > 30
GROUP BY Gender, AGE
ORDER BY 1 DESC, 2 DESC
