--#151 - Find Table in Execution Plan

--Video: https://www.youtube.com/watch?v=GzcgTwe9ZkQ&list=PL4BD5C24EDB584162&index=41

--SELECT *
--FROM [Sales].[Orders] o
--INNER JOIN [Sales].[OrderLines] ol ON o.OrderID = ol.OrderID

SELECT *
FROM [Production].[Product] p
INNER JOIN [Production].[ProductModel] pm ON p.ProductModelID = pm.ProductModelID




