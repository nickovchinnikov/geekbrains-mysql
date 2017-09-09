-- Табличка geodata
use geodata;
-- 1. Сделать запрос, в котором мы выберем все данные о городе - регион, страна.
SELECT country.title AS country_name, region.title as region_name, city.title as city_name FROM _cities city
	left join _countries country on city.country_id = country.id
	left join _regions region on city.region_id = region.id;
    
    
-- 2. Выбрать все города из Московской области
select region.title as region_name, city.title as city_name from _cities city
	left join _regions region on city.region_id = region.id
    where region.title = "Московская область";
    

-- Табличка employees
use employees;
-- 1. Выбрать среднюю зарплату по отделам
select avg(salary) as avg_salary, dept_name from departments dep
	left join dept_emp on dep.dept_no = dept_emp.dept_no
    left join employees emp on dept_emp.emp_no = emp.emp_no
    left join salaries on emp.emp_no = salaries.emp_no
    group by dept_name
    order by avg_salary DESC;
    

-- 2. Выбрать максимальную зарплату у сотрудника
select max(salary) as max_salary, concat(first_name, " ", last_name) as full_name from employees emp
	left join salaries on emp.emp_no = salaries.emp_no;


-- 3. Удалить одного сотрудника, у которого максимальная зарплата
delete from employees where emp_no =
 (select emp_no from salaries where salary =
		(select max(salary) from salaries)
 );
 
 
-- 4. Посчитать количество сотрудников во всех отделах
select count(*) as employees_count from dept_emp where emp_no IS NOT NULL;

	
-- 5. Найти количество сотрудников в отделах и посмотреть сколько всего денег получает отдел
select sum(salary) as total_salary, dept_name from departments dep
	left join dept_emp on dep.dept_no = dept_emp.dept_no
    left join employees emp on dept_emp.emp_no = emp.emp_no
    left join salaries on emp.emp_no = salaries.emp_no
    group by dept_name
    order by total_salary DESC;