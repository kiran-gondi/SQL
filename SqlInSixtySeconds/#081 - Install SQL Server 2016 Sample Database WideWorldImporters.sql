--#081 - Install SQL Server 2016 Sample Database WideWorldImporters

--Script: https://www.youtube.com/watch?v=zOMFXHf4blg&list=PL4BD5C24EDB584162&index=111

USE [master]
RESTORE DATABASE [WideWorldImporters] FROM 
DISK = N'C:\WideWorldImporters-Full\WideWorldImporters-Full.bak' WITH
MOVE N'WWI_Primary' TO N'C:\WideWorldImporters-Full\WideWorldImporters.mdf',  
MOVE N'WWI_UserData' TO N'C:\WideWorldImporters-Full\WideWorldImporters_UserData.ndf',  
MOVE N'WWI_Log' TO N'C:\WideWorldImporters-Full\WideWorldImporters.ldf',  
MOVE N'WWI_InMemory_Data_1'
TO N'C:\WideWorldImporters-Full\WideWorldImporters_InMemory_Data_1'
GO
