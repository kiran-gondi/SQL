--#185 - CPU Running 100%
--Scripts: https://blog.sqlauthority.com/2021/09/20/sql-server-troubleshooting-high-cpu/

--Step 1: Process Using CPU
DECLARE @ms_ticks_now BIGINT
SELECT @ms_ticks_now = ms_ticks
FROM sys.dm_os_sys_info;
SELECT TOP 60 record_id
    ,dateadd(ms, - 1 * (@ms_ticks_now - [timestamp]), GetDate()) AS EventTime
    ,[SQLProcess (%)]
    ,SystemIdle
    ,100 - SystemIdle - [SQLProcess (%)] AS [OtherProcess (%)]
FROM (
    SELECT record.value('(./Record/@id)[1]', 'int') AS record_id
        ,record.value('(./Record/SchedulerMonitorEvent/SystemHealth/SystemIdle)[1]', 'int') AS SystemIdle
        ,record.value('(./Record/SchedulerMonitorEvent/SystemHealth/ProcessUtilization)[1]', 'int') AS [SQLProcess (%)]
        ,TIMESTAMP
    FROM (
        SELECT TIMESTAMP
            ,convert(XML, record) AS record
        FROM sys.dm_os_ring_buffers
        WHERE ring_buffer_type = N'RING_BUFFER_SCHEDULER_MONITOR'
            AND record LIKE '%<SystemHealth>%'
        ) AS x
    ) AS y
ORDER BY record_id DESC

--Step 2: Current Queries Using CPU
SELECT
    r.session_id
    ,st.TEXT AS batch_text
    ,SUBSTRING(st.TEXT, statement_start_offset / 2 + 1, (
            (
                CASE
                    WHEN r.statement_end_offset = - 1
                        THEN (LEN(CONVERT(NVARCHAR(max), st.TEXT)) * 2)
                    ELSE r.statement_end_offset
                    END
                ) - r.statement_start_offset
            ) / 2 + 1) AS statement_text
    ,qp.query_plan AS 'XML Plan'
    ,r.cpu_time, r.total_elapsed_time
    ,r.logical_reads, r.writes, r.dop
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) AS st
CROSS APPLY sys.dm_exec_query_plan(r.plan_handle) AS qp
ORDER BY cpu_time DESC

--Step 3: Historical Queries Using CPU
SELECT TOP(10) qs.execution_count AS [Execution Count],
    (qs.total_logical_reads)/1000.0 AS [Total Logical Reads in ms],
    (qs.total_logical_reads/qs.execution_count)/1000.0 AS [Avg Logical Reads in ms],
    (qs.total_worker_time)/1000.0 AS [Total Worker Time in ms],
    (qs.total_worker_time/qs.execution_count)/1000.0 AS [Avg Worker Time in ms],
    (qs.total_elapsed_time)/1000.0 AS [Total Elapsed Time in ms],
    (qs.total_elapsed_time/qs.execution_count)/1000.0 AS [Avg Elapsed Time in ms],
    qs.creation_time AS [Creation Time]
    ,t.text AS [Complete Query Text], qp.query_plan AS [Query Plan]
FROM sys.dm_exec_query_stats AS qs WITH (NOLOCK)
CROSS APPLY sys.dm_exec_sql_text(plan_handle) AS t
CROSS APPLY sys.dm_exec_query_plan(plan_handle) AS qp
WHERE t.dbid = DB_ID()
ORDER BY (qs.total_logical_reads/qs.execution_count) DESC;