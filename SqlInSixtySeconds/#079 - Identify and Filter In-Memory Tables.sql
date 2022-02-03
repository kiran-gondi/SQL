--#079 - Identify and Filter In-Memory Tables

--Script: https://blog.sqlauthority.com/2015/01/07/sql-server-identify-and-filter-in-memory-optimized-tables-sql-in-sixty-seconds-079/

--How to identify if table is memory optimized or not?

SELECT *
FROM sys.tables
WHERE is_memory_optimized = 1

