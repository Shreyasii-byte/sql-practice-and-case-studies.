```sql
-- =============================================
-- SQL AGGREGATION PRACTICE
-- Database: MySQL
-- Objective: Summarize and analyze employee data
-- Skills: COUNT, SUM, AVG, MIN, MAX,
--         GROUP BY, HAVING
-- =============================================

USE sql_practice;

-- 1. Count total employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- 2. Calculate total salary expenditure
SELECT SUM(salary) AS total_salary
FROM employees;

-- 3. Calculate average employee salary
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees;

-- 4. Find the highest salary
SELECT MAX(salary) AS highest_salary
FROM employees;

-- 5. Find the lowest salary
SELECT MIN(salary) AS lowest_salary
FROM employees;

-- 6. Count employees in each department
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 7. Calculate average salary by department
SELECT department,
       ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;

-- 8. Calculate total salary by city
SELECT city,
       SUM(salary) AS total_salary
FROM employees
GROUP BY city
ORDER BY total_salary DESC;

-- 9. Find departments with more than one employee
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;

-- 10. Find departments with average salary above 55000
SELECT department,
       ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;

-- =============================================
-- END OF AGGREGATION PRACTICE
-- =============================================
```
