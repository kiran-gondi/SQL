--#125 - Nested Transactions are Myth

--Script:https://blog.sqlauthority.com/2020/09/25/nested-transactions-are-myth-sql-in-sixty-seconds-125/

-- Create Sample Tables
USE SQLAuthority
GO
CREATE TABLE T1 (ID1 INT);
CREATE TABLE T2 (ID2 INT);
CREATE TABLE T3 (ID3 INT);
GO
SELECT  (SELECT ID1 FROM T1) T1,
        (SELECT ID2 FROM T2) T2,
        (SELECT ID3 FROM T3) T3;
GO

-- Nested Transactions
BEGIN TRAN Level1;
INSERT INTO T1 (ID1) VALUES (1);
    BEGIN TRAN Level2;
    INSERT INTO T2 (ID2) VALUES (2);
        BEGIN TRAN Level3;
        INSERT INTO T3 (ID3) VALUES (3);
        COMMIT TRAN Level3;
    COMMIT TRAN Level2;
ROLLBACK TRAN Level1;
GO

-- Select Data
SELECT  (SELECT ID1 FROM T1) T1,
        (SELECT ID2 FROM T2) T2,
        (SELECT ID3 FROM T3) T3;

-- Clean up
SELECT  (SELECT ID1 FROM T1) T1,
        (SELECT ID2 FROM T2) T2,
        (SELECT ID3 FROM T3) T3;


BEGIN TRAN
SELECT @@TRANCOUNT
