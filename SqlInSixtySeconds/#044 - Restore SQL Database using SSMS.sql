--#044 - Restore SQL Database using SSMS
 
--Script: https://blog.sqlauthority.com/2013/02/20/sql-server-restore-sql-database-using-ssms-sql-in-sixty-seconds-044-video/
https://blog.sqlauthority.com/2007/02/25/sql-server-restore-database-backup-using-sql-script-t-sql/

--Go through the video
https://www.youtube.com/watch?v=i_MHQH2sTcc&list=PL4BD5C24EDB584162&index=148

--Step 1: Retrive the Logical file name of the database from backup.
RESTORE FILELISTONLY
FROM DISK = 'D:\BackUpYourBaackUpFile.bak'
GO

--Step 2: Use the values in the LogicalName Column in following Step.
----Make Database to single user Mode
ALTER DATABASE YourDB
SET SINGLE_USER WITH
ROLLBACK IMMEDIATE
 
----Restore Database
RESTORE DATABASE YourDB
FROM DISK = 'D:\BackUpYourBaackUpFile.bak'
WITH MOVE 'YourMDFLogicalName' TO 'D:\DataYourMDFFile.mdf',
MOVE 'YourLDFLogicalName' TO 'D:\DataYourLDFFile.ldf'
 
/*If there is no error in statement before database will be in multiuser
mode.
If error occurs please execute following command it will convert
database in multi user.*/
ALTER DATABASE YourDB SET MULTI_USER
GO



