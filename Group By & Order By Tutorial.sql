-- Group By

SELECT *
FROM employee_demographics;


SELECT gender, ROUND(AVG(age), 1), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- ORDER BY
SELECT *
FROM employee_demographics
#ORDER BY gender, age
ORDER BY 5, 4	# Same thing as above, NOT RECOMMENDED
;