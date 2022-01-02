--#003-T-SQL Constructs - Declaration and Initialization

USE AdventureWorks2017
GO

--Pre SQL 2005
DECLARE @counter INT
SET @counter = 1
SELECT @counter [Counter]
GO

--After SQL 2008
DECLARE @counter INT = 1
SELECT @counter [Counter]
GO
