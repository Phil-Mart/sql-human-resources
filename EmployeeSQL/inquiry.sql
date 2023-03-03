--QUERY TABLE
--[ ] List the employee number, last name, first name, sex, and salary of each employee (2 points)
select 
	e.emp_no,
    e.first_name,
    e.last_name,
    e.sex,
	s.salary
from employees as e 
	left join salaries as s
	on (e.emp_no = s.emp_no)
order by e.emp_no;

--[ ] List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
select 
    e.first_name, 
    e.last_name, 
    e.hire_date 
from employees as e
where e.hire_date between '1986-01-01' AND '1986-12-31'
order by e.hire_date

--[ ] List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
select 
	m.emp_no, 
	m.dept_no,
	c.dept_name,
	e.last_name,
	e.first_name
from dept_manager as m
	left join departments as c
	on (m.dept_no = c.dept_no)
	left join employees as e
	on (m.emp_no = e.emp_no)
;

--[ ] List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
select 
	d.dept_no,
	e.emp_no, 
	e.last_name, 
	e.first_name,
	f.dept_name 
from employees as e
	left join dept_emp as d
	on (d.emp_no = e.emp_no)
	left join departments as f
	on (d.dept_no = f.dept_no);


--[ ] List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
select 
first_name as fn,
last_name as ln, 
sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'


--------HERE
--[ ] List each employee in the Sales department, including their employee number, last name, and first name (2 points)
select 
	d.dept_name,
	e.emp_no,
	e.last_name, 
	e.first_name
from departments as d
	left join dept_emp as f
	on (f.dept_no = d.dept_no)
	left join employees as e
	on (e.emp_no = f.emp_no)
where dept_name = 'Sales' 



--[ ] List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
select 
	d.dept_name,
	e.emp_no,
	e.last_name, 
	e.first_name
from departments as d
	left join dept_emp as f
	on (f.dept_no = d.dept_no)
	left join employees as e
	on (e.emp_no = f.emp_no)
where dept_name = 'Sales'

union 

select 
	d.dept_name,
	e.emp_no,
	e.last_name, 
	e.first_name
from departments as d
	left join dept_emp as f
	on (f.dept_no = d.dept_no)
	left join employees as e
	on (e.emp_no = f.emp_no)
where dept_name = 'Development'
order by dept_name

-- number of last names by desc
select count (last_name) as "qtyln"
, last_name
from employees 
group by last_name
order by "qtyln" desc