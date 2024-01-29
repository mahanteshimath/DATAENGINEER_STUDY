--CVS Health wants to gain a clearer understanding of its pharmacy sales and the performance of various products.

--Write a query to calculate the total drug sales for each manufacturer. 
--Round the answer to the nearest million and report your results in descending order of total sales. 
--In case of any duplicates, sort them alphabetically by the manufacturer name.

--Since this data will be displayed on a dashboard viewed by business stakeholders, 
--please format your results as follows: "$36 million".


--EACH MANUFACTURER  ----------GROUP BY CLAUSE OR WE HAVE TO RANKING FUNCTIONS

 ----each manufacturer. -----either you have to use the group by clause 
 ----or you have to use any of the ranking functions  with partition by clause


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

--To convert a number in Rupees to Million follow the below process:
--Where 1000000 Rupees = 1 Million,


SELECT manufacturer,concat('$',FLOOR(SUM(total_sales)/1000000),'m') AS TOTAL_SALES_IN_MILLION
FROM PHARMACY_SALES
GROUP BY manufacturer


--AbbVie	113777182.55
--AstraZeneca	32084388.42
--Bayer	33825949.63
--Biogen	69824472.58
--Eli Lilly	76656174.98
--GlaxoSmithKline	4061641.45
--Johnson & Johnson	43408805.85
--Merck	24965058.89
--Novartis	26001699.19
--Pfizer	27502472.25
--Roche	15537878.73
--Sanofi	25167027.16

SELECT manufacturer,ROUND(SUM(total_sales)/1000000,0),
CAST(ROUND(SUM(TOTAL_SALES)/1000000,0) AS DECIMAL(3,0)),
CONCAT('$',CAST(ROUND(SUM(TOTAL_SALES)/1000000,0) AS DECIMAL(3,0)),'million') as Sales
FROM PHARMACY_SALES
GROUP BY manufacturer
order by SUM(total_sales) DESC


--114555.000000

SELECT 
manufacturer,
CONCAT('$',CAST(ROUND(SUM(TOTAL_SALES)/1000000,0) AS DECIMAL(5,0)),' million')  AS SALE
FROM PHARMACY_SALES
GROUP BY manufacturer
order by SUM(TOTAL_SALES) DESC

