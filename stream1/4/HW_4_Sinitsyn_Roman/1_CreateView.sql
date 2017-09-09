USE employees;

DROP VIEW IF EXISTS GetAvgDeptSalary;

CREATE VIEW GetAvgDeptSalary AS
SELECT 
	departments.dept_name,
	AVG(salaries.salary) AS avg_dept_sal
FROM dept_emp 
INNER JOIN salaries ON dept_emp.emp_no = salaries.emp_no
	AND salaries.from_date BETWEEN dept_emp.from_date AND dept_emp.to_date
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY departments.dept_name;

SELECT * FROM GetAvgDeptSalary;