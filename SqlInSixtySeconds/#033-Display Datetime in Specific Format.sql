--#033-Display Datetime in Specific Format

--SQL Server 2000/2005/2008/2012 onwards
--Datetime
SELECT CONVERT(VARCHAR(30), GETDATE()) AS DateConvert;
SELECT CONVERT(VARCHAR(30), GETDATE(), 10) AS DateConvert;
SELECT CONVERT(VARCHAR(30), GETDATE(), 110) AS DateConvert;
SELECT CONVERT(VARCHAR(30), GETDATE(), 5) AS DateConvert;
SELECT CONVERT(VARCHAR(30), GETDATE(), 105) AS DateConvert;
SELECT CONVERT(VARCHAR(30), GETDATE(), 113) AS DateConvert;
SELECT CONVERT(VARCHAR(30), GETDATE(), 114) AS DateConvert;
GO

--SQL Server 2012 onwards
--Various format of Datetime
SELECT CONVERT(VARCHAR(30), GETDATE(), 113) AS DateConvert;
SELECT FORMAT (GETDATE(), 'dd mon yyyy HH:m:ss:mmm', 'en-US') AS DateConvert;
SELECT CONVERT(VARCHAR(30), GETDATE(), 114) AS DateConvert;
SELECT FORMAT (GETDATE(), 'HH:m:ss:mmm', 'en-US') AS DateConvert;
GO

SELECT FORMAT(GETDATE(), N'"Current Time is "dddd MMMM dd, yyyy', 'en-US') AS CurrentTimeString;