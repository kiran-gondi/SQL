--#010-Installing AdventureWorks Sample Database

CREATE DATABASE AdventureWorks2012
ON (FILENAME = 'D:\data\AdventureWorks2012_Data.mdf')
FOR ATTACH_REBUILD_LOG;