--Built- in SQL Functions

Strings 
Date
Mathematical 

--Aggregate - SUM, AVG, MAX, MIN, COUNT

USE [AdventureWorks2012]

Create Table StuResult
(
StudentID  varchar(5),
Subject varchar(15),
Marks  INT
)

Insert into STuresult values ('A1202','Data Analytics',50);

Insert into STuresult values ('A1202','Robotics',34);

Insert into STuresult values ('A1202','Data Structures',23);

Insert into STuresult values ('A1202','Web programing',90);

Insert into STuresult values ('A1202','IOT',45);

Insert into STuresult values ('A1202','Prac DBMS',56);

Insert into STuresult values ('A1202','Prac Web prog',null);

SELECT * FROM StuResult

SELECT SUM(MARKS) FROM StuResult
298

SELECT AVG(MARKS) FROM StuResult
49...


SELECT MAX(MARKS) FROM StuResult
90

SELECT MIN(MARKS) FROM StuResult
23

SELECT COUNT(MARKS) FROM StuResult--------------COUNT(COLUMN_NAME) ELIMINATES NULL VALUES
6

SELECT COUNT(1) FROM StuResult
7

SELECT COUNT(*) FROM StuResult

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------




