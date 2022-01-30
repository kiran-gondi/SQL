--#124 - Dropping Temp Table in Stored Procedure

--Script:https://blog.sqlauthority.com/2020/09/22/dropping-temp-table-in-stored-procedure-sql-in-sixty-seconds-124/


CREATE OR ALTER PROCEDURE TempDrop
AS
CREATE TABLE #TempTable (ID BIGINT)
INSERT INTO #TempTable (ID)
VALUES (1)
DROP TABLE #TempTable;
GO


CREATE OR ALTER PROCEDURE TempNoDrop
AS
CREATE TABLE #TempTable (ID BIGINT)
INSERT INTO #TempTable (ID)
VALUES (1)
-- DROP TABLE #Temp1;
GO

--Tip: For cleaner code always drop the temp table in the stored procedure/s
SET NOCOUNT ON
EXEC TempDrop
GO 5000

SET NOCOUNT ON
EXEC TempNoDrop
GO 5000


