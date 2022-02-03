--#051 - RESEED Identity Column in Database Table
 
--Script: https://blog.sqlauthority.com/2013/05/08/sql-server-reseed-identity-in-table-column-rest-table-identity-value-sql-in-sixty-seconds-051/

USE tempdb
GO
-- Create Table
CREATE TABLE TestTable (ID INT IDENTITY(1,1), Col1 VARCHAR(100));

-- Insert Table
INSERT INTO TestTable (Col1)
SELECT 'First'
UNION ALL
SELECT 'Second'
UNION ALL
SELECT 'Third'
UNION ALL
SELECT 'Fourth'
UNION ALL
SELECT 'Fifth';
-- Select data
SELECT *
FROM TestTable
GO

-- Returns current Identity Value
DBCC CHECKIDENT ('TestTable', NORESEED);
-- Resets the current Identity value to maximum value
DBCC CHECKIDENT ('TestTable', RESEED, 11);

-- Insert Table
INSERT INTO TestTable (Col1)
SELECT 'First'
UNION ALL
SELECT 'Second'
UNION ALL
SELECT 'Third'
UNION ALL
SELECT 'Fourth'
UNION ALL
SELECT 'Fifth';

-- Select Table
SELECT *
FROM TestTable
ORDER BY ID;

-- Drop Table
DROP TABLE TestTable;