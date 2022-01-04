--#036-Select and Delete Duplicate Records

USE tempdb
GO
CREATE TABLE TestTable(ID INT, NameCol VARCHAR(100))
GO

INSERT INTO TestTable (ID, NameCol)
SELECT 1, 'First'
UNION ALL
SELECT 2, 'Second'
UNION ALL
SELECT 3, 'Second'
UNION ALL
SELECT 4, 'Second'
UNION ALL
SELECT 5, 'Second'
UNION ALL
SELECT 6, 'Third'
GO

--Selecting Data
SELECT *
FROM TestTable
GO

--Detecting Duplicate
SELECT NameCol, COUNT(*) TotalCount
FROM TestTable
GROUP BY NameCol
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC
GO

--Deleting Duplicate
DELETE
FROM TestTable
WHERE ID NOT IN
(
SELECT MAX(ID)
FROM TestTable
GROUP BY NameCol)
GO

--Selecting Data
SELECT *
FROM TestTable
GO

DROP TABLE TestTable
GO