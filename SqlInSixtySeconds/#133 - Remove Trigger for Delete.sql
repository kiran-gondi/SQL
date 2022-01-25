--#133 - Remove Trigger for Delete

--Script 1: https://blog.sqlauthority.com/2020/10/13/remove-trigger-for-delete-sql-in-sixty-seconds-133/
--Script 2: https://blog.sqlauthority.com/2020/10/11/how-to-capture-deleted-rows-without-trigger-interview-question-of-the-week-297/

-- Creating two tables
CREATE TABLE MainTab (ID1 INT, Col1 VARCHAR(100))
GO
CREATE TABLE DeletedTab (ID3 INT, Col3 VARCHAR(100))
GO
-- Inserting into two tables together
INSERT INTO MainTab (ID1, Col1)
VALUES(1,'Col'), (2, 'Col2')
GO
-- Deleting from Main Table
-- Inserting in Deleted Table
DELETE FROM MainTab
OUTPUT deleted.ID1, deleted.Col1
INTO DeletedTab
WHERE ID1 = 1
GO
--Selecting from both the tables
SELECT *
FROM DeletedTab;
SELECT *
FROM MainTab;
-- Clean up
DROP TABLE MainTab;
DROP TABLE DeletedTab;
GO

