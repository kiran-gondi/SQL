--#052 - Puzzle SET ANSI_NULLS and Resultset
 
--Script: https://blog.sqlauthority.com/2013/05/29/sql-server-puzzle-set-ansi_nulls-and-resultset-sql-in-sixty-seconds-052/


-- Original Puzzle
-- Script
SET ANSI_NULLS ON;
-- Query1
SELECT 'SQLAuthority' AS Statement11
WHERE 'Authority' IN ('S','Q', 'L', 'Authority', NULL);
-- Query 2
SELECT 'SQLAuthority' AS Statement12
WHERE 'Authority' NOT IN ('S','Q', 'L', NULL);


-- Puzzle Solution
-- New puzzle
SET ANSI_NULLS OFF;
-- Query3
SELECT 'SQLAuthority' AS Statement11
WHERE 'Authority' IN ('S','Q', 'L', 'Authority', NULL);
-- Query 4
SELECT 'SQLAuthority' AS Statement12
WHERE 'Authority' NOT IN ('S','Q', 'L', NULL);