--#177 - SUM(1) vs COUNT(1) Performance Battle
--Scripts: https://blog.sqlauthority.com/2021/06/24/sql-server-count-collection-of-articles/

-- Create sample table
SELECT *
INTO TestTable
FROM [AdventureWorks].[Person].[Address]
GO
USE [AdventureWorks]
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
SELECT COUNT(*)
FROM TestTable
GO
SELECT COUNT(1)
FROM TestTable
GO
SELECT SUM(1)
FROM TestTable
GO
-- Clean up
DROP TABLE TestTable
GO