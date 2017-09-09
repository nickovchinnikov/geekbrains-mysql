USE employees;

DROP FUNCTION IF EXISTS FindManager;

DELIMITER //
CREATE FUNCTION FindManager(first_name VARCHAR(14), last_name VARCHAR(16))
	RETURNS INT(11) DETERMINISTIC
    RETURN (SELECT emp_no FROM employees
		WHERE employees.first_name = first_name AND employees.last_name = last_name
        LIMIT 1)//
DELIMITER ;

SELECT  FindManager("Chirstian","Koblick");
    
