--#182 - MAX Columns Ever Existed in Table
--Scripts:https://blog.sqlauthority.com/2021/07/29/sql-server-max-column-id-used-in-table/

SELECT name, max_column_id_used
FROM sys.tables
WHERE name = 'Test';

CREATE TABLE Test
(ID1 INT, ID2 INT, ID3 INT, ID4 INT, ID5 INT);

ALTER TABLE Test
DROP COLUMN ID1;
ALTER TABLE Test
DROP COLUMN ID5;

ALTER TABLE Test
ADD ID6 INT;

ALTER TABLE Test
ADD ID1 INT;

DROP TABLE Test;
