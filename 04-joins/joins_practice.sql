
-- =============================================
-- SQL JOINS PRACTICE
-- Database: MySQL
-- Objective: Combine data from multiple tables
-- Skills: INNER JOIN, LEFT JOIN, RIGHT JOIN,
--         GROUP BY, COUNT, SUM
-- =============================================

USE sales_analysis;

-- Add a customer with no orders to practice LEFT JOIN
INSERT IGNORE INTO customers
(customer_id, customer_name, city)
VALUES
(6, 'Ishita', 'Jaipur');


-- 1. INNER JOIN
-- Find customers who have placed orders.

SELECT
    c.customer_name,
    o.order_id,
    o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;


-- 2. LEFT JOIN
-- Display all customers, including those
-- who have not placed any orders.

SELECT
    c.customer_name,
    o.order_id,
    o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


-- 3. RIGHT JOIN
-- Display all orders with their customer details.

SELECT
    c.customer_name,
    o.order_id,
    o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


-- 4. Find customers who have not placed orders.

SELECT
    c.customer_name,
    c.city
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- 5. Calculate total spending by each customer.

SELECT
    c.customer_name,
    SUM(o.amount) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC;


-- 6. Count the number of orders placed by each customer.

SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;


-- 7. Calculate city-wise revenue using JOIN.

SELECT
    c.city,
    SUM(o.amount) AS total_revenue
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;


-- 8. Find customers whose total spending
-- exceeds 3000.

SELECT
    c.customer_name,
    SUM(o.amount) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > 3000;


-- =============================================
-- END OF SQL JOINS PRACTICE
-- =============================================
