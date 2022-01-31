--#105 - Possible to Rollback TRUNCATE

--Script: https://blog.sqlauthority.com/2020/08/20/rollback-truncate-script-sql-in-sixty-seconds-105/

-- Create Test Table
CREATE TABLE TruncateTest (ID INT)
INSERT INTO TruncateTest (ID)
SELECT 1
UNION ALL
SELECT 2
UNION ALL
SELECT 3
GO

-- Check the data before truncate
SELECT * FROM TruncateTest
GO

-- Begin Transaction
BEGIN TRAN
-- Truncate Table
TRUNCATE TABLE TruncateTest
GO
-- Check the data after truncate
SELECT * FROM TruncateTest
GO
-- Rollback Transaction
ROLLBACK TRAN
GO

-- Check the data after Rollback
SELECT * FROM TruncateTest
GO

-- Clean up
DROP TABLE TruncateTest
GO