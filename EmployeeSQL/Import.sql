INSERT INTO employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
SELECT
    emp_no,
    emp_title_id,
    TO_DATE(birth_date, 'MM/DD/YYYY'),
    first_name,
    last_name,
    sex,
    TO_DATE(hire_date, 'MM/DD/YYYY')
FROM
    employees_staging;

COPY titles(title_id, title)
FROM '/Users/janhavibharati/sql-challenge/EmployeeSQL/data/titles.csv'
CSV HEADER;

COPY salaries(emp_no,salary)
FROM '/Users/janhavibharati/sql-challenge/EmployeeSQL/data/salaries.csv'
CSV HEADER;