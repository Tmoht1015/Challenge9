-- List: emp number, last name, first name, sex, and salary:
SELECT e.emp_no, last_name, first_name, sex, salary
FROM employee AS e
LEFT JOIN salary AS s
ON e.emp_no=s.emp_no
ORDER BY e.emp_no ASC;

--List: hired in 1986:
SELECT emp_no, last_name, first_name, hire_date
FROM employee
WHERE hire_date>'1985-12-31'
	AND hire_date<'1987-01-01'
--order by hire_date asc
--order by hire_date desc
ORDER BY emp_no ASC;

--List of mgmt by: --department (# & name), employee number, last & first name
SELECT dmg.dept_no, dept.dept_name, dmg.emp_no, emp.last_name, emp.first_name   
FROM dept_emp AS de
JOIN department AS dept
ON de.dept_no=dept.dept_no
JOIN dept_manager AS dmg
ON de.emp_no=dmg.emp_no
JOIN employee AS emp
ON de.emp_no=emp.emp_no
ORDER BY emp_no ASC;

--List of each employee's DEPARTMENT NUMBER with: employee number, last name, first name, dept name.
SELECT depte.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employee AS emp
JOIN dept_emp AS depte
ON emp.emp_no=depte.emp_no
JOIN department AS dept
ON depte.dept_no=dept.dept_no;

--FIRST NAME is "Hercules" and LAST NAMES "B":
SELECT emp_no, first_name, last_name, sex
FROM employee
WHERE first_name='Hercules'
	AND last_name LIKE 'B%';
	
--List of all employees in the SALES department, including: employee number, last name, first name 
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employee AS emp
JOIN dept_emp AS depte
ON emp.emp_no=depte.emp_no
JOIN department AS dept
ON depte.dept_no=dept.dept_no
WHERE dept.dept_name='Sales'
ORDER BY emp_no ASC;

--List of all employees in the SALES and DEVELOPMENT department, including: employee number, last name, first name, department number 
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employee AS emp
JOIN dept_emp AS depte
ON emp.emp_no=depte.emp_no
JOIN department AS dept
ON depte.dept_no=dept.dept_no
WHERE dept.dept_name='Sales'
	OR dept.dept_name='Development';

--FREQUENCY count of LAST NAMES descending:
SELECT last_name, COUNT(last_name) AS emp_count_by_last_name
FROM employee
GROUP BY last_name
ORDER BY emp_count_by_last_name DESC;