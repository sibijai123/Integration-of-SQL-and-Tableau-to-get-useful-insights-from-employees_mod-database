USE employees_mod;
SELECT * from t_dept_emp;
SELECT * FROM t_employees;

SELECT 
    YEAR(t2.from_date) AS calendar_year,
    t1.gender AS gender,
    COUNT(t1.emp_no) AS number_of_employees
FROM
    t_employees t1
        JOIN
    t_dept_emp t2 ON t1.emp_no = t2.emp_no

GROUP BY calendar_year, t1.gender
HAVING calendar_year >=1990
ORDER BY calendar_year;
