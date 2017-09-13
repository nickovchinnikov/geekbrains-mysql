-- Не оптимизированный запрос
explain select avg(salary) 
		as avg_salary, dept_name 
	from departments dep
	left join dept_emp 
		on dep.dept_no = dept_emp.dept_no
    left join employees emp 
		on dept_emp.emp_no = emp.emp_no
    left join salaries 
		on emp.emp_no = salaries.emp_no
    group by dept_name
    order by avg_salary DESC;
    
-- https://i.gyazo.com/93c97cc581d91fda685d1d50c7b032d4.png результат выполнения
-- Пытаемся избавиться от Using index и Using temporary, для этого убираем order by avg_salary DESC;
-- Оптимизированный запрос:

explain select avg(salary) 
		as avg_salary, dept_name 
	from departments dep
	left join dept_emp 
		on dep.dept_no = dept_emp.dept_no
    left join employees emp 
		on dept_emp.emp_no = emp.emp_no
    left join salaries 
		on emp.emp_no = salaries.emp_no
    group by dept_name;
    

-- Транзакционные запросы это все запросы, которые должны быть выполнены либо все, либо не выполнены вообще
-- Например, если бы у нас была таблица, где хранится кол-во сотрудников во всех отделах, то при удалении сотрудника - должно изменяться и количество
-- Если вдруг что-то идёт не так, то данные испортятся, что не хорошо.

-- Так же, транзакции активно мной применяются при создании табличек и наполнении их данными при создании сайтов, а так же при совершении заказов.
-- Не пишу примеры, т.к. с временем беда, да и очевидно тут, Start transaction, пара запросов и commit/rollback.