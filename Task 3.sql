USE employees_mod;

SELECT * FROM t_employees;
SELECT * FROM t_salaries;
SELECT * FROM t_dept_emp;
SELECT * FROM t_departments;

SELECT e.gender, ROUND(AVG(s.salary),2) AS salary, YEAR(s.from_date) AS calendar_year, d.dept_name
FROM t_employees e
JOIN t_salaries s ON e.emp_no = s.emp_no
JOIN t_dept_emp de ON de.emp_no = e.emp_no
JOIN t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no,e.gender,calendar_year
HAVING calendar_year <= '2002'
ORDER BY d.dept_no;
