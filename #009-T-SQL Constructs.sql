--#009-T-SQL Constructs - += and *= - 
--Note: Here we can see the += which is similar to .NET

--Increment Operations
DECLARE @counter int = 1

--Returns 2
SELECT @counter += 1
PRINT @counter

--Return 6
SELECT @counter *= 3
PRINT @counter

--Return 3
SELECT @counter /= 2
PRINT @counter

