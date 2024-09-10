SELECT *
FROM employee_salary
WHERE salary >= 50000;

DROP PROCEDURE IF EXISTS high_salaries;
CREATE PROCEDURE high_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL high_salaries();

DROP PROCEDURE IF EXISTS high_salaries2
DELIMITER $$
CREATE PROCEDURE high_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL high_salaries2();



DROP PROCEDURE IF EXISTS salaries
DELIMITER $$
CREATE PROCEDURE salaries(p_employee_id INT)
BEGIN
	SELECT *
	FROM employee_salary
	WHERE employee_id = p_employee_id;
END $$
DELIMITER ;

CALL salaries(3);