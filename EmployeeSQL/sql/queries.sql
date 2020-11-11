-- Query 1
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT
	e.emp_no as employee_number
	,e.last_name as last_name
	,e.first_name as first_name
	,e.sex as sex
	,s.salary as salary
	
FROM
	employees e JOIN salaries s on e.emp_no = s.emp_no

ORDER BY
	e.emp_no ASC
;

-- Query 2
-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT
	employees.first_name
	,employees.last_name
	,employees.hire_date
		
FROM
	employees

WHERE 1=1
	AND EXTRACT(YEAR FROM employees.hire_date) = '1986'

ORDER BY 
	employees.hire_date ASC
	,employees.last_name ASC
	,employees.first_name ASC
;

-- Query 3
-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
	d.dept_no as department_number
	,d.dept_name as department_name
	,dm.emp_no as employee_number
	,e.last_name as last_name
	,e.first_name as first_name
	
FROM
	employees e JOIN dept_manager dm on e.emp_no = dm.emp_no
	JOIN departments d on dm.dept_no = d.dept_no
;

-- Query 4
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	de.emp_no as employee_number
	,e.last_name as last_name
	,e.first_name as first_name
	,d.dept_name as department_name
	
FROM
	employees e JOIN dept_emp de on e.emp_no = de.emp_no
	JOIN departments d on de.dept_no = d.dept_no
;

-- Query 5
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
	employees.first_name
	,employees.last_name
	,employees.sex
		
FROM
	employees

WHERE 1=1
	AND employees.first_name = 'Hercules'
	AND employees.last_name ILIKE 'B%'

ORDER BY 
	employees.last_name ASC
;

-- Query 6
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	de.emp_no as employee_number
	,e.last_name as last_name
	,e.first_name as first_name
	,d.dept_name as department_name
	
FROM
	employees e JOIN dept_emp de on e.emp_no = de.emp_no
	JOIN departments d on de.dept_no = d.dept_no

WHERE 1=1
	AND d.dept_name = 'Sales'
;

-- Query 7
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	de.emp_no as employee_number
	,e.last_name as last_name
	,e.first_name as first_name
	,d.dept_name as department_name
	
FROM
	employees e JOIN dept_emp de on e.emp_no = de.emp_no
	JOIN departments d on de.dept_no = d.dept_no

WHERE 1=1
	AND d.dept_name = 'Sales'
	OR d.dept_name = 'Development'
;

-- Query 8
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	employees.last_name
	,COUNT(employees.last_name)
		
FROM
	employees

GROUP BY
	employees.last_name

ORDER BY 
	count DESC
;

-- Query Epilogue
-- Display the data for employee ID number 499942
SELECT
	*
	
FROM
	employees

WHERE 1=1
	AND emp_no = 499942
;