--#158 - Case Sensitive Search

--Script: https://blog.sqlauthority.com/2021/03/15/sql-server-case-sensitive-search/

	
CREATE TABLE Names (NamesCol VARCHAR(100));

INSERT INTO Names (NamesCol)
VALUES ('Jack'),('jack'),('jacK');

SELECT *
FROM Names
WHERE NamesCol = 'jack'

SELECT *
FROM Names
WHERE NamesCol COLLATE Latin1_General_CS_AS = 'jack'

SELECT name, collation_name
FROM sys.databases

--Case Insensitive
SQL_Latin1_General_CP1_CI_AS

--Case Sensitive
Latin1_General_CS_AS

DROP TABLE Names;

