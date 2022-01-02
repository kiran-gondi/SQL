--#024-Three Methods to Insert Multiple Rows into Single Table

--Insert Multiple Values into SQL Server
CREATE TABLE #SQLAuthority (ID INT, Value VARCHAR(100));

--Method 1 - Traditional Insert
INSERT INTO #SQLAuthority (ID, Value)
VALUES(1, 'First');
INSERT INTO #SQLAuthority (ID, Value)
VALUES(2, 'Second');
INSERT INTO #SQLAuthority (ID, Value)
VALUES(3, 'Third');

--Clean up
TRUNCATE TABLE #SQLAuthority;

--Method 2 - Select Union Insert
INSERT INTO #SQLAuthority (ID, Value)
SELECT 1, 'First'
UNION ALL
SELECT 2, 'Second'
UNION ALL
SELECT 3, 'Third'

--Clean up
TRUNCATE TABLE #SQLAuthority;


--Method 2 - Select Union Insert
INSERT INTO #SQLAuthority (ID, Value)
VALUES (1, 'First'), (2, 'Second'), (3, 'Third')

--Clean up
TRUNCATE TABLE #SQLAuthority;