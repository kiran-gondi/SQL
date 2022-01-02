--#007-Table Variables and Transactions
--Concept: Table variable/s have no effect of the transaction.
USE AdventureWorks2017
GO

-- Create Temp Table and insert single row
CREATE TABLE #TempTable (Col1 VARCHAR(100))
INSERT INTO #TempTable (Col1)
VALUES('Temp Table - Outside Tran');

-- Create Table Variable and insert single row
DECLARE @TableVar TABLE(Col1 VARCHAR(100))
INSERT INTO @TableVar (Col1)
VALUES('Table Var - Outside Tran');

-- Check the Values in tables
SELECT Col1 AS TempTable_BeforeTransaction
FROM #TempTable;
SELECT Col1 AS TableVar_BeforeTransaction
FROM @TableVar;

/*
Insert additional row in trans Rollback Transaction at the end */
BEGIN TRAN
-- Insert single row
INSERT INTO #TempTable (Col1)
VALUES('Temp Table - Inside Tran');

-- Insert single row
INSERT INTO @TableVar (Col1)
VALUES('Table Var - Inside Tran');
ROLLBACK

-- Check the Values in tables
SELECT Col1 AS TempTable_AfterTransaction
FROM #TempTable;
SELECT Col1 AS TableVar_AfterTransaction
FROM @TableVar;
GO

-- Clean up
DROP TABLE #TempTable
GO