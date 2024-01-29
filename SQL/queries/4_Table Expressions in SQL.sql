--Derived Tables :
--Common table Expressions 
--Multiple CTEs :
--Recursive CTE :  
--Views and Inline table valued Functions :

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
------Derived Tables

--A derived table is probably the form of table expression that most closely resembles a
--subquery—only a subquery that returns an entire table result. 

--You define the derived
--table’s inner query in parentheses in the FROM clause of the outer query, and specify the
--name of the derived table after the parentheses.

--select * from  
--(
--select * from table 
--) t 



--Consider the following query, which computes row numbers for products, partitioned by
--categoryid, and ordered by unitprice and productid.

--The thing with the ROW_NUMBER function—and window functions in general—is that
--they are only allowed in the SELECT and ORDER BY clauses of a query. 

-----will below query work ?

--sql server by default order is asc 



SELECT
ROW_NUMBER() OVER(PARTITION BY categoryid
ORDER BY unitprice, productid) AS rownum,
categoryid, productid, productname, unitprice
FROM Production.Products
--where 
--ROW_NUMBER() OVER(PARTITION BY categoryid
--ORDER BY unitprice, productid)
--rownum


--order by 
--ROW_NUMBER() OVER(PARTITION BY categoryid
--ORDER BY unitprice, productid)


-----will below query work ?

--SELECT
--ROW_NUMBER() OVER(PARTITION BY categoryid
--ORDER BY unitprice, productid) AS rownum,
--categoryid, productid, productname, unitprice
--FROM Production.Products
--order by 
--ROW_NUMBER() OVER(PARTITION BY categoryid
--ORDER BY unitprice, productid)

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

--The thing with the ROW_NUMBER function—and window functions in general—is that
--they are only allowed in the SELECT and ORDER BY clauses of a query. 

--So, what if you want to
--filter rows based on such a function’s result? For example, suppose you want to return only
--the rows where the row number is less than or equal to 2; namely, in each category, you want
--to return the two products with the lowest unit prices, with the product ID used as a tiebreaker.
--You are not allowed to refer to the ROW_NUMBER function in the query’s WHERE clause.

--In - short , derived table is known as select statement written inside the from clause of the select query 
--and in oracle it is known as inline view.

SELECT
ROW_NUMBER() OVER(PARTITION BY categoryid
ORDER BY unitprice, productid) AS rownum,
categoryid, productid, productname, unitprice
FROM Production.Products

-------------------Derived table/Inline view--------------------ORACLE

SELECT categoryid, productid, productname, unitprice,rownum
FROM (
SELECT
ROW_NUMBER() OVER(PARTITION BY categoryid
ORDER BY unitprice, productid) AS rownum,
categoryid, productid, productname, unitprice
FROM Production.Products
)  AS D------------dervied table
WHERE rownum <= 2;

----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--Common table Expressions 

--Views and Inline table valued Functions :
--Inline Table - valued Functions :   
--Recursive CTE :  
--Multiple CTEs :


--A common table expression (CTE) is a similar concept to a derived table in the sense that it’s
--a named table expression that is visible only to the statement that defines it. Like a query
--against a derived table, a query against a CTE involves three main parts:
--Key
--Terms

-- The inner query
-- The name you assign to the query and its columns
-- The outer query


--However, with CTEs, the arrangement of the three parts is different. Recall that with derived
--tables the inner query appears in the FROM clause of the outer query—kind of in the
--middle of things. With CTEs, you first name the CTE, then specify the inner query, and then
--the outer query—a much more modular approach.
--WITH <CTE_name>
--AS
--(
--<inner_query>
--)
--<outer_query>;

----Dervied table

-----Common table expression


--SELECT
--ROW_NUMBER() OVER(PARTITION BY categoryid
--ORDER BY unitprice, productid) AS rownum,
--categoryid, productid, productname, unitprice
--FROM Production.Products
--where 
--ROW_NUMBER() OVER(PARTITION BY categoryid
--ORDER BY unitprice, productid)=2



WITH PRODUCT AS
(
SELECT
RANK() OVER(PARTITION BY categoryid
ORDER BY unitprice, productid) AS rownum,
categoryid, productid, productname, unitprice
FROM Production.Products
--where rownum <=3
--where ROW_NUMBER() OVER(PARTITION BY categoryid
--ORDER BY unitprice, productid) =2
)
SELECT categoryid, productid, productname, unitprice
FROM PRODUCT
WHERE rownum <= 2;


--Views and Inline table valued Functions :
--Inline Table - valued Functions :   
--Recursive CTE :  
--Multiple CTEs :

--You don’t nest CTEs like you do derived tables. If you need to define multiple CTEs, you
--simply separate them by commas. Each can refer to the previously defined CTEs, and the
--outer query can refer to all of them. After the outer query terminates, all CTEs defined in that
--WITH statement are gone. The fact that you don’t nest CTEs makes it easier to follow the logic
--and therefore reduces the chances for errors. For example, if you want to refer to one CTE
--from another, you can use the following general form.

--WITH C1 AS
--(
--SELECT ...
--FROM T1
--WHERE ...
--),
--C2 AS
--(
--SELECT
--FROM C1
--WHERE ...
--)
--SELECT ...C1
--FROM C2
--WHERE ...;*


--Views and Inline table valued Functions :
--Inline Table - valued Functions :   
--Recursive CTE :  

--CTEs also have a recursive form. The body of the recursive query has two or more queries,
--usually separated by a UNION ALL operator. At least one of the queries in the CTE body,
--known as the anchor member, is a query that returns a valid relational result. The anchor
--query is invoked only once. 

--In addition, at least one of the queries in the CTE body, known as
--the recursive member, has a reference to the CTE name. This query is invoked repeatedly until
--it returns an empty result set. In each iteration, the reference to the CTE name from the recursive
--member represents the previous result set. Then the reference to the CTE name from
--the outer query represents the unified results of the invocation of the anchor member and all
--invocations of the recursive member.

--As an example, the following code uses a recursive CTE to return the management chain
--leading all the way up to the CEO for a specified employee.

SELECT * FROM HR.Employees;

;WITH EmpsCTE AS
(
SELECT empid, mgrid, firstname, lastname, 0 AS distance
FROM HR.Employees
WHERE empid = 9--------Anchor Member
UNION ALL
SELECT M.empid, M.mgrid, M.firstname, M.lastname, S.distance + 1 AS distance
FROM EmpsCTE AS S
JOIN HR.Employees AS M
ON S.mgrid = M.empid

)
SELECT empid, mgrid, firstname, lastname, distance
FROM EmpsCTE;

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
--Views and Inline table valued Functions :
----Inline Table - valued Functions :   

--derived tables and CTEs are table expressions that are
--visible only in the scope of the statement that defines them. After that statement terminates,
--the table expression is gone.

--Hence, derived tables and CTEs are not reusable. For reusability,
--you need to store the definition of the table expression as an object in the database, and for
--this you can use either views or inline table-valued functions.

--------views we cannot use paramters 

---table valued functions we can use input paramters

--The main difference between views and inline table-valued functions is that the former
--doesn’t accept input parameters and the latter does. As an example, suppose you need to
--persist the definition of the query with the row number computation from the examples in
--the previous sections. To achieve this, you create the following view.


SELECT
ROW_NUMBER() OVER(PARTITION BY categoryid
ORDER BY unitprice, productid) AS rownum,
categoryid, productid, productname, unitprice
FROM Production.Products






IF OBJECT_ID('Sales.RankedProducts', 'V') IS NOT NULL DROP VIEW Sales.RankedProducts;
GO
CREATE VIEW Sales.RankedProducts
AS
SELECT
ROW_NUMBER() OVER(PARTITION BY categoryid
ORDER BY unitprice, productid) AS rownum,
categoryid, productid, productname, unitprice
FROM Production.Products;
GO

-------------------------------------------------------------------------------------------------------------------
SELECT categoryid, productid, productname, unitprice,rownum
FROM Sales.RankedProducts
WHERE rownum <= 2;

-------------------------------------------------------------------------------------------------------------------
--Inline Table - valued Functions :   

--As for inline table-valued functions, they are very similar to views in concept; however,
--as mentioned, they do support input parameters. So if you want to define something like a
--view with parameters, the closest you have is an inline table-valued function. As an example,
--consider the recursive CTE from the section about CTEs that retuned the management chain
--leading to employee 9. Suppose that you wanted to encapsulate the logic in a table expression
--for reusability, but also wanted to parameterize the input employee instead of using the
--constant 9. You can achieve this by using an inline table-valued function with the following
--definition.

IF OBJECT_ID('HR.GetManagers', 'IF') IS NOT NULL DROP FUNCTION HR.GetManagers;
GO
CREATE FUNCTION HR.GetManagers(@empid AS INT) RETURNS TABLE
AS
RETURN
WITH EmpsCTE AS
(
SELECT empid, mgrid, firstname, lastname, 0 AS distance
FROM HR.Employees
WHERE empid = @empid
UNION ALL
SELECT M.empid, M.mgrid, M.firstname, M.lastname, S.distance + 1 AS distance
FROM EmpsCTE AS S
JOIN HR.Employees AS M
ON S.mgrid = M.empid
)
SELECT empid, mgrid, firstname, lastname, distance
FROM EmpsCTE;
GO

-------------------------------------------------------------------------------------------------------------------

SELECT *
FROM HR.GetManagers(9) AS M;

-------------REUSABILITY
SELECT *
FROM HR.GetManagers(8) AS M;


-------------------------------------------------------------------------------------------------------------------
SELECT *
FROM HR.GetManagers(8) AS M;

-------------------------------------------------------------------------------------------------------------------











