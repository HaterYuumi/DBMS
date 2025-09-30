-- 1 --

--SELECT d.department_name,
--COUNT(e.employee_id) AS employee_cnt,
--ROUND(AVG(e.salary)) FROM employees e 
--JOIN departments d ON e.department_id = d.department_id
--GROUP BY d.department_id, d.department_name
--HAVING AVG(e.salary) > 7000
--ORDER BY AVG(e.salary);

-- 2 --

--SELECT e.first_name ||' '|| e.last_name AS employee, 
--d.department_name,
--date_part('day', e.hire_date)
--FROM employees e JOIN departments d ON
--e.department_id = d.department_id
--WHERE e.phone_number IS NULL;

-- 3 -- 

--SELECT e.employee_id,  d.department_name
--FROM employees e JOIN departments d ON
--e.department_id = d.department_id
--WHERE UPPER(d.department_name) LIKE 'IT' 
--AND e.salary > 5000;

-- 4 --

--SELECT e.department_id,
--COUNT(e.employee_id) AS employee_cnt,
--c.country_name, l.city
--FROM employees e JOIN departments d ON
--d.department_id = e.department_id
--JOIN locations l ON d.location_id = l.location_id
--JOIN countries c ON l.country_id = c.country_id
--GROUP BY e.department_id, c.country_name, l.city;

-- 5 -- 

-- SELECT e.department_id,
-- d.department_name, l.city,
-- COUNT(e.employee_id) AS employee_cnt, COUNT(de.dependent_id) AS child_cnt
-- FROM employees e JOIN departments d ON
-- d.department_id = e.department_id
-- JOIN locations l ON d.location_id = l.location_id
-- JOIN dependents de ON de.employee_id = e.employee_id 
-- GROUP BY e.department_id, d.department_name, l.city;

-- 6 -- 

-- SELECT e.last_name ||' '|| e.first_name AS employee, d.department_name,
-- l.city, r.region_name
-- FROM employees e JOIN departments d ON
-- d.department_id = e.department_id
-- JOIN locations l ON d.location_id = l.location_id
-- JOIN countries c ON c.country_id = l.country_id 
-- JOIN regions r ON r.region_id = c.region_id
-- ORDER BY e.last_name DESC;

-- 7 --

-- SELECT e.first_name ||' '|| e.last_name AS employee, e.salary,
-- d.department_name, l.state_province
-- FROM employees e JOIN departments d ON
-- d.department_id = e.department_id
-- JOIN locations l ON d.location_id = l.location_id
-- WHERE UPPER(l.state_province) = 'WASHINGTON' 

-- 8 --

-- SELECT r.region_name FROM regions r 
-- LEFT JOIN countries c ON r.region_id = c.region_id
-- LEFT JOIN locations l ON l.country_id = c.country_id
-- LEFT JOIN departments d ON d.location_id = l.location_id
-- WHERE d.department_id IS NULL
-- GROUP BY r.region_name;

-- 9 --

-- SELECT e.last_name ||' '|| e.first_name AS employee, d.department_name,
-- l.city, r.region_name
-- FROM employees e JOIN departments d ON
-- d.department_id = e.department_id
-- JOIN locations l ON d.location_id = l.location_id
-- JOIN countries c ON c.country_id = l.country_id 
-- JOIN regions r ON r.region_id = c.region_id
-- WHERE e.last_name LIKE '%o%';

-- 10 --

-- SELECT d.department_id, d.department_name, 
-- r.region_name, MAX(e.salary), 
-- STRING_AGG(e.last_name ||' '|| UPPER(SUBSTR(e.first_name, 1, 1)), ', ')
-- FROM employees e JOIN departments d ON
-- d.department_id = e.department_id
-- JOIN locations l ON d.location_id = l.location_id
-- JOIN countries c ON c.country_id = l.country_id 
-- JOIN regions r ON r.region_id = c.region_id
-- GROUP BY d.department_id, r.region_name;

-- 11 --

-- Найти всех сотрудников (имя, фамилия, название должности), 
-- которые работают '%Sales%' 
-- в Великобритании (country_id = 'UK') 
-- и у которых есть дети

-- SELECT e.first_name || ' ' || e.last_name AS employee_name,
-- j.job_title, d.department_name
-- FROM employees e, departments d, locations l, jobs j, dependents dep
-- WHERE e.department_id = d.department_id    
-- AND d.location_id = l.location_id          
-- AND e.job_id = j.job_id                    
-- AND e.employee_id = dep.employee_id        
-- AND UPPER(d.department_name) LIKE '%SALES%' 
-- AND l.country_id = 'UK'                    
-- AND dep.relationship = 'Child';

-- 12 -- 

-- Проанализировать эффективность локаций для отделов. Мы хотим увидеть 
-- ВСЕ локации (даже те, где нет отделов), а также ВСЕ отделы 
-- (даже те, которые не привязаны к локациям), и для тех отделов, 
-- где есть сотрудники, вывести информацию о них.
