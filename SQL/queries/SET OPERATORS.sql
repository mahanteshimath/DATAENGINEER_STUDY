use [AdventureWorks2012]

--Union 
--Union all 
--Intersect
--Except / Minus 

--Basic Rules on Set Operations

--The result sets of all the queries must be the same number of columns.

--In all result sets the data type of each of the columns must be well-matched 
--and compatible with the data type of its corresponding columns in another result set.

--For sorting the result, the ORDER BY clause can be applied to the last query.


CREATE TABLE Speakers
(
  Name VARCHAR(25),
)

CREATE TABLE Author
(
  Name VARCHAR(25),
)


INSERT INTO Speakers VALUES ('Sachin')
INSERT INTO Speakers VALUES ('Rahul')
INSERT INTO Speakers VALUES ('Kamplesh')
INSERT INTO Speakers VALUES ('Chirag')

INSERT INTO Author VALUES ('Sachin')
INSERT INTO Author VALUES ('Rahul')
INSERT INTO Author VALUES ('Pratik')
INSERT INTO Author VALUES ('Rajesh')
INSERT INTO Author VALUES ('Anil')


select * from Speakers
select * from Author

SPEAKERS TABLE === I HAVE NAME COLUMN -----VARCHAR(10)

AUTHOR TABLE ==== I HAVE SALARY COLUMN ----------INT, DECIMAL

SELECT NAME FROM Speakers
UNION
SELECT SALARY FROM Author


SELECT * FROM Speakers
UNION ALL
SELECT * FROM Author
ORDER BY Name


SELECT * FROM Speakers
INTERSECT
SELECT * FROM Author



SELECT * FROM Speakers
EXCEPT
SELECT * FROM Author

SELECT * FROM Author
EXCEPT
SELECT * FROM Speakers


43659
43660
43661
SELECT * FROM Sales.SalesOrderDetail----29


43659
43660

SELECT * FROM Sales.SalesOrderDetail_1510---14


SELECT * FROM Sales.SalesOrderDetail
UNION
SELECT * FROM Sales.SalesOrderDetail_1510


SELECT * FROM Sales.SalesOrderDetail----------10

UNION ALL
SELECT * FROM Sales.SalesOrderDetail_1510--------8


SELECT SalesOrderID,SalesOrderDetailID,CarrierTrackingNumber,OrderQty 
FROM Sales.SalesOrderDetail
UNION
SELECT SalesOrderID,SalesOrderDetailID,CarrierTrackingNumber 
FROM Sales.SalesOrderDetail_1510


SELECT * FROM Sales.SalesOrderDetail
EXCEPT
SELECT * FROM Sales.SalesOrderDetail_1510

Except / Minus

SELECT * FROM Sales.SalesOrderDetail_1510------------14
EXCEPT
SELECT * FROM Sales.SalesOrderDetail--------------29

