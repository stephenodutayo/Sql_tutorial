SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE gender != 'male'
OR birth_date > '1985-01-01';

SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE first_name LIKE 'a___%'
OR birth_date LIKE '1980';

SELECT *
FROM Parks_and_Recreation.employee_salary
WHERE salary >= 70000;


SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE (first_name = 'leslie' AND age = 44) OR age > 55;