-- Limit & Aliasing

SELECT *
FROM employee_demographics
ORDER BY age DESC
#LIMIT 3
LIMIT 2, 1
;

-- Aliasing

SELECT gender, AVG(age) AS avg_age	# the 'AS' is not needed
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;