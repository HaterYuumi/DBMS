-- 1 --

-- Возвратите отделы и среднюю зарплату 
-- для каждого отдела,
-- где средняя зарплата для отдела меньше,
-- чем средняя зарплата для всех сотрудников

-- SELECT department_id, round(AVG(salary))
-- FROM employees
-- WHERE department_id IS NOT NULL
-- GROUP BY department_id
-- HAVING AVG(salary) < (SELECT AVG(salary) FROM employees)

-- 2 --

-- Вернуть имена,
-- наименование отдела для сотрудников,
-- получающих ту же зарплату, что и «Alexander»

-- SELECT e.first_name, d.department_name
-- FROM employees e
-- JOIN departments d ON e.department_id = d.department_id
-- WHERE e.salary IN (SELECT salary FROM employees 
-- WHERE UPPER(first_name) LIKE 'ALEXANDER')

-- 3 --

-- Вывести id сотрудника, его имя, 
-- фамилию, должность, зарплата,
-- максимальная зарплата по его должности,
-- а также разницамежду максимальной зарплатой
-- по его должностии зарплатой этого сотрудника,
-- при условии,что эта не равна разница равна нулю.

-- SELECT e.employee_id, e.first_name ||' '|| e.last_name AS employee,
-- j.job_title, e.salary, m.max_salary, (m.max_salary - e.salary) AS salary_diff
-- FROM employees e 
-- JOIN jobs j ON e.job_id = j.job_id
-- JOIN (SELECT job_id, MAX(salary) AS max_salary FROM employees GROUP BY job_id) m 
-- ON j.job_id = m.job_id WHERE (m.max_salary - e.salary) != 0;

-- 4 --

-- Вывести сотрудников, у которых стаж работы 
-- больше среднего стажа в их из отделе

-- SELECT e.first_name ||' '|| e.last_name AS employee,
-- e.hire_date, AGE(CURRENT_DATE, e.hire_date) AS full_interval,
-- e.department_id FROM employees e
-- WHERE (CURRENT_DATE - e.hire_date) > 
-- (SELECT AVG(CURRENT_DATE - e2.hire_date)
-- FROM employees e2 WHERE 
-- e2.department_id = e.department_id);

-- 5 -- 

-- Все имя и фамилию менеджера в одном столбце, 
-- суммарную плату его подчиненных. 
-- Отсортировать по убыванию средней заработной платы. 
-- Реализовать 2 способами, один из которых 
-- с помощью коррелированного подзапроса, второй нет.

-- SELECT m.first_name || ' ' || m.last_name AS manager_name,
-- (SELECT SUM(e.salary) 
-- FROM employees e 
-- WHERE e.manager_id = m.employee_id) AS total_subordinates_salary
-- FROM  employees m
-- WHERE m.employee_id IN (SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL)
-- ORDER BY (SELECT AVG(e.salary) FROM employees e 
-- WHERE e.manager_id = m.employee_id) DESC;

-- SELECT m.first_name || ' ' || m.last_name AS manager_name,
-- SUM(e.salary) AS total_subordinates_salary
-- FROM employees m
-- JOIN employees e ON m.employee_id = e.manager_id
-- GROUP BY m.employee_id, m.first_name, m.last_name
-- ORDER BY AVG(e.salary) DESC;

-- 6 --

-- Вывести сотрудников, которые работают на тех же должностях и в тех же отделах,
-- где есть хотя бы один сотрудник с зарплатой выше минимальной 

-- SELECT first_name, last_name, job_id, department_id, salary
-- FROM employees
-- WHERE (job_id, department_id) in 
-- (SELECT job_id, department_id
-- FROM employees WHERE salary > (SELECT MIN(salary)
-- FROM employees))
