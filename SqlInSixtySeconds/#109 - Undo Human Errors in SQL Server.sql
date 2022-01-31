--#109 - Undo Human Errors in SQL Server 

--Script: https://blog.sqlauthority.com/2020/08/25/undo-human-errors-in-sql-server-sql-in-sixty-seconds-109-point-in-time-restore/

CREATE DATABASE SQLAuthority
GO
ALTER DATABASE SQLAuthority
SET RECOVERY FULL
GO
USE SQLAuthority
GO
CREATE TABLE TestTable (ID INT)
GO
BACKUP DATABASE [SQLAuthority] 
TO DISK = N'D:\SQLAuthority.bak'
GO
INSERT INTO TestTable (ID)
VALUES (1), (2), (3)
GO
SELECT GETDATE() BeforeTruncateTime;
-- 2020-08-18 19:45:38.717

SELECT *
FROM TestTable
GO

-- Disaster
TRUNCATE TABLE TestTable
GO

SELECT *
FROM TestTable
GO

BACKUP LOG [SQLAuthority] TO
DISK = N'D:\SQLAuthorityLog.trn'
GO
-- ------------------

-- Restore operation
USE master
GO
RESTORE DATABASE [SQLAuthority] 
FROM DISK = N'D:\SQLAuthority.bak'
WITH NORECOVERY, REPLACE
GO

RESTORE LOG [SQLAuthority] 
FROM DISK = N'D:\SQLAuthorityLog.trn'
WITH STOPAT = '2020-08-18 19:45:38.717', RECOVERY
GO

USE SQLAuthority
GO

SELECT *
FROM TestTable
GO

USE master
GO

DROP DATABASE SQLAuthority
GO
