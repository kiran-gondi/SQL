--#090 - Creating Covering Index to Eliminate Join

--Script: https://blog.sqlauthority.com/2020/07/29/creating-covering-index-to-eliminate-join-sql-in-sixty-seconds-090/

SET STATISTICS IO ON;

SELECT [InvoiceID]     
      ,[ContactPersonID]
      ,[AccountsPersonID]
  FROM [WideWorldImporters].[Sales].[Invoices]
  WHERE [ContactPersonID] >= 3032 AND
        [ContactPersonID] <= 3035;


CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_ContactPersonID] ON [Sales].[Invoices]
(
    [ContactPersonID] ASC
)
INCLUDE([AccountsPersonID])