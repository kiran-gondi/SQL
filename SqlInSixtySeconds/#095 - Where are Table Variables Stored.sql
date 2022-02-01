--#095 - Where are Table Variables Stored?

--Script: https://blog.sqlauthority.com/2020/08/06/where-are-table-variables-stored-sql-in-sixty-seconds-095/

-- Get Current Datetime
DECLARE @CurrentDateTime DATETIME = GETDATE()

-- Create Temp Table 
CREATE TABLE #TempTable (ID INT)

-- Create Memory Table
DECLARE @TableVariable TABLE(ID INT)

-- Check the Object Created in Tamp Database
SELECT * FROM tempdb.sys.objects
WHERE type = 'U'
    AND create_date >= @CurrentDateTime;

-- Clean up
DROP TABLE #TempTable;