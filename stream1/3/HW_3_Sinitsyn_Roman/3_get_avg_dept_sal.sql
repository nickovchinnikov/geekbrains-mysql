use employees;
/*Выбрать среднюю зарплату по отделам
учитываю, что сотрдуник может работать в разных отделах*/

select 
departments.dept_name,
avg(salaries.salary) as avg_dept_sal
from dept_emp 
inner join salaries on dept_emp.emp_no = salaries.emp_no
and salaries.from_date between dept_emp.from_date and dept_emp.to_date
left join departments on dept_emp.dept_no = departments.dept_no
group by departments.dept_name;
