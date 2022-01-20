--#156 - Multiple Backup Files Stripped

--Script: https://blog.sqlauthority.com/2021/02/18/sql-server-creating-multiple-backup-files/

BACKUP DATABASE [CollationTest] TO
DISK = N'D:\data\backup1.bak', --1stcopy
DISK = N'D:\data\backupcopy2.bak' --2ndcopy
WITH STATS = 10
GO