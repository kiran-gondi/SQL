--#078 - Schema Change Reports

--Script: https://blog.sqlauthority.com/2015/01/06/sql-server-finding-tables-created-last-week-dba-tip/


SELECT o.name AS [Object_Name],
s.name [Schema_Name],
o.type_desc [Description],
o.create_date [Creation_Date],
o.modify_date [Modified_Date] FROM   sys.all_objects o
LEFT OUTER JOIN sys.schemas s
ON o.schema_id = s.schema_id
WHERE  create_date > (GETDATE() - 7) OR modify_date > (GETDATE() - 7)