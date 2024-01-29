use [AdventureWorks2012]

-----PRIMARY KEY AND FOREIGN KEY RELATIONSHIPS AND OTHER PROPERTIES OF CREATING TABLE 
-----ON DELETE CASCADE ----------------1
-----ON DELETE SET NULL ---------------2
-----ON DELETE SET DEFAULT-------------3

drop table Countries

drop table States

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Countries
(
CountryID INT PRIMARY KEY,
CountryName VARCHAR(50),
CountryCode VARCHAR(3)
)

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE States
(
StateID INT PRIMARY KEY,
StateName VARCHAR(50),
StateCode VARCHAR(3),
CountryID INT,
CONSTRAINT FK_States_Countries
    FOREIGN KEY (CountryID)
    REFERENCES Countries (CountryID)
)

-----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Countries VALUES (1,'United States','USA')

INSERT INTO States VALUES (1,'Texas','TX',1)
INSERT INTO States VALUES (2,'Arizona','AZ',1)

delete from Countries where countryid =1


--Msg 547, Level 16, State 0, Line 1
--The DELETE statement conflicted with the REFERENCE constraint "FK_States_Countries". The conflict occurred in database "AdventureWorks2012", table "dbo.States", column 'CountryID'.
--The statement has been terminated.


SELECT * FROM Countries--------PARENT TABLE

SELECT * FROM States-----------CHILD TABLE

drop table Countries

--Msg 3726, Level 16, State 1, Line 1
--Could not drop object 'Countries' because it is referenced by a FOREIGN KEY constraint.

-----------------------------------------------------------------------------------------------------------------------------
drop table Countries

drop table States

-----------------------------------------------------------------------------------------------------------------------------
-----ON DELETE CASCADE ----------------1
-----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Countries
(
CountryID INT PRIMARY KEY,
CountryName VARCHAR(50),
CountryCode VARCHAR(3)
)

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE States
(
StateID INT PRIMARY KEY,
StateName VARCHAR(50),
StateCode VARCHAR(3),
CountryID INT,
CONSTRAINT FK_States_Countries
    FOREIGN KEY (CountryID)
    REFERENCES Countries (CountryID)
    ON DELETE CASCADE----------------------------add
)

-----------------------------------------------------------------------------------------------------------------------------
Select * from Countries 
Select * from States

INSERT INTO Countries VALUES (1,'United States','USA')
INSERT INTO States VALUES (1,'Texas','TX',1)
INSERT INTO States VALUES (2,'Arizona','AZ',1)

delete from Countries where countryid =1---------------THIS WILL DELETE DATA FROM THE CHILD TABLE AS WELL,
				--------------BECAUSE ON DELETE CASCADE IS USED WHILE CREATING THE CHILD TABLE

select * from states   

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
drop table Countries
drop table States
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Countries
(
CountryID INT PRIMARY KEY,
CountryName VARCHAR(50),
CountryCode VARCHAR(3)
)

-----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE States
(
StateID INT PRIMARY KEY,
StateName VARCHAR(50),
StateCode VARCHAR(3),
CountryID INT,
CONSTRAINT FK_States_Countries
    FOREIGN KEY (CountryID)
    REFERENCES Countries (CountryID)
    ON DELETE SET NULL------------------------constraints
)

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
Select * from Countries 
Select * from States

INSERT INTO Countries VALUES (1,'United States','USA')
INSERT INTO States VALUES (1,'Texas','TX',1)
INSERT INTO States VALUES (2,'Arizona','AZ',1)

delete from Countries where countryid =1

select * from states

--drop table Countries
--drop table States

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
drop table Countries

drop table States

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Countries
(
CountryID INT PRIMARY KEY,
CountryName VARCHAR(50),
CountryCode VARCHAR(3)
)

-----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE States
(
StateID INT PRIMARY KEY,
StateName VARCHAR(50),
StateCode VARCHAR(3),
CountryID INT DEFAULT 2,
CONSTRAINT FK_States_Countries
    FOREIGN KEY (CountryID)
    REFERENCES Countries (CountryID)
    ON DELETE SET DEFAULT 
)

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
Select * from Countries 
Select * from States

INSERT INTO Countries VALUES (1,'United States','USA')
INSERT INTO Countries VALUES (2,'India','IN')

INSERT INTO States VALUES (1,'Texas','TX',1)
INSERT INTO States VALUES (2,'Arizona','AZ',1)
INSERT INTO States VALUES (3,'Banglaore','IN',2)

delete from Countries where countryid =1

select * from states

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------



 