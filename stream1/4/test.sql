EXPLAIN SELECT
          d.*,
          e.first_name,
          e.last_name
        FROM departments d
        LEFT JOIN dept_manager m
            ON d.dept_no = m.dept_no
        LEFT JOIN employees e
            ON m.emp_no = e.emp_no
        WHERE d.dept_no = "d009";

EXPLAIN SELECT * FROM dept_manager m WHERE m.from_date = "1985-01-01";