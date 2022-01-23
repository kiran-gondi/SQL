--#140 - Performance Challenge - Write Efficient Query

--SET STATISTICS IO ON
SET STATISTICS TIME ON

--Solution 1: When SalesOrderDetailID is Identity Column
USE AdventureWorks
GO
SELECT * 
FROM Sales.SalesOrderDetail
WHERE SalesOrderDetailID IN (
SELECT MIN(SalesOrderDetailID) SalesOrderDetailID
FROM Sales.SalesOrderDetail
UNION ALL
SELECT MAX(SalesOrderDetailID) SalesOrderDetailID
FROM Sales.SalesOrderDetail)
GO

--Solution 2: When Ordering by Any Column (here SalesOrderDetailID)
USE AdventureWorks
GO
SELECT * 
FROM Sales.SalesOrderDetail
WHERE SalesOrderDetailID IN (
SELECT TOP 1 SalesOrderDetailID
FROM Sales.SalesOrderDetail
ORDER BY SalesOrderDetailID)
OR --UNION ALL / OR
SalesOrderDetailID IN (
SELECT TOP 1 SalesOrderDetailID
FROM Sales.SalesOrderDetail
ORDER BY SalesOrderDetailID DESC)
GO

--Solution 3: Using Ranking Function
USE AdventureWorks
GO
SELECT * 
FROM
(
SELECT *,
ROW_NUMBER() OVER (ORDER BY SalesOrderDetailID ASC) TopRow,
ROW_NUMBER() OVER (ORDER BY SalesOrderDetailID ASC) BottomRow
FROM Sales.SalesOrderDetail
) t
WHERE TopRow = 1 OR BottomRow = 1
ORDER BY TopRow
GO