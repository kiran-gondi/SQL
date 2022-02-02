--#084 - Impact of CHECKPOINT On Memory

--Script: https://www.youtube.com/watch?v=oee7g_y7iRY&list=PL4BD5C24EDB584162&index=108

--VIP Check it out: https://blog.sqlauthority.com/2015/04/20/sql-server-how-to-view-the-dirty-pages-in-memory-of-a-database/

CREATE DATABASE DirtyPagesDB
GO
USE DirtyPagesDB
GO
-- Disable automatic checkpoint so that data isn't flushed
----#084 - Impact of CHECKPOINT On Memory

--Script: https://www.youtube.com/watch?v=oee7g_y7iRY&list=PL4BD5C24EDB584162&index=108
DBCC TRACEON(3505, -1);
DBCC TRACESTATUS();
GO

CREATE TABLE t1 (Speaker_Bio CHAR(8000))
GO
INSERT INTO t1 VALUES ('SQL'),('Authority')
GO
CHECKPOINT

-- Get the rows of dirtied pages
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
WHERE is_modified = 1
AND d.name = 'DirtyPagesDB'
AND
(
o1.name = 't1'
OR o2.name = 't1'
);
GO

INSERT INTO t1 VALUES ('Pinal')
GO

-- Clean up
USE MASTER
GO
DROP DATABASE DirtyPagesDB
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


CHECKPOINT
GO