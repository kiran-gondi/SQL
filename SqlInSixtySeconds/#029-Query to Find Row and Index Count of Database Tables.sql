--#029-Query to Find Row and Index Count of Database Tables

/*https://www.youtube.com/watch?v=3kDHC_Tjrns&list=PL4BD5C24EDB584162&index=159
Above script returns three important details about all the tables of the database. 
1) No of NonClustered Index
2) No of the Rows in the Table
3) Table Clustered Index Property (Heap or Clustered Index)
A very handy script which I use to get a quick assessment of the database. */

SELECT [schema_name] = s.name, table_name = o.name,
MAX(i1.type_desc) ClusteredIndexOrHeap,
COUNT(i.TYPE) NoOfNonClusteredIndex, p.rows
FROM sys.indexes i
RIGHT JOIN sys.objects o ON i.[object_id] = o.[object_id] AND i.TYPE=2
INNER JOIN sys.schemas s ON o.[schema_id] = s.[schema_id] 
LEFT JOIN sys.partitions p ON p.OBJECT_ID = o.OBJECT_ID AND p.index_id IN (0,1)
LEFT JOIN sys.indexes i1 ON o.OBJECT_ID  = i1.OBJECT_ID AND i1.TYPE IN (0,1)
WHERE o.TYPE IN ('U')
GROUP BY s.name, o.name, p.rows
ORDER BY schema_name, table_name