
-- =============================================
-- PROJECT: SQL BASICS PRACTICE
-- Database: MySQL
-- Objective: Practice fundamental SQL queries
-- Skills: SELECT, DISTINCT, WHERE, AND, OR,
--         BETWEEN, IN, LIKE, ORDER BY, LIMIT
-- =============================================

-- 1. DATABASE SETUP

CREATE DATABASE IF NOT EXISTS sql_practice;
USE sql_practice;

-- 2. CREATE EMPLOYEE TABLE

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

-- 3. INSERT SAMPLE DATA

INSERT INTO employees VALUES
(1, 'Aarav', 'IT', 55000, 'Delhi'),
(2, 'Priya', 'HR', 45000, 'Mumbai'),
(3, 'Riya', 'Analytics', 60000, 'Delhi'),
(4, 'Kabir', 'IT', 70000, 'Bengaluru'),
(5, 'Ananya', 'Analytics', 65000, 'Mumbai'),
(6, 'Rahul', 'HR', 40000, 'Delhi'),
(7, 'Meera', 'Finance', 58000, 'Pune'),
(8, 'Arjun', 'IT', 75000, 'Mumbai');

-- 4. DISPLAY ALL EMPLOYEES

SELECT *
FROM employees;

-- 5. SELECT SPECIFIC COLUMNS

SELECT employee_name, department, salary
FROM employees;

-- 6. FIND UNIQUE DEPARTMENTS

SELECT DISTINCT department
FROM employees;

-- 7. FILTER EMPLOYEES FROM DELHI

SELECT *
FROM employees
WHERE city = 'Delhi';

-- 8. EMPLOYEES EARNING MORE THAN 50000

SELECT employee_name, salary
FROM employees
WHERE salary > 50000;

-- 9. FILTER USING AND

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;

-- 10. FILTER SALARY WITHIN A RANGE

SELECT *
FROM employees
WHERE salary BETWEEN 45000 AND 65000;

-- 11. SORT BY HIGHEST SALARY

SELECT employee_name, salary
FROM employees
ORDER BY salary DESC;

-- 12. FIND TOP 3 HIGHEST-PAID EMPLOYEES

SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 13. SEARCH NAMES STARTING WITH A

SELECT *
FROM employees
WHERE employee_name LIKE 'A%';

-- 14. FILTER USING IN

SELECT *
FROM employees
WHERE city IN ('Delhi', 'Mumbai');

-- =============================================
-- END OF SQL BASICS PRACTICE
-- =============================================
