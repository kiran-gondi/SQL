--#118 - Recent Execution of Stored Procedure

--Script: https://blog.sqlauthority.com/2020/09/05/recent-execution-of-stored-procedure-sql-in-sixty-seconds-118/

SELECT 
    SCHEMA_NAME(sysobject.schema_id) SchemaName,
    OBJECT_NAME(stats.object_id) SPName, 
    cached_time, last_execution_time, 
    execution_count,
    total_elapsed_time/execution_count 
            AS avg_elapsed_time
FROM  
    sys.dm_exec_procedure_stats stats
    INNER JOIN sys.objects sysobject 
        ON sysobject.object_id = stats.object_id 
WHERE 
    sysobject.type = 'P'
ORDER BY
    stats.last_execution_time DESC


--SP's to execute below
USE WideWorldImporters
GO

EXEC [Website].[SearchForPeople]
'Rob', 5

GO 4

EXEC [Website].[SearchForPeople]
'Toy', 10

GO 5


