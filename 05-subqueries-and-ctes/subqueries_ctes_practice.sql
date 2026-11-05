
-- =============================================
-- SQL SUBQUERIES AND CTEs PRACTICE
-- Database: MySQL 8.0+
-- Objective: Perform advanced data analysis
-- Skills: Subqueries, CTEs, EXISTS, WITH
-- Dataset: Customer and Order Records
-- =============================================

USE sales_analysis;

-- 1. Find orders greater than the average order amount

SELECT *
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
);


-- 2. Find customers who have spent more
-- than the average customer spending

SELECT
    c.customer_name,
    SUM(o.amount) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(amount) AS customer_total
        FROM orders
        GROUP BY customer_id
    ) AS customer_spending
);


-- 3. Find customers who have placed orders
-- using EXISTS

SELECT
    customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);


-- 4. Find customers who have never placed orders
-- using NOT EXISTS

SELECT
    customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);


-- 5. CTE: Calculate total spending per customer

WITH CustomerSpending AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    cs.total_spending
FROM customers c
JOIN CustomerSpending cs
    ON c.customer_id = cs.customer_id
ORDER BY cs.total_spending DESC;


-- 6. CTE: Calculate monthly revenue

WITH MonthlyRevenue AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        SUM(amount) AS revenue
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT *
FROM MonthlyRevenue
ORDER BY revenue DESC;


-- 7. CTE: Find customers spending above 3000

WITH CustomerSpending AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    cs.total_spending
FROM customers c
JOIN CustomerSpending cs
    ON c.customer_id = cs.customer_id
WHERE cs.total_spending > 3000;


-- 8. CTE: Find the highest-value order

WITH HighestOrder AS (
    SELECT MAX(amount) AS max_amount
    FROM orders
)
SELECT *
FROM orders
WHERE amount = (
    SELECT max_amount
    FROM HighestOrder
);


-- =============================================
-- END OF PRACTICE
-- =============================================
