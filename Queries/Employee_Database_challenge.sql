--Retrieve the emp_no, first_name, and last_name columns 
--from the Employees table
--Retrieve the title, from_date, and to_date columns 
--from the Titles table
--Create a new table using the INTO clause
--Join both tables on the primary key
--Filter the data on the birth_date
--order by the employee number
--Export the Retirement Titles table
-- Use Dictinct with Orderby to remove duplicate rows

SELECT * FROM employees;
SELECT * FROM titles;
DROP TABLE retirement_titles;

SELECT e.emp_no, 
e.first_name, 
e.last_name,
ti.title, 
ti.from_date, 
ti.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS ti
ON (ti.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT count(title) FROM retirement_titles;
SELECT * FROM retirement_titles;

------------------
--to remove these duplicates
--keep only the most recent title of each employee.
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;
SELECT count(emp_no) FROM unique_titles;

------------------
--retrieve the number of employees 
--by their most recent job title who are about to retire
SELECT COUNT (DISTINCT(title))
FROM unique_titles;
SELECT DISTINCT (title) title
FROM unique_titles;

DROP Table if exists retiring_titles
SELECT COUNT(emp_no) AS Retiring_no, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM retiring_titles;
SELECT sum(count) FROM retiring_titles;

---------------------------
--Deliverable 2_Employees eligible for the Mentorship Program
--create a mentorship-eligibility table 
--holds the current employees  
--who were born between January 1, 1965 and December 31, 1965.

SELECT DISTINCT ON(e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibilty
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no) 
JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

SELECT * FROM mentorship_eligibilty;
------------------------------
SELECT me.title, count(me.emp_no) AS Mentor_Count
--INTO mentor_count
FROM mentorship_eligibilty AS me
GROUP BY me.title
ORDER BY mentor_count DESC;
--
SELECT * FROM retiring_titles;
SELECT * FROM mentor_count;

SELECT rt.title, rt.retiring_no, mc.mentor_count 
FROM mentor_count AS mc
RIGHT JOIN retiring_titles AS rt
ON (rt.title = mc.title);

----
SELECT DISTINCT ON(me.title) me.title, count(me.emp_no) AS Mentor_Count, 
	(rt.retiring_no) AS Retiring_Count
FROM mentorship_eligibilty AS me
JOIN retiring_titles AS rt
ON (me.title = rt.title)
GROUP BY me.title, rt.retiring_no;
--
SELECT mc.title AS Titles, mc.mentor_count AS Mentors, 
	(rt.retiring_no) AS Retirees
FROM mentor_count AS mc
JOIN retiring_titles AS rt
ON (mc.title = rt.title)
GROUP BY mc.title, mc.mentor_count, rt.retiring_no;
--


--
