--Supercloud Customer [Microsoft SQL Interview Question]

--A Microsoft Azure Supercloud customer is defined as a company that purchases at least one product 
--from each product category.

--Write a query that effectively identifies the Customer ID of such Supercloud customers.



CREATE TABLE CUSTOMER_CONTRACTS
(
CUSTOMER_ID INT,
PRODUCT_ID INT,
AMOUNT INT
)

--INSERT INTO CUSTOMER_CONTRACTS VALUES(2,2,2000)
--INSERT INTO CUSTOMER_CONTRACTS VALUES(3,1,1100)
--INSERT INTO CUSTOMER_CONTRACTS VALUES(4,1,1000)
--INSERT INTO CUSTOMER_CONTRACTS VALUES(7,1,1000)
--INSERT INTO CUSTOMER_CONTRACTS VALUES(7,3,4000)
--INSERT INTO CUSTOMER_CONTRACTS VALUES(6,4,2000)
--INSERT INTO CUSTOMER_CONTRACTS VALUES(1,5,1500)
--INSERT INTO CUSTOMER_CONTRACTS VALUES(2,5,2000)
--INSERT INTO CUSTOMER_CONTRACTS VALUES(4,5,2200)
--INSERT INTO CUSTOMER_CONTRACTS VALUES(7,6,5000)
--INSERT INTO CUSTOMER_CONTRACTS VALUES(1,2,2000)


CREATE TABLE PRODUCTSS
(
PRODUCT_ID INT,
PRODUCT_CATEGORY VARCHAR(100),
PRODUCT_NAME VARCHAR(100)
)


--INSERT INTO PRODUCTSS VALUES(1,'Analytics','Azure Databricks')
--INSERT INTO PRODUCTSS VALUES(2,'Analytics','Azure Stream Analytics')
--INSERT INTO PRODUCTSS VALUES(3,'Containers','Azure Kubernetes Service')
--INSERT INTO PRODUCTSS VALUES(4,'Containers','Azure Service Fabric')
--INSERT INTO PRODUCTSS VALUES(5,'Compute','Virtual Machines')
--INSERT INTO PRODUCTSS VALUES(6,'Compute','Azure Functions')

-----NEED TO IDENTITY THOSE CUSTOMERS WHO HAS BUY ATLEAST ONE PRODUCT FROM EACH PRODUCT CATEGORY

SELECT * FROM CUSTOMER_CONTRACTS

SELECT * FROM PRODUCTSS


--CUSTOMER_ID
--7


SELECT COUNT(DISTINCT PRODUCT_CATEGORY) AS CT ----3
FROM PRODUCTSS 


SELECT C.CUSTOMER_ID,COUNT(DISTINCT P.PRODUCT_CATEGORY) PT 
FROM CUSTOMER_CONTRACTS C 
INNER JOIN PRODUCTSS P ON C.PRODUCT_ID = P.product_id
GROUP BY C.CUSTOMER_ID


SELECT T.CUSTOMER_ID FROM 
(
SELECT C.CUSTOMER_ID,COUNT(DISTINCT P.PRODUCT_CATEGORY) PT 
FROM CUSTOMER_CONTRACTS C 
INNER JOIN PRODUCTSS P ON C.PRODUCT_ID = P.product_id
GROUP BY C.CUSTOMER_ID
) T 
WHERE PT IN 
(
SELECT COUNT(DISTINCT PRODUCT_CATEGORY) AS CT ----3
FROM PRODUCTSS 
)



;WITH CTE 
AS 
(
SELECT COUNT(DISTINCT PRODUCT_CATEGORY) AS CT ----3
FROM PRODUCTSS 

),CTE2 AS 
(
SELECT C.CUSTOMER_ID,COUNT(DISTINCT P.PRODUCT_CATEGORY) PT 
FROM CUSTOMER_CONTRACTS C 
INNER JOIN PRODUCTSS P ON C.PRODUCT_ID = P.product_id
GROUP BY C.CUSTOMER_ID
)
SELECT CTE2.CUSTOMER_ID FROM CTE 
INNER JOIN CTE2 ON CTE.CT = CTE2.PT









SELECT CUSTOMER_ID,COUNT(DISTINCT PRODUCT_CATEGORY) AS PT-----3
FROM CUSTOMER_CONTRACTS C  
INNER JOIN PRODUCTSS P ON C.PRODUCT_ID = P.PRODUCT_ID 
GROUP BY CUSTOMER_ID






;WITH CTE 
AS 
(
SELECT COUNT(DISTINCT PRODUCT_CATEGORY) AS CT ----3
FROM PRODUCTSS 

), CTE2 AS
(
SELECT CUSTOMER_ID,COUNT(DISTINCT PRODUCT_CATEGORY) AS PT-----3
FROM CUSTOMER_CONTRACTS C  
INNER JOIN PRODUCTSS P ON C.PRODUCT_ID = P.PRODUCT_ID 
GROUP BY CUSTOMER_ID
)
SELECT CUSTOMER_ID FROM CTE 
INNER JOIN CTE2 ON CTE.CT = CTE2.PT


--CUSTOMER_ID
--7

--CUSTOMER_ID
--7


