USE AdventureWorks2012

DROP TABLE [Sales].[SalesOrderDetails_bkp_20231008_bkpp_1]



Select * from [Sales].[SalesOrderDetail]

Select * from [Sales].[SalesOrderDetail_8102023_bkp]


Select * into [Sales].[SalesOrderDetail_8102023_bkp_2]
from [Sales].[SalesOrderDetail]
where 1=2

------------------------TO COPY THE STRUCTURE OF THE TABLE ONLY
Select * into [Sales].[SalesOrderDetails_bkp_20231008_bkpp_1] from [Sales].[SalesOrderDetail]
--where 1=1;

Select * from [Sales].[SalesOrderDetails_bkp_20231008_bkpp_1]


-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
DROP TABLE [Sales].[SalesOrderDetails_bkp_20231008_bkpp]

------------------------TO COPY THE STRUCTURE OF THE TABLE WITH DATA ALSO
Select * into [Sales].[SalesOrderDetails_bkp_20231008_bkpp] from [Sales].[SalesOrderDetail]

-----------------------------------------------------------------------------------------------------------------------------------
PK_0ERER_FER356
-----------------------------------------------------------------------------------------------------------------------------------
drop table Sales.MyOrders

USE TSQL2012


CREATE TABLE Sales.MyOrders
(
orderid INT NOT NULL IDENTITY(1, 1)
CONSTRAINT PK_MyOrders_orderid PRIMARY KEY,
custid INT NOT NULL,
empid INT NOT NULL,
orderdate DATE NOT NULL
CONSTRAINT DFT_MyOrders_orderdate DEFAULT (CAST(SYSDATETIME() AS DATE)),
shipcountry NVARCHAR(15) NOT NULL,
freight MONEY NOT NULL
);


--Observe that the orderid column has an IDENTITY property defined with a seed 1 and
--an increment 1. This property generates the values in this column automatically when rows
--are inserted.


--INSERT VALYES 

INSERT INTO Sales.MyOrders(custid, empid, orderdate, shipcountry, freight)
VALUES(2, 19, '20120620', N'USA', 30.00);

--If you do want to provide
--your own value instead of letting the IDENTITY property do it for you, you need to first turn
--on a session option called IDENTITY_INSERT, as follows.

--SET IDENTITY_INSERT <table> ON;

----Example of DEFAULT constraint
--For example, the following statement doesn’t specify a value for orderdate,
--and therefore SQL Server uses the default expression.

INSERT INTO Sales.MyOrders(custid, empid, shipcountry, freight)
VALUES(3, 11, N'USA', 10.00);


--Another way to achieve the same behavior is to specify the column name in the names
--list and the keyword DEFAULT in the respective element in the VALUES list. Here’s an INSERT
--example demonstrating this.

INSERT INTO Sales.MyOrders(custid, empid, orderdate, shipcountry, freight)
VALUES(3, 17, DEFAULT, N'USA', 30.00);

INSERT INTO Sales.MyOrders(custid, empid,shipcountry, freight)
VALUES(44, 18,N'UK', 50.00);


--If you don’t specify a value for a column, SQL Server will first check whether the column
--gets its value automatically—for example, from an IDENTITY property or a default constraint.
--If that’s not the case, SQL Server will check whether the column allows NULLs, in which case it
--will assume a NULL. If that’s not the case, SQL Server will generate an error.

--The INSERT VALUES statement doesn’t limit you to inserting only one row; rather, it allows
--you to insert multiple rows. Simply separate the rows with commas, as follows.

INSERT INTO Sales.MyOrders(custid, empid, orderdate, shipcountry, freight) VALUES
(2, 11, '20120620', N'USA', 50.00),-------FAIL
(5, 13, '20120620', N'USA', 40.00),
(7, 17, '20120620', N'USA', 45.00),
(7, 17, '20120620', N'USA', 45.00),
(7, 17, '20120620', N'USA', 45.00),
(7, 17, '20120620', N'USA', 45.00)



--Note that the entire statement is considered one transaction, meaning that if any row fails
--to enter the target table, the entire statement fails and no row is inserted.


--INSERT SELECT STATEMENT

--The INSERT SELECT statement inserts the result set returned by a query into the specified target
--table. As with INSERT VALUES, the INSERT SELECT statement supports optionally specifying
--the target column names. Also, you can omit columns that get their values automatically
--from an IDENTITY property, default constraint, or when allowing NULLs.

--SELECT * INTO SOMETABLE NAME 
--FROM TABLENAME 
--WHERE 1=2 [OPTIONAL CONDITION]

SELECT * FROM Sales.MyOrders
--TRUNCATE TABLE Sales.MyOrders

SELECT orderid, custid, empid, orderdate, shipcountry, freight
FROM Sales.Orders
WHERE shipcountry = N'Norway';




MY TABLE IS EXISTED , I WANT TO INSERT DATA INTO SOME OTHER TABLE FROM MY TABLE 

SET IDENTITY_INSERT Sales.MyOrders ON;

INSERT INTO Sales.MyOrders(orderid, custid, empid, orderdate, shipcountry, freight)
SELECT orderid, custid, empid, orderdate, shipcountry, freight
FROM Sales.Orders
--WHERE shipcountry = N'Norway';


SET IDENTITY_INSERT Sales.MyOrders OFF;


--INSERT EXEC COMMAND

IF OBJECT_ID('Sales.OrdersForCountry', 'P') IS NOT NULL
DROP PROC Sales.OrdersForCountry;
GO
CREATE PROC Sales.OrdersForCountry
@country AS NVARCHAR(15)
AS
SELECT orderid, custid, empid, orderdate, shipcountry, freight
FROM Sales.Orders
WHERE shipcountry = @country;
GO

EXEC Sales.OrdersForCountry 'Norway'

--Run the following code to invoke the stored procedure with Portugal as the input country,
--and insert the result of the procedure into the Sales.MyOrders table.

SET IDENTITY_INSERT Sales.MyOrders ON;

INSERT INTO Sales.MyOrders(orderid, custid, empid, orderdate, shipcountry, freight)
EXEC Sales.OrdersForCountry
@country = N'Portugal';

SET IDENTITY_INSERT Sales.MyOrders OFF;


--SELECT INTO STATEMENT

--The following code shows an example for a SELECT INTO statement that queries the Sales.
--Orders table returning orders shipped to Norway, creates a target table called Sales.MyOrders,
--and stores the query’s result in the target table.

--The statement creates the target table based on the definition of the source and inserts
--the result rows from the query into that table. 
--The statement copies from the source some aspects
--of the data definition like the column names, types, nullability, and IDENTITY property, in addition to the data itself. 
--Certain aspects of the data definition aren’t copied like indexes,--------------------------------------
--constraints, triggers, permissions, and others. If you want to include these aspects, you need
--to script them from the source and apply them to the target.


IF OBJECT_ID('Sales.MyOrders', 'U') IS NOT NULL DROP TABLE Sales.MyOrders;
SELECT orderid, custid, orderdate, shipcountry, freight
INTO Sales.MyOrders
FROM Sales.Orders
WHERE shipcountry = N'Norway';


drop table Sales.MyOrders

--If you want the target column’s type to be different than the source, you can use the CAST
--or CONVERT functions. But remember that in such a case, the target column will be defined
--as allowing NULLs even if the source column disallowed NULLs,

drop table Sales.MyOrders

SELECT
ISNULL(orderid + 0, -1) AS orderid, -- get rid of IDENTITY property
-- make column NOT NULL
ISNULL(custid, -1) AS custid, -- make column NOT NULL
empid,
ISNULL(CAST(orderdate AS DATETIME2), '19000101') AS orderdate,
shipcountry, freight
INTO Sales.MyOrders
FROM Sales.Orders
WHERE shipcountry = N'Norway';


select * from Sales.Orders
WHERE shipcountry = N'Norway';

select * from Sales.MyOrders


--Remember that SELECT INTO does not copy constraints from the source table, so if you
--need those, it’s your responsibility to define them in the target. For example, the following
--code defines a primary key constraint in the target table.

ALTER TABLE Sales.MyOrders
ADD CONSTRAINT PK_MyOrders PRIMARY KEY(orderid);
