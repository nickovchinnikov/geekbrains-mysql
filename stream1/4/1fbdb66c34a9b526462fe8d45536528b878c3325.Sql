
-- 1 задание


 USE geodata;

CREATE VIEW city AS select _cities.title as город, _regions.title as область, _countries.title as страна from _cities
left join _countries on _cities.country_id = _countries.id
left join _regions on _cities.region_id = _regions.id;



--   2 задание



use employees;

DELIMITER //
drop function if exists search //

CREATE FUNCTION search (G VARCHAR(30))

RETURNS text 

BEGIN 

return (

select concat(first_name , ' ', last_name) from employees
where concat(first_name , ' ', last_name) = G limit 1

);
end//

select search ('Georgi Facello')



-- 3 задание 



use employees;
drop trigger if exists After_insert_cash;
DELIMITER //
drop trigger if exists After_insert_cash //

 CREATE TRIGGER `After_insert_cash`
after INSERT ON employees
FOR EACH ROW 
BEGIN 

insert into salaries (emp_no, salary, from_date, to_date)
VALUES (NEW.emp_no , 100 ,   '1995-04-07',   '1995-07-05');
 
END //


insert into employees (emp_no, birth_date,first_name,last_name,gender,hire_date)
values (123456, '1953-09-02' , 'Nikita' , 'Kyrochkin' , 'M' , '2007-06-26' );