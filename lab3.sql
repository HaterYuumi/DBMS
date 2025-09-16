-- 1 --
SELECT last_name ||' '|| UPPER(SUBSTR(first_name, 1, 1)), 
	hire_date	
FROM employees WHERE date_part('day', hire_date) > 20;
-- 2 --
SELECT last_name ||' '|| UPPER(SUBSTR(first_name, 1, 1)), 
	EXTRACT(JULIAN FROM hire_date) AS JD_hire_date	
	FROM employees;
-- 3 --
SELECT last_name ||' - '|| phone_number, 
	to_char(hire_date, 'DD MONTH YYYY'),
	(current_date - hire_date)/30 AS work_month
FROM employees;
-- 4 --
SELECT first_name ||' '|| last_name, 
	hire_date FROM employees 
WHERE (date_part('year', hire_date) BETWEEN 1990 AND 1995)
	AND (current_date - hire_date)/365 > 30;
-- 5 --
SELECT UPPER(last_name) ||' '|| hire_date,
	to_char(hire_date, 'DAY - MONTH') AS hire_date2 FROM employees
WHERE (job_id BETWEEN 14 AND 19) OR
	salary BETWEEN 9000 AND 25000;
-- 6 --
SELECT last_name, 
	to_char(hire_date, 'DD - YYYY') FROM employees
WHERE date_part('month', hire_date) = 1;
-- 7 --
SELECT last_name, 
	date_trunc('day', hire_date) AS hire_day FROM employees
WHERE EXTRACT(DAY FROM hire_date) BETWEEN 15 AND 31;

SELECT last_name, 
	date_trunc('day', hire_date) AS hire_day FROM employees
WHERE EXTRACT(DAY FROM hire_date) BETWEEN 15 AND 31;
