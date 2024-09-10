SELECT first_name
FROM employee_demographics
UNION
SELECT last_name
FROM employee_demographics;

SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary
ORDER BY first_name, last_name;


SELECT first_name, last_name, 'old man' as label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION 
SELECT first_name, last_name, 'old woman' as label
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION
SELECT first_name, last_name, 'highly paid' as label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;
