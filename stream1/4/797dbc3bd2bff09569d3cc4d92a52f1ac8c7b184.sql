--
-- 1. Создать на основе запросов, которые вы сделали в ДЗ к уроку 3, VIEW.
--
CREATE VIEW country_region_city_name
AS
SELECT
	_countries.title as country_name,
	_regions.title as region_name,
	_cities.title as city_name
FROM _cities
	LEFT JOIN _countries
    	ON _countries.id = _cities.country_id
	LEFT JOIN _regions
    	ON _regions.id = _cities.region_id


CREATE VIEW moscow_region
AS
SELECT
	_regions.title as region_name,
	_cities.title as city_name
FROM _cities
	LEFT JOIN _regions
    	ON _regions.id = _cities.region_id
    WHERE _regions.title = 'Московская область'


use employees;
CREATE VIEW avg_salary
AS
SELECT
  AVG(salary) as avg_salary,
  dept_name
FROM departments
  LEFT JOIN dept_emp
    ON dept_emp.dept_no = departments.dept_no
  LEFT JOIN employees
    ON dept_emp.emp_no = employees.emp_no
  LEFT JOIN salaries
    ON employees.emp_no = salaries.emp_no
GROUP BY dept_name
ORDER BY avg_salary DESC;


CREATE VIEW max_salary
AS
SELECT
  MAX(salary) as max_salary,
  CONCAT_WS(' ', first_name, last_name) as name,
  employees.emp_no
FROM employees
  RIGHT JOIN salaries
    ON employees.emp_no = salaries.emp_no
GROUP BY employees.emp_no


CREATE VIEW employees_count_in_departments
AS
SELECT
  COUNT(emp_no) as employees_count,
  departments.dept_name
FROM dept_emp
	LEFT JOIN departments
    	ON departments.dept_no = dept_emp.dept_no
GROUP BY dept_emp.dept_no


CREATE VIEW employees_count_in_departments_and_department_salary
AS
SELECT
  SUM(salary) as total_salary,
  dept_name
FROM departments
  LEFT JOIN dept_emp
    ON departments.dept_no = dept_emp.dept_no
  LEFT JOIN employees
    ON employees.emp_no = dept_emp.emp_no
  LEFT JOIN salaries
    ON salaries.emp_no = employees.emp_no
GROUP BY dept_name


--
-- 2. Создать функцию, которая найдет менеджера по имени и фамилии.
--

DROP FUNCTION IF EXISTS find_manager;
DELIMITER //

CREATE FUNCTION find_manager (first TEXT, last TEXT)
  RETURNS TEXT
BEGIN
  DECLARE result TEXT;
  DECLARE data TEXT;

  SELECT
    GROUP_CONCAT(emp_no) as emp_no
    INTO data
  FROM employees
    WHERE first_name = first AND last_name = last;

  RETURN (data);
END//
DELIMITER ;

/**
 * 3. Создать триггер, который при добавлении нового сотрудника будет выплачивать ему вступительный бонус в таблицу salary
 */

DROP TRIGGER IF EXISTS add_bonus;
DELIMITER //

CREATE TRIGGER add_bonus AFTER INSERT ON employees
FOR EACH ROW
BEGIN
  INSERT INTO salaries (emp_no, salary, from_date, to_date) VALUES (NEW.emp_no, 100, CURRENT_DATE, '9999-01-01');
END//

DELIMITER ;
