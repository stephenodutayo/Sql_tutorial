SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- inner join & join are the same

SELECT *
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.employee_id, age, birth_date,salary, occupation
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id;
    
    
SELECT *
FROM employee_demographics as dem
RIGHT JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id;
    
SELECT *
FROM employee_demographics as dem1
JOIN employee_demographics as dem2
	ON dem1.employee_id = dem2.employee_id;
    
SELECT *
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments as pd
	ON sal.dept_id = pd.department_id;