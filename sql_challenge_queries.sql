/*
Data Analysis:
Database is complete, the following are the requested queries from Pewlett Hackard. 
*/

--Q1:List the following details of each employee: employee number, last name, 
--first name, gender, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees AS e
INNER JOIN salaries s ON e.emp_no = s.emp_no;

--Q2:List employees who were hired in 1986.

SELECT emp_no, birth_date, first_name, last_name, gender, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date ASC;

--Q3:List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dm.dept_no, dm.emp_no, dm.from_date, dm.to_date, d.dept_name, e.first_name, last_name
FROM departments d
INNER JOIN dept_manager dm ON dm.dept_no = d.dept_no
INNER JOIN employees e ON dm.emp_no = e.emp_no;

--Q4:List the department of each employee with the following information: employee number, 
--last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no;

--Q5:List all employees whose first name is "Hercules" and last names begin with "B."

SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC;

--Q6:List all employees in the Sales department, including their employee number, last name,
--first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales'
ORDER BY last_name;

--Q7:List all employees in the Sales and Development departments, including their employee number,
--last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales'  OR  dept_name = 'Development'
ORDER BY last_name; 

--Q8:In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.
SELECT e.last_name, COUNT(*) frequency_count
FROM employees e
GROUP BY last_name 
ORDER BY frequency_count DESC;







