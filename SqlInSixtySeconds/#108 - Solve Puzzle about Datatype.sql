--#108 - Solve Puzzle about Datatype

--Script: https://blog.sqlauthority.com/2020/08/24/solve-puzzle-about-data-type-sql-in-sixty-seconds-108/

-- Find your answer at 
-- https://blog.sqlauthority.com 

DECLARE @PhoneNumber VARCHAR(8) --(9)
SET @PhoneNumber='123456789'
SELECT @PhoneNumber AS PhoneNo
GO

DECLARE @PhoneNumber VARCHAR(8) --(9)
SET @PhoneNumber=123456789
SELECT @PhoneNumber AS PhoneNo
GO

--HINT: DataType and its conversion.