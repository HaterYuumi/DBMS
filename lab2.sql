SELECT last_name ||' '|| UPPER(SUBSTR(first_name, 1, 1)) AS employee, salary * 6 AS half_year_salary FROM employees WHERE salary * 6 > 50000 ORDER BY last_name;
SELECT department_id, SUBSTR(first_name, 2) AS name_without_first_char FROM employees WHERE UPPER(last_name) = 'HUNOLD';
SELECT LOWER(last_name), ROUND(salary / 4) AS week_salary FROM employees WHERE UPPER(first_name) <> 'STEVEN' ORDER BY week_salary DESC;
SELECT first_name ||' '|| last_name AS employee, ROUND(salary * 12) AS year_salary, CEIL(salary * 0.131) AS bonus FROM employees WHERE (LENGTH(first_name) = 5 OR LENGTH(last_name) = 5) AND ROUND(salary / 20) <= 400;
SELECT last_name ||' '|| first_name AS employee, TRUNC(salary/20.0)||' руб '||round(((salary/20.0)-salary/20)*100,0)||' коп ' AS daily_salary FROM employees;
SELECT last_name ||' '|| first_name AS employee, FLOOR(salary/20.0)||' руб '||CEIL(((salary/20.0)-salary/20)*100,0)||' коп ' AS daily_salary FROM employees;
SELECT last_name ||' '|| UPPER(SUBSTR(first_name, 1, 1)) AS employee, salary, MOD(salary, 2) AS salary_parity FROM employees ORDER BY salary_parity;
SELECT last_name ||' '|| UPPER(SUBSTR(first_name, 1, 1)) AS employee, salary, SIGN(salary - 20000) AS deck FROM employees;
