--#150 - Transactions and Variables 

DECLARE @Var VARCHAR(100)
SET @Var = 'Var - Outside Tran'
SELECT @Var BeforeTransaction
BEGIN TRAN
SET @Var = 'Var - Inside Tran'
ROLLBACK
SELECT @Var AfterRollBackTran

-------------------------------------  
-------------------------------------
DECLARE @TableVar TABLE(Col1 VARCHAR(100))
INSERT INTO @TableVar (Col1)
VALUES ('Table Var - Outside Tran');

BEGIN TRAN
INSERT INTO @TableVar (Col1)
VALUES ('Table Var - Inside Tran')
ROLLBACK

SELECT Col1 AS TableVar_AfterTransaction
FROM @TableVar;
GO

