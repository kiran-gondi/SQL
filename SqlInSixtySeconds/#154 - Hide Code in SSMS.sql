--#154 - Hide Code in SSMS

--Script: https://www.youtube.com/watch?v=t5mM3Jvj8k8&list=PL4BD5C24EDB584162&index=38
--DB Used here is WideWorldImporters

CREATE OR ALTER PROC SimpleSP
AS 
SELECT TOP 100 *
FROM Application.People P
INNER JOIN Sales.InvoiceLines il ON p.PersonID = il.LastEditedBy
INNER JOIN Warehouse.StockItemTransactions sit ON p.PersonID = sit.LastEditedBy
ORDER BY il.StockItemID
GO

EXEC SimpleSP;
EXEC sp_helptext SimpleSP;
GO

CREATE OR ALTER PROC EncryptedSP
WITH ENCRYPTION
AS 
SELECT TOP 100 *
FROM Application.People P
INNER JOIN Sales.InvoiceLines il ON p.PersonID = il.LastEditedBy
INNER JOIN Warehouse.StockItemTransactions sit ON p.PersonID = sit.LastEditedBy
ORDER BY il.StockItemID
GO

EXEC EncryptedSP;
EXEC sp_helptext EncryptedSP;