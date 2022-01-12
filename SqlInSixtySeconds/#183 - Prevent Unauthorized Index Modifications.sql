--#183 - Prevent Unauthorized Index Modifications
--Scripts: https://blog.sqlauthority.com/2021/08/24/sql-server-prevent-users-from-changing-index/

CREATE TRIGGER StopIndexCreation ON DATABASE
	FOR CREATE_INDEX,
	ALTER_INDEX,
	DROP_INDEX
AS
PRINT 'This database does not allow new Triggers.'
ROLLBACK TRANSACTION
GO

CREATE NONCLUSTERED INDEX [NCIndex] ON [Person].[Address]
(
	[City] ASC
)
GO

SELECT *
FROM [Person].[Address]
WHERE City = 'Duluth'
GO