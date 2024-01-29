--Subqueries
--Subqueries can be self-contained—namely, independent of the outer query; or 
--they can be correlated—namely, having a reference to a column from the table in the outer query.

--Self-Contained Subqueries
--Self-contained subqueries are subqueries that have no dependency on the outer query.-----------we can run it independently
--If you want, you can highlight the inner query and run it independently. This makes the
--troubleshooting of problems with self-contained subqueries easier compared to correlated
--subqueries.

--Types of Subqueries 

--Subqueries that return a single value, or scalar subqueries,

--Single valued subuery or scalar subquery

SELECT productid, productname, unitprice
FROM Production.Products

SELECT min(unitprice)
FROM Production.Products

--2.50

--1.50

--productid	productname	unitprice
--33	Product ASTMN	2.50

--productid	productname	unitprice
--33	Product ASTMN	2.50

SELECT * FROM Production.Products


INSERT INTO Production.Products VALUES (1033,'MOBILE',1,1,1.50,0)

SELECT productid, productname, unitprice
FROM Production.Products
where unitprice = (SELECT MIN(UNITPRICE) FROM Production.Products)

--productid	productname	unitprice
--1033	MOBILE	1.50

--2.50
SELECT productid, productname, unitprice
FROM Production.Products
WHERE unitprice =
(SELECT MIN(unitprice)
FROM Production.Products);

--Multi - valued subquery

--A subquery can also return multiple values in the form of a single column. Such a subquery
--can be used where a multi-valued result is expected—for example, when using the IN predicate.
--As an example, the following query uses a multi-valued subquery to return products
--supplied by suppliers from Japan.

SELECT P.productid,P.productname,P.unitprice,S.country 
FROM Production.Products P 
INNER JOIN Production.Suppliers S ON P.supplierid = S.supplierid
WHERE S.country ='JAPAN'

SELECT productid, productname, unitprice
FROM Production.Products
WHERE supplierid IN
(SELECT supplierid
FROM Production.Suppliers
WHERE country = N'Japan');

--Msg 512, Level 16, State 1, Line 1
--Subquery returned more than 1 value. 
--This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.


SELECT productid, productname, unitprice
FROM Production.Products
WHERE supplierid IN
(SELECT supplierid
FROM Production.Suppliers
WHERE country = N'Japan');


---------------------------------------------------------------------------------------------------------------------------------------
--Correlated Subqueries

--Correlated subqueries are subqueries where the inner query has a reference to a column from
--the table in the outer query. 
--They are trickier to work with compared to self-contained subqueries
--because you can’t just highlight the inner portion and run it independently.


SELECT categoryid, productid, productname, unitprice
FROM Production.Products AS P1
ORDER BY P1.categoryid,P1.unitprice



SELECT categoryid, productid, productname, unitprice AS MIN_PRICE_CATEGORY_WISE
FROM Production.Products AS P1
WHERE unitprice =
(SELECT MIN(unitprice)
FROM Production.Products AS P2
WHERE P2.categoryid = P1.categoryid);

--Msg 4104, Level 16, State 1, Line 3
--The multi-part identifier "P1.categoryid" could not be bound.


-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
SELECT custid, companyname
FROM Sales.Customers AS C
WHERE C.custid IN (66,5)

SELECT *
FROM Sales.Orders AS O WHERE orderdate = '20070212'


--66
--5

SELECT custid, companyname
FROM Sales.Customers AS C
WHERE EXISTS
(SELECT *
FROM Sales.Orders AS O
WHERE O.custid = C.custid
AND O.orderdate = '20070212');


-------------WHICH CUSTOMERS ARE NOT EXISTED ON TIS PARTICULAR DATE

SELECT custid, companyname
FROM Sales.Customers AS C
WHERE NOT EXISTS
(SELECT *
FROM Sales.Orders AS O
WHERE O.custid = C.custid
AND O.orderdate = '20070212');

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------USE OF DERIVED TABLE CONCEPT
-------------------------------------------------------------------------------------------------------------------------------------
--Consider the following query, which computes row numbers for products, partitioned by
--categoryid, and ordered by unitprice and productid.



SELECT
ROW_NUMBER() OVER(PARTITION BY categoryid
ORDER BY unitprice, productid) AS rownum,
categoryid, productid, productname, unitprice
FROM Production.Products;


SELECT categoryid, productid, productname, unitprice,rownum
FROM (SELECT
ROW_NUMBER() OVER(PARTITION BY categoryid
ORDER BY unitprice, productid) AS rownum,
categoryid, productid, productname, unitprice
FROM Production.Products) AS D
WHERE rownum = 2;

-------------------------------------------------------------------------------------------------------------------------------------
------------------------COMMON TABLE EXPRESSIONS
-------------------------------------------------------------------------------------------------------------------------------------
--CTEs
--A common table expression (CTE) is a similar concept to a derived table in the sense that it’s
--a named table expression that is visible only to the statement that defines it. Like a query
--against a derived table, a query against a CTE involves three main parts:


--   The inner query
--   The name you assign to the query and its columns
--   The outer query


WITH C AS
(
SELECT
ROW_NUMBER() OVER(PARTITION BY categoryid
ORDER BY unitprice, productid) AS rownum,
categoryid, productid, productname, unitprice
FROM Production.Products
)
SELECT categoryid, productid, productname, unitprice
FROM C
WHERE rownum <= 2;

SELECT * FROM C  


-------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------Recursive CTEs.
-------------------------------------------------------------------------------------------------------------------------------------
SELECT empid, mgrid, firstname, lastname, 0 AS distance
FROM HR.Employees

CTEs also have a recursive form. The body of the recursive query has two or more queries,
usually separated by a UNION ALL operator. At least one of the queries in the CTE body,
known as the anchor member

The anchor
query is invoked only once. In addition, at least one of the queries in the CTE body, known as
the recursive member, has a reference to the CTE name.

This query is invoked repeatedly until
it returns an empty result set.




WITH EmpsCTE AS
(
SELECT empid, mgrid, firstname, lastname, 0 AS distance
FROM HR.Employees
WHERE empid = 9

UNION ALL
SELECT M.empid, M.mgrid, M.firstname, M.lastname, S.distance + 1 AS distance
FROM EmpsCTE AS S
JOIN HR.Employees AS M
ON S.mgrid = M.empid
)
SELECT empid, mgrid, firstname, lastname, distance
FROM EmpsCTE;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------





