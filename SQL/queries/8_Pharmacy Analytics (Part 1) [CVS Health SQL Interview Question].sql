--CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. 
--Each drug can only be produced by one manufacturer.

--Write a query to find the top 3 most profitable drugs sold, and how much profit they made. 
--Assume that there are no ties in the profits. ----------------------Dense rank and rank both will be giving the same output.
--Display the result from the highest to the lowest total profit.

--Definition:

--cogs stands for Cost of Goods Sold which is the direct cost associated with producing the drug.
--Total Profit = Total Sales - Cost of Goods Sold


CREATE TABLE PHARMACY_SALES
(
product_id INT,
units_sold INT,
total_sales DECIMAL(18,2),
cogs  DECIMAL(18,2),
manufacturer  VARCHAR(100),
drug  VARCHAR(100),
total_loss INT ,
total_profit INT,
total INT
)


SELECT TOP 3 drug,manufacturer,
total_sales - cogs AS TOTAL_PROFIT FROM PHARMACY_SALES 
ORDER BY TOTAL_PROFIT DESC 


=--------IN SQL SERVER  ===DERIVED TABLE
---------ORACLE         ===INLINE VIEW


SELECT T.drug,T.manufacturer,T.P FROM 
(
SELECT 
drug,manufacturer,total_sales - cogs AS P,
RANK() OVER(ORDER BY total_sales - cogs DESC) AS RK 
FROM  PHARMACY_SALES
) AS T 
WHERE RK <=3



--FETCH  3 ROWS ONLY;






SELECT total_sales - cogs as profit,* FROM PHARMACY_SALES
order BY total_sales - cogs desc


;WITH CTE 
AS 
(
SELECT 
DRUG,
total_sales - cogs AS Profit,
RANK() OVER(ORDER BY total_sales - cogs DESC) AS RK
FROM PHARMACY_SALES
)
SELECT DRUG,profit FROM CTE 
WHERE RK<=3



Humira		81515652.55
Keytruda	11622022.02
Dupixent	11217052.34


Humira		81515652.55
Keytruda	11622022.02
Dupixent	11217052.34


;WITH CTE 
AS 
(
SELECT
DRUG,
TOTAL_SALES-COGS AS TOTAL_PROFIT,
ROW_NUMBER() OVER(ORDER BY TOTAL_SALES-COGS  DESC) AS RK
FROM PHARMACY_SALES
)
SELECT DRUG, TOTAL_PROFIT 
FROM CTE 
WHERE RK <=3
