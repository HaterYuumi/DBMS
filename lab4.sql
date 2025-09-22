-- 1 --

SELECT department_id, AVG(salary) FROM employees
GROUP BY department_id HAVING COUNT(*) > 5
ORDER BY AVG(salary) DESC;

-- 2 --

SELECT job_id,
COUNT(*)
FROM employees
WHERE date_part('year', hire_date) > 1990
GROUP BY job_id;

-- 3 --

SELECT department_id, 
STRING_AGG(CONCAT(last_name, ', ', job_id, ', ', salary), ', '), --CONCAT() создаёт строку для каждого сотрудника
MIN(salary), MAX(salary), 
AVG(salary) FROM employees
GROUP BY department_id;

-- 4 -- 

SELECT manager_id,
COUNT(*) AS employee_cnt
FROM employees
GROUP BY manager_id
HAVING AVG(salary) BETWEEN 3000 and 7000
ORDER BY employee_cnt;

-- 5 --

SELECT department_id,
CONCAT(department_id, ' - ', COUNT(*)),
AVG(salary),
STRING_AGG(first_name, ', ')
FROM employees
GROUP BY department_id
HAVING AVG(salary) < 6000;
