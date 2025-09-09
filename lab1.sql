SELECT * FROM employees WHERE first_name LIKE '%e%n';
SELECT first_name, last_name, manager_id, phone_number, email, salary FROM employees WHERE salary < 25000 ORDER BY salary DESC;
SELECT last_name, first_name, email FROM employees WHERE (first_name LIKE '%l%l%' AND first_name LIKE '%a%') OR email LIKE '%\_%';
SELECT last_name, hire_date FROM employees WHERE hire_date BETWEEN '1997-01-01' AND '2000-12-31' ORDER BY  last_name; 
SELECT first_name, last_name FROM employees WHERE last_name ~* 'o{2}' OR first_name ILIKE '%oo%'; --ILIKE, ~* — совпадение без учёта регистра
SELECT manager_id FROM employees WHERE hire_date < '1997-01-01' AND phone_number IS NULL GROUP BY manager_id ORDER BY manager_id; --GROUP BY дает уникальные значения
SELECT DISTINCT ON (manager_id) manager_id, hire_date,phone_number FROM employees WHERE hire_date < '1997-01-01' AND phone_number IS NULL ORDER BY manager_id; --второй вариант, но можно вывести еще данные
SELECT first_name, last_name, department_id FROM employees WHERE department_id IN (1, 3, 7) ORDER BY department_id; --пример для IN
SELECT employee_id FROM employees WHERE manager_id IS NOT NULL AND phone_number IS NOT NULL; -- пример для NOT
SELECT first_name, phone_number FROM employees WHERE first_name SIMILAR TO '(A|B)%'; --пример для SIMILAR TO
