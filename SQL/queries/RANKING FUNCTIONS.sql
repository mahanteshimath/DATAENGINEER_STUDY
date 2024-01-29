USE [TSQL2012]

ROW_NUMBER --widely used
RANK---widely used
DENSE_RANK----widely used
NTILE=--------------------rarely used function

SALES ------------ CUSTOMER ID WISE DATA 

CUSTOMER ID --------------

ORDER BY CLAUSE - MANDATORY IN 
 
PARTITION BY CLAUSE BY - OPTIONAL 


--With window ranking functions, you can rank rows within a partition based on specified ordering. 
--As with the other window functions, if you don’t indicate a window partition clause,
--the entire underlying query result is considered one partition.

--The window order clause is mandatory.

--T-SQL supports
--four window ranking functions: ROW_NUMBER, RANK, DENSE_RANK, and NTILE.

--ROW_NUMBER
--The ROW_NUMBER function computes a unique sequential integer starting with 1 within
--the window partition based on the window ordering. Because the example query doesn’t
--have a window partition clause, the function considers the entire query’s result set as one
--partition; hence, the function assigns unique row numbers across the entire query’s result set.

--The RANK and DENSE_RANK functions are slightly different from each other as well as the 
--ROW_NUMBER function: RANK numbers are skipped so there may be a gap in rankings, and may not be unique. 
--DENSE_RANK numbers are not skipped so there will not be a gap in rankings, and may not be unique.

SELECT * FROM  Sales.OrderValues
ORDER BY VAL------------

 
SELECT custid, orderid, val,
ROW_NUMBER() OVER(ORDER BY val) AS rownum,
RANK() OVER(ORDER BY val) AS rnk,
DENSE_RANK() OVER(ORDER BY val) AS densernk,
NTILE(10) OVER(ORDER BY val) AS ntile100
FROM Sales.OrderValues;

SELECT 600/10

====6

31


select 631/100.00

6.310000






