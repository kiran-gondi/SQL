--#047 - Resolve Cannot Resolve Collation Conflict Error
 
--Script: https://blog.sqlauthority.com/2013/04/03/sql-server-resolve-cannot-resolve-collation-conflict-error-sql-in-sixty-seconds-047/

--Go through the video
https://www.youtube.com/watch?v=MLcpWr9HuZY&list=PL4BD5C24EDB584162&index=143

SELECT ID
FROM ItemsTable
INNER JOIN AccountsTable
WHERE ItemsTable.Collation1Col = AccountsTable.Collation2Col


SELECT ID
FROM ItemsTable
INNER JOIN AccountsTable
WHERE ItemsTable.Collation1Col COLLATE DATABASE_DEFAULT
= AccountsTable.Collation2Col COLLATE DATABASE_DEFAULT

