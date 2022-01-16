--#174 - Index SCANs - Good or Bad
--Scripts: https://blog.sqlauthority.com/2021/06/11/sql-server-index-scans-are-not-always-bad/

SET STATISTICS IO ON
SELECT TOP 1 i.InvoiceID, i.BillToCustomerID, i.Comments
FROM [WideWorldImporters].[Sales].[Invoices] i

SET STATISTICS IO ON
SELECT TOP 1 i.InvoiceID, i.BillToCustomerID, i.Comments
FROM [WideWorldImporters].[Sales].[Invoices] i
ORDER BY [OrderID], [Comments]
