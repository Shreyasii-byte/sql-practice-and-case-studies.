-- =============================================
-- SQL BASICS PRACTICE
-- Objective: Practice fundamental SQL queries
-- Database: MySQL
-- Focus: SELECT, DISTINCT, WHERE, ORDER BY, LIMIT
-- =============================================

CREATE DATABASE IF NOT EXISTS sql_practice;
USE sql_practice;

-- 1. Create Employee Table

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

-- 2. Insert Sample Records

INSERT INTO employees VALUES
(1, 'Aarav', 'IT', 55000, 'Delhi'),
(2, 'Priya', 'HR', 45000, 'Mumbai'),
(3, 'Riya', 'Analytics', 60000, 'Delhi'),
(4, 'Kabir', 'IT', 70000, 'Bengaluru'),
(5, 'Ananya', 'Analytics', 65000, 'Mumbai'),
(6, 'Rahul', 'HR', 40000, 'Delhi'),
(7, 'Meera', 'Finance', 58000, 'Pune'),
(8, 'Arjun', 'IT', 75000, 'Mumbai');

-- 3. Display All Employees

SELECT *
FROM employees;

-- 4. Select Specific Columns

SELECT employee_name, department, salary
FROM employees;

-- 5. Find Unique Departments

SELECT DISTINCT department
FROM employees;

-- 6. Filter Employees from Delhi

SELECT *
FROM employees
WHERE city = 'Delhi';

-- 7. Find Employees Earning More Than 50000

SELECT employee_name, salary
FROM employees
WHERE salary > 50000;

-- 8. Filter Employees Using AND

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;

-- 9. Filter Salary Within a Range

SELECT *
FROM employees
WHERE salary BETWEEN 45000 AND 65000;

-- 10. Sort Employees by Salary (Highest First)

SELECT employee_name, salary
FROM employees
ORDER BY salary DESC;

-- 11. Sort Employees Alphabetically

SELECT employee_name
FROM employees
ORDER BY employee_name ASC;

-- 12. Find Top 3 Highest-Paid Employees

SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 13. Search Names Starting with A

SELECT *
FROM employees
WHERE employee_name LIKE 'A%';

-- 14. Find Employees from Selected Cities

SELECT *
FROM employees
WHERE city IN ('Delhi', 'Mumbai');

-- =============================================
-- END OF SQL BASICS PRACTICE
-- =============================================
