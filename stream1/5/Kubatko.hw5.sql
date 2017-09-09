/**
 * Created by skubatko on 06/09/17.
 */


/**
 * Домашнее задание 5
 */

USE employees;

/**
 * 1. Реализовать практические задания на примере других таблиц и запросов
 */

-- тест транзакции

-- сессия 1
LOCK TABLE salaries READ;
SELECT * FROM salaries LIMIT 10 \G;

UNLOCK TABLES;

-- сессия 2
SELECT * FROM salaries LIMIT 10 \G;
INSERT INTO salaries (emp_no) VALUES (5000015);

-- тест EXPLAIN

EXPLAIN
  SELECT emp_no
    FROM salaries
    WHERE salary =
    (
      SELECT MAX(salary)
      FROM salaries
    );
+----+-------------+----------+------+---------------+------+---------+------+---------+-------------+
| id | select_type | table    | type | possible_keys | key  | key_len | ref  | rows    | Extra       |
+----+-------------+----------+------+---------------+------+---------+------+---------+-------------+
|  1 | PRIMARY     | salaries | ALL  | NULL          | NULL | NULL    | NULL | 2838411 | Using where |
|  2 | SUBQUERY    | salaries | ALL  | NULL          | NULL | NULL    | NULL | 2838411 | NULL        |
+----+-------------+----------+------+---------------+------+---------+------+---------+-------------+
2 rows in set (0.01 sec)

/**
 * 2. Подумать, какие операции являются транзакционными и написать несколько примеров с
 * транзакционными запросами
 */
-- транзакционные: UPDATE, SELECT, INSERT

-- построчная блокировка
-- сессия 1
SET AUTOCOMMIT = 0;

SELECT * FROM salaries WHERE (emp_no > 500000) AND (emp_no < 500005) FOR UPDATE \G;

UPDATE salaries SET salary = salary + 10000 WHERE emp_no = 500002;

SELECT salary FROM salaries WHERE emp_no = 500002;

COMMIT;

-- сессия 2
UPDATE salaries SET salary = salary + 10000 WHERE emp_no = 500002;

SELECT * FROM salaries LIMIT 10 FOR UPDATE \G;


/**
 * 3. Проанализировать несколько запросов с помощью EXPLAIN
 */

EXPLAIN
 SELECT d.*, COUNT(e.emp_no) qty_of_employees
   FROM employees e
   LEFT JOIN dept_emp de
     ON de.emp_no = e.emp_no
   LEFT JOIN departments d
     ON d.dept_no = de.dept_no
   GROUP BY d.dept_no;
+----+-------------+-------+--------+-------------------+---------+---------+----------------------+--------+----------------------------------------------+
| id | select_type | table | type   | possible_keys     | key     | key_len | ref                  | rows   | Extra                                        |
+----+-------------+-------+--------+-------------------+---------+---------+----------------------+--------+----------------------------------------------+
|  1 | SIMPLE      | e     | index  | NULL              | PRIMARY | 4       | NULL                 | 299470 | Using index; Using temporary; Using filesort |
|  1 | SIMPLE      | de    | ref    | PRIMARY,emp_no    | PRIMARY | 4       | employees.e.emp_no   |      1 | Using index                                  |
|  1 | SIMPLE      | d     | eq_ref | PRIMARY,dept_name | PRIMARY | 4       | employees.de.dept_no |      1 | NULL                                         |
+----+-------------+-------+--------+-------------------+---------+---------+----------------------+--------+----------------------------------------------+
3 rows in set (0.00 sec)

--  есть temporary и filesort, необходимо рассмотреть варианты запроса чтобы их убрать

EXPLAIN
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
+----+-------------+-------+--------+-------------------+---------+---------+----------------------+--------+----------------------------------------------+
| id | select_type | table | type   | possible_keys     | key     | key_len | ref                  | rows   | Extra                                        |
+----+-------------+-------+--------+-------------------+---------+---------+----------------------+--------+----------------------------------------------+
|  1 | SIMPLE      | e     | index  | NULL              | PRIMARY | 4       | NULL                 | 299470 | Using index; Using temporary; Using filesort |
|  1 | SIMPLE      | de    | ref    | PRIMARY,emp_no    | PRIMARY | 4       | employees.e.emp_no   |      1 | Using index                                  |
|  1 | SIMPLE      | d     | eq_ref | PRIMARY,dept_name | PRIMARY | 4       | employees.de.dept_no |      1 | NULL                                         |
|  1 | SIMPLE      | s     | ref    | PRIMARY,emp_no    | PRIMARY | 4       | employees.e.emp_no   |      4 | NULL                                         |
+----+-------------+-------+--------+-------------------+---------+---------+----------------------+--------+----------------------------------------------+
4 rows in set (0.00 sec)

--  есть temporary и filesort, необходимо рассмотреть варианты запроса чтобы их убрать
