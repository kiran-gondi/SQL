--#161 - Query Ignoring CPU Threads 

--Go through the video for settings 
--https://www.youtube.com/watch?v=3DkIS31k-c8&list=PL4BD5C24EDB584162&index=31


SELECT *
FROM [WideWorldImporters].[Sales].[Orders]
ORDER BY [DeliveryInstructions]
--OPTION (MAXDOP 4)