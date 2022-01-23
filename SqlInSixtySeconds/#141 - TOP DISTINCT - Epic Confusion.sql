--#141 - TOP DISTINCT - Epic Confusion

SELECT StockItemID
FROM [WideWorldImporters].[Sales].[OrderLines]
ORDER BY StockItemID;

SELECT TOP 10 StockItemID
FROM [WideWorldImporters].[Sales].[OrderLines]
ORDER BY StockItemID;

SELECT DISTINCT StockItemID
FROM [WideWorldImporters].[Sales].[OrderLines]
ORDER BY StockItemID;

SELECT DISTINCT TOP 10 StockItemID
FROM [WideWorldImporters].[Sales].[OrderLines]
ORDER BY StockItemID;