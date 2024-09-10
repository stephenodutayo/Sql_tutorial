SELECT first_name,
last_name,
age,
CASE 
	WHEN age <= 30 THEN 'young'
    WHEN age BETWEEN 31 AND 50 THEN 'old'
    WHEN age >= 50 THEN 'goodbye'
END as age_bracket
FROM employee_demographics
ORDER BY age;


-- < 50000 = 5% increase
-- > 50000 = 7% increase
-- finance dept = 10% bonus


SELECT first_name,
last_name,
salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END as new_salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.1
END as bonus
FROM employee_salary;

SELECT *
FROM employee_salary as sal
JOIN parks_departments as pdp
	ON sal.dept_id = pdp.department_id;