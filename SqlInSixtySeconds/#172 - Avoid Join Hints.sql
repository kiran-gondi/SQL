--#172 - Avoid Join Hints
--Scripts: https://blog.sqlauthority.com/2021/04/22/sql-server-change-join-type-for-query/

SELECT *
FROM [Person].[Person] p
INNER JOIN [Person].[PersonPhone] ph ON p.BusinessEntityID = ph.BusinessEntityID

SELECT *
FROM [Person].[Person] p
INNER JOIN [Person].[PersonPhone] ph ON p.BusinessEntityID = ph.BusinessEntityID
OPTION (HASH JOIN)

SELECT *
FROM [Person].[Person] p
INNER JOIN [Person].[PersonPhone] ph ON p.BusinessEntityID = ph.BusinessEntityID
OPTION (LOOP JOIN)

SELECT *
FROM [Person].[Person] p
INNER JOIN [Person].[PersonPhone] ph ON p.BusinessEntityID = ph.BusinessEntityID
OPTION (HASH JOIN, LOOP JOIN)
