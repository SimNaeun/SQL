/*
Group By, Order By
*/

SELECT Gender, Age, Count(Gender) AS CountGender
From EmployeeDemographic
Where Age > 30
GROUP BY Gender, AGE
ORDER BY Gender DESC, AGE DESC

Gender ��ſ� 1, AGE ��ſ� 2�� ǥ������
SELECT Gender, Age, Count(Gender) AS CountGender
From EmployeeDemographic
Where Age > 30
GROUP BY Gender, AGE
ORDER BY 1 DESC, 2 DESC
