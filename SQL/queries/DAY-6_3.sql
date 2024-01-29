--use TSQL2012

--The LAG function has the ability to fetch data from a previous row, while LEAD fetches data from a subsequent row. 
--Both functions are very similar to each other and you can just replace one by the other by changing the sort order.


SELECT custid, orderid, orderdate, val,
LAG(val) OVER(ORDER BY orderdate, orderid) AS prev_val,
LEAD(val) OVER(ORDER BY orderdate, orderid) AS next_val
FROM Sales.OrderValues;



SELECT custid, orderid, orderdate, val,
LAG(val) OVER(PARTITION BY custid
ORDER BY orderdate, orderid) AS prev_val,
LEAD(val) OVER(PARTITION BY custid
ORDER BY orderdate, orderid) AS next_val
FROM Sales.OrderValues;
