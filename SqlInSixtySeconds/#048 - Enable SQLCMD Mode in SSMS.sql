--#048 - Enable SQLCMD Mode in SSMS
 
--Script: https://blog.sqlauthority.com/2013/04/10/sql-server-enable-sqlcmd-mode-in-ssms-sql-in-sixty-seconds-048/
--https://docs.microsoft.com/en-us/sql/ssms/scripting/edit-sqlcmd-scripts-with-query-editor?view=sql-server-2017

SELECT @@SERVERNAME
GO
:Connect localhost
SELECT @@SERVERNAME
GO

USE AdventureWorks2012
GO
SELECT DISTINCT Type FROM Sales.SpecialOffer;
GO
!!DIR
GO
SELECT ProductCategoryID, Name FROM Production.ProductCategory;
GO