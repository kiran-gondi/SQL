--#181 - Tuning Query Cost 100%

SET STATISTICS IO, TIME ON;

SELECT *
FROM [Sales].[SalesOrderHeader]
ORDER BY [ShipDate];

SELECT TOP 1 *
FROM [Sales].[SalesOrderHeader]
ORDER BY [ShipDate];

SELECT *
FROM [Sales].[SalesOrderHeader]
WHERE 1 = 2;