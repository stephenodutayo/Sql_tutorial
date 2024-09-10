SELECT 
    gender, 
    sum(salary) as salary_sum
FROM
    employee_demographics AS dem
JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id
GROUP BY  gender;


-- window function

SELECT 
    dem.first_name, 
    dem.last_name, 
    gender, 
    salary,
    sum(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) as rolling_total
FROM
    employee_demographics AS dem
JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id,
    dem.first_name, 
    dem.last_name, 
    gender, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) as row_num,
    RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as rank_num,
    DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as desc_rank
FROM
    employee_demographics AS dem
JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id;
   
    