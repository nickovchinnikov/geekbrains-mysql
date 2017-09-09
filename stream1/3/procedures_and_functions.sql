delimiter //

CREATE PROCEDURE count_employees (IN dept_name VARCHAR(50), OUT count_emp INT)
  BEGIN
    SELECT COUNT(*)
      FROM employees emp
      LEFT JOIN dept_emp de
        ON emp.emp_no = de.emp_no
      LEFT JOIN departments dep
        ON dep.dept_no = de.dept_no
      WHERE dep.dept_name = dept_name;
  END//

delimiter ;


CREATE FUNCTION multiply (a INT, b INT)
RETURNS INT DETERMINISTIC
  RETURN a * b;


delimiter //

CREATE FUNCTION count_employees_func (dept_name VARCHAR(50)) RETURNS INT DETERMINISTIC
  BEGIN
    DECLARE EMP_COUNT INT;
    SELECT COUNT(*) INTO EMP_COUNT
        FROM employees emp
        LEFT JOIN dept_emp de
          ON emp.emp_no = de.emp_no
        LEFT JOIN departments dep
          ON dep.dept_no = de.dept_no
        WHERE dep.dept_name = dept_name;
      RETURN EMP_COUNT;
  END//
delimiter ;

delimiter //

DROP PROCEDURE IF EXISTS mmm_proc;

CREATE PROCEDURE mmm_proc (IN amount_for_each INT)
  BEGIN
    UPDATE account SET amount = amount + amount_for_each;
  END//

DROP TRIGGER IF EXISTS mmm_action;

CREATE TRIGGER mmm_action BEFORE INSERT ON account
FOR EACH ROW
  BEGIN
    DECLARE COUNT_PARTICIPANTS INT;
    DECLARE AMOUNT_TO_EACH_PERSON INT;

    SELECT COUNT(*) INTO COUNT_PARTICIPANTS
      FROM account;

    IF COUNT_PARTICIPANTS > 0 THEN
      SET AMOUNT_TO_EACH_PERSON = NEW.amount/COUNT_PARTICIPANTS;
      SET NEW.amount = 0;
    END IF;
  END//

delimiter ;