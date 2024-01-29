--Photoshop Revenue Analysis [Adobe SQL Interview Question]

--For every customer that bought Photoshop, 
--return a list of the customers,and the total spent on all the products except for Photoshop products.

--Sort your answer by customer ids in ascending order.


CREATE TABLE adobe_transactions
(
CUSTOMER_ID INT,
PRODUCT VARCHAR(100),
REVENUE INT
)

--INSERT INTO ADOBE_TRANSACTIONS VALUES(123,'Photoshop',50)
--INSERT INTO ADOBE_TRANSACTIONS VALUES(123,'Premier Pro',100)
--INSERT INTO ADOBE_TRANSACTIONS VALUES(123,'After Effects',50)
--INSERT INTO ADOBE_TRANSACTIONS VALUES(234,'Illustrator',200)
--INSERT INTO ADOBE_TRANSACTIONS VALUES(234,'Premier Pro',100)
--INSERT INTO ADOBE_TRANSACTIONS VALUES(562,'Illustrator',200)
--INSERT INTO ADOBE_TRANSACTIONS VALUES(913,'Photoshop',50)
--INSERT INTO ADOBE_TRANSACTIONS VALUES(913,'Premier Pro',100)
--INSERT INTO ADOBE_TRANSACTIONS VALUES(913,'Illustrator',200)


SELECT * FROM ADOBE_TRANSACTIONS



--123	Photoshop	50------------------------
--123	Premier Pro	100
--123	After Effects	50
--234	Illustrator	200
--234	Premier Pro	100
--562	Illustrator	200
--913	Photoshop	50----------------------------
--913	Premier Pro	100
--913	Illustrator	200





SELECT CUSTOMER_ID,SUM(REVENUE) FROM ADOBE_TRANSACTIONS 
WHERE CUSTOMER_ID IN 
(
SELECT CUSTOMER_ID FROM ADOBE_TRANSACTIONS 
WHERE PRODUCT ='Photoshop'
)
AND PRODUCT != 'Photoshop'
GROUP BY CUSTOMER_ID



with cte as 
(
select * from adobe_transactions
where product='Photoshop'
)

select 
CTE.CUSTOMER_ID , sum(adobe_transactions.revenue) as total_spent
from cte
INNER JOIN adobe_transactions ON CTE.CUSTOMER_ID = adobe_transactions.CUSTOMER_ID
where  adobe_transactions.product <>'Photoshop'  
group by CTE.customer_id















SELECT * FROM ADOBE_TRANSACTIONS
WHERE CUSTOMER_ID IN
(
SELECT CUSTOMER_ID FROM ADOBE_TRANSACTIONS 
WHERE PRODUCT ='Photoshop'
)











SELECT customer_id,sum(revenue) FROM ADOBE_TRANSACTIONS 
WHERE CUSTOMER_ID IN  
(
SELECT CUSTOMER_ID FROM ADOBE_TRANSACTIONS 
WHERE PRODUCT ='Photoshop'
)
AND PRODUCT NOT IN ('Photoshop')
group by customer_id
order by customer_id 
