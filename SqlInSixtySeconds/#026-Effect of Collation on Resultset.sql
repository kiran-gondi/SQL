--#026-Effect of Collation on Resultset

USE TempDB
GO
--Sample Data Building
CREATE TABLE ColTable
(Col1 VARCHAR(15) COLLATE Latin1_General_CI_AS, --Case In-Sensitive Collation
Col2 VARCHAR(15) COLLATE Latin1_General_CS_AS); --Case Sensitive Collation

INSERT ColTable(Col1, Col2)
VALUES('Apple', 'Apple'),
('apple', 'apple'),
('pineapple', 'pineapple'),
('Pineapple', 'Pineapple');
GO

--Retrieve Data
SELECT *
FROM ColTable
ORDER BY Col1
GO

--Retrieve Data
SELECT *
FROM ColTable
ORDER BY Col2
GO

--Clean up
DROP TABLE ColTable
GO