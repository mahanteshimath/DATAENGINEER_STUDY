--Subqueries

--Subqueries can be self-contained—namely, independent of the outer query; or they can be
--correlated—namely, having a reference to a column from the table in the outer query.

--In terms of the result of the subquery, it can be scalar, multi-valued, or table-valued.


--Self-Contained Subqueries
--Self-contained subqueries are subqueries that have no dependency on the outer query.
--If you want, you can highlight the inner query and run it independently. This makes the
--troubleshooting of problems with self-contained subqueries easier compared to correlated
--subqueries.

--Types of Subqueries 

-------------------------------------------------------------------
Self contained subquery -----------------we can independently execute the inner query without any error
-------------------------------------------------------------------
Scalar subquery --------which returns only single row or we can say that single value 
Multi valued subquery   -------
Table valued subquery 


Correlated subquery 


--INSERT INTO Production.Products
--VALUES (103333,'MOB',1,1,1.50,0)


SELECT MIN(unitprice)
FROM Production.Products

SELECT * FROM PRODUCTION.Products
WHERE unitprice = 
(
SELECT MIN(unitprice)
FROM Production.Products
---1.50
)

-----Single valued sub query example with = operator

SELECT productid, productname, unitprice
FROM Production.Products
WHERE unitprice =
(SELECT MIN(unitprice)
FROM Production.Products);


------Multi - valued Subquery

SELECT TOP 10 productid, productname, unitprice,supplierid
FROM Production.Products

SELECT TOP 10 supplierid,*
FROM Production.Suppliers

SELECT productid,productname,unitprice 
FROM PRODUCTION.Products P 
INNER JOIN PRODUCTION.Suppliers S ON P.supplierid = S.supplierid
WHERE S.country ='Japan'



SELECT productid,productname,unitprice 
FROM PRODUCTION.Products
where supplierid IN
(
SELECT supplierid FROM PRODUCTION.Suppliers
WHERE country ='Japan'
)


SELECT productid, productname, unitprice
FROM Production.Products
WHERE supplierid IN
(SELECT supplierid
FROM Production.Suppliers
WHERE country != N'Japan');

SELECT productid, productname, unitprice,supplierid
FROM Production.Products
WHERE exists
(SELECT supplierid
FROM Production.Suppliers
WHERE country = N'Japan');




--Correlated Subqueries

--Correlated subqueries are subqueries where the inner query has a reference to a column from
--the table in the outer query. 

--They are trickier to work with compared to self-contained subqueries

--because you can’t just highlight the inner portion and run it independently.
--As an example, suppose that you need to return products with the minimum unit price
--per category. You can use a correlated subquery to return the minimum unit price out of
--the products where the category ID is equal to the one in the outer row (the correlation), as
--follows.

SELECT p1.categoryid, productid, productname, unitprice
FROM Production.Products AS P1

SELECT MIN(unitprice) as minunit
FROM Production.Products AS P2


SELECT p1.categoryid, productid, productname, unitprice
FROM Production.Products AS P1
WHERE unitprice =
(SELECT MIN(unitprice) as minunit
FROM Production.Products AS P2
WHERE P2.categoryid = P1.categoryid) ;


--As another example of a correlated subquery, the following query returns customers who
--placed orders on February 12, 2007.

SELECT custid, companyname
FROM Sales.Customers AS C
where C.custid =25

SELECT *
FROM Sales.Orders AS O
where O.custid =25
and orderdate = '20070212'


SELECT custid, companyname
FROM Sales.Customers AS C
WHERE not EXISTS
(SELECT *
FROM Sales.Orders AS O
WHERE O.custid = C.custid
AND O.orderdate = '20070212');


SELECT *
FROM Sales.Orders AS O
WHERE O.custid = C.custid
AND O.orderdate = '20070212'



