--#005-T-SQL Errors and Reactions Demo
USE AdventureWorks2017
GO

EXEC AddGrantAmount '003', 'One Thousand'
EXEC AddGrantAmount '003', NULL


SET XACT_ABORT ON;