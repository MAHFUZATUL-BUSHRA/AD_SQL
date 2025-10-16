

-- Example 1: AVG() OVER() - Compare individual values to group averages
-- This example compares each employee's salary to their department's average
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    e.salary,
    AVG(e.salary) OVER (PARTITION BY e.department_id) AS dept_avg_salary,
    e.salary - AVG(e.salary) OVER (PARTITION BY e.department_id) AS diff_from_avg,
    ROUND(e.salary / AVG(e.salary) OVER (PARTITION BY e.department_id) * 100 - 100, 2) AS percent_diff_from_avg
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
ORDER BY 
    d.department_name, percent_diff_from_avg DESC;
    

-- Example 2: COUNT() OVER() - Calculate percentages within groups
-- This example calculates each product's percentage contribution to its category's total sales
SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) AS product_sales,
    SUM(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) OVER (PARTITION BY p.category_id) AS category_total_sales,
    ROUND(
        SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) / 
        SUM(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) OVER (PARTITION BY p.category_id) * 100,
        2
    ) AS percentage_of_category_sales
FROM 
    products p
JOIN 
    categories c ON p.category_id = c.category_id
JOIN 
    order_items oi ON p.product_id = oi.product_id
JOIN 
    orders o ON oi.order_id = o.order_id
WHERE 
    o.status = 'Delivered'
GROUP BY 
    p.product_id, p.product_name, c.category_name
ORDER BY 
    c.category_name, percentage_of_category_sales DESC;
    

-- Example 3: SUM() OVER() - Calculate running totals
-- This example calculates the running total of order values by month
SELECT 
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) AS monthly_sales,
    SUM(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) OVER (
        PARTITION BY YEAR(o.order_date) 
        ORDER BY MONTH(o.order_date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW -- FRAME SPECIFICATION
    ) AS running_total_sales
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
WHERE 
    o.status = 'Delivered'
GROUP BY 
    YEAR(o.order_date), MONTH(o.order_date)
ORDER BY 
    year, month;


-- Example 4: Aggregate Window Functions with Frames
-- This example calculates a 3-month moving average of monthly sales
SELECT 
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) AS monthly_sales,
    AVG(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) OVER (
        ORDER BY YEAR(o.order_date), MONTH(o.order_date)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS three_month_moving_avg
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
WHERE 
    o.status = 'Delivered'
GROUP BY 
    YEAR(o.order_date), MONTH(o.order_date)
ORDER BY 
    year, month;
    
    



-- Example 5: Calculating Growth Rates with LAG
-- This example calculates month-over-month growth rates in sales
SELECT 
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) AS monthly_sales,
    LAG(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) OVER (
        ORDER BY YEAR(o.order_date), MONTH(o.order_date)
    ) AS previous_month_sales,
    SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) - 
    LAG(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) OVER (
        ORDER BY YEAR(o.order_date), MONTH(o.order_date)
    ) AS sales_change,
    CASE 
        WHEN LAG(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) OVER (
            ORDER BY YEAR(o.order_date), MONTH(o.order_date)
        ) = 0 THEN NULL
        ELSE ROUND(
            (SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) - 
             LAG(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) OVER (
                ORDER BY YEAR(o.order_date), MONTH(o.order_date)
             )) / 
            LAG(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) OVER (
                ORDER BY YEAR(o.order_date), MONTH(o.order_date)
            ) * 100,
            2
        )
    END AS growth_rate_percent
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
WHERE 
    o.status = 'Delivered'
GROUP BY 
    YEAR(o.order_date), MONTH(o.order_date)
ORDER BY 
    year, month;
    

-- Example 6: Calculating Time Between Events with LAG
-- This example calculates the days between consecutive orders for each customer
SELECT 
    o.customer_id,
    c.company_name,
    o.order_id,
    o.order_date,
    LAG(o.order_date) OVER (
        PARTITION BY o.customer_id 
        ORDER BY o.order_date
    ) AS previous_order_date,
    DATEDIFF(
        o.order_date,
        LAG(o.order_date) OVER (
            PARTITION BY o.customer_id 
            ORDER BY o.order_date
        )
    ) AS days_since_last_order,
    CASE 
        WHEN DATEDIFF(
            o.order_date,
            LAG(o.order_date) OVER (
                PARTITION BY o.customer_id 
                ORDER BY o.order_date
            )
        ) > 90 THEN 'Potential Churn Risk'
        ELSE 'Regular Customer'
    END AS customer_status
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
ORDER BY 
    o.customer_id, o.order_date;
    



-- Example 7: ROW_NUMBER() - Assign unique sequential numbers to rows
-- This example assigns a unique number to each employee within their department
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    e.salary,
    ROW_NUMBER() OVER(PARTITION BY e.department_id ORDER BY e.salary DESC, e.hire_date) AS salary_rank_in_dept
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
ORDER BY 
    d.department_name, salary_rank_in_dept;



-- Example 8: Comparing Different Ranking Functions
-- This example shows the difference between ROW_NUMBER, RANK, and DENSE_RANK

SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    p.unit_price,
    ROW_NUMBER() OVER(PARTITION BY p.category_id ORDER BY p.unit_price DESC) AS row_num,
    RANK() OVER(PARTITION BY p.category_id ORDER BY p.unit_price DESC) AS price_rank,
    DENSE_RANK() OVER(PARTITION BY p.category_id ORDER BY p.unit_price DESC) AS dense_ranks
FROM 
    products p
JOIN 
    categories c ON p.category_id = c.category_id
ORDER BY 
    c.category_name, p.unit_price DESC;
    
-- UPDATE products
-- SET unit_price = 24.99
-- WHERE product_id = 12;
