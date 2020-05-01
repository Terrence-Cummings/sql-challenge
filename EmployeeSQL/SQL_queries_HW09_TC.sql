--09 - SQL Homework - Terrence Cummings

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date FROM employees
WHERE employees.hire_date LIKE '%86';

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
--Note: A department can have more than one manager so number of managers > number of departments
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no AS mgr_emp_no, employees.last_name, employees.first_name FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, 
--and department name.
--Note: A single employee can be associated with more than one department so result is > number of employees
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, 
--and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no = 'd007';

--7. List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no = 'd007' OR departments.dept_no = 'd005';
 
--8. In descending ORDER, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, count(employees.last_name) AS Frequency FROM employees
GROUP BY employees.last_name
ORDER BY Frequency DESC;
