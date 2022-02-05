--#192 - Performance Troubles - Function on Date Variable
 
--Script: https://www.youtube.com/watch?v=sJjRNEcrE_0&list=PL4BD5C24EDB584162

USE AdventureWorks2017
GO
SET STATISTICS IO ON;

SELECT [WorkOrderID], [ProductID], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
WHERE ModifiedDate >= '2011-06-15' AND ModifiedDate < '2011-06-26'

SELECT [WorkOrderID], [ProductID], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
WHERE ModifiedDate BETWEEN '2011-06-15 00:00:00.000' AND '2011-06-15 23:59:59.997'

DECLARE @myDate DATETIME = '2011-06-15';
SELECT [WorkOrderID], [ProductID], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
WHERE ModifiedDate >= @myDate AND ModifiedDate < DATEADD(day,1,@myDate);

DECLARE @myDate DATETIME = '2011-06-15';
SELECT [WorkOrderID], [ProductID], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
WHERE ModifiedDate BETWEEN @myDate AND DATEADD(day,1,@myDate);