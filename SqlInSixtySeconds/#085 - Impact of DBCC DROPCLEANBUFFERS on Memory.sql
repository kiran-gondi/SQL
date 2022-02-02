--#085 - Impact of DBCC DROPCLEANBUFFERS on Memory

--NOTE: Get another query from the video
--https://www.youtube.com/watch?v=A7biW2sYNYc&list=PL4BD5C24EDB584162&index=107
--Script: https://blog.sqlauthority.com/2019/05/05/how-to-list-dirty-pages-from-memory-in-sql-server-interview-question-of-the-week-223/
--https://blog.sqlauthority.com/2019/03/03/what-is-clean-buffer-in-dbcc-dropcleanbuffers-interview-question-of-the-week-215/
--https://blog.sqlauthority.com/2019/06/17/sql-server-impact-of-checkpoint-and-dbcc-dropcleanbuffers-on-memory/

SELECT
database_name = d.name,
OBJECT_NAME =
CASE au.TYPE
WHEN 1 THEN o1.name
WHEN 2 THEN o2.name
WHEN 3 THEN o1.name
END,
OBJECT_ID =
CASE au.TYPE
WHEN 1 THEN p1.OBJECT_ID
WHEN 2 THEN p2.OBJECT_ID
WHEN 3 THEN p1.OBJECT_ID
END,
index_id =
CASE au.TYPE
WHEN 1 THEN p1.index_id
WHEN 2 THEN p2.index_id
WHEN 3 THEN p1.index_id
END,
bd.FILE_ID,
bd.page_id,
bd.page_type,
bd.page_level
FROM sys.dm_os_buffer_descriptors bd
INNER JOIN sys.databases d
ON bd.database_id = d.database_id
INNER JOIN sys.allocation_units au
ON bd.allocation_unit_id = au.allocation_unit_id
LEFT JOIN sys.partitions p1
ON au.container_id = p1.hobt_id
LEFT JOIN sys.partitions p2
ON au.container_id = p2.partition_id
LEFT JOIN sys.objects o1
ON p1.OBJECT_ID = o1.OBJECT_ID
LEFT JOIN sys.objects o2
ON p2.OBJECT_ID = o2.OBJECT_ID

DBCC DROPCLEANBUFFERS
GO


--************************************************************************************************************--
SELECT 
	DB_NAME(dm_os_buffer_descriptors.database_id) DatabaseName,
	COUNT(*) AS [Total Pages in Buffer],	
	COUNT(*) * 8 / 1024 AS [Buffer Size in MB],
	SUM(CASE dm_os_buffer_descriptors.is_modified
		WHEN 1 THEN 1 ELSE 0
		END) AS [Dirty Pages],
	SUM(CASE dm_os_buffer_descriptors.is_modified
		WHEN 1 THEN 0 ELSE 1
		END) AS [Clean Pages],
	SUM(CASE dm_os_buffer_descriptors.is_modified
		WHEN 1 THEN 1 ELSE 0
		END)  * 8 / 1024 AS [Dirty Page (MB)],
	SUM(CASE dm_os_buffer_descriptors.is_modified
		WHEN 1 THEN 0 ELSE 1
		END) * 8 / 1024 AS [Clean Page (MB)]
FROM sys.dm_os_buffer_descriptors
INNER JOIN sys.databases ON dm_os_buffer_descriptors.database_id = databases.database_id
GROUP BY DB_NAME(dm_os_buffer_descriptors.database_id)
ORDER BY [Total Pages In Buffer] DESC;
--************************************************************************************************************--