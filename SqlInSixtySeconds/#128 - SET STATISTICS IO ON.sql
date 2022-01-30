--#128 - SET STATISTICS IO ON

--Script: https://blog.sqlauthority.com/2020/10/05/set-statistics-io-on-sql-in-sixty-seconds-128/

SET STATISTICS IO ON
--SET STATISTICS TIME ON
GO
--Query with Operators
SELECT *
FROM [WideWorldImporters].[Sales].[InvoiceLines]
WHERE InvoiceID BETWEEN 20 AND 80;
GO
--Query with In
SELECT * 
FROM [WideWorldImporters].[Sales].[InvoiceLines]
WHERE InvoiceID IN (20, 21, 22, ....,78, 79, 80)
GO

SET STATISTICS IO ON
GO
--Query with Operators
SELECT *
FROM [WideWorldImporters].[Sales].[InvoiceLines]
WHERE InvoiceID BETWEEN 20 AND 22;
--Query with In
SELECT * 
FROM [WideWorldImporters].[Sales].[InvoiceLines]
WHERE InvoiceID IN (20, 21, 22)
GO