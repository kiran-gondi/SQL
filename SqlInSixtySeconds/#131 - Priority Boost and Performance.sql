--#131 - Priority Boost and Performance

--Script: https://blog.sqlauthority.com/2020/10/08/priority-boost-and-performance-sql-in-sixty-seconds-131/

SELECT name, value_in_use
FROM sys.configurations
WHERE name = 'priority boost'

EXEC sys.sp_configure N'show advanced options', N'1' RECONFIGURE WITH OVERRIDE
GO
EXEC sys.sp_configure N'priority boost', N'0'
GO
RECONFIGURE WITH OVERRIDE
GO
EXEC sys.sp_configure N'show advanced options', N'0' RECONFIGURE WITH OVERRIDE
GO