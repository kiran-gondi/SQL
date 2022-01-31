--#101 - Negative Identity Column

--Script: https://blog.sqlauthority.com/2020/08/14/negative-identity-column-sql-in-sixty-seconds-101/

CREATE TABLE TestTable 
    (ID INT IDENTITY (0,-1), Col1 VARCHAR(100))
GO

INSERT INTO TestTable (Col1) 
VALUES ('SQLAuthority.com') 
GO 20 

SELECT *
FROM TestTable
ORDER BY ID
GO

DROP TABLE TestTable
GO
