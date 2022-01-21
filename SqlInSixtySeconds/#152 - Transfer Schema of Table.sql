--#152 - Transfer Schema of Table

--Video: https://www.youtube.com/watch?v=8u5eXhvTGGQ&list=PL4BD5C24EDB584162&index=40

ALTER SCHEMA NewSchema
TRANSFER OldSchema.TableName;

ALTER SCHEMA Person
TRANSFER dbo.orders;