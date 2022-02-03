--#072 - SQL Server 2014 Cardinality Estimation 

--Script: https://blog.sqlauthority.com/2014/08/20/sql-server-cardinality-estimation-and-performance-sql-in-sixty-seconds-072/

USE AdventureWorks2017
GO
SET STATISTICS IO ON
-- -------------------------------
-- NEW Cardinality Estimation
ALTER DATABASE AdventureWorks2017
SET COMPATIBILITY_LEVEL = 120
GO
EXEC [dbo].[uspGetManagerEmployees] 44
GO
-- -------------------------------
-- Old Cardinality Estimation
ALTER DATABASE AdventureWorks2017
SET COMPATIBILITY_LEVEL = 110
GO
EXEC [dbo].[uspGetManagerEmployees] 44
GO
