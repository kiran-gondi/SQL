--#099 - Join or Inner Join

--Script: https://blog.sqlauthority.com/2020/08/13/patch-your-sql-server-sql-in-sixty-seconds-100/

USE WideWorldImporters
GO

SELECT o.OrderID, ol.OrderID
FROM [Sales].[Orders] o
INNER JOIN [Sales].[OrderLines] ol
ON ol.OrderID = o.OrderID
WHERE o.OrderID = 7

SELECT o.OrderID, ol.OrderID
FROM [Sales].[Orders] o
JOIN [Sales].[OrderLines] ol
ON ol.OrderID = o.OrderID
WHERE o.OrderID = 7