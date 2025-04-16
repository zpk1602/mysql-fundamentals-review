-- String Functions

SELECT LENGTH('skyfall');

SELECT first_name, UPPER(first_name)
FROM employee_demographics
ORDER BY 2	# Remember, order by COLUMN 2
;

SELECT UPPER('sky');	# All uppercase
SELECT LOWER('SKY');	# All lowercase

SELECT TRIM('          sky           ');	# Gets rid of leading and trailing white spaces
SELECT LTRIM('         sky           ');	# Only removes leading spaces
SELECT RTRIM('         sky           ');	# Only removes trailing spaces

SELECT first_name, 
LEFT(first_name, 4),		# How many characters from the lefthand side do we want to select
RIGHT(first_name, 4),		# How many characters from the righthand side do we want to select
SUBSTRING(first_name,3,2),	# For first_name, Start at 3rd position, take 2 characters (inclusive)
birth_date,
SUBSTRING(birth_date,6,2) AS birth_month
FROM employee_demographics
;

-- Replace

SELECT first_name, REPLACE(first_name, 'a','z')
FROM employee_demographics
;

SELECT LOCATE('x','Alexander');		# Tells us what position the sequence is

SELECT first_name, LOCATE('An', first_name)		# Gives us 0's or 1's based on if the name has it
FROM employee_demographics
;

SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) AS full_name	# Combine these columns into one single column
FROM employee_demographics
;