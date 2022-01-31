--#106 - Do MAX(col) Scan Table?

--Script: https://blog.sqlauthority.com/2020/08/21/do-maxcol-scan-table-sql-in-sixty-seconds-106/

SET STATISTICS IO ON

USE WideWorldImporters
GO

SELECT MAX([InvoiceID]) MaxValue
FROM [Sales].[Invoices]
GO

SELECT MAX([TotalChillerItems]) MaxValue
FROM [Sales].[Invoices]
GO