
USE employees;

EXPLAIN SELECT * FROM employees
	
    INNER JOIN dept_emp ON dept_emp.dept_no = employees.emp_no
    INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
    INNER JOIN salaries ON salaries.emp_no = employees.emp_no
    WHERE employees.emp_no = 10001; 
    -- количество сканированных строк 1x331143x1x17
    
    
    
EXPLAIN SELECT * FROM employees
	
    INNER JOIN dept_emp ON dept_emp.dept_no = employees.emp_no
    INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
    INNER JOIN salaries ON salaries.emp_no = employees.emp_no
    WHERE employees.emp_no BETWEEN 10001 AND 10006; 
    -- количество сканированных строк 6x331143x1x9
    
    

EXPLAIN SELECT * FROM employees
	
    INNER JOIN dept_emp ON dept_emp.dept_no = employees.emp_no
    INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
    INNER JOIN salaries ON salaries.emp_no = employees.emp_no
    WHERE employees.emp_no = 10001 AND dept_emp.emp_no = 10001;
    -- количество сканированных строк 1x1x1x17
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////
	-- Продецдура для добавления вводимого значения первой строки выплаты в колонку salary
	
	
	USE employees;


DELIMITER //
DROP PROCEDURE IF EXISTS add_cash //

CREATE PROCEDURE add_cash (G VARCHAR(30), F INT)
 -- где G - полное имя сотрудника , F - сумма , которая добавляется сотруднику 



BEGIN 

DECLARE new_cash INT;
DECLARE nomber_employee VARCHAR (30);


SET nomber_employee = 
		(
            
		SELECT emp_no FROM employees
		WHERE concat(first_name , ' ', last_name) = G LIMIT 1
            
		);

SET new_cash = 
		(
            
		SELECT salaries.salary FROM salaries
		WHERE emp_no = nomber_employee LIMIT 1
            
		);


SET new_cash = new_cash + F;

START TRANSACTION;

	UPDATE salaries 
		SET salary =  new_cash
			WHERE emp_no = nomber_employee LIMIT 1;
    
COMMIT;


end//

CALL add_cash ('Georgi Facello', '10')