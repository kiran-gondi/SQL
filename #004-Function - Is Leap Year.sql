--#004 - Function: Is Leap Year
USE AdventureWorks2017
GO

--CONCAT - 2012
--EOMONTH - 2012
--DATEPART
--IIF - 2012

DECLARE @year INT = 2012;
SELECT CONCAT(@year, '0201');
SELECT EOMONTH(CONCAT(@year, '0201'));
SELECT DATEPART(dd, (EOMONTH(CONCAT(@year, '0201'))));
SELECT IIF(DATEPART(dd, (EOMONTH(CONCAT(@year, '0201')))) = 29, 1, 0)
GO

CREATE FUNCTION dbo.IsLeapYear (@year INT)
RETURNS INT
AS
BEGIN
RETURN(IIF(DATEPART(dd,(EOMONTH(CONCAT(@year, '0201')))) = 29, 1, 0))
END
GO

SELECT dbo.IsLeapYear('2011') '2011_IsNOTLeapYear'
SELECT dbo.IsLeapYear('2012') '2012_IsLeapYear'
GO