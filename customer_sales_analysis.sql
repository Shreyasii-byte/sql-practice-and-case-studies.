
-- Customer Sales Analysis
-- Objective: Analyze revenue, customer spending, and monthly sales.
-- Skills: SQL, JOINs, Aggregations, GROUP BY, ORDER BY

CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'Aarav', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Riya', 'Delhi'),
(4, 'Kabir', 'Bengaluru'),
(5, 'Ananya', 'Mumbai');

INSERT INTO orders VALUES
(101, 1, '2026-01-05', 2500.00),
(102, 2, '2026-01-12', 1800.00),
(103, 1, '2026-02-03', 3200.00),
(104, 3, '2026-02-15', 1200.00),
(105, 4, '2026-02-20', 4500.00),
(106, 2, '2026-03-02', 2700.00),
(107, 5, '2026-03-10', 3500.00),
(108, 3, '2026-03-18', 2100.00);

-- 1. Calculate total revenue
SELECT SUM(amount) AS total_revenue
FROM orders;

-- 2. Find customer spending
SELECT c.customer_name,
       SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- 3. Analyze revenue by city
SELECT c.city,
       SUM(o.amount) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- 4. Calculate average order value
SELECT ROUND(AVG(amount), 2) AS average_order_value
FROM orders;

-- 5. Find the highest-revenue month
SELECT DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
       SUM(amount) AS monthly_revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY monthly_revenue DESC
LIMIT 1;
