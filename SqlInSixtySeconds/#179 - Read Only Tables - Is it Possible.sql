--#179 - Read Only Tables - Is it Possible?
--Scripts: https://blog.sqlauthority.com/2021/07/08/sql-server-making-table-read-only-via-filegroup/

USE [master]
GO
-- Step 1: Add FileGroup
ALTER DATABASE [SQLAuthority] ADD FILEGROUP [ReadOnlyFG]
GO
-- Step 2: Add File to FileGroup
ALTER DATABASE [SQLAuthority] ADD FILE
( NAME = N'ReadOnlyFile', FILENAME = N'D:\data\ReadOnlyFile.ndf')
TO FILEGROUP [ReadOnlyFG]
GO
-- Step 3: Create Table and populate it
USE [SQLAuthority]
GO
CREATE TABLE RegularTable (ID INT)
ON [ReadOnlyFG]
GO
INSERT INTO RegularTable (ID)
VALUES (1), (2), (3)
GO
-- Step 4: Make FileGroup ReadOnly
USE master
GO
ALTER DATABASE [SQLAuthority]
MODIFY FILEGROUP [ReadOnlyFG] READONLY
GO
-- Step 5: Test the ReadOnly Property
USE [SQLAuthority]
GO
INSERT INTO RegularTable (ID)
VALUES (4), (5), (6)
GO
-- Step 6: (Optional) Make FileGroup ReadWrite
USE master
GO
ALTER DATABASE [SQLAuthority]
MODIFY FILEGROUP [ReadOnlyFG] READWRITE
GO