--(Deliverable #1)--The Number of Retiring Employees by Title-------------
SELECT employees.emp_no,
	employees.first_name, 
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees 
INNER JOIN titles
ON employees.emp_no = titles.emp_no 
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
		first_name,
		last_name,
		title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- Table count of employees about to retire
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

--(Deliverable #2)--The Employees Eligible for the Mentorship Program-----
SELECT DISTINCT ON (emp_no)
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.birth_date,
	dept_employees.from_date,
	dept_employees.to_date,
	titles.title
INTO mentorship_eligibilty
FROM employees
	INNER JOIN dept_employees
		ON employees.emp_no = dept_employees.emp_no
	INNER JOIN titles
		ON employees.emp_no = titles.emp_no 
WHERE dept_employees.to_date = ('9999-01-01')
	AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;

SELECT * FROM mentorship_eligibilty;