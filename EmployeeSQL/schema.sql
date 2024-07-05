-- Drop existing tables if they exist
DROP TABLE IF EXISTS employees_staging, departments, employees, dept_manager, salaries, dept_emp, titles CASCADE;

-- Create the staging table for employees
CREATE TABLE employees_staging (
    emp_no INT,
    emp_title_id VARCHAR(5),
    birth_date VARCHAR(10),
    first_name VARCHAR(35),
    last_name VARCHAR(35),
    sex CHAR(1),  -- Using 'sex' instead of 'gender'
    hire_date VARCHAR(10)
);

-- Create the final employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(35) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(40) NOT NULL UNIQUE
);

--Create titles table
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title TEXT NOT NULL
);


-- Create department employees table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create salaries table
CREATE TABLE salaries(
	emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create department manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);