--CVS Health is trying to better understand its pharmacy sales, and how well different drugs are selling.

--Write a query to find the top 2 drugs sold, in terms of units sold, for each manufacturer. 
--List your results in alphabetical order by manufacturer.


----------for each manufacturer. -----group by or patition by manufacturer


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

SELECT * FROM  PHARMACY_SALES 
ORDER BY manufacturer,units_sold DESC 


SELECT MANUFACTURER,DRUG,UNITS_SOLD
FROM 
(
SELECT 
MANUFACTURER,
DRUG,
UNITS_SOLD,
DENSE_RANK() OVER(PARTITION BY MANUFACTURER ORDER BY UNITS_SOLD) AS RK 
FROM PHARMACY_SALES 
) T 
WHERE RK <=2



;WITH CTE 
AS 
(
SELECT 
MANUFACTURER,
DRUG,
UNITS_SOLD,
ROW_NUMBER() OVER(PARTITION BY MANUFACTURER ORDER BY UNITS_SOLD DESC) AS RK 
FROM PHARMACY_SALES 

)
SELECT MANUFACTURER,DRUG,UNITS_SOLD FROM CTE 
WHERE RK <=2
ORDER BY MANUFACTURER
