--#111 - Single Column Single Row and TABLE SCAN

--Script: https://blog.sqlauthority.com/2020/08/27/single-column-single-row-and-table-scan-sql-in-sixty-seconds-111/

USE WideWorldImporters
GO
SET STATISTICS IO ON
SELECT BillToCustomerID
FROM Sales.Invoices
WHERE InvoiceDate = '2013-12-09'
        AND DeliveryInstructions = 'Shop 191, 435 Vladu Crescent'
OPTION (MAXDOP 1) 
GO
SELECT *
FROM Sales.Invoices
GO
