--#166 - 3 Ways to Configure MAXDOP

--Go through the video for settings 
--https://www.youtube.com/watch?v=Bw0l1Bo-c-A&list=PL4BD5C24EDB584162&index=26

--#1: Server Level Properties
EXEC sys.sp_configure N'max degree of parallelism', N'2'

--#2: Database Level Properties
USE [AdventureWorks]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 2;
GO

--#3: Query Level Properties
SELECT *
	FROM [Sales].[SalesOrderDetail]
	ORDER BY ModifiedDate
	OPTION (MAXDOP 2)