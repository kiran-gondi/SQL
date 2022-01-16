--#178 - Performance Battle: Single Scan for Count and Sum
--Scripts: https://blog.sqlauthority.com/2021/06/30/sql-server-single-scan-for-3-operations-count-count1-sum1/

USE [AdventureWorks2017]
GO
-- Create sample table
SELECT *
INTO TestTable
FROM [AdventureWorks2017].[Person].[Address]
GO
-- Clustered index
CREATE CLUSTERED INDEX [CI] ON [dbo].[TestTable]
(
[AddressID] ASC
)
GO
-- Narrow non-clustered index
CREATE NONCLUSTERED INDEX [Narrow] ON [dbo].[TestTable]
(
[StateProvinceID] ASC
)
GO
-- Wide non-clustered index
CREATE NONCLUSTERED INDEX [Wide] ON [dbo].[TestTable]
(
[PostalCode] ASC
)
GO
-- Get Statistics On
SET STATISTICS IO ON
GO
SELECT COUNT(*) CountStar,
COUNT(1) CountOne,
SUM(1) SumOne
FROM TestTable
GO
-- Clean up
DROP TABLE TestTable
GO