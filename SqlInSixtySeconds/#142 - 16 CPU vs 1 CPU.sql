--#142 - 16 CPU vs 1 CPU

--Video: https://www.youtube.com/watch?v=Ze5pI7bHuco&list=PL4BD5C24EDB584162&index=50

SET STATISTICS IO, TIME ON

--Query running on 16 logical processors
USE AdventureWorks
GO
SELECT * FROM 
(
	SELECT *,
	ROW_NUMBER() OVER (ORDER BY SalesOrderDetailID ASC) TopRow,
	ROW_NUMBER() OVER (ORDER BY SalesOrderDetailID ASC) BottomRow,
	FROM Sales.SalesOrderDetail
) t
WHERE TopRow = 1 OR BottomRow = 1
OPTION (MAXDOP 16)
GO


--Query running on 1 logical processors
USE AdventureWorks
GO
SELECT * FROM 
(
	SELECT *,
	ROW_NUMBER() OVER (ORDER BY SalesOrderDetailID ASC) TopRow,
	ROW_NUMBER() OVER (ORDER BY SalesOrderDetailID ASC) BottomRow,
	FROM Sales.SalesOrderDetail
) t
WHERE TopRow = 1 OR BottomRow = 1
OPTION (MAXDOP 1)
GO