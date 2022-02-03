--#055 - Delay Command in SQL Server
 
--Script: https://blog.sqlauthority.com/2013/07/17/sql-server-delay-command-in-sql-server-sql-in-sixty-seconds-055/

----Delay for 20 seconds
WAITFOR DELAY '000:00:20'
SELECT '20 Second Delay'
GO
----Delay till 7 AM
WAITFOR TIME '7:00:00'
SELECT 'Good Morning'
GO

--Sleep in SQL Server
--Delay in SQL Server
SELECT GETDATE() CurrentDateTime
WAITFOR DELAY '00:00:10'
SELECT GETDATE() CurrentDateTime
