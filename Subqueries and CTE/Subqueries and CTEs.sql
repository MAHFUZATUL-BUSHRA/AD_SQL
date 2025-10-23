-- Subqueries and Common Table Expression (CTEs)

-- Example of using SubQuery to find the employees who work in departments with the highest average salary

USE ADVANCED_SQL_DB;

SELECT 
    E.EMPLOYEE_ID,
    CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS EMPLOYEE_NAME,
    E.DEPARTMENT_ID,
    D.DEPARTMENT_NAME AS DEPARTMENT_WITH_HIGHEST_AVG_SALARY
FROM
    EMPLOYEES E
        LEFT JOIN
    DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE
    E.DEPARTMENT_ID = (SELECT 
            DEPARTMENT_ID
        FROM
            (SELECT 
                DEPARTMENT_ID, AVG(SALARY) AS DEPT_AVG_SALARY
            FROM
                EMPLOYEES
            GROUP BY 1
            ORDER BY 2 DESC
            LIMIT 1) AS HIGHEST_PAYING_DEPARTMENT);


-- LET'S TRY TO SOLVE THIS USING A CTE

WITH HIGHEST_PAYING_DEPARTMENT AS (
SELECT 
	DEPARTMENT_ID, 
    AVG(SALARY) AS DEPT_AVG_SALARY
FROM
	EMPLOYEES
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1)

SELECT 
    E.EMPLOYEE_ID,
    CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS EMPLOYEE_NAME,
    E.DEPARTMENT_ID,
    D.DEPARTMENT_NAME AS DEPARTMENT_WITH_HIGHEST_AVG_SALARY,
    HPD.DEPT_AVG_SALARY
FROM
    EMPLOYEES E
        LEFT JOIN
    DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
		INNER JOIN HIGHEST_PAYING_DEPARTMENT HPD ON HPD.DEPARTMENT_ID = D.DEPARTMENT_ID;
        
        
-- Top Selling Category in Each Month
WITH monthly_sales AS (
    -- Step 1: Calculate monthly sales by product category
    SELECT 
        YEAR(o.order_date) AS year,
        MONTH(o.order_date) AS month,
        c.category_name,
        SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) AS total_sales
    FROM 
        orders o
    JOIN 
        order_items oi ON o.order_id = oi.order_id
    JOIN 
        products p ON oi.product_id = p.product_id
    JOIN 
        categories c ON p.category_id = c.category_id
    WHERE 
        o.status = 'Delivered'
    GROUP BY 
        YEAR(o.order_date), MONTH(o.order_date), c.category_name
),

SALES_RANK AS
(SELECT 
	YEAR,
    MONTH,
    CATEGORY_NAME,
    TOTAL_SALES,
    RANK() OVER(PARTITION BY YEAR, MONTH ORDER BY TOTAL_SALES DESC) AS SALES_RNK
FROM monthly_sales)

SELECT
	*
FROM SALES_RANK
WHERE SALES_RNK = 1; 



-- Example 1: Subquery in the WHERE Clause (Single-value Subquery)
-- This example finds products that have a higher-than-average unit price
SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    p.unit_price
FROM 
    products p
JOIN 
    categories c ON p.category_id = c.category_id
WHERE 
    p.unit_price > (SELECT AVG(unit_price) FROM products)
ORDER BY 
    p.unit_price DESC;
    
-- SubQueries can be used in the SELECT and FROM Clause as well.

-- Example 2: Nested Subqueries
-- This example finds employees who work in departments with the highest average salary
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    e.salary
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    e.department_id = (
        SELECT department_id
        FROM (
            SELECT 
                department_id,
                AVG(salary) AS avg_dept_salary
            FROM 
                employees
            GROUP BY 
                department_id
            ORDER BY 
                avg_dept_salary DESC
            LIMIT 1
        ) AS highest_paying_dept
    )
ORDER BY 
    e.salary DESC;
    
    
-- Example 1: Basic CTE Structure
-- This example shows the basic syntax of a CTE and how it can be used to simplify a query
WITH employee_details AS (
    SELECT 
        e.employee_id,
        CONCAT(e.first_name, ' ', e.last_name) AS full_name,
        d.department_name,
        r.region_name,
        e.salary
    FROM 
        employees e
    JOIN 
        departments d ON e.department_id = d.department_id
    JOIN 
        regions r ON e.region_id = r.region_id
)
SELECT 
    full_name,
    department_name,
    region_name,
    salary
FROM 
    employee_details
WHERE 
    salary > 80000
ORDER BY 
    salary DESC;
    

-- Example 2: CTE for Multi-step Data Transformation
-- This example demonstrates using a CTE for step-by-step data transformation in sales analysis
WITH monthly_sales AS (
    -- Step 1: Calculate monthly sales by product category
    SELECT 
        YEAR(o.order_date) AS year,
        MONTH(o.order_date) AS month,
        c.category_name,
        SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) AS total_sales
    FROM 
        orders o
    JOIN 
        order_items oi ON o.order_id = oi.order_id
    JOIN 
        products p ON oi.product_id = p.product_id
    JOIN 
        categories c ON p.category_id = c.category_id
    WHERE 
        o.status = 'Delivered'
    GROUP BY 
        YEAR(o.order_date), MONTH(o.order_date), c.category_name
),
category_monthly_ranking AS (
    -- Step 2: Rank categories by sales within each month
    SELECT 
        year,
        month,
        category_name,
        total_sales,
        RANK() OVER (PARTITION BY year, month ORDER BY total_sales DESC) AS sales_rank
    FROM 
        monthly_sales
)
-- Step 3: Get the top-selling category for each month
SELECT 
    year,
    month,
    category_name AS top_category,
    total_sales
FROM 
    category_monthly_ranking
WHERE 
    sales_rank = 1
ORDER BY 
    year, month;
    

-- Example 3: CTE for Before-After Analysis
-- This example uses a CTE to compare sales before and after a specific date
WITH sales_periods AS (
    SELECT 
        p.product_id,
        p.product_name,
        c.category_name,
        SUM(CASE 
                WHEN o.order_date < '2023-01-01' THEN oi.unit_price * oi.quantity * (1 - oi.discount)
                ELSE 0 
            END) AS sales_2022,
        SUM(CASE 
                WHEN o.order_date >= '2023-01-01' AND o.order_date < '2024-01-01' THEN oi.unit_price * oi.quantity * (1 - oi.discount)
                ELSE 0 
            END) AS sales_2023
    FROM 
        products p
    JOIN 
        categories c ON p.category_id = c.category_id
    LEFT JOIN 
        order_items oi ON p.product_id = oi.product_id
    LEFT JOIN 
        orders o ON oi.order_id = o.order_id
    WHERE 
        o.status = 'Delivered'
    GROUP BY 
        p.product_id, p.product_name, c.category_name
)
SELECT 
    product_id,
    product_name,
    category_name,
    sales_2022,
    sales_2023,
    sales_2023 - sales_2022 AS sales_change,
    CASE 
        WHEN sales_2022 = 0 THEN NULL
        ELSE ROUND((sales_2023 - sales_2022) / sales_2022 * 100, 2)
    END AS percentage_change
FROM 
    sales_periods
WHERE 
    sales_2022 > 0 OR sales_2023 > 0
ORDER BY 
    percentage_change DESC;