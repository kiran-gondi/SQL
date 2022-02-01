--#098 - List All Parallel Queries

--Script: https://blog.sqlauthority.com/2015/07/25/sql-server-how-to-find-if-queries-are-running-in-parallel/

SELECT *
FROM [WideWorldImporters].[Sales].[InvoiceLines]
ORDER BY StockItemID
GO
SELECT *
FROM [WideWorldImporters].[Sales].[Invoices]
ORDER BY PackedByPersonID, LastEditedBy
GO

SELECT
p.dbid,
p.objectid,
p.query_plan,
q.encrypted,
q.TEXT,
cp.usecounts,
cp.size_in_bytes,
cp.plan_handle
FROM sys.dm_exec_cached_plans cp
CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle) AS p
CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) AS q
WHERE cp.cacheobjtype = 'Compiled Plan' AND p.query_plan.value('declare namespace
p="http://schemas.microsoft.com/sqlserver/2004/07/showplan"; max(//p:RelOp/@Parallel)', 'float') > 0

SELECT
qs.sql_handle,
qs.statement_start_offset,
qs.statement_end_offset,
q.dbid,
q.objectid,
q.number,
q.encrypted,
q.TEXT
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.plan_handle) AS q
WHERE qs.total_worker_time > qs.total_elapsed_time