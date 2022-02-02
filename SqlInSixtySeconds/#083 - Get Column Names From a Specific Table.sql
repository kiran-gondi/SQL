--#083 - Get Column Names From a Specific Table

--Script: https://blog.sqlauthority.com/2017/06/29/sql-server-get-column-names-specific-table/

--Method 1: Using INFORMATION_SCHEMA.COLUMNS
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'Address'

--Method 2: Using Sys Schema (My Preferred Way)
SELECT OBJECT_SCHEMA_NAME (c.object_id) SchemaName,
        o.Name AS Table_Name, 
        c.Name AS Field_Name,
        t.Name AS Data_Type,
        t.max_length AS Length_Size,
        t.precision AS Precision
FROM sys.columns c 
     INNER JOIN sys.objects o ON o.object_id = c.object_id
     LEFT JOIN  sys.types t on t.user_type_id  = c.user_type_id   
WHERE o.type = 'U'
 and o.Name = 'Address'
ORDER BY o.Name, c.Name

--Method 3 ALT+F1
[Person].[Address]

--Method 4 sp_columns
sp_columns 'Address'