--#145 - Change Database Collation

--Script: https://blog.sqlauthority.com/2020/12/01/sql-server-change-database-and-table-collation/

--Collation refers to set of rules that determine how data is sorted & compared


SELECT name, collation_name
FROM sys.databases
WHERE name = 'CollationTest';

SELECT name, collation_name
FROM sys.all_columns
WHERE OBJECT_NAME(OBJECT_ID) = 'TestTable';

ALTER DATABASE CollationTest 
    SET SINGLE_USER 
    WITH ROLLBACK IMMEDIATE;
 
ALTER DATABASE CollationTest 
    COLLATE SQL_Latin1_General_CP1_CS_AS;
 
ALTER TABLE TestTable 
    ALTER COLUMN Col1 NCHAR(10) 
    COLLATE SQL_Latin1_General_CP1_CS_AS;
 
ALTER DATABASE CollationTest 
    SET MULTI_USER;


--To get total collation in SQL Server
SELECT count(name) TotalCollection
FROM sys.fn_helpcollations();
