--Card Launch Success [JPMorgan Chase SQL Interview Question]

--Your team at JPMorgan Chase is soon launching a new credit card. 
--You are asked to estimate how many cards you'll issue in the first month.

--Before you can answer this question, you want to first get some perspective on how well new credit card launches 
---typically do in their first month.

--Write a query that outputs the name of the credit card, and what is the issued_amount in its launch month. 
----The launch month is the earliest record in the monthly_cards_issued table for a given card.
-- Order the results starting from the biggest issued amount.


--DROP TABLE monthly_cards_issued

CREATE TABLE monthly_cards_issued
(
CARD_NAME VARCHAR(50),
ISSUED_AMOUNT INT,
ISSUE_MONTH INT,
ISSUE_YEAR INT,
)

--INSERT INTO monthly_cards_issued VALUES('Chase Sapphire Reserve',170000,1,2021)
--INSERT INTO monthly_cards_issued VALUES('Chase Sapphire Reserve',175000,2,2021)
--INSERT INTO monthly_cards_issued VALUES('Chase Sapphire Reserve',180000,3,2021)
--INSERT INTO monthly_cards_issued VALUES('Chase Freedom Flex',55000,1,2021)
--INSERT INTO monthly_cards_issued VALUES('Chase Freedom Flex',60000,2,2021)
--INSERT INTO monthly_cards_issued VALUES('Chase Freedom Flex',65000,3,2021)
--INSERT INTO monthly_cards_issued VALUES('Chase Freedom Flex',70000,4,2021)
--INSERT INTO monthly_cards_issued VALUES('Chase Sapphire Reserve',150000,11,2020)

SELECT * FROM monthly_cards_issued
ORDER BY CARD_NAME


;WITH CTE 
AS 
(
SELECT CARD_NAME,ISSUED_AMOUNT,ISSUE_MONTH,ISSUE_YEAR,
ROW_NUMBER() OVER(PARTITION BY CARD_NAME ORDER BY ISSUE_YEAR,ISSUE_MONTH) AS RK 
FROM monthly_cards_issued
)
SELECT * FROM CTE 
WHERE RK =1


--------------------SQL SERVER --------DERIVED TABLE 

SELECT * FROM 
(
SELECT CARD_NAME,ISSUED_AMOUNT,ISSUE_MONTH,ISSUE_YEAR,
ROW_NUMBER() OVER(PARTITION BY CARD_NAME ORDER BY ISSUE_YEAR,ISSUE_MONTH) AS RK 
FROM monthly_cards_issued
) AS T 
WHERE RK =1








------------SUBQUERY

-----------DERIVED TABLE

----------INLINE VIEW IN ORACLE--------------WHEN WE WRITE SUBQUERY INSIDE THE FROM CLAUSE OF A SELECT STATEMENT 
-----------THAN IT IS CONSIDER AS INLINE VIEW.

SELECT card_name,issue_month,issue_year,issued_amount FROM 
(
SELECT card_name,issue_month,issue_year,issued_amount,
row_number() over(partition by card_name order by 
issue_year, issue_month) as rk
from monthly_cards_issued 
) T 
WHERE T.RK = 1



;with cte 
as 
(
SELECT card_name,issue_month,issue_year,issued_amount,
row_number() over(partition by card_name order by 
issue_year, issue_month) as rk
from monthly_cards_issued 
--WHERE RK =1

)
select card_name,issue_month,issue_year,issued_amount from cte 
where rk=1
order by issued_amount DESC


--Chase Sapphire Reserve	150000
--Chase Freedom Flex	55000


Chase Sapphire Reserve	170000	1	2021
Chase Sapphire Reserve	175000	2	2021
Chase Sapphire Reserve	180000	3	2021
Chase Freedom Flex	55000	1	2021-----------------------1
Chase Freedom Flex	60000	2	2021
Chase Freedom Flex	65000	3	2021
Chase Freedom Flex	70000	4	2021
Chase Sapphire Reserve	150000	11	2020------------------1

