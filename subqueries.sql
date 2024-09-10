-- subqueries

SELECT dem_table.employee_id, 
dem_table.first_name, 
dem_table.last_name,
department_name
FROM employee_demographics as dem_table
INNER JOIN employee_salary as sal_table
	ON dem_table.employee_id = sal_table.employee_id
INNER JOIN parks_departments as pdp_table
	ON sal_table.dept_id = pdp_table.department_id
WHERE department_id = 1;


SELECT *
FROM employee_demographics
WHERE employee_id IN 
	(SELECT employee_id
	FROM employee_salary
	WHERE dept_id = 1);


SELECT 
first_name,
salary,
    (SELECT AVG(salary)     
     FROM employee_salary)      
FROM
    employee_salary
GROUP BY first_name , salary;


-- window funvtion
SELECT 
    first_name,
    salary,
    avg(salary) OVER()   
FROM
	employee_salary;