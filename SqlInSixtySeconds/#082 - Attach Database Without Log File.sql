--#082 - Attach Database Without Log File

--Script: https://blog.sqlauthority.com/2010/04/26/sql-server-attach-mdf-file-without-ldf-file-in-database/
--https://www.youtube.com/watch?v=ZIDisT6byi4&list=PL4BD5C24EDB584162&index=110


USE [master] GO
-- Method 1: I use this method
EXEC sp_attach_single_file_db @dbname='TestDb',
@physname=N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\TestDb.mdf'
GO

-- Method 2:
CREATE DATABASE TestDb ON
(FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\TestDb.mdf')
FOR ATTACH_REBUILD_LOG
GO

-- Method 3:
CREATE DATABASE TestDb ON
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\TestDb.mdf')
FOR ATTACH
GO
