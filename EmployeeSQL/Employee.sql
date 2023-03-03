

--drop table if exists "dept_emp", 
--drop table if exists "departments",
--drop table if exists "dept_manager",
--drop table if exists "titles",
--drop table if exists "employees",
--drop table if exists "salaries"

-- title_id,title
CREATE TABLE "titles" (
    "title_id" varchar(6)   NOT NULL,
    "title" varchar(30)   NOT NULL,
    PRIMARY KEY ("title_id")
);

-- emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date
CREATE TABLE "employees" (
    "emp_no" INT (10)  NOT NULL,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" varchar(11)   NOT NULL,
    "first_name" varchar(40)   NOT NULL,
    "last_name" varchar(40)   NOT NULL,
    "sex" varchar(2),
    "hire_date" varchar(11)   NOT NULL,
PRIMARY KEY ("emp_no"),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- "dept_no","dept_name"
CREATE TABLE "departments" (
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
PRIMARY KEY ("dept_no")
);

--emp_no,dept_no
CREATE TABLE "dept_emp" (
    "emp_no" INT (10) NOT NULL,
    "dept_no" varchar (10) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


-- dept_no,emp_no
CREATE TABLE "dept_manager" (
    "dept_no" varchar (10) NOT NULL,
    "emp_no" INT (10) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


--emp_no,salary
CREATE TABLE "salaries" (
    "emp_no" INT (10) NOT NULL,
    "salary" INT (10) NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


