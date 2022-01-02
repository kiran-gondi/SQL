--#018-Importing CSV into SQL Server

--csvtest.txt data below
--1,Hari,Rao,19750201
--2,Bob,Roy,19450506
--3,Soni,Rao,20071105
--4,Troy,Bob,20081105

USE Tempdb
GO

--Create Test Table
CREATE TABLE CSVTest
(	ID INT,
	FirstName VARCHAR(40),
	LastName VARCHAR(40),
	BirthDate VARCHAR(40)
)
GO

--Import Data using CSV
BULK
INSERT CSVTest
FROM 'C:\csvtest.txt'
WITH
(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
)
GO

--Check the content of the table.
SELECT *
FROM CSVTest
GO

--Clean up
DROP TABLE CSVTest
