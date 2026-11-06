
-- =============================================
-- SQL WINDOW FUNCTIONS PRACTICE
-- Database: MySQL 8.0+
-- Objective: Perform advanced analytical queries
-- Skills: ROW_NUMBER, RANK, DENSE_RANK,
--         PARTITION BY, SUM OVER, LAG
-- Dataset: Customer and Order Records
-- =============================================

USE sales_analysis;

-- 1. Assign a unique row number to every order

SELECT
    order_id,
    customer_id,
    amount,
    ROW_NUMBER() OVER (
        ORDER BY amount DESC
    ) AS row_num
FROM orders;


-- 2. Rank orders based on their amount

SELECT
    order_id,
    amount,
    RANK() OVER (
        ORDER BY amount DESC
    ) AS order_rank
FROM orders;


-- 3. Rank orders without skipping rank numbers

SELECT
    order_id,
    amount,
    DENSE_RANK() OVER (
        ORDER BY amount DESC
    ) AS dense_rank_value
FROM orders;


-- 4. Rank customers based on spending

WITH CustomerSpending AS (
    SELECT
        c.customer_name,
        SUM(o.amount) AS total_spending
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    total_spending,
    DENSE_RANK() OVER (
        ORDER BY total_spending DESC
    ) AS spending_rank
FROM CustomerSpending;


-- 5. Rank orders within each month

SELECT
    order_id,
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    amount,
    RANK() OVER (
        PARTITION BY DATE_FORMAT(order_date, '%Y-%m')
        ORDER BY amount DESC
    ) AS monthly_rank
FROM orders;


-- 6. Calculate running revenue

SELECT
    order_id,
    order_date,
    amount,
    SUM(amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_revenue
FROM orders;


-- 7. Compare each order with the previous order

SELECT
    order_id,
    order_date,
    amount,
    LAG(amount) OVER (
        ORDER BY order_date, order_id
    ) AS previous_order_amount
FROM orders;


-- 8. Calculate difference from previous order

WITH OrderComparison AS (
    SELECT
        order_id,
        order_date,
        amount,
        LAG(amount) OVER (
            ORDER BY order_date, order_id
        ) AS previous_amount
    FROM orders
)
SELECT
    order_id,
    amount,
    previous_amount,
    amount - previous_amount AS amount_difference
FROM OrderComparison;


-- =============================================
-- END OF WINDOW FUNCTIONS PRACTICE
-- =============================================
