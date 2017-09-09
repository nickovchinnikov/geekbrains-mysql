# 2 TASK
use employees
delimiter //

create procedure menager_emp (
    in first_name varchar(100),
    in last_name varchar(100),
    out man_first_neme varchar(100),
    out man_last_name varchar(100)
  ) 
  begin
    select employees.first_name, employees.last_name 
    from employees where emp_no = (
    select emp_no from dept_manager
    where dept_no = (select dept_no from dept_emp left join employees on employees.emp_no = dept_emp.emp_no
     where employees.first_name = first_name and employees.last_name = last_name and dept_manager.to_date = '9999-01-01'));
  end//

delimiter ;

call menager_emp ('Bezalel', 'Simmel', @meneger_emp);
select @meneger_emp;

