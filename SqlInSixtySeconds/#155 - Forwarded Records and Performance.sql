--#155 - Forwarded Records and Performance

--Script: https://blog.sqlauthority.com/2018/03/08/sql-server-forwarded-records-fix/

-- Create a test database
CREATE DATABASE SQLAuthority
GO
USE SQLAuthority
GO
-- Create a sample table
CREATE TABLE HeapTable
(Col1 VARCHAR(100))
GO
-- Insert Sample Values
INSERT INTO HeapTable (Col1)
VALUES ('SmallString')
GO 5000
-- Check Forwarded Record Count
SELECT OBJECT_NAME(object_id) AS table_name,
forwarded_record_count,
avg_fragmentation_in_percent,
page_count
FROM sys.dm_db_index_physical_stats
(DB_ID(), DEFAULT, DEFAULT, DEFAULT, 'DETAILED')
WHERE forwarded_record_count is NOT NULL
GO
-- Update Col1 with Larger Value
UPDATE HeapTable
SET Col1 = 'This is very long string'
GO
-- Check Forwarded Record Count
SELECT OBJECT_NAME(object_id) AS table_name,
forwarded_record_count,
avg_fragmentation_in_percent,
page_count
FROM sys.dm_db_index_physical_stats
(DB_ID(), DEFAULT, DEFAULT, DEFAULT, 'DETAILED')
WHERE forwarded_record_count is NOT NULL
GO

-- Rebuild the table
ALTER TABLE HeapTable REBUILD
GO
-- Check Forwarded Record Count
SELECT OBJECT_NAME(object_id) AS table_name,
forwarded_record_count,
avg_fragmentation_in_percent,
page_count
FROM sys.dm_db_index_physical_stats
(DB_ID(), DEFAULT, DEFAULT, DEFAULT, 'DETAILED')
WHERE forwarded_record_count is NOT NULL
GO
-- Clean up
USE master
GO
DROP DATABASE SQLAuthority
GO
