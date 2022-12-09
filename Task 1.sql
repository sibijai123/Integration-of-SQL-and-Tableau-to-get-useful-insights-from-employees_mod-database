USE employees_mod;

SELECT * FROM t_departments;
SELECT * FROM t_dept_emp;
SELECT  * FROM t_employees;
SELECT * FROM t_dept_manager;
SELECT d.dept_name, ee.gender, dm.emp_no, dm.from_date,dm.to_date,e.calendar_year,
       CASE 
            WHEN e.calendar_year BETWEEN YEAR(dm.from_date) AND YEAR(dm.to_date) THEN 1
            ELSE 0
		END AS Active
FROM
(SELECT YEAR(hire_date) AS calendar_year
FROM t_employees
GROUP BY calendar_year) e
CROSS JOIN t_dept_manager dm 
JOIN t_departments d ON d.dept_no = dm.dept_no
JOIN t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;

