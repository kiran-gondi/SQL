--#032-Rename Columnname or Tablename

USE tempdb
GO
CREATE TABLE TestTable (ID INT, OldName VARCHAR(20))
GO
INSERT INTO TestTable
VALUES (1, 'First')
GO

--Check the Tabledata
SELECT *
FROM TestTable
GO

--Rename the ColumnName
SP_RENAME 'TestTable.OldName', 'NewName', 'Column'
GO

--Check the Tabledata
SELECT *
FROM TestTable
GO

--Rename the TableName
SP_RENAME 'TestTable', 'NewTable'
GO

--Check the Tabledata - Error
SELECT *
FROM TestTable
GO

--Check the Tabledata - New
SELECT *
FROM NewTable
GO

--Cleanup
DROP TABLE NewTable