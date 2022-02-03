--#042 - Generate Random Values
 
--Script: https://blog.sqlauthority.com/2013/02/06/sql-server-generate-random-values-sql-in-sixty-seconds-042-video/
https://blog.sqlauthority.com/2007/04/29/sql-server-random-number-generator-script-sql-query/

--Method 1: Generate Random Numbers (Int) between Rang
---- Create the variables for the random number generation
DECLARE @Random INT;
DECLARE @Upper INT;
DECLARE @Lower INT
 
---- This will create a random number between 1 and 999
SET @Lower = 1 ---- The lowest random number
SET @Upper = 999 ---- The highest random number
SELECT @Random = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)
SELECT @Random

--Method 2: Generate Random Float Numbers
SELECT RAND( (DATEPART(mm, GETDATE()) * 100000 )
+ (DATEPART(ss, GETDATE()) * 1000 )
+ DATEPART(ms, GETDATE()) )

--Method 3: Random Numbers Quick Scripts
---- random float from 0 up to 20 - [0, 20)
SELECT 20*RAND()
-- random float from 10 up to 30 - [10, 30)
SELECT 10 + (30-10)*RAND()
--random integer BETWEEN 0
AND 20 - [0, 20]
SELECT CONVERT(INT, (20+1)*RAND())
----random integer BETWEEN 10
AND 30 - [10, 30]
SELECT 10 + CONVERT(INT, (30-10+1)*RAND())

--Method 4: Random Numbers (Float, Int) Tables Based on Time
DECLARE @t TABLE( randnum float )
DECLARE @cnt INT; SET @cnt = 0
WHILE @cnt <=10000
BEGIN
SET @cnt = @cnt + 1
INSERT INTO @t
SELECT RAND( (DATEPART(mm, GETDATE()) * 100000 )
+ (DATEPART(ss, GETDATE()) * 1000 )
+ DATEPART(ms, GETDATE()) )
END
SELECT randnum, COUNT(*)
FROM @t
GROUP BY randnum

--Method 5: Random number on a per-row basis
---- The distribution is pretty good however there are the occasional peaks.
---- If you want to change the range of values just change the 1000 to the maximum value you want.
---- Use this as the source of a report server report and chart the results to see the distribution
SELECT randomNumber, COUNT(1) countOfRandomNumber
FROM (
SELECT ABS(CAST(NEWID() AS binary(6)) %1000) + 1 randomNumber
FROM sysobjects) sample
GROUP BY randomNumber
ORDER BY randomNumber


