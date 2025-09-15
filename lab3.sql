--SELECT * FROM employees;
--	SELECT  e.last_name ||' '|| e.first_name AS employee, e.hire_date, j.job_title,
--	    EXTRACT(DAY FROM (DATE_TRUNC('MONTH', hire_date) + INTERVAL '1 MONTH' - INTERVAL '1 DAY' - hire_date)) AS days_until_month_end	
--	FROM employees e INNER JOIN jobs j ON e.job_id = j.job_id
--	WHERE EXTRACT(DAY FROM (DATE_TRUNC('MONTH', e.hire_date) + INTERVAL '1 MONTH' - INTERVAL '1 DAY' - e.hire_date)) <= 10;

--SELECT last_name ||' '|| UPPER(SUBSTR(first_name, 1, 1)), 
--	hire_date	
--	FROM employees WHERE date_part('day', hire_date) > 20;

--SELECT last_name ||' '|| UPPER(SUBSTR(first_name, 1, 1)), 
--	EXTRACT(JULIAN FROM hire_date) AS JD_hire_date	
--	FROM employees;

--SELECT last_name ||' - '|| phone_number, 
--	to_char(hire_date, 'DD MONTH YYYY'),
--	(current_date - hire_date)/30 AS work_month
--FROM employees;
