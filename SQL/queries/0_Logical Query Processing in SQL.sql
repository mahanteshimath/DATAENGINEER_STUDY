--There are 2 types of query execution in T-SQL: logical query execution and physical query exectuion.
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--Logical Query execution Phases

----Physical Order
--As you know, when writing T-SQL queries we have defined steps for statements. They are:
--1.	SELECT
--2.	FROM
--3.	WHERE
--4.	GROUP BY
--5.	HAVING
--6.	ORDER BY
--7.	OFFSET..FETCH

--While the above ordering is correct for physical execution, Logical processing executes these statements in a slightly different order. Logical execution order is:
--1.	FROM
--2.	WHERE
--3.	GROUP BY
--4.	HAVING
--5.	SELECT
--6.	ORDER BY
--7.	OFFSET..FETCH

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--Practical Values of Logical Execution
 
--1. You don’t have an access to the aliases created in SELECT phase from FROM phase.

Select SOD.CarrierTrackingNumber,SOD.LineTotal,SOD.UnitPrice,SOD.UnitPriceDiscount AS UPDiscount
from Sales.SalesOrderDetail AS SOD
where UnitPriceDiscount >0.01
order by UPDiscount

---This is the correct one 

Select SOD.CarrierTrackingNumber,SOD.LineTotal,SOD.UnitPrice,SOD.UnitPriceDiscount AS UPDiscount
from Sales.SalesOrderDetail AS SOD
where SOD.UnitPriceDiscount > 0.01

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

--2. You can’t access the same alias in SELECT twice.

--Even if you declare an alias in the SELECT clause, it is not possible to use the same alias twice.

Select SOD.CarrierTrackingNumber,SOD.LineTotal,SOD.UnitPrice as abc,SOD.UnitPriceDiscount as abc,
SOD.UnitPriceDiscount * 2  AS abc ----calcuated column  
from Sales.SalesOrderDetail AS SOD
--where UPDiscount >0.01

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--3. WHERE doesn’t work for Group By.

Select SOD.CarrierTrackingNumber,SOD.UnitPriceDiscount AS UPDiscount
from Sales.SalesOrderDetail AS SOD
--where 
GROUP BY SOD.CarrierTrackingNumber,UPDiscount
HAVING SOD.UnitPriceDiscount > 0.01

--------------------------------------------------------------------------------------------------------------------

Select SOD.CarrierTrackingNumber,SOD.UnitPriceDiscount AS UPDiscount
from Sales.SalesOrderDetail AS SOD
--where 
GROUP BY SOD.CarrierTrackingNumber,SOD.UnitPriceDiscount

Select SOD.CarrierTrackingNumber,SOD.UnitPriceDiscount AS UPDiscount
from Sales.SalesOrderDetail AS SOD
--where 
GROUP BY SOD.UnitPriceDiscount,SOD.CarrierTrackingNumber


HAVING SOD.UnitPriceDiscount > 0.01


--------------------------------------------------------------------------------------------------------------------
--4. SELECT picks only those columns, which are defined by GROUP BY.

Select SOD.CarrierTrackingNumber,abc,ss,ddd,zz
max(SOD.UnitPriceDiscount) AS UPDiscount
from Sales.SalesOrderDetail AS SOD
GROUP BY SOD.CarrierTrackingNumber,abc,ss,ddd,zz

Select distinct SOD.CarrierTrackingNumber,SOD.UnitPriceDiscount AS UPDiscount
from Sales.SalesOrderDetail AS SOD

GROUP BY SOD.CarrierTrackingNumber


--Msg 8120, Level 16, State 1, Line 1
--Column 'Sales.SalesOrderDetail.UnitPriceDiscount' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--5. ORDER BY can see aliases created by SELECT.
--This is also understandable because ORDER BY will be executed only after SELECT. 
--Every statement can see the data defined by previous statement.
--------------------------------------------------------------------------------------------------------------------
Select SOD.CarrierTrackingNumber,SOD.LineTotal,SOD.UnitPrice,SOD.UnitPriceDiscount AS UPDiscount
from Sales.SalesOrderDetail AS SOD
where SOD.UnitPriceDiscount > 0.01
order by SOD.UnitPriceDiscount

--------------------------------------------------------------------------------------------------------------------
Select SOD.CarrierTrackingNumber,SOD.LineTotal,SOD.UnitPrice,SOD.UnitPriceDiscount AS UPDiscount
from Sales.SalesOrderDetail AS SOD
where SOD.UnitPriceDiscount > 0.01
order by UPDiscount

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------





