--#075 - Search Records with Single Quotes

--Script: https://blog.sqlauthority.com/2014/10/22/sql-server-search-records-with-single-quotes-sql-in-sixty-seconds-075/

SELECT [ProductModelID]
,[Name]
FROM [AdventureWorks2017].[Production].[ProductModel]
WHERE [Name] LIKE '%''%'
GO

SELECT [ProductModelID]
,[Name]
FROM [AdventureWorks2017].[Production].[ProductModel]
WHERE [Name] LIKE '%'+CHAR(39)+'%'
GO

SELECT [ProductModelID]
,[Name]
FROM [AdventureWorks2017].[Production].[ProductModel]
WHERE CHARINDEX('''',[Name]) <> 0
GO

SELECT [ProductModelID]
,[Name]
FROM [AdventureWorks2017].[Production].[ProductModel]
WHERE [Name] <> REPLACE(name, '''','')
GO