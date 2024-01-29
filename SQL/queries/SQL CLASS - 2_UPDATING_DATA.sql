
select * from sys.tables where name ='MyCustomers'

select * from INFORMATION_SCHEMA.TABLES

IF OBJECT_ID('Sales.MyOrderDetails', 'U') IS NOT NULL
DROP TABLE Sales.MyOrderDetails;

IF OBJECT_ID('Sales.MyOrders', 'U') IS NOT NULL
DROP TABLE Sales.MyOrders;

IF OBJECT_ID('Sales.MyCustomers', 'U') IS NOT NULL
DROP TABLE Sales.MyCustomers;

SELECT * INTO Sales.MyCustomers FROM Sales.Customers;

ALTER TABLE Sales.MyCustomers
ADD CONSTRAINT PK_MyCustomers PRIMARY KEY(custid);

SELECT * INTO Sales.MyOrders FROM Sales.Orders;

ALTER TABLE Sales.MyOrders
ADD CONSTRAINT PK_MyOrders PRIMARY KEY(orderid);

SELECT * INTO Sales.MyOrderDetails FROM Sales.OrderDetails;

ALTER TABLE Sales.MyOrderDetails
ADD CONSTRAINT PK_MyOrderDetails PRIMARY KEY(orderid, productid);


-------------------------------
SELECT *
FROM Sales.MyOrderDetails
WHERE orderid = 10251;

UPDATE Sales.MyOrderDetails
SET discount = discount + 0.05
WHERE orderid = 10251;

update s 
set s.discount = s.discount + 0.05
from Sales.MyOrderDetails s 
WHERE orderid = 10251;



UPDATE Sales.MyOrderDetails
SET discount = discount - 0.05
WHERE orderid = 10251;


UPDATE Sales.MyOrderDetails
SET discount += 0.05
WHERE orderid = 10251;


--As an example, suppose that you want to add a 5 percent discount to order lines associated
--with orders placed by customers from Norway. The rows you need to modify are in the
--Sales.MyOrderDetails table. But the information you need to examine for filtering purposes
--is in rows in the Sales.MyCustomers table.

--SELECT discount= 0.005 

update md
set discount = discount + 0.005
FROM SALES.MyCustomers C 
inner join Sales.MyOrders mo on c.custid = mo.custid
inner join Sales.MyOrderDetails md on md.orderid = mo.orderid
where c.country = 'Norway'

select c.*,mo.*
FROM SALES.MyCustomers C 
inner join Sales.MyOrders mo on c.custid = mo.custid
inner join Sales.MyOrderDetails md on md.orderid = mo.orderid
where c.country = 'Norway'


table a    table b 
1			1
1			1
1			2
null		null
null		3
2			4	
2
3
4
null

inner   
left
right
full




select top 2 * from Sales.MyOrderDetails----orderid

select top 2 * from Sales.MyOrders----custid ,,,orderid

select * from sales.MyCustomers---custid

SELECT OD.*
FROM Sales.MyCustomers AS C
INNER JOIN Sales.MyOrders AS O
ON C.custid = O.custid
INNER JOIN Sales.MyOrderDetails AS OD---------------we want to update data into this table
ON O.orderid = OD.orderid
WHERE C.country = N'Norway';

-----

UPDATE OD
SET OD.discount += 0.05
FROM Sales.MyCustomers AS C
INNER JOIN Sales.MyOrders AS O
ON C.custid = O.custid
INNER JOIN Sales.MyOrderDetails AS OD
ON O.orderid = OD.orderid
WHERE C.country = N'Norway';

--------

UPDATE OD
SET OD.discount -= 0.05
FROM Sales.MyCustomers AS C
INNER JOIN Sales.MyOrders AS O
ON C.custid = O.custid
INNER JOIN Sales.MyOrderDetails AS OD
ON O.orderid = OD.orderid
WHERE C.country = N'Norway';


update Sales.MyOrderDetails 
set discount -= 0.05
FROM Sales.MyCustomers AS C
INNER JOIN Sales.MyOrders AS O
ON C.custid = O.custid
INNER JOIN Sales.MyOrderDetails
ON O.orderid = Sales.MyOrderDetails.orderid
WHERE C.country = N'Norway';








