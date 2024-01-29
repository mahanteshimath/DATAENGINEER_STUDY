--Signup Activation Rate [TikTok SQL Interview Question]

--New TikTok users sign up with their emails. 
--They confirmed their signup by replying to the text confirmation to activate their accounts. 
--Users may receive multiple text messages for account confirmation until they have confirmed their new account.

--A senior analyst is interested to know the activation rate of specified users in the emails table. 
---Write a query to find the activation rate.
---- Round the percentage to 2 decimal places.

--Definitions:

--emails table contain the information of user signup details.
--texts table contains the users' activation information.
--Assumptions:

--The analyst is interested in the activation rate of specific users in the emails table, 
--which may not include all users that could potentially be found in the texts table.
--For example, user 123 in the emails table may not be in the texts table and vice versa.
--Effective April 4th 2023, we added an assumption to the question to provide additional clarity.


CREATE TABLE EMAILS
(
EMAIL_ID INT,
USER_ID INT,
SIGNUP_DATE DATE
)

--INSERT INTO EMAILS VALUES(125,7771,'06-14-2022')
--INSERT INTO EMAILS VALUES(236,6950,'07-01-2022')
--INSERT INTO EMAILS VALUES(433,1052,'07-09-2022')
--INSERT INTO EMAILS VALUES(450,8963,'08-02-2022')
--INSERT INTO EMAILS VALUES(555,6633,'08-09-2022')
--INSERT INTO EMAILS VALUES(499,2500,'08-08-2022')

CREATE TABLE TEXTS
(
TEXT_ID INT,
EMAIL_ID INT,
SIGNUP_ACTION VARCHAR(20)
)


--INSERT INTO TEXTS VALUES(6878,125,'Confirmed')
--INSERT INTO TEXTS VALUES(6994,236,'Confirmed')
--INSERT INTO TEXTS VALUES(8950,450,'Not Confirmed')
--INSERT INTO TEXTS VALUES(6920,236,'Not Confirmed')
--INSERT INTO TEXTS VALUES(8966,450,'Not Confirmed')
--INSERT INTO TEXTS VALUES(8010,499,'Not Confirmed')
-------------------------------------------------------------------------------------------------------------------------------------


select * from emails 

select * from TEXTS


--select 2.00/6.00

--0.333333


SELECT count(e.user_id) as total_users FROM emails e  
inner join texts t on e.email_id = t.email_id

--6

SELECT count(e.user_id) as confirmed_users 
FROM emails e  
inner join texts t on e.email_id = t.email_id
where lower(t.signup_action) = 'Confirmed'

---multiple cte

;with cte 
as
(
SELECT count(e.user_id) as confirmed_users 
FROM emails e  
inner join texts t on e.email_id = t.email_id
where lower(t.signup_action) = 'Confirmed'
), cte2 
AS
(
SELECT count(e.user_id) as total_users FROM emails e  
inner join texts t on e.email_id = t.email_id
)
select cast(round(cast(confirmed_users as decimal(9,2))/cast(total_users as decimal(9,2)) *100,2) as decimal(5,2)) as Activation_Ratio
from cte2 ,cte






-------------------------------------------------------------------------------------------------------------------------------------
;with cte 
as 
(
SELECT count(e.user_id) as total_users FROM emails e  
inner join texts t on e.email_id = t.email_id
),cte2 as 
(
SELECT count(e.user_id) as confirmed_users 
FROM emails e  
inner join texts t on e.email_id = t.email_id
where lower(t.signup_action) = 'Confirmed'
)
(
select 
--CAST(confirmed_users AS DECIMAL(5,2))/CAST(total_users AS DECIMAL(5,2)),2))
cast(ROUND(CAST(confirmed_users AS DECIMAL(5,2))/CAST(total_users AS DECIMAL(5,2)),2) as decimal(5,2)) as confirm_rate
from cte,cte2 
)

--0.33
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
;with cte 
as 
(
SELECT count(e.user_id) as total_users FROM emails e  
inner join texts t on e.email_id = t.email_id
),cte2 as 
(
SELECT count(e.user_id) as confirmed_users 
FROM emails e  
inner join texts t on e.email_id = t.email_id
where lower(t.signup_action) = 'Confirmed'
),CTE3 AS
(
select 
ROUND(CAST(confirmed_users AS DECIMAL(5,2))/CAST(total_users AS DECIMAL(5,2)),2) as confirm_rate
from cte,cte2 
)
SELECT ROUND(CAST(confirm_rate AS DECIMAL(5,2)),2) FROM CTE3

