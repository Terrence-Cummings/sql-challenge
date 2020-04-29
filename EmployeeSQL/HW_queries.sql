--09 - SQL Homework - Terrence Cummings

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary from employees
join salaries on employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select employees.first_name, employees.last_name, employees.hire_date from employees
where employees.hire_date like '%86';

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
--Note: A department can have more than one manager.
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name from dept_manager
join departments on dept_manager.dept_no = departments.dept_no
join employees on dept_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, 
--and department name.
--Note: A single employee can be associated with more than one department.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
order by emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name, employees.last_name, employees.sex from employees
where employees.first_name = 'Hercules' and employees.last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, 
--and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_no = 'd007';

--7. List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_no = 'd007' or departments.dept_no = 'd005';
 
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select employees.last_name, count(employees.last_name) as Frequency from employees
group by employees.last_name
order by Frequency desc;
