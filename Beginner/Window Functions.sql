-- Window Functions

# Similar to a GROUP BY

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

# Now let's use a window function
SELECT gender, AVG(salary) OVER()	# Looking at the avg salary OVER everything
FROM employee_demographics dem		# This avg salary is looking at the avg salary over EVERYBODY, the entire column
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# This is good if we want additional information
SELECT gender, AVG(salary) OVER(PARTITION BY gender)	# Separate it out kind of like GROUP BY... perform calculation based off gender
FROM employee_demographics dem		
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# If we tried adding these names with GROUP BY, it will be different...
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)	# Separate it out kind of like GROUP BY... perform calculation based off gender
FROM employee_demographics dem		
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# Rolling Total example, partitioned based off of gender
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem		
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# Special things you can really only do with Window Functions

# Row number is based off of everything, they won't repeat themselves
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics dem		
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

# Row numbers are partitioned by gender
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num,				# Rank, when encountering a duplicate, assigns the same number and skips (ex: 5, 5, 7)
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) dense_rank_num	# Dense Rank does not skip a number after encountering dupes (ex: 5, 5, 6)
FROM employee_demographics dem		
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;