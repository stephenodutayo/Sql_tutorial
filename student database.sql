DROP TABLE IF EXISTS student;
CREATE TABLE student (
	student_id INT AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    major VARCHAR(20) DEFAULT 'undecided',
    PRIMARY KEY (student_id)
);

ALTER TABLE student
ADD age INT NOT NULL;


SELECT * 
FROM student;

INSERT INTO student(first_name, last_name, major)
VALUES('William', 'Jack', 'economics'),
('Samantha', 'Paul', 'biology'),
('Abigail', 'Cook', 'mathematics'),
('Daniel', 'Cleaveland', 'chemistry'),
('Paul', 'Quest', 'biology')
;








