--#068 - Attach or Detach Database
 
--Script: https://www.youtube.com/watch?v=4X5h2WgFIcE&list=PL4BD5C24EDB584162&index=124

-- Detach Database
USE [master]
GO
EXEC MASTER.dbo.sp_detach_db @dbname = N'AdventureWorks2014_new'
GO
-- Deprecated Way to Attach Database
USE [master]
GO
EXEC MASTER.dbo.sp_attach_db 'AdventureWorks2014_new',
'E:\AdventureWorks2012_Data_new.mdf',
'E:\AdventureWorks2012_log_new.ldf'
GO

-- Correct Way to Attach Database
USE [master]
GO
CREATE DATABASE [AdventureWorks2014_new] ON
( FILENAME = 'E:\AdventureWorks2012_Data_new.mdf'),
( FILENAME = 'E:\AdventureWorks2012_log_new.ldf')
FOR ATTACH
GO
