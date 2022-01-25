--#130 - SSMS Efficiency - Replace STAR

--Script: https://blog.sqlauthority.com/2020/10/07/ssms-efficiency-replace-star-sql-in-sixty-seconds-130/

SELECT * 
FROM [dbo].[TestTable]

SELECT [AddressID], [AddressLine1], [AddressLine2], [City], [StateProvinceID], [PostalCode], [SpatialLocation], [rowguid], [ModifiedDate] 
FROM [dbo].[TestTable]

