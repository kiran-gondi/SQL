--#107 - Move TempDB for Performance

--Script: https://blog.sqlauthority.com/2020/08/22/move-tempdb-for-performance-sql-in-sixty-seconds-107/

--Step 1: Get Logical File Name
USE TempDB
GO
EXEC sp_helpfile
GO

--Step 2: Move TempDB to New Drive
USE master
GO
ALTER DATABASE TempDB MODIFY FILE
(NAME = tempdev, FILENAME = 'd:\datatempdb.mdf')
GO
ALTER DATABASE TempDB MODIFY FILE
(NAME = templog, FILENAME = 'e:\datatemplog.ldf')
GO

