-- =====================================================
-- PROJECT: Customer Sales Analysis
-- OBJECTIVE: Analyze revenue, customer spending,
--            city-wise performance, and monthly sales.
-- DATABASE: MySQL
-- SKILLS: SQL, JOINs, Aggregations, GROUP BY,
--         ORDER BY, Date Functions
-- DATASET: Fictional sample sales data
-- =====================================================

-- 1. DATABASE SETUP
CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;

-- 2. CREATE TABLES
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

-- 3. INSERT SAMPLE DATA
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

-- =====================================================
-- ANALYSIS 1: TOTAL REVENUE
-- Business question: What is the total sales revenue?
-- Expected result: 21,500.00
-- =====================================================

SELECT SUM(amount) AS total_revenue
FROM orders;

-- =====================================================
-- ANALYSIS 2: CUSTOMER SPENDING
-- Business question: Who are the highest-spending customers?
-- Expected top customer: Aarav (5,700.00)
-- =====================================================

SELECT
    c.customer_name,
    SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- =====================================================
-- ANALYSIS 3: CITY-WISE REVENUE
-- Business question: Which city generates the most revenue?
-- Expected top city: Delhi (9,000.00)
-- =====================================================

SELECT
    c.city,
    SUM(o.amount) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- =====================================================
-- ANALYSIS 4: AVERAGE ORDER VALUE
-- Business question: What is the average revenue per order?
-- Expected result: 2,687.50
-- =====================================================

SELECT
    ROUND(AVG(amount), 2) AS average_order_value
FROM orders;

-- =====================================================
-- ANALYSIS 5: MONTHLY REVENUE
-- Business question: Which month has the highest revenue?
-- Expected result: February 2026 (8,900.00)
-- =====================================================

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(amount) AS monthly_revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY monthly_revenue DESC
LIMIT 1;
