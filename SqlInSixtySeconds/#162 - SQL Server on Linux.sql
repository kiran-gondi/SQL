--#162 - SQL Server on Linux 

--Go through the video for settings 
--https://www.youtube.com/watch?v=IoaKsOHm66c&list=PL4BD5C24EDB584162&index=30

--Script: https://blog.sqlauthority.com/2021/05/11/sql-server-on-linux-commands/

--Query to check for the host of the SQL Server.
SELECT host_platform, host_distribution, host_release,
	host_service_pack_level, host_sku, os_language_version
FROM sys.dm_os_host_info;