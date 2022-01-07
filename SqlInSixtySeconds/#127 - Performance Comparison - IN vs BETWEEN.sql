--#127 - Performance Comparison - IN vs BETWEEN

SET STATISTICS IO ON
GO

--Query with Between
SELECT *
FROM [WideWorldImporters].[Sales].[InvoiceLines]
WHERE InvoiceID >= 20 AND StockItemID <= 40;
GO
--Query with Operators
SELECT *
FROM [WideWorldImporters].[Sales].[InvoiceLines]
WHERE InvoiceID BETWEEN 20 AND 40;
GO
--Query with IN
SELECT * 
FROM [WideWorldImporters].[Sales].[InvoiceLines]
WHERE InvoiceID IN (20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30)
GO