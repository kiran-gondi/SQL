--#110 - Dirty Read with NOLOCK

--Script: https://blog.sqlauthority.com/2020/08/26/dirty-read-with-nolock-sql-in-sixty-seconds-110/


USE SQLAuthority
GO
CREATE TABLE Toys
    ([Name] VARCHAR(100),
    Price INT)
GO
INSERT INTO Toys ([Name], Price)
VALUES ('Car',99),('Bird',100),('Bike',100)
GO
SELECT *
FROM Toys
GO
-- Transaction
BEGIN TRANSACTION
-- First Update
UPDATE Toys
SET Price = Price+1
WHERE [Name] = 'Car';
-- Wait
WAITFOR DELAY '000:00:10'
-- Another Update
UPDATE Toys
SET Price = Price+1
WHERE [Name] = 'Car';
-- Over
COMMIT
-- Clean up
DROP TABLE Toys
GO

USE SQLAuthority
GO
SELECT *
FROM Toys
WHERE Price = 100
GO
SELECT *
FROM Toys WITH (NOLOCK)
WHERE Price = 100
GO



