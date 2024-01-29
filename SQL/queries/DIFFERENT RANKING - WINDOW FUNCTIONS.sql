use [AdventureWorks2012]

---------------Ranking Functions 

--Rank 
--Dense Rank 
--Row Number 
--NTILE

DROP TABLE cars

CREATE TABLE Cars
(
id INT,
name VARCHAR(50) NOT NULL,
company VARCHAR(50) NOT NULL,
power INT NOT NULL
)



INSERT INTO Cars
VALUES
(1, 'Corrolla', 'Toyota', 1800),
(2, 'City', 'Honda', 1500),
(3, 'C200', 'Mercedez', 2000),
(4, 'Vitz', 'Toyota', 1300),
(5, 'Baleno', 'Suzuki', 1500),
(6, 'C500', 'Mercedez', 5000),
(7, '800', 'BMW', 8000),
(8, 'Mustang', 'Ford', 5000),
(9, '208', 'Peugeot', 5400),
(10, 'Prius', 'Toyota', 3200),
(11, 'Atlas', 'Volkswagen', 5000),
(12, '110', 'Bugatti', 8000),
(13, 'Landcruiser', 'Toyota', 3000),
(14, 'Civic', 'Honda', 1800),
(15, 'Accord', 'Honda', 2000)

Select * from cars 


--RANK Function
--The RANK function is used to retrieve ranked rows based on the condition of the ORDER BY clause. 
--For example, if you want to find the name of the car with third highest power, you can use RANK Function.


SELECT name,company, power,
DENSE_RANK() OVER(ORDER BY power DESC) AS PowerRank
FROM Cars


---With partition by clause 

SELECT name,company, power,
RANK() OVER(PARTITION BY company ORDER BY power DESC) AS PowerRank
FROM Cars
order by company



--DENSE_RANK Function
--The DENSE_RANK function is similar to RANK function however the DENSE_RANK function does not skip any ranks 
--if there is a tie between the ranks of the preceding records.

SELECT name,company, power,
RANK() OVER(PARTITION BY company ORDER BY power DESC) AS PowerRank,
DENSE_RANK() OVER(PARTITION BY company ORDER BY power DESC) AS PowerRank1,
ROW_NUMBER() OVER(PARTITION BY company ORDER BY power DESC) AS PowerRank2
FROM Cars

--UPDATE CARS SET POWER =3200 
--WHERE NAME ='Landcruiser' AND COMPANY ='Toyota'


--ROW_NUMBER Function
--Unlike the RANK and DENSE_RANK functions, the ROW_NUMBER function simply returns the row number of the sorted records starting with 1. 
--For example, if RANK and DENSE_RANK functions of the first two records in the ORDER BY column are equal, both of them are assigned 1 as their RANK and DENSE_RANK. However, the ROW_NUMBER function will assign values 1 and 2 to those rows without taking the fact that they are equally into account.


SELECT name,company, power,
ROW_NUMBER() OVER(PARTITION BY DEPART_ID ORDER BY power DESC) AS RowRank
FROM Cars

-------------With partition by clause

SELECT name, company, power,
ROW_NUMBER() OVER(PARTITION BY company ORDER BY power DESC) AS RowRank
FROM Cars


--Similarities between RANK, DENSE_RANK, and ROW_NUMBER Functions

--The RANK, DENSE_RANK and ROW_NUMBER Functions have the following similarities:
--1- All of them require an order by clause.
--2- All of them return an increasing integer with a base value of 1.
--3- When combined with a PARTITION BY clause, all of these functions reset the returned integer value to 1 as we have seen.
--4- If there are no duplicated values in the column used by the ORDER BY clause, these functions return the same output.


