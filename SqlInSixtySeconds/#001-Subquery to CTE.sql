--#001-Subquery to CTE.sql
--BEFORE
SELECT *
FROM (
SELECT 1 AS COL1
UNION ALL
SELECT 2 AS COL1
UNION ALL
SELECT 3 AS COL1
) AS TABLE1
GO




--AFTER
;WITH TABLE1 AS
(
SELECT 1 AS COL1
UNION ALL
SELECT 2 AS COL1
UNION ALL
SELECT 3 AS COL1
)
SELECT * 
FROM TABLE1
GO

/*
WITH cte_sales_amounts (staff, sales, year) AS (
    SELECT    
        first_name + ' ' + last_name, 
        SUM(quantity * list_price * (1 - discount)),
        YEAR(order_date)
    FROM    
        sales.orders o
    INNER JOIN sales.order_items i ON i.order_id = o.order_id
    INNER JOIN sales.staffs s ON s.staff_id = o.staff_id
    GROUP BY 
        first_name + ' ' + last_name,
        year(order_date)
)

SELECT
    staff, 
    sales
FROM 
    cte_sales_amounts
WHERE
    year = 2018;*/
