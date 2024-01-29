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

SELECT
[OrderQty],
  LAG([OrderQty]) OVER(ORDER BY[OrderQty] DESC) AS[Lag "OrderQty"
    Column]
FROM[Sales].[SalesOrderDetail]
ORDER BY[OrderQty] DESC

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

--It is also possible to LEAD or LAG by a specific number of rows. What this means is that, with the LEAD function, for example, 
--I can specify to start bringing forward values starting from after the next N rows. Let’s look at another example.

SELECT
[OrderQty],
  LAG([OrderQty], 2) OVER(ORDER BY[OrderQty] DESC)[Lead "OrderQty"
    Column]
FROM[Sales].[SalesOrderDetail]
ORDER BY[OrderQty] DESC

---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------HOW TO FIND DUPLICATE DATA IN A TABLE AND REMOVE IT
---------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE DETAILS (
    SN INT IDENTITY(1,1) PRIMARY KEY,
    EMPNAME VARCHAR(25) NOT NULL,
    DEPT VARCHAR(20) NOT NULL,
    CONTACTNO BIGINT NOT NULL,
    CITY VARCHAR(15) NOT NULL
);

-------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DETAILS (EMPNAME, DEPT, CONTACTNO, CITY)
VALUES 
    ('VISHAL', 'SALES', 9193458625, 'GAZIABAD'),
    ('VIPIN', 'MANAGER', 7352158944, 'BAREILLY'),
    ('ROHIT', 'IT', 7830246946, 'KANPUR'),
    ('RAHUL', 'MARKETING', 9635688441, 'MEERUT'),
    ('SANJAY', 'SALES', 9149335694, 'MORADABAD'),
    ('VIPIN', 'MANAGER', 7352158944, 'BAREILLY'),
    ('VISHAL', 'SALES', 9193458625, 'GAZIABAD'),
    ('AMAN', 'IT', 78359941265, 'RAMPUR');

-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
--SELECT * FROM DETAILS
--ORDER BY EMPNAME

--DERVIED TABLE ---WHY DERIVED TABLE == BCZ WHEN WE WRITE THE SUBQUERY INSIDE THE FROM CLAUSE OF THE SELECT STATEMENT 
--THAN IT IS KNOWN AS DERIVED TABLE--------------IN THE ORACLE THIS ONE IS KNOWN AS INLINE VIEW

SELECT 
EMPNAME,DEPT,CONTACTNO,CITY,
ROW_NUMBER() OVER(PARTITION BY EMPNAME,DEPT,CONTACTNO,CITY ORDER BY SN) AS ROWNUM
FROM DETAILS

--INSERT INTO DETAILS VALUES('VIPIN','MANAGER',7352158944,'BAREILLY')
--INSERT INTO DETAILS VALUES('VISHAL','SALES',9193458625,'GAZIABAD')


SELECT * FROM 
(
SELECT 
EMPNAME,DEPT,CONTACTNO,CITY,
ROW_NUMBER() OVER(PARTITION BY EMPNAME,DEPT,CONTACTNO,CITY ORDER BY SN) AS ROWNUM
FROM DETAILS
) T 
WHERE T.ROWNUM =2

--(2 row(s) affected)



WHERE ROW_NUMBER() OVER(PARTITION BY EMPNAME,DEPT,CONTACTNO,CITY ORDER BY SN) =2







--Msg 4108, Level 15, State 1, Line 5
--Windowed functions can only appear in the SELECT or ORDER BY clauses.

SELECT * FROM (
SELECT 
EMPNAME,DEPT,CONTACTNO,CITY,
ROW_NUMBER() OVER(PARTITION BY EMPNAME,DEPT,CONTACTNO,CITY ORDER BY SN) AS RK
FROM DETAILS
) AS T
WHERE RK = 2

-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM DETAILS


;WITH CTE 
AS 
(
SELECT 
EMPNAME,DEPT,CONTACTNO,CITY,
ROW_NUMBER() OVER(PARTITION BY EMPNAME,DEPT,CONTACTNO,CITY ORDER BY SN) AS RK
FROM DETAILS
) 
DELETE FROM CTE 
WHERE RK = 2

--(2 row(s) affected)

-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------







