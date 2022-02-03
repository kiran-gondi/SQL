--#073 - SQL Server 2014 Live Plan for Query

--Script: https://www.youtube.com/watch?v=zQ8bWT3CfiE&list=PL4BD5C24EDB584162&index=119

--go through the video for scripts

--Displaying Live Plan Script
--Open this on a different session and run it.
SELECT physical_operator_name, row_count, estimate_row_count, session_id
FROM sys.dm_exec_query_profiles