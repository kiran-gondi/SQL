--#139 - SET STATISTICS TIME ON

--Note
SET STATISTICS TIME, IO ON

USE AdventureWorks2017
GO

SET STATISTICS TIME ON
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
GO
