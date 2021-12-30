--#008-Using MAXDOP 1 for Single Processor Query
USE AdventureWorks2017
GO

--Parallel Query
SELECT * 
FROM [Sales].[SalesOrderHeader] soh
INNER JOIN [Sales].[SalesOrderDetail] sod
	ON sod.SalesOrderID = soh.SalesOrderID
OPTION (MAXDOP 1)
	

--Parallel Query
SELECT * 
FROM [Sales].[SalesOrderHeader] soh
INNER JOIN [Sales].[SalesOrderDetail] sod
	ON sod.SalesOrderID = soh.SalesOrderID