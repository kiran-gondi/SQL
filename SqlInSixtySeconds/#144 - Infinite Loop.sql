--#144 - Infinite Loop

--Video: https://www.youtube.com/watch?v=U6DHGvVGPps&list=PL4BD5C24EDB584162&index=48

--Query 1
WHILE 1 = 1
SELECT 1

--Query 2
DECLARE @Counter INT 
SET @Counter = 100
WHILE (@Counter > 0)
BEGIN
	SELECT @Counter;
	SET @Counter = @Counter - 1;
END

--Query 3
DECLARE @timerctr DATETIME
SET @timectr = GETDATE()
WHILE (DATEDIFF(s, @timectr, GETDATE()) < 60)
BEGIN
	SELECT GETDATE()
	WAITFOR DELAY '00:00:01'
END