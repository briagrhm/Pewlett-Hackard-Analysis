--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
from employees;

--Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
from titles;
--Create a new table using the INTO clause.Join both tables on the primary key.
SELECT *FROM employees;
SELECT * FROM retirement_titles;
DROP TABLE retirement_titles; 

SELECT e.emp_no, e.first_name, e.last_name,t.title, t.from_date, t.to_date
into retirement_titles
from employees e
left join titles t on e.emp_no = t.emp_no

--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
--Then, order by the employee number.
SELECT e.emp_no, e.first_name, e.last_name,t.title, t.from_date, t.to_date
INTO retirement_titles
from employees e
left join titles t on e.emp_no = t.emp_no
WHERE(birth_date between'1952-01-01' AND '1955-12-31' )
order by e.emp_no;

--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
SELECT emp_no, first_name, last_name, title
from retirement_titles

--Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no) emp_no, 
first_name, 
last_name, 
title
INTO unique_titles
from retirement_titles
WHERE 1=1
--Exclude employees that have left
AND to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;
--Check Table
SELECT * FROM unique_titles

--Retrieve number of employees by most recent job title
SELECT title, COUNT(title)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;

--Check Table 
SELECT *FROM retiring_titles

--Membership Eligibility
SELECT DISTINCT ON (emp_no) e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date, 
d.from_date, 
d.to_date,
t.title
INTO mentorship_eligibilty
from employees e
left join dept_employees d on e.emp_no = d.emp_no
right join titles t on e. emp_no = t.emp_no
WHERE 1=1
AND (birth_date BETWEEN '1965-01-01'AND '1965-12-31')
AND d.to_date = '9999-01-01'
ORDER BY e.emp_no

