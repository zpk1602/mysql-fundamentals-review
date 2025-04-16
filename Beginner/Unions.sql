-- Unions
# Allows you to combine rows of data, from separate or the same table

SELECT age, gender
FROM employee_demographics
UNION	# By default, union takes DISTINCT (UNION DISTINCT)
SELECT first_name, last_name
FROM employee_salary
# While this "works", you really should SELECT the same things
;

SELECT first_name, last_name
FROM employee_demographics
UNION	# "UNION ALL" gives all results without removing duplicates
SELECT first_name, last_name
FROM employee_salary
;

# What if the park wants to identify older workers who they want to push out?
# What about high-paid employees who they can reduce pay/push out to save money?
SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;