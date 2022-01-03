--#031-Copy Data from One Table to Another Table

--Method 1 : INSERT INTO SELECT
USE AdventureWorks2017
GO

--Create TestTable
CREATE TABLE TestTable (FirstName VARCHAR(100), LastName VARCHAR(100))

--INERT INTO TestTable using SELECT
INSERT INTO TestTable (FirstName, LastName)
SELECT FirstName, LastName
FROM Person.Person
WHERE EmailPromotion = 2

--Verify that Data in TestTable
SELECT FirstName, LastName
FROM TestTable

--Clean Up Database
DROP TABLE TestTable
GO


--Method 2 : SELECT INTO
USE AdventureWorks2017
GO

--Create new table and insert into table using SELECT INSERT
SELECT FirstName, LastName
INTO TestTable
FROM Person.Person
WHERE EmailPromotion = 2

--Verify that Data in TestTable
SELECT FirstName, LastName
FROM TestTable

