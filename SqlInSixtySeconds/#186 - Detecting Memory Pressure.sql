--#186 - Detecting Memory Pressure

--Scripts: https://blog.sqlauthority.com/2021/05/18/sql-server-3-queries-to-detect-memory-issues/

--Query 1: dm_os_sys_memory
SELECT total_physical_memory_kb/1024 [Total Physical Memory in MB],
available_physical_memory_kb/1024 [Physical Memory Available in MB],
system_memory_state_desc
FROM sys.dm_os_sys_memory;

--Query 2: dm_os_process_memory
SELECT physical_memory_in_use_kb/1024 [Physical Memory Used in MB],
process_physical_memory_low [Physical Memory Low],
process_virtual_memory_low [Virtual Memory Low]
FROM sys.dm_os_process_memory;

--Query 3: dm_os_sys_info
SELECT committed_kb/1024 [SQL Server Committed Memory in MB],
committed_target_kb/1024 [SQL Server Target Committed Memory in MB]
FROM sys.dm_os_sys_info;

