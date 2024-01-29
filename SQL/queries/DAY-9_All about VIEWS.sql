--With views , you can present the contents of one or more base data tables
--to users, and you can encapsulate complex logic such as joins and filters so that the user does
--not need to remember them.

--you can use views to store and re-use queries in the database. Views appear
--for almost all purposes as tables: You can select from them, and filter the results, just as you
--do with tables. You can even insert, update, and delete rows through views, though with
--restrictions.

SELECT * INTO SALES.ORDERS1 FROM SALES.Orders

DROP VIEW Sales.OrderTotalsByYear


CREATE VIEW Sales.OrderTotalsByYear
AS
SELECT
YEAR(O.orderdate) AS orderyear,
SUM(OD.qty) AS qty
FROM [Sales].[ORDERS1] AS O
JOIN Sales.OrderDetails AS OD
ON OD.orderid = O.orderid
GROUP BY YEAR(orderdate);


--You can read from a view just as you would a table. So you can select from it as follows.
SELECT orderyear, qty
FROM Sales.OrderTotalsByYear;


select * from [Sales].[ORDERS1]


---Here are some things for you to note right away about this view:

--Just as with other CREATE statements such as CREATE TABLE, you can optionally specify
--a database schema as the container for the view. In this case, the view is created in the
--Sales schema. As a best practice, you should always reference database objects such
--as views by using the two-part name, which includes the schema name. (


--The body of the view is just a SELECT statement, subject to all the usual rules for
--SELECT statements.

--You can add new columns to the view by creating new columns in the SELECT statement,
--by using expressions.

--You can prevent users from seeing some columns of an underlying table by removing
--the columns from the SELECT statement that defines the view.

--You can rename columns by using column aliases, just as in a SELECT statement.

---------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------View Options
---------------------------------------------------------------------------------------------------------------------------------
--Using WITH ENCRYPTION, you can specify that the view text should be stored in an
--obfuscated manner (this is not strong encryption). This makes it difficult for users to
--discover the SELECT text of the view.

drop view Sales.OrderTotalsByYear_new


CREATE VIEW Sales.OrderTotalsByYear_new
WITH Encryption------------use cannot see the text of this view when we create view with encryption option
AS
SELECT
YEAR(O.orderdate) AS orderyear,
SUM(OD.qty) AS qty
FROM [Sales].[ORDERS1] AS O
JOIN Sales.OrderDetails AS OD
ON OD.orderid = O.orderid
GROUP BY YEAR(orderdate);


insert into Sales.OrderTotalsByYear_new values (2011,2000)

--Msg 4406, Level 16, State 1, Line 1
--Update or insert of view or function 'Sales.OrderTotalsByYear_new' failed because it contains a derived or constant field.

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
--WITH SCHEMABINDING, as explained earlier, binds the view to the table schemas of
--the underlying tables: The view cannot have its schema definitions changed unless
--the view is dropped. This protects the view from having table structures changed and
--breaking the view.


--drop view Sales.OrderTotalsByYear

CREATE VIEW Sales.OrderTotalsByYear
WITH schemabinding
AS
SELECT
YEAR(O.orderdate) AS orderyear,
SUM(OD.qty) AS qty
FROM [Sales].[ORDERS1] AS O
JOIN Sales.OrderDetails AS OD
ON OD.orderid = O.orderid
GROUP BY YEAR(orderdate);


DROP TABLE Sales.Orders1

--Msg 3729, Level 16, State 1, Line 1
--Cannot DROP TABLE 'Sales.Orders1' because it is being referenced by object 'OrderTotalsByYear'.

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

drop table t1

drop view v1 

CREATE TABLE t1 (a INT);

CREATE VIEW v1 AS SELECT * FROM t1 WHERE a < 2
WITH CHECK OPTION;


INSERT INTO v1 VALUES (1);

INSERT INTO v1 VALUES (2);


--Msg 550, Level 16, State 1, Line 1
--The attempted insert or update failed because the target view either specifies WITH CHECK OPTION or spans a view that specifies WITH CHECK OPTION and one or more rows resulting from the operation did not qualify under the CHECK OPTION constraint.
--The statement has been terminated.

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

drop view v2


CREATE VIEW V2 
AS
SELECT O.orderdate,OD.productid
FROM [Sales].[ORDERS] AS O
JOIN Sales.OrderDetails AS OD
ON OD.orderid = O.orderid


INSERT INTO V2 VALUES ('2006-07-08 00:00:00.000',33)

--Msg 4405, Level 16, State 1, Line 1
--View or function 'V2' is not updatable because the modification affects multiple base tables.

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
