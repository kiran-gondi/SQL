--#012-Introduction to Hierarchical Query

WITH CTE AS 
(
SELECT BOSS.EmpID, BOSS.LastName, BOSS.ManagerID, 1 AS lvl
FROM Employee AS BOSS
WHERE BOSS.ManagerID IS NULL

UNION ALL

SELECT Emp.EmpID, Emp.LastName, Emp.ManagerID, CTE.lvl + 1
FROM Employee AS Emp 
INNER JOIN CTE ON Emp.ManagerID = CTE.EmpID
WHERE Emp.ManagerID IS NOT NULL)

SELECT * FROM CTE