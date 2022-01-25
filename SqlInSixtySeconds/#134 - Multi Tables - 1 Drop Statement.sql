--#134 - Multi Tables - 1 Drop Statement

--Script: https://blog.sqlauthority.com/2020/10/16/multi-tables-1-drop-statement-sql-in-sixty-seconds-134/

CREATE TABLE testing1(ID INT, NAME VARCHAR(100));
CREATE TABLE testing2(ID INT, NAME VARCHAR(100));
CREATE TABLE testing3(ID INT, NAME VARCHAR(100));

DROP TABLE testing1, testing2, testing3;

DROP TABLE IF EXISTS testing1, testing2, testing3;


--OUTROW TIP
BEGIN TRAN
	DROP TABLE testing1, testing2, testing3;
ROLLBACK

DROP TABLE IF EXISTS testing1, testing2, testing3;