--#171 - One Query Many Plans
--Script 1: https://blog.sqlauthority.com/2021/06/02/sql-server-same-result-same-query-plan-different-entry-in-cache/
--Script 2: https://blog.sqlauthority.com/2019/03/16/sql-server-list-query-plan-cache-size-text-and-execution-count/

--DBCC FREEPROCCACHE
GO
USE AdventureWorks
GO
SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE OrderQty IN (1,2);
GO
select *
from [Sales].[SalesOrderDetail]
where OrderQty IN (0,1,2);
GO

-- if you want to see the cache size, query plan along with the execution count, you can run the following query. 
--The query only lists all the queries which are from the Query Cache.
--DBCC FREEPROCCACHE

SELECT
cplan.usecounts,
qrypln.[query_plan],
sqltxt.text,
planobj.pages_in_bytes / 1024 AS [PlanKB],
cplan.plan_handle,
cplan.cacheobjtype,
cplan.objtype
FROM sys.dm_exec_cached_plans cplan
OUTER APPLY sys.dm_exec_sql_text(cplan.[plan_handle]) sqltxt
OUTER APPLY sys.dm_exec_query_plan(cplan.[plan_handle]) qrypln
INNER JOIN sys.dm_os_memory_objects planobj
ON planobj.memory_object_address = cplan.memory_object_address
WHERE cplan.parent_plan_handle IS NULL
AND cplan.cacheobjtype IN (N'Compiled Plan', N'Compiled Plan Stub')
ORDER BY cplan.objtype, cplan.plan_handle;