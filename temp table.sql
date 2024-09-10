-- temp table

CREATE TEMPORARY TABLE fav_movie(
first_name VARCHAR(20) NOT NULL,
gender VARCHAR(10) NOT NULL,
movie VARCHAR(50) NOT NULL
);

DESCRIBE fav_movie;

INSERT INTO fav_movie VALUE
('Stephen', 'male', 'Dune');


SELECT *
FROM fav_movie;

DROP TEMPORARY TABLE  high_salary_staff;
CREATE TEMPORARY TABLE high_salary_staff
SELECT first_name, salary, department_name
FROM employee_salary
JOIN parks_departments
	ON dept_id = department_id
WHERE salary >= 50000
ORDER BY first_name;


SELECT *
FROM high_salary_staff;



