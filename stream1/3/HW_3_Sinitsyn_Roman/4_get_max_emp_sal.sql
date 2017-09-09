use employees;
/*Выбрать максимальную зарплату сотрудникаalter
учитываю только ежегодную зп*/

select 
concat(employees.first_name,' ' , employees.last_name) as emp_full_name,
max(salaries.salary) as max_salary 
from employees
left join salaries on employees.emp_no = salaries.emp_no 
where employees.emp_no = 10002
group by emp_full_name
;