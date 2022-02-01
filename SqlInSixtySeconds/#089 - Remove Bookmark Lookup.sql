--#089 - Remove Bookmark Lookup

--Script: https://blog.sqlauthority.com/2020/07/22/remove-bookmark-lookup-sql-in-sixty-seconds-089/

SET STATISTICS IO ON

SELECT [OrderID],[ContactPersonID],
        [PickingCompletedWhen]
FROM [WideWorldImporters].[Sales].[Orders]
WHERE ContactPersonID = 3176;

CREATE NONCLUSTERED INDEX [FK_Sales_Orders_ContactPersonID] ON [Sales].[Orders]
([ContactPersonID] ASC) INCLUDE([PickingCompletedWhen]);