--RANK() gives you the ranking within your ordered partition. Ties are assigned the same rank, with the next ranking(s) skipped. 
--So, if you have 3 items at rank 2, the next rank listed would be ranked 5.

--DENSE_RANK() again gives you the ranking within your ordered partition, 
--but the ranks are consecutive. No ranks are skipped if there are ranks with multiple items.


CREATE TABLE student (
    student_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    fees_paid INT,
    gender VARCHAR(1)
);


/*
Insert (for all vendors)
*/


--INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
--VALUES (1, 'John', 'Smith', 200, 'M');
--INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
--VALUES (2, 'Susan', 'Johnson', 500, 'F');
--INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
--VALUES (3, 'Tom', 'Capper', 350, 'M');
--INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
--VALUES (4, 'Mark', 'Holloway', 100, 'M');
--INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
--VALUES (5, 'Steven', 'Webber', 0, 'M');
--INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
--VALUES (6, 'Julie', 'Armstrong', 150, 'F');
--INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
--VALUES (7, 'Michelle', 'Randall', 150, 'F');
--INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
--VALUES (8, 'Andrew', 'Cooper', 800, 'M');
--INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
--VALUES (9, 'Robert', 'Pickering', 900, 'M');
--INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
--VALUES (10, 'Tanya', 'Hall', 50, 'F');

SELECT * FROM student


SELECT *
FROM student
ORDER BY fees_paid;


--This example partitions (groups) the data by gender, and then ranks the values according to fees_paid.

SELECT
student_id,
first_name,
last_name,
gender,
fees_paid,
RANK() OVER (
  PARTITION BY gender
  ORDER BY fees_paid
) AS rank_val
FROM student;

SELECT
student_id,
first_name,
last_name,
gender,
fees_paid,
DENSE_RANK() OVER (
  PARTITION BY gender
  ORDER BY last_name, first_name
) AS rank_val
FROM student;


-------------------------------------------------------------------------------------------------------------

SELECT
student_id,
first_name,
last_name,
gender,
fees_paid,
RANK() OVER (
  PARTITION BY fees_paid
  ORDER BY last_name, first_name
) AS rank_val
FROM student;


SELECT
student_id,
first_name,
last_name,
gender,
fees_paid,
DENSE_RANK() OVER (
  PARTITION BY fees_paid
  ORDER BY last_name, first_name
) AS rank_val
FROM student;

---------------------------------------------------------------------------------------------------------------------------------------

SELECT
student_id,
first_name,
last_name,
gender,
fees_paid,
RANK() OVER (
  ORDER BY fees_paid
) AS rank_val,
DENSE_RANK() OVER (
  ORDER BY fees_paid
) AS DENSE_rank_val
FROM student;

---------------------------------------------------------------------------------------------------------------------------------------

SELECT
student_id,
first_name,
last_name,
gender,
fees_paid,
RANK() OVER (
  PARTITION BY gender
  ORDER BY fees_paid
) AS rank_val,
DENSE_RANK() OVER (
  PARTITION BY gender
  ORDER BY fees_paid
) AS dense_rank_val
FROM student;

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

