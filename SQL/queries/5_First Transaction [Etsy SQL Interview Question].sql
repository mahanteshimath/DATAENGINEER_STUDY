----First Transaction

--Assume you're given a table containing Etsy user transactions. 
---Write a query that retrieves the customers whose first transaction was valued at $50 or more. 
----Output the total number of users who meet this criteria.

--Instructions:

--To determine the first transaction for each user, use the transaction_date field.
--Take into account scenarios where a user had multiple transactions on the same day. 
--Use a specific function (we can't give too much away 😉) to handle these cases 
--and correctly identify the first transaction.

--drop table user_transactions

--CREATE table user_transactions 
--(
--transaction_id int,
--user_id int,
--spend decimal(9,2),
--transaction_date date
--)

--insert into user_transactions values(615348,145,36.3,'03-22-2022')
--insert into user_transactions values(137424,156,151,'04-04-2022')
--insert into user_transactions values(759274,111,49.5,'02-03-2022')
--insert into user_transactions values(850371,111,51,'03-15-2022')
--insert into user_transactions values(248475,156,87,'04-16-2022')
--insert into user_transactions values(563301,180,78.5,'03-25-2022')
--insert into user_transactions values(968585,268,47.3,'03-24-2022')
--insert into user_transactions values(632020,179,36.89,'04-29-2022')
--insert into user_transactions values(120562,268,96.7,'02-28-2022')
--insert into user_transactions values(362514,179,250,'05-23-2022')
--insert into user_transactions values(563021,180,36.89,'06-28-2022')
--insert into user_transactions values(248476,156,78.9,'04-04-2022')

;WITH CTE 
AS 
(
SELECT 
transaction_id,user_id,spend,transaction_date,
ROW_NUMBER() OVER(PARTITION BY USER_ID ORDER BY TRANSACTION_DATE) AS RK  
FROM user_transactions
)
SELECT COUNT(USER_ID) AS TOTAL_USERS 
FROM CTE 
WHERE SPEND >=50.00
AND RK =1




759274	111	49.50	2022-02-03----TRAN-1 BUT NO >50$
850371	111	51.00	2022-03-15
615348	145	36.30	2022-03-22
137424	156	151.00	2022-04-04------------TRANS-1 WHICH IS > 50$
248476	156	78.90	2022-04-04
248475	156	87.00	2022-04-16
632020	179	36.89	2022-04-29
362514	179	250.00	2022-05-23
563301	180	78.50	2022-03-25------------TRANS-1 WHICH IS >50$
563021	180	36.89	2022-06-28
120562	268	96.70	2022-02-28------------
968585	268	47.30	2022-03-24


select user_transactions.user_id,SPEND,transaction_date,
rank() over(partition by user_id order by transaction_date ASC) as first_tran 
from user_transactions 


select 
count(distinct user_id) as users
from  
(
select user_transactions.user_id,SPEND,transaction_date,
rank() over(partition by user_id order by transaction_date ASC) as first_tran 
from user_transactions 
) t 
where T.spend >=50.00
and first_tran =1

-----------------------------------------------------------------------------------------------------------------
--users
--3
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
;with cte 
as 
(
select 
user_id,
spend,
row_number() over(PARTITION by user_id order by transaction_date) as rk
from  user_transactions 
)
select count(user_id) as user_id
from cte 
where rk =1
and spend >50.0

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

