--#103 - Stop It Now - Offline-Detach and Drop

--Script: https://blog.sqlauthority.com/2020/08/18/sql-server-offline-detach-and-drop-differences/

--Taking Database Offline
ALTER DATABASE SQLAuthority
SET OFFLINE
WITH ROLLBACK IMMEDIATE
GO

--Taking Database Online
ALTER DATABASE SQLAuthority
SET ONLINE
GO

--Detaching Database
EXEC master.dbo.sp_detach_db @dbname = N'SQLAuthority'
GO

--Attaching Database
EXEC sp_attach_db @dbname = N'SQLAuthority',
@filename1 =
N'D:\data\SQLAuthority.mdf',
@filename2 =
N'D:\data\SQLAuthority_log.ldf'
GO

--Drop Database
DROP DATABASE SQLAuthority -- noway to recover data
GO











