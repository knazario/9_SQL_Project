--Display individual tables for reference 
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name,e.first_name,e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no;	

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;

--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.
SELECT d.dept_no, d.dept_name,dm.emp_no, e.first_name, e.last_name
FROM dept_manager AS dm
INNER JOIN employees AS e ON
dm.emp_no = e.emp_no
INNER JOIN departments AS d ON 
d.dept_no = dm.dept_no; 

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT de.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM  dept_emp AS de
INNER JOIN employees AS e ON 
de.emp_no = e.emp_no
INNER JOIN departments AS d ON
d.dept_no = de.dept_no
--Sorts the in department number order (ascending) and within department, alphabetical by last name 
--Note that employees may belong to multiple departments
ORDER BY de.dept_no, e.last_name;

--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B. Final result yields 20 names 
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'  AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM  dept_emp AS de
INNER JOIN employees AS e ON 
de.emp_no = e.emp_no
INNER JOIN departments AS d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM  dept_emp AS de
INNER JOIN employees AS e ON 
de.emp_no = e.emp_no
INNER JOIN departments AS d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)
--Note- Additonally ordered by last_name, so that frequency counts of equal value where ordered alpahbetically
SELECT last_name, COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC, last_name;