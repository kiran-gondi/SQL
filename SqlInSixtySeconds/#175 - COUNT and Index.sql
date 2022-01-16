--#175 - COUNT(*) and Index
--Scripts: https://blog.sqlauthority.com/2021/06/18/sql-server-count-and-index-used-part-2/

-- Create sample table
SELECT *
INTO TestTable
FROM [AdventureWorks].[Person].[Address]
GO
USE [AdventureWorks]
GO

SELECT COUNT(*)
FROM TestTable
GO
-- Clustered index
CREATE CLUSTERED INDEX [CI] ON [dbo].[TestTable]
(
[AddressID] ASC
)
GO
SELECT COUNT(*)
FROM TestTable
GO

-- Narrow non-clustered index
CREATE NONCLUSTERED INDEX [Narrow] ON [dbo].[TestTable]
(
[StateProvinceID] ASC
)
GO
SELECT COUNT(*)
FROM TestTable
GO

-- Wide non-clustered index
CREATE NONCLUSTERED INDEX [Wide] ON [dbo].[TestTable]
(
[PostalCode] ASC
)
GO
SELECT COUNT(*)
FROM TestTable
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

-- Clean up
DROP TABLE TestTable
GO
