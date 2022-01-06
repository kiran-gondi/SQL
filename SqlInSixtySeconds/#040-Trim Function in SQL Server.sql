--#040-Trim Function in SQL Server

--Following will throw an error in old db sql editor 2005 etc.
DECLARE @String1 NVARCHAR(MAX)
SET @String1 = '    String     '
SELECT TRIM(@String1) TrimmedValue
GO

--Following will work
DECLARE @String1 NVARCHAR(MAX)
SET @String1 = '    String     '
SELECT @String1 OriginalString, RTRIM(LTRIM(@String1)) TrimmedValue
GO
