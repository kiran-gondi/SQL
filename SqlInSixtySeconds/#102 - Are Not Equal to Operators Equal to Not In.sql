--#102 - Are Not Equal to Operators Equal to Not In?

--Script: https://blog.sqlauthority.com/2020/08/17/are-not-equal-to-operators-equal-to-not-in-sql-in-sixty-seconds-102/

USE WideWorldImporters
GO
SET STATISTICS IO ON;

SELECT DISTINCT LastEditedBy
FROM [Sales].[Orders]
WHERE LastEditedBy <>  7
        AND LastEditedBy <>  15
GO
SELECT DISTINCT LastEditedBy
FROM [Sales].[Orders]
WHERE LastEditedBy !=  7
        AND LastEditedBy !=  15
GO
SELECT DISTINCT LastEditedBy
FROM [Sales].[Orders]
WHERE LastEditedBy NOT IN (7,15)
GO