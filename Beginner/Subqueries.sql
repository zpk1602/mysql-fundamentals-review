-- Subqueries

SELECT *
FROM employee_demographics	# Ron won't be in this, he's only in salary!
WHERE employee_id IN 
				(SELECT employee_id		# You can only select 1, the operand "IN" can only contain 1 column
					FROM employee_salary
                    WHERE dept_id = 1)
;

SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

# Now we can perform aggregations on the table
# We are now looking at the averages of the column "MAX(age)"
# If we didn't use aliasing, we'd have to do agg with AVG(`MAX(age)`), where we use backticks
SELECT gender, AVG(max_age), AVG(avg_age) 
FROM
(SELECT gender, 
AVG(age) AS avg_age, 
MAX(age) AS max_age, 
MIN(age) AS min_age, 
COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table	# "Like" a temp table, need to name or error. Better ways to do this, like a CTE or actual Temp Table
GROUP BY gender
;

SELECT *
FROM employee_demographics;
SELECT *
FROM employee_salary;