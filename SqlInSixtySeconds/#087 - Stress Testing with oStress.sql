--#087 - Stress Testing with oStress

--Script: https://blog.sqlauthority.com/2020/05/07/stress-testing-with-ostress-sql-in-sixty-seconds-087/

--Command to change the directory:
cd C:\Program Files\Microsoft Corporation\RMLUtils

--Run oStress:
ostress -S"Quick\SQL19" -E -Q"INSERT INTO [SQLAuthority].[dbo].[TestTable] VALUES (DEFAULT);" -n5 -r20 -q

--Script to create a table:
USE [SQLAuthority]
GO
CREATE TABLE [dbo].[TestTable](
[ID] [int] IDENTITY(1,1) NOT NULL,
[Description] [varchar](500) NOT NULL DEFAULT ('I hope you have a great day!')
) ON [PRIMARY]
GO

--Insert script used inside oStress:
INSERT INTO [SQLAuthority].[dbo].[TestTable] VALUES (DEFAULT);

--Script to count the inserted row:
SELECT COUNT(*) TotalRows
FROM SQLAuthority.dbo.TestTable WITH (NOLOCK);

--Script to truncate table:	
TRUNCATE TABLE SQLAuthority.dbo.TestTable;


