--#149 - Count Table in Cache

--Script: https://blog.sqlauthority.com/2021/01/04/sql-server-find-count-of-table-used-in-query-from-cache/

--DB Used is WorldWideImporters
SELECT TOP 1 *
FROM [Sales].[Invoices]
GO 5
SELECT *
FROM [Sales].[Invoices] i
INNER JOIN [Sales].[InvoiceLines] il ON i.InvoiceID = il.InvoiceID
WHERE i.InvoiceID = 23
GO 7

--Below script is used to count table in the cache.
SELECT dest.text
, deqs.execution_count
FROM sys.dm_exec_query_stats deqs
CROSS APPLY sys.dm_exec_sql_text(deqs.plan_handle) dest
WHERE dest.text LIKE '%Invoices%'
GO