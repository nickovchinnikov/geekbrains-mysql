
use geodata;
-- Иноформация всех городов по области и стране

select _cities.title as город, _regions.title as область, _countries.title as страна from _cities
left join _countries on _cities.country_id = _countries.id
left join _regions on _cities.region_id = _regions.id;


-- Все города в Московской области

select _cities.title as город from _cities
left join _regions on _cities.region_id =  _regions.id where _regions.title = 'Московская область';




use employees;

 
 -- Выбрать среднюю зарплату по отделам
select 
avg(if(departments.dept_name = 'Development', salaries.salary , null)) as Development ,
avg(if(departments.dept_name = 'Customer Service', salaries.salary, null)) ,
avg(if(departments.dept_name = 'Human Resources', salaries.salary, null)) ,
avg(if(departments.dept_name = 'Marketing', salaries.salary, null)) ,
avg(if(departments.dept_name = 'Production', salaries.salary, null)) ,
avg(if(departments.dept_name = 'Quality Management', salaries.salary, null)) ,
avg(if(departments.dept_name = 'Research', salaries.salary, null)) ,
avg(if(departments.dept_name = 'Finance', salaries.salary, null)) ,
avg(if(departments.dept_name = 'Sales', salaries.salary, null)) 
from employees
left join dept_emp on employees.emp_no = dept_emp.emp_no
left join departments on departments.dept_no = dept_emp.dept_no
left join salaries on salaries.emp_no = employees.emp_no;


-- Выбрать максимальную зарплату у сотрудника

select max(salaries.salary), concat(employees.first_name, ' ', employees.last_name ) , employees.emp_no from employees
left join salaries on salaries.emp_no = employees.emp_no;

-- Удалить одного сотрудника, у которого максимальная зарплата

delete from employees

where emp_no =  (select employees.emp_no from
(select max(salaries.salary)  from salaries
left join employees on employees.emp_no = salaries.emp_no)  ); -- не работает ещё :с(программа сама находит самого толстого и удаляет его)
 
 
 -- Посчитать количество сотрудников во всех отделах + Найти количество сотрудников в отделах и посмотреть сколько всего денег получает отдел
 select 
 departments.dept_name, count(departments.dept_name ), 

 max(if(departments.dept_name = 'Development', salaries.salary,not null)) max, 
max(if(departments.dept_name = 'Customer Service', salaries.salary,not null)) max, 
max(if(departments.dept_name = 'Human Resources', salaries.salary,not null)) max, 
max(if(departments.dept_name = 'Marketing', salaries.salary, not null)) max, 
max(if(departments.dept_name = 'Production', salaries.salary, not null)) max, 
max(if(departments.dept_name = 'Quality Management', salaries.salary, not null)) max, 
max(if(departments.dept_name = 'Research', salaries.salary, not null)) max,  
max(if(departments.dept_name = 'Finance', salaries.salary, not null)) max, 
 max(if(departments.dept_name = 'Sales', salaries.salary, not null)) max  -- смотрится ужастно...
 
 from employees
 left join dept_emp on employees.emp_no = dept_emp.emp_no
left join departments on departments.dept_no = dept_emp.dept_no
left join salaries on salaries.emp_no = employees.emp_no
group by departments.dept_name;