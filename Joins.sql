-- Joins

SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_salary
;

SELECT *
FROM employee_demographics
JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
# By default, 'JOIN' is the same as 'INNER JOIN'
# This join doesn't include Ron, since his employee_id isn't in both tables
;

SELECT *
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
# By default, 'JOIN' is the same as 'INNER JOIN'
# This join doesn't include Ron, since his employee_id isn't in both tables
# Aliasing to make easier to read
;

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Outer Joins
# Take everything from left table, even if no match in join,
# and only return matches from right table (opposite true
# for RIGHT JOIN)...
# As a reminder, the FROM is the left table, JOIN is right.
# Populates with NULLs if no match in join

SELECT *
FROM employee_demographics AS dem
OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Self Join

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- Joining multiple tables together

SELECT *
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_departments		# Reference table... doesn't change much, unlike salary or demographics
;