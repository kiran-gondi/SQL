--#119 - Nonclustered Primary Key

--Script: https://blog.sqlauthority.com/2020/09/07/nonclustered-primary-key-sql-in-sixty-seconds-119/

--Clustered Primary Key
USE SQLAuthority
GO
CREATE TABLE TestTable
(
	ID INT NOT NULL,
	Col1 INT NOT NULL,
)
GO
ALTER TABLE TestTable
ADD PRIMARY KEY (ID);
GO
DROP TABLE TestTable;
GO

--Non-Clustered Primary Key
USE SQLAuthority
GO
CREATE TABLE TestTable
(
	ID INT NOT NULL,
	Col1 INT NOT NULL,
)
GO
ALTER TABLE TestTable
ADD PRIMARY KEY NONCLUSTERED (ID);
GO
DROP TABLE TestTable;
GO


--Auto Non-Clustered Primary Key
USE SQLAuthority
GO
CREATE TABLE TestTable
(
	ID INT NOT NULL,
	Col1 INT NOT NULL,
)
GO
CREATE CLUSTERED INDEX IX_PK
ON TestTable(Col1);
GO
ALTER TABLE TestTable
ADD PRIMARY KEY (ID);
GO
DROP TABLE TestTable;
GO
