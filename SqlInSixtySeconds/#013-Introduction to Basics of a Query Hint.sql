--#013-Introduction to Basics of a Query Hint

--BEFORE
SELECT *
FROM Customer
WHERE CustomerType = 'Business'

SELECT *
FROM Customer
WHERE CustomerType = 'Consumer'

--AFTER
DECLARE @Type VARCHAR(50)
SET @Type = 'Business'

SELECT *
FROM Customer
WHERE CustomerType = @Type
OPTION (Optimize FOR (@Type = 'Business'))



