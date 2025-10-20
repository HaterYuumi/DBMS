-- 1 --

-- Вывести все сотрудников (Last_name F. - departmetn_name), у которых есть 2 вышестоящих руководителя.
-- Добавить столбец, в котором перечислены эти руководители через запятую

-- WITH RECURSIVE r AS 

-- (
-- 	SELECT employee_id, manager_id, first_name, last_name, 0 AS level, 
-- 	'' AS managers, department_id 
-- 	FROM employees 
-- 	WHERE manager_id IS NULL 
-- 	UNION 
-- 	SELECT e.employee_id, e.manager_id, e.first_name, e.last_name, 
-- 	r.level + 1 AS level, managers || r.first_name ||' '|| r.last_name ||', ', e.department_id 
-- 	FROM employees e 
-- 	JOIN r ON e.manager_id = r.employee_id
-- )

-- SELECT last_name ||' '|| substring(first_name, 1, 1) ||'. - '|| d.department_name AS employee, 
-- substring(managers, 0, length(managers) - 1) AS managers 
-- FROM r 
-- JOIN departments d ON d.department_id = r.department_id 
-- WHERE level >= 2

-- 2 --

-- Подсчитайте количество подчиненных (всех уровней) для каждого сотрудника, начиная с главного менеджера. 
-- При этом отсортировать по кол-ву подчиненных от большего к меньшему и вывести только первых 7 сотрудников, 
-- у кого кол-во подчинённых больше 1

-- WITH RECURSIVE r AS 

-- (
-- 	SELECT employee_id, manager_id, employee_id AS head
-- 	FROM employees
-- 	UNION 
-- 	SELECT e.employee_id, e.manager_id, r.head AS head
-- 	FROM employees e 
-- 	JOIN r ON r.employee_id = e.manager_id
-- )

-- SELECT head, count(*) AS count_employees
-- FROM r
-- GROUP BY head
-- HAVING count(*) - 1 > 1 
-- ORDER BY count_employees DESC LIMIT 7

-- 3 --

-- Вывести кол-во всех сотрудников для каждого менеджера

-- WITH RECURSIVE r AS 

-- (
-- 	SELECT employee_id, first_name, last_name, manager_id, 1 AS count_slave
--     FROM employees
--     UNION
--     SELECT e.employee_id, e.first_name, e.last_name, e.manager_id, r.count_slave
--     FROM employees e
--     JOIN r ON e.manager_id = r.employee_id
-- )

-- SELECT em.first_name || ' ' || em.last_name AS manager_name, COUNT(r.employee_id) AS employee_cnt
-- FROM employees em
-- JOIN r ON em.employee_id = r.manager_id
-- GROUP BY em.employee_id, em.first_name, em.last_name
-- HAVING COUNT(r.employee_id) > 0
-- ORDER BY employee_cnt DESC
