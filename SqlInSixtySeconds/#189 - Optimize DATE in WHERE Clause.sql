--#189 - Optimize DATE in WHERE Clause

USE [AdventureWorks2017]
GO
SET STATISTICS IO ON;

SELECT [WorkOrderID], [ProductId], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
WHERE ModifiedDate = '2011-06-15';

SELECT [WorkOrderID], [ProductId], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
WHERE CAST(CONVERT(VARCHAR(10), ModifiedDate, 101) AS DATETIME) = '2011-06-15';

SELECT [WorkOrderID], [ProductId], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
--WHERE ModifiedDate >= '2011-06-15' AND ModifiedDate < '2011-06-16';
WHERE ModifiedDate BETWEEN '2011-06-15' AND '2011-06-16';