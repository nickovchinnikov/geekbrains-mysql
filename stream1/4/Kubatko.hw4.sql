/*
* Домашнее задание 4
*/

/*
* 1. Создать на основе запросов, которые вы сделали в ДЗк уроку 3, VIEW
*/

/*
* База данных “страны и города мира”
*/

USE geodata;

-- Сделать запрос, в котором мы выберем все данные о городе - регион, страна
DROP VIEW IF EXISTS cities_info;

CREATE VIEW cities_info AS
  SELECT ci.title `город`, r.title `регион`, co.title `страна`
    FROM _cities ci
    LEFT JOIN _regions r
      ON r.id = ci.region_id
    LEFT JOIN _countries co
      ON co.id = ci.country_id;

SELECT * FROM cities_info WHERE `город` = 'Москва';

DROP VIEW IF EXISTS cities_info;

-- Выбрать все города из Московской области
DROP VIEW IF EXISTS msc_region_info;

CREATE VIEW msc_region_info AS
  SELECT ci.title город, r.title регион
    FROM _cities ci
    LEFT JOIN _regions r
      ON r.id = ci.region_id
    WHERE r.title = 'Московская область';

SELECT * FROM msc_region_info;

DROP VIEW IF EXISTS msc_region_info;

/*
* База данных “сотрудники”
*/

USE employees;

-- 1. Выбрать среднюю зарплату по отделам
DROP VIEW IF EXISTS avg_salary_by_depts;

CREATE VIEW avg_salary_by_depts AS
  SELECT  d.*, AVG(s.salary) average
    FROM departments d
    LEFT JOIN dept_emp de
      ON de.dept_no = d.dept_no
    LEFT JOIN employees e
      ON e.emp_no = de.emp_no
    LEFT JOIN salaries s
      ON s.emp_no = de.emp_no
    GROUP BY d.dept_no;

SELECT * FROM avg_salary_by_depts;

DROP VIEW IF EXISTS avg_salary_by_depts;

-- 2. Выбрать максимальную зарплату у сотрудника
DROP VIEW IF EXISTS emp_max_slry;

CREATE VIEW emp_max_slry AS
  SELECT e.*, MAX(s.salary) maximum
    FROM employees e
    LEFT JOIN salaries s
      ON s.emp_no = e.emp_no
    GROUP BY e.emp_no;

SELECT * FROM emp_max_slry LIMIT 10;

DROP VIEW IF EXISTS emp_max_slry;

-- 3. Удалить одного сотрудника, у которого максимальная зарплата
DROP VIEW IF EXISTS max_slry_emp;
-- вместо удаления найдем сотрудника с максимальной зарплатой
CREATE VIEW max_slry_emp AS
-- DELETE FROM employees WHERE emp_no = (
  SELECT emp_no FROM salaries
    WHERE salary = (
      SELECT MAX(salary) FROM salaries
    -- )
  );

SELECT * FROM max_slry_emp;

DROP VIEW IF EXISTS max_slry_emp;

-- 4. Посчитать количество сотрудников во всех отделах
DROP VIEW IF EXISTS emp_count_by_dept;

CREATE VIEW emp_count_by_dept AS
  SELECT d.*, COUNT(e.emp_no) qty_of_employees
    FROM employees e
    LEFT JOIN dept_emp de
      ON de.emp_no = e.emp_no
    LEFT JOIN departments d
      ON d.dept_no = de.dept_no
    GROUP BY d.dept_no;

SELECT * FROM emp_count_by_dept;

DROP VIEW IF EXISTS emp_count_by_dept;

-- 5. Найти количество сотрудников в отделах и посмотреть сколько всего денег получает отдел
DROP VIEW IF EXISTS emp_slry_count_by_dept;

CREATE VIEW emp_slry_count_by_dept AS
  SELECT d.*, COUNT(e.emp_no) qty_of_employees, SUM(s.salary) amount, AVG(s.salary) average
    FROM employees e
    LEFT JOIN dept_emp de
      ON de.emp_no = e.emp_no
    LEFT JOIN departments d
      ON d.dept_no = de.dept_no
    LEFT JOIN salaries s
      ON s.emp_no = e.emp_no
    GROUP BY d.dept_no
    ORDER BY average DESC;

SELECT * FROM emp_slry_count_by_dept;

DROP VIEW IF EXISTS emp_slry_count_by_dept;

/*
* 2. Создать функцию, которая найдет менеджера по имени и фамилии
*/

DROP FUNCTION IF EXISTS find_emp_by_name;

DELIMITER //

CREATE FUNCTION find_emp_by_name(emp_first_name VARCHAR(45), emp_last_name VARCHAR(45)) RETURNS INT
BEGIN
  DECLARE result INT;
  SET @result = 0;

  SELECT e.emp_no INTO result
    FROM employees e
    WHERE e.first_name = emp_first_name
      AND e.last_name = emp_last_name;

  RETURN result;
END//

DELIMITER ;

SET @found_emp_no = find_emp_by_name('Elgin', 'Nittel');
SELECT @found_emp_no;
SELECT * FROM employees WHERE emp_no = @found_emp_no;

SET @found_emp_no = find_emp_by_name('Junichi', 'Angel');
SELECT @found_emp_no;
SELECT * FROM employees WHERE emp_no = @found_emp_no;

SET @found_emp_no = find_emp_by_name('Deborah', 'Murtha');
SELECT @found_emp_no;
SELECT * FROM employees WHERE emp_no = @found_emp_no;

DROP FUNCTION IF EXISTS find_emp_by_name;

/*
* 3. Создатьтриггер, который при добавлении нового сотрудника будет выплачивать ему
* вступительный бонус в таблицу salary.
*/

DROP TRIGGER IF EXISTS new_emp_bonus;

DELIMITER //

CREATE TRIGGER new_emp_bonus AFTER INSERT ON employees
  FOR EACH ROW
  BEGIN
    DECLARE bonus INT;
    SET @bonus = 3500;
    INSERT INTO salaries(emp_no, salary, from_date, to_date) VALUES (NEW.emp_no, @bonus, NEW.hire_date, ADDDATE(NEW.hire_date, INTERVAL 1 MONTH));
  END//

DELIMITER ;

INSERT INTO employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
  VALUES(500000, '1998-11-30', 'Khaled', 'Baaz', 'M', '2017-08-01');
SELECT salary FROM salaries WHERE emp_no = 500000;

INSERT INTO employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
  VALUES(500001, '1978-11-30', 'Harid', 'Duchilas', 'M', '2017-08-01');
SELECT salary FROM salaries WHERE emp_no = 500001;

INSERT INTO employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
  VALUES(500002, '1985-09-30', 'Irina', 'Dilais', 'F', '2017-08-01');
SELECT salary FROM salaries WHERE emp_no = 500001;

DROP TRIGGER IF EXISTS new_emp_bonus;

/*
* Задание **
* сделать так, чтобы после выполнения триггера у нас обновлялись данные о счете пользователя,
* т.е. каждый последний пользователь теряет свои деньги и начисляет их тем, кто пришел раньше в равных пропорциях.
* У нас получилось списывать деньги, осталось только научиться их начислять
*/

DROP TABLE IF EXISTS account;
DROP PROCEDURE IF EXISTS new_mmm_player;
DROP TRIGGER IF EXISTS mmm_action;

CREATE TABLE account (acct_num INT, amount DECIMAL(10,2));

DELIMITER //

CREATE PROCEDURE new_mmm_player (IN acct INT, IN income DECIMAL(10,2))
BEGIN
  DECLARE number_of_people INT;
  DECLARE bonus DECIMAL(10,2);

  SELECT COUNT(*) INTO number_of_people FROM account;
  SET bonus = income / number_of_people;

  UPDATE account SET amount = amount + bonus;

  INSERT INTO account(acct_num, amount) VALUES (acct, income);

END//

CREATE TRIGGER mmm_action BEFORE INSERT ON account
FOR EACH ROW
BEGIN
  DECLARE num_people INT;

  SELECT COUNT(*) INTO num_people FROM account;

  IF num_people > 0 THEN
    SET NEW.amount = 0;
  END IF;

END//

DELIMITER ;

CALL new_mmm_player(1, 100);
SELECT * FROM account;

CALL new_mmm_player(2, 50);
SELECT * FROM account;

CALL new_mmm_player(3, 200);
SELECT * FROM account;

CALL new_mmm_player(4, 150);
SELECT * FROM account;

CALL new_mmm_player(5, 100);
SELECT * FROM account;

DROP PROCEDURE IF EXISTS new_mmm_player;
DROP TRIGGER IF EXISTS mmm_action;
DROP TABLE IF EXISTS account;
