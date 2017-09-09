USE employees;

DROP TRIGGER IF EXISTS AddSalary;

CREATE TRIGGER AddSalary AFTER INSERT ON employees
	FOR EACH ROW 
	  INSERT INTO salaries (emp_no,salary,from_date,to_date) 
      VALUES 
      (NEW.emp_no, 100, NEW.hire_date, '9999-01-01');
    
SELECT * FROM salaries WHERE emp_no = 500000;

INSERT INTO employees (emp_no,birth_date,first_name,last_name,gender,hire_date) 
	VALUES (500000, '1985-10-10',"Vasya", "Pupkin", "M",'2017-09-01');
    
SELECT * FROM salaries WHERE emp_no = 500000;




    
    

