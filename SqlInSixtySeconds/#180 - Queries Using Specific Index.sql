--#180 - Queries Using Specific Index
--Script 1:https://blog.sqlauthority.com/2021/07/15/sql-server-finding-queries-using-particular-index/
--Script 2:https://blog.sqlauthority.com/2011/01/04/sql-server-2008-unused-index-script-download/
--Script 3:https://blog.sqlauthority.com/2011/01/03/sql-server-2008-missing-index-script-download/

--Script 1
-- Query to identify query using any speicific index
-- Pinal Dave (https://blog.sqlauthority.com)
SELECT
SUBSTRING(sqltext.text, (deqs.statement_start_offset / 2) + 1,
(CASE deqs.statement_end_offset
WHEN -1 THEN DATALENGTH(sqltext.text)
ELSE deqs.statement_end_offset
END - deqs.statement_start_offset) / 2 + 1) AS sqltext,
deqs.execution_count,
deqs.total_logical_reads/execution_count AS avg_logical_reads,
deqs.total_logical_writes/execution_count AS avg_logical_writes,
deqs.total_worker_time/execution_count AS avg_cpu_time,
deqs.last_elapsed_time/execution_count AS avg_elapsed_time,
deqs.total_rows/execution_count AS avg_rows,
deqs.creation_time,
deqs.last_execution_time,
CAST(query_plan AS xml) as plan_xml
FROM sys.dm_exec_query_stats as deqs
CROSS APPLY sys.dm_exec_text_query_plan
(deqs.plan_handle, deqs.statement_start_offset, deqs.statement_end_offset)
as detqp
CROSS APPLY sys.dm_exec_sql_text(deqs.sql_handle) AS sqltext
WHERE
detqp.query_plan like '%IX_Address_StateProvinceID%'
--detqp.query_plan like '%Name of Your Index Here%'
ORDER BY deqs.last_execution_time DESC
OPTION (MAXDOP 1, RECOMPILE);
GO

SELECT AddressID , StateProvinceID
FROM [Person].[Address]
WHERE StateProvinceID = 9

SELECT AddressID , StateProvinceID
FROM [Person].[Address]
WHERE StateProvinceID = 1

--Script 2
-- Unused Index Script
-- Original Author: Pinal Dave 
SELECT TOP 25
o.name AS ObjectName
, i.name AS IndexName
, i.index_id AS IndexID
, dm_ius.user_seeks AS UserSeek
, dm_ius.user_scans AS UserScans
, dm_ius.user_lookups AS UserLookups
, dm_ius.user_updates AS UserUpdates
, p.TableRows
, 'DROP INDEX ' + QUOTENAME(i.name)
+ ' ON ' + QUOTENAME(s.name) + '.'
+ QUOTENAME(OBJECT_NAME(dm_ius.OBJECT_ID)) AS 'drop statement'
FROM sys.dm_db_index_usage_stats dm_ius
INNER JOIN sys.indexes i ON i.index_id = dm_ius.index_id 
AND dm_ius.OBJECT_ID = i.OBJECT_ID
INNER JOIN sys.objects o ON dm_ius.OBJECT_ID = o.OBJECT_ID
INNER JOIN sys.schemas s ON o.schema_id = s.schema_id
INNER JOIN (SELECT SUM(p.rows) TableRows, p.index_id, p.OBJECT_ID
FROM sys.partitions p GROUP BY p.index_id, p.OBJECT_ID) p
ON p.index_id = dm_ius.index_id AND dm_ius.OBJECT_ID = p.OBJECT_ID
WHERE OBJECTPROPERTY(dm_ius.OBJECT_ID,'IsUserTable') = 1
AND dm_ius.database_id = DB_ID()
AND i.type_desc = 'nonclustered'
AND i.is_primary_key = 0
AND i.is_unique_constraint = 0
ORDER BY (dm_ius.user_seeks + dm_ius.user_scans + dm_ius.user_lookups) ASC
GO

--Script 3
-- Missing Index Script
-- Original Author: Pinal Dave 
SELECT TOP 25
dm_mid.database_id AS DatabaseID,
dm_migs.avg_user_impact*(dm_migs.user_seeks+dm_migs.user_scans) Avg_Estimated_Impact,
dm_migs.last_user_seek AS Last_User_Seek,
OBJECT_NAME(dm_mid.OBJECT_ID,dm_mid.database_id) AS [TableName],
'CREATE INDEX [IX_' + OBJECT_NAME(dm_mid.OBJECT_ID,dm_mid.database_id) + '_'
+ REPLACE(REPLACE(REPLACE(ISNULL(dm_mid.equality_columns,''),', ','_'),'[',''),']','') 
+ CASE
WHEN dm_mid.equality_columns IS NOT NULL
AND dm_mid.inequality_columns IS NOT NULL THEN '_'
ELSE ''
END
+ REPLACE(REPLACE(REPLACE(ISNULL(dm_mid.inequality_columns,''),', ','_'),'[',''),']','')
+ ']'
+ ' ON ' + dm_mid.statement
+ ' (' + ISNULL (dm_mid.equality_columns,'')
+ CASE WHEN dm_mid.equality_columns IS NOT NULL AND dm_mid.inequality_columns 
IS NOT NULL THEN ',' ELSE
'' END
+ ISNULL (dm_mid.inequality_columns, '')
+ ')'
+ ISNULL (' INCLUDE (' + dm_mid.included_columns + ')', '') AS Create_Statement
FROM sys.dm_db_missing_index_groups dm_mig
INNER JOIN sys.dm_db_missing_index_group_stats dm_migs
ON dm_migs.group_handle = dm_mig.index_group_handle
INNER JOIN sys.dm_db_missing_index_details dm_mid
ON dm_mig.index_handle = dm_mid.index_handle
WHERE dm_mid.database_ID = DB_ID()
ORDER BY Avg_Estimated_Impact DESC
GO