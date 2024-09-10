-- limit and aliasing
SELECT *
FROM Parks_and_Recreation.employee_demographics
ORDER BY birth_date
LIMIT 5;

SELECT *
FROM Parks_and_Recreation.employee_demographics;

SELECT gender, AVG(age) as avg_age
FROM employee_demographics
GROUP BY gender;


SELECT gender, AVG(age) as avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 30;

-- group by and having
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;


SELECT *
FROM Parks_and_Recreation.employee_salary;

SELECT occupation, salary
FROM Parks_and_Recreation.employee_salary
GROUP BY occupation, salary;

-- order by
SELECT *
FROM Parks_and_Recreation.employee_demographics
ORDER BY first_name;

SELECT *
FROM Parks_and_Recreation.employee_demographics
ORDER BY 5, 4;