-- Verify data import by selecting all records from each table
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- Retrieve employee details along with their salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no;

-- Retrieve details of employees hired in 1986, sorted by hire date
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('Year', hire_date) = 1986
ORDER BY hire_date ASC;

-- Retrieve each department’s manager along with department and employee details
SELECT dm.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM employees AS e
INNER JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
INNER JOIN departments AS d ON dm.dept_no = d.dept_no;

-- Retrieve department details for each employee
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no;

-- Retrieve details of employees named Hercules with last names beginning with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Retrieve all employees in the Sales department, including department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- Retrieve employees in both Sales and Development departments
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- Retrieve frequency counts of last names, sorted by frequency in descending order
SELECT last_name, COUNT(last_name) AS "Frequency counts"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
