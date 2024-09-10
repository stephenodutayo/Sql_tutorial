-- CTEs

SELECT gender, avg(salary), min(salary), max(salary),
count(age)
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;



WITH CTE_Example1 (gender, avg_sal, min_sal, max_sal, count_age) as
(
SELECT gender, avg(salary), min(salary), max(salary),
count(age)
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT avg(avg_sal)
FROM CTE_Example1;



SELECT avg(avg_sal)
FROM
(
SELECT gender, avg(salary) avg_sal, min(salary), max(salary),
count(age)
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) as subqueries1
;


WITH CTE_Example1 as
(
SELECT employee_id, first_name, gender , birth_date
FROM employee_demographics 
WHERE gender = 'male'
),
CTE_Example2 as
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary  > 50000
)
SELECT *
FROM CTE_Example1
JOIN CTE_Example2
	ON CTE_Example1.employee_id = CTE_Example2.employee_id
;


