--#097 - Alter Index Add Column - Workaround

--Script: https://blog.sqlauthority.com/2020/08/08/alter-index-add-column-workaround-sql-in-sixty-seconds-097/

ALTER INDEX [FK_Sales_Orders_ContactPersonID]
ON [Sales].[Orders] REBUILD

USE [WideWorldImporters]
GO
CREATE NONCLUSTERED INDEX [FK_Sales_Orders_ContactPersonID] ON [Sales].[Orders]
(
    [ContactPersonID] ASC
)
INCLUDE([PickingCompletedWhen]) WITH (DROP_EXISTING = ON) ON [USERDATA]
GO