--#191 - Performance: Between and Other Operators
 
--Script: https://blog.sqlauthority.com/2022/01/12/performance-between-and-other-operators-sql-in-sixty-seconds-191/
--https://www.youtube.com/watch?v=AL1AQrta1-Q

USE AdventureWorks2017
GO
SET STATISTICS IO ON;

--Comparison set 1
SELECT [WorkOrderID], [ProductID], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
WHERE ModifiedDate >= '2011-06-15' AND ModifiedDate < '2011-06-26'

SELECT [WorkOrderID], [ProductID], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
WHERE ModifiedDate BETWEEN '2011-06-15 00:00:00.000' AND '2011-06-15 23:59:59.997'

--Comparison set 2
SELECT [WorkOrderID], [ProductID], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
WHERE ModifiedDate >= '2011-06-15' AND ModifiedDate < '2011-06-26'

SELECT [WorkOrderID], [ProductID], [OrderQty], [ModifiedDate]
FROM [Production].[WorkOrder]
WHERE ModifiedDate BETWEEN '2011-06-15 00:00:00.000' AND '2011-06-15 23:59:59.999'

