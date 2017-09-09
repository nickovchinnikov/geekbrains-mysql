use employees;
/*Удалить сотрудникаб у которого максмальная зарплата
запрос не работает, т.к. не дает делать лимит во вложенном запросе
*/

delete from employees
where emp_no in (
select 
employees.emp_no
from employees
left join salaries on employees.emp_no = salaries.emp_no 
order by salaries.salary desc
limit 1)
;