SELECT length('stephen');

SELECT first_name, length(first_name)
FROM employee_demographics
ORDER BY 2;

SELECT first_name, 
lower(first_name),
upper(first_name)
FROM employee_demographics
ORDER BY 2;

-- trim removes whitespaces
SELECT trim('   skyfall   ');

SELECT substring('stephen', 4, 3);

SELECT first_name, 
left(first_name, 4),
right(first_name, 4),
substring(first_name, 3, 2),
birth_date,
substring(birth_date, 6, 2) as birth_month
FROM employee_demographics;

SELECT first_name,
replace(first_name,'r', 'w'),
locate('a',first_name)
FROM employee_demographics;

SELECT locate('e', 'stephen');

SELECT first_name, last_name,
concat(first_name,' ', last_name) full_name
FROM employee_demographics
