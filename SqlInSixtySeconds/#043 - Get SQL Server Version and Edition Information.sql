--#043 - Get SQL Server Version and Edition Information
 
--Script: https://blog.sqlauthority.com/2013/02/13/sql-server-get-sql-server-version-and-edition-information-sql-in-sixty-seconds-043-video/


SELECT @@VERSION VersionInfo
GO

EXEC xp_msver
GO

SELECT SERVERPROPERTY('productversion'),
	   SERVERPROPERTY('productlevel'),
	   SERVERPROPERTY('edition')