```sql
-- =============================================
-- SQL FILTERING AND SORTING PRACTICE
-- Database: MySQL
-- Objective: Extract and organize relevant data
-- Skills: WHERE, AND, OR, BETWEEN, IN, LIKE,
--         ORDER BY, LIMIT
-- Dataset: Employee Records
-- =============================================

USE sql_practice;

-- 1. Filter employees from Delhi
SELECT *
FROM employees
WHERE city = 'Delhi';

-- 2. Employees earning more than 50000
SELECT employee_name, salary
FROM employees
WHERE salary > 50000;

-- 3. Employees in IT with salary above 60000
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;

-- 4. Employees from Delhi or Mumbai
SELECT *
FROM employees
WHERE city = 'Delhi'
OR city = 'Mumbai';

-- 5. Employees earning between 45000 and 65000
SELECT employee_name, salary
FROM employees
WHERE salary BETWEEN 45000 AND 65000;

-- 6. Employees belonging to IT or Analytics
SELECT *
FROM employees
WHERE department IN ('IT', 'Analytics');

-- 7. Employees whose names start with A
SELECT *
FROM employees
WHERE employee_name LIKE 'A%';

-- 8. Employees whose names end with a
SELECT *
FROM employees
WHERE employee_name LIKE '%a';

-- 9. Sort employees by salary (highest first)
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC;

-- 10. Find the top 3 highest-paid employees
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- =============================================
-- END OF PRACTICE
-- =============================================
```
