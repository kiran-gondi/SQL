--#104 - Live Query Statistics

--Script: https://blog.sqlauthority.com/2020/08/19/sql-server-live-query-statistics-sql-in-sixty-seconds-104/

--Refer the video: https://www.youtube.com/watch?v=LJ2WUhZd_gQ&list=PL4BD5C24EDB584162&index=88

USE	WideWorldImporters
GO

--Enable Live Query Statistics
SELECT TOP 100000 *
FROM Appliacation.People p
INNER JOIN Sales.InvoiceLines il ON p.PersonID = il.LastEditedBy
INNER JOIN Warehouse.StockItemTransactions sit ON p.PersonID = sit.LastEditedBy
--INNER JOIN Sales.OrderLines ol ON p.PersonID = ol.LastEditedBy
ORDER BY il.StockItemID
GO

