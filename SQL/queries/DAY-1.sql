--use adventureworks2012
--What is Database ?

--What is a table ?------------information or collection of some kind of data

--What is row and column ?

--What are the different types of commands in SQL ?
------DML-----INSERT,UPDATE,DELETE
------DDL-----CREATE,ALTER,DROP,TRUNCATE
------TCL-----COMMIT,ROLLBACK
------DCL-----GRANT,REVOKE
------DQL-----SELECT


--What are the Constraints in SQL?

--SQL constraints are used to specify rules for the data in a table. 
--Constraints are used to limit the type of data that can go into a table. -----------------------
--This ensures the accuracy and reliability of the data in the table. 
--If there is any violation between the constraint and the data action, the action is aborted.


--Insert into Some table from some table (We should have table created with same structure)

--Select * into some table from some table 

--Select * into some table from some table  where 1=2 (Copy only the structure not the data)

-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
--Data Definition Language - DDL  ----CREATE, ALTER, DROP , TRUNCATE--------------

--Data Manipulation Language - DML ----INSERT , UPDATE, DELETE

--Data Control Language - DCL  -----GRANT, REVOKE--these options are not used by data engineers, or data analysts 
-------------or data scientists or any freshers 
---------DBAs only they exp peoples

--Transaction Control Language - TCL ---- COMMIT, ROLLBACK

--rollback -----------revert your changes to a table it goes to the initial stage

--commit ----------over changes will be permanently commited to the table

--Data Query/Retrieval Language _ DQL ---- SELECT=----------mostly used and most important

--database integrity and referential integrity amongst different objects/tables in the database 

--primary key is the combination of unique key constraint and not null contraints


----------------------------Constraints
--Primary Key-------------customer id in bank data base is primary key ----it will be unique and it will be not null both
--Foreign
--Unique----------phone number ------there is no duplicate values in unique key and it is allowed only 1 null value
--Not null------email-----------there is no null value will be there in email id column 
--CHECK-------------<0   we cannot enter less than 0
--null-------will allow any number of null values in the table
--default ----------------------------------in that kind of scenario default constraints is used

use AdventureWorks2012

DROP TABLE customer

set IDENTITY_INSERT customer OFF 


--What is Identity in SQL ?
--The IDENTITY keyword is a property in SQL Server. When a table column is defined with an identity property, 
--its value will be auto-generated incremental value. This value is created by the server automatically. 
--Therefore, we can't manually enter a value into an identity column as a user.

identity(5,15)
customerid identity(starting with,increment by)
--1 2 3 4 5 6 7

--5
--20+15
--35+15
--50


 --if we create primary key with two columns than it is known as composite primary key

create table customer
(
customerid int identity(1,1) primary key,---------------------unique values into the column as well as not null values 
												-------identity will generate continuous values in a column 	
												----start with 1 and jump to 1 only 1,2,3,4.....									

customernumber int not null unique check (customernumber>0),----------there must be a value and it will be unique no duplicates are allowed
emailadd varchar(30) unique,   -- emaild id will always be the unique for all customers , no duplicate values are allowed in this column
lastname varchar(30) not null,-----------column must have values,,,,,,,both will be allowed the duplicates values
firstname varchar(30) not null,---------------
middlename varchar(30) null,---------it can be any null values or all the null values it will accept
areacode int default 71000,---------it will generate default value if we not enter at the time of insert
address varchar(50),
country varchar(50) default 'Malaysia'
)


DELETE
RESEED THE IDENTITY TO ITS INITIAL VALUE(1)




select * from customer

--Command(s) completed successfully.

alter table customer 
add phonenumber int 

select * from customer

SP_HELP customer----------to check the table structure and other properties of the table




insert into customer values
(100,'fyung@gmail.com','Fang Ying','Sham','M','418999','sdadasfdfd',default,11111111),
(200,'meimei@yahoo.com','Mei Mei','Tan','K',default,'adssdsadsd','Thailand',2222222),
(300,'albert.john@yahoo.com','Albert','John','J',default,'dfdsfsdf',default,333333)
--(3 row(s) affected)

select * from customer



create table customer
(
customerid int identity(1,1) primary key,---------------------unique values into the column as well as not null values 
												-------identity will generate continuous values in a column 	
												----start with 1 and jump to 1 only 1,2,3,4.....									

customernumber int not null unique check (customernumber>0),----------there must be a value and it will be unique no duplicates are allowed
emailadd varchar(30) unique,   -- emaild id will always be the unique for all customers , no duplicate values are allowed in this column
lastname varchar(30) not null,-----------column must have values,,,,,,,both will be allowed the duplicates values
firstname varchar(30) not null,---------------
middlename varchar(30) null,---------it can be any null values or all the null values it will accept
areacode int default 71000,---------it will generate default value if we not enter at the time of insert
address varchar(50),
country varchar(50) default 'Malaysia'
)

insert into customer values (0,'albertjohn@gmail.com','Albert','John','K',default,'dfdsfsdf',default,'44444444')----------To verify check constraint is working or not

--Msg 547, Level 16, State 0, Line 1
--The INSERT statement conflicted with the CHECK constraint "CK__customer__custom__56BECA79". 
--The conflict occurred in database "AdventureWorks2012", table "dbo.customer", column 'customernumber'.
--The statement has been terminated.

insert into customer values (400,'xyz@yahoo.com','Albert',NULL,'L',default,'dfdsfsdf',default,99999999)----------To verify NULL constraint is working or not


insert into customer values (500,null,'Albert','harry','jennifer',default,'dfdsfsdf',default,999999)----------To verify NULL constraint is working or not
-----------------------Null constraint is allowed only 1 null value in the table

insert into customer values (600,null,'Albe','harry','jenni',default,'dfdsfsdf',default,0988888)------------------To verify NULL constraint is working or not

insert into customer values (6660,'addkd!@abc.com','Albe','harry','jenni',default,'dfdsfsdf',default,0988888)------------------To verify NULL constraint is working or not

select * from customer

insert into customer values (400,'albert.john@yahoo.com','Albert','John','J',default,'dfdsfsdf',default,9999999)

insert into customer values (0,'albertjohn@gmail.com','Albert','John','K',default,'dfdsfsdf',default,009)                       ----------To verify check constraint is working or not

insert into customer values (4440,'xyzabc@yahoo.com','Albertttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt','abc','L',default,'dfdsfsdf',default,999999)                               ----------To verify NULL constraint is working or not

--Msg 8152, Level 16, State 14, Line 1
--String or binary data would be truncated.
--The statement has been terminated.

insert into customer values
(5600,'fyunhng@gmail.com','Fang Ying','Sham','M','418999','sdadasfdfd',default,11111111)

create table customer
(
customerid int identity(1,1) primary key,---------------------unique values into the column as well as not null values 
												-------identity will generate continuous values in a column 	
												----start with 1 and jump to 1 only 1,2,3,4.....									

customernumber int not null unique check (customernumber>0),----------there must be a value and it will be unique no duplicates are allowed
emailadd varchar(30) unique,   -- emaild id will always be the unique for all customers , no duplicate values are allowed in this column
lastname varchar(30) not null,-----------column must have values,,,,,,,both will be allowed the duplicates values
firstname varchar(30) not null,---------------
middlename varchar(30) null,---------it can be any null values or all the null values it will accept
areacode int default 71000,---------it will generate default value if we not enter at the time of insert
address varchar(50),
country varchar(50) default 'Malaysia'
)

select * from customer



set IDENTITY_INSERT customer on 

insert into customer 
(
customerid	
,customernumber	
,emailadd	
,lastname	
,firstname	
,middlename	
,areacode	
,address	
,country	
,phonenumber
)
values
(20,7670,'ffyFGJHnhng@gmail.com','Fang Ying','Sham','M','418999','sdadasfdfd',default,11111111)

--(1 row(s) affected)


Msg 8101, Level 16, State 1, Line 1
An explicit value for the identity column in table 'customer' can only be specified 
when a column list is used 

and IDENTITY_INSERT is ON.-----------------THIS IS DONE


set IDENTITY_INSERT customer on 

insert into customer  
(
customerid,
customernumber	
,emailadd	
,lastname	
,firstname	
,middlename	
,areacode	
,[address]	
,country
,phonenumber
) VALUES (8,6400,'xyzlkabc@yahoo.com','Albertttttttttttttttt','abc','L',default,'dfdsfsdf','hhh',988)                               ----------To verify NULL constraint is working or not


set IDENTITY_INSERT customer OFF 


--Msg 544, Level 16, State 1, Line 1
--Cannot insert explicit value for identity column in table 'customer' when IDENTITY_INSERT is set to OFF.


--Msg 8152, Level 16, State 14, Line 1
--String or binary data would be truncated.
--The statement has been terminat

SET IDENTITY_INSERT AdventureWorks2012.DBO.CUSTOMER ON

insert into customer  
(
customerid,
customernumber	
,emailadd	
,lastname	
,firstname	
,middlename	
,areacode	
,[address]	
,country
,phonenumber
) VALUES (400,123,'xyzabc@yahoo.com','Alberttttt','abc','L',default,'dfdsfsdf',default,999999)                               ----------To verify NULL constraint is working or not

SET IDENTITY_INSERT AdventureWorks2012.DBO.CUSTOMER OFF

insert into customer values (600,'xyzabcD@yahoo.com','Albertttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt','abc','L',default,'dfdsfsdf',default,999999)                               ----------To verify NULL constraint is working or not



SET IDENTITY_INSERT AdventureWorks2012.[Sales].[SalesOrderDetails_bkp_20230916_BKPP] OFF;

SELECT * FROM CUSTOMER

insert into customer 
(
customerid
,customernumber
,emailadd
,lastname
,firstname
,middlename
,areacode
,address
,country
,phonenumber
)
values (7,700,'xyzaFbcD@yahoo.com','Albertttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt','abc','L',default,'dfdsfsdf',default,999999)                               ----------To verify NULL constraint is working or not


Msg 8101, Level 16, State 1, Line 1
An explicit value for the identity column in table 'customer' can only be specified when a column list is used and IDENTITY_INSERT is ON.



SELECT * FROM CUSTOMER

--(1 row(s) affected)

Msg 8152, Level 16, State 14, Line 1
String or binary data would be truncated.
The statement has been terminated.


select * from customer

SELECT COUNT(1) FROM customer

SELECT COUNT(emailadd) FROM customer

SELECT COUNT(*) FROM customer

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
sp_help customer------------------------------------------------16-7-2023
------------------------------------------------------------------------------------------------------------------------------

select * from customer

select top 2 * from customer

select top 70 percent * from customer


sp_help customer


alter table customer 
alter column lastname varchar(600)


----------------------------------------------------------------------------------------------------------------------------------------
drop table dbo.customer-------------------16-7-2023

select * from customer


----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--sort result (by default is ascending)

select firstname, lastname from customer
order by lastname desc



select firstname, lastname from customer
order by 2 desc -- Order By Based on column no. without typing column name


--distinct: only show unique value
select distinct firstname,lastname from customer
order by lastname ASC  --------if we have not written over here desc than it will automatically choose the asc order, we do not need to 
------mention asc specificially 

select distinct firstname,lastname from customer
order by lastname   --------if we have not written over here desc than it will automatically choose the asc order, we do not need to 
------mention asc specificially 


---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
-----------CREATE TABLE STRUCTURE FROM SELECT STATEMENT WITHOUT DATA
select top 2 * from  [Sales].[SalesOrderDetail]

create table empp1 
( 
id int,
name varchar(10)
)

insert into empp1 values(1,'abc')
insert into empp1 values(2,'xyz')
insert into empp1 values(NULL,NULL)

SELECT * FROM EMPP1

SELECT COUNT(*) FROM EMPP1

SELECT COUNT(1) FROM EMPP1



insert into [Sales].[SalesOrderDetail] values(null,null,null,null,null,null,null,null,null,null,null)


Select *  from [Sales].[SalesOrderDetail]

select * from [Sales].[SalesOrderDetails_bkp_20230916]


select * from [Sales].[SalesOrderDetails_bkp_20230916]

drop table [Sales].[SalesOrderDetails_bkp_20230916]

Select * into [Sales].[SalesOrderDetails_bkp_20230916]
from [Sales].[SalesOrderDetail] where 1=1

--(0 row(s) affected)

Select * into [Sales].[SalesOrderDetails_bkp_20230916_bkp]
from [Sales].[SalesOrderDetail] ----where 1=2

--(121317 row(s) affected)



select * from [Sales].[SalesOrderDetails_bkp_20230907]

Select count(1) from [Sales].[SalesOrderDetail]

select count(1) from [Sales].[SalesOrderDetails_bkp_20230907_bkpp]

truncate table [Sales].[SalesOrderDetails_bkp_20230907_bkpp]



(121317 row(s) affected)

DROP TABLE [Sales].[SalesOrderDetails_bkp_20230916_bkpp]

Select * into [Sales].[SalesOrderDetails_bkp_20230916_bkpp] from [Sales].[SalesOrderDetail]
where 1=2;


SELECT * FROM [Sales].[SalesOrderDetails_bkp_20230916_bkpp]


--(0 row(s) affected)


SELECT * INTO AdventureWorks2012.[Sales].[SalesOrderDetails_bkp_20230916_BKPP]
FROM [Sales].[SalesOrderDetail] 

SELECT * FROM [Sales].[SalesOrderDetail] 


BEGIN TRAN ABC

UPDATE [Sales].[SalesOrderDetail] 
SET UNITPRICE =333333333

ROLLBACK 



--(121317 row(s) affected)



--WHERE SalesOrderID = 43677


SET IDENTITY_INSERT AdventureWorks2012.[Sales].[SalesOrderDetails_bkp_20230916_BKPP] ON;

SET IDENTITY_INSERT AdventureWorks2012.[Sales].[SalesOrderDetails_bkp_20230916_BKPP] OFF;


truncate table AdventureWorks2012.[Sales].[SalesOrderDetails_bkp_20230907]


INSERT INTO AdventureWorks2012.[Sales].[SalesOrderDetails_bkp_20230916_BKPP]
(
SalesOrderID	
,SalesOrderDetailID	
,CarrierTrackingNumber	
,OrderQty	
,ProductID	
,SpecialOfferID	
,UnitPrice	
,UnitPriceDiscount	
,LineTotal	
,rowguid	
,ModifiedDate
)
SELECT 
SalesOrderID	
,SalesOrderDetailID	
,CarrierTrackingNumber	
,OrderQty	
,ProductID	
,SpecialOfferID	
,UnitPrice	
,UnitPriceDiscount	
,LineTotal	
,rowguid	
,ModifiedDate
FROM [Sales].[SalesOrderDetail]


--(121317 row(s) affected)



Msg 544, Level 16, State 1, Line 1
Cannot insert explicit value for identity column in table 'SalesOrderDetails_bkp_20230916_BKPP' when IDENTITY_INSERT is set to OFF.



SELECT * FROM [Sales].[SalesOrderDetails_bkp_20230907]

--------------------------------------------------------------------
--------------SAVE THIS DATA INTO THE ANOTHER TABLE
SELECT * FROM [Production].[ProductDescription]
--(762 row(s) affected)


SELECT * INTO [Production].[ProductDescription_BKP] FROM [Production].[ProductDescription]

--(762 row(s) affected)

select * from [Production].[ProductDescription_BKP]

--Msg 208, Level 16, State 1, Line 1
--Invalid object name 'Production.ProductDescription_BKP'.



SELECT * FROM [Production].[ProductDescription_BKP]



drop table [Production].[ProductDescription_BKP]


--------------------------------------------------------------------------------------------------
