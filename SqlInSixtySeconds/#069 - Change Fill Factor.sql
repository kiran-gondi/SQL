--#069 - Change Fill Factor

--Script: https://blog.sqlauthority.com/2014/06/18/sql-server-change-fill-factor-sql-in-sixty-seconds-069/

EXEC sys.sp_configure N'fill factor (%)', N'80'
GO
RECONFIGURE WITH OVERRIDE
GO
