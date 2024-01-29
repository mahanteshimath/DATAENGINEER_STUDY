
CREATE TABLE books
(
id int,
title varchar(50),
type varchar(50),
author_id int,
editor_id int,
translator_id int
)

--insert into books values(1,'Time to Grow Up!','original',11,21,Null)
--insert into books values(2,'Your Trip','translated',15,22,32)
--insert into books values(3,'Lovely Love','original',14,24,Null)
--insert into books values(4,'Dream Your Life','original',11,24,Null)
--insert into books values(5,'Oranges','translated',12,25,31)
--insert into books values(6,'Your Happy Life','translated',15,22,33)
--insert into books values(7,'Applied AI','translated',13,23,34)
--insert into books values(8,'My Last Book','original',11,28,Null)

CREATE TABLE authors
(
id int,
first_name varchar(30),
last_name varchar(30)
)

--insert into authors values(11,'Ellen','Writer')
--insert into authors values(12,'Olga','Savelieva')
--insert into authors values(13,'Jack','Smart')
--insert into authors values(14,'Donald','Brain')
--insert into authors values(15,'Yao','Dou')

SELECT * FROM authors


CREATE TABLE editors
(
id int,
first_name varchar(30),
last_name varchar(30)
)

--insert into editors values(21,'Daniel','Brown')
--insert into editors values(22,'Mark','Johnson')
--insert into editors values(23,'Maria','Evans')
--insert into editors values(24,'Cathrine','Roberts')
--insert into editors values(25,'Sebastian','Wright')
--insert into editors values(26,'Barbara','Jones')
--insert into editors values(27,'Matthew','Smith')

SELECT * FROM editors

CREATE TABLE translators
(
id int,
first_name varchar(30),
last_name varchar(30)
)


--insert into translators values(31,'Ira','Davies')
--insert into translators values(32,'Ling','Weng')
--insert into translators values(33,'Kristian','Green')
--insert into translators values(34,'Roman','Edwards')

SELECT * FROM translators

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM books
SELECT * FROM authors

SELECT * FROM editors
SELECT * FROM translators

--Example #1
--Let’s say we want to show book titles along with their authors (i.e., the author’s first name and last name). 
--The book titles are stored in the books table, 
--and the author names are stored in the authors table.
--In our SQL query, we’ll join these two tables by matching the author_id column from the books table 
--and the id column from the authors table:


SELECT b.title,a.first_name as Authors_FIrst_Name, a.last_name as Authors_last_name 
FROM BOOKS b 
JOIN authors a on b.author_id = a.id


--SELECT B.ID,B.TITLE,A.first_name,A.last_name 
--FROM BOOKS B 
--INNER JOIN AUTHORS A 
--	ON B.AUTHOR_ID = A.ID 


SELECT * FROM books
SELECT * FROM translators


--Example #2
--In our second example, we’ll be displaying books along with their translators 
--(i.e., the translator’s last name). Only half of our books have been translated and thus have a corresponding translator.
-- So, what would be the result of joining the books and translators tables using INNER JOIN?

select b.title,b.type,b.translator_id,t.id,t.first_name,t.last_name 
from books b 
FULL join translators t on b.translator_id = t.id




--SELECT B.ID,B.title,B.TYPE,T.first_name,T.last_name 
--FROM BOOKS B 
--INNER JOIN TRANSLATORS T 
--	ON B.translator_id= T.id

--Example #3
--For instance, let’s say that we want to display information about each book’s author and translator 
--(i.e., their last names). We also want to keep the basic information about each book (i.e., id, title, and type).

SELECT * FROM books
SELECT * FROM authors
SELECT * FROM editors
SELECT * FROM translators

SELECT B.title,A.last_name,T.last_name,B.id,B.type 
FROM BOOKS B 
LEFT JOIN AUTHORS A ON B.author_id = A.id
LEFT JOIN translators T ON T.ID = B.translator_id

--SELECT
--B.title,B.type,B.author_id,B.translator_id,
--A.first_name AS Authoer_firstname,A.last_name as Author_last_name,
--T.first_name as Translator_FIrst_name,T.last_name as Translator_last_name
--FROM BOOKS B 
--LEFT OUTER JOIN authors A ON B.author_id = A.id
--LEFT OUTER JOIN translators T ON B.translator_id = T.id



--Example #4
--This time, we want to show the basic book information (i.e., ID and title) along with the last names of the corresponding editors.
--Again, we want to keep all of the books in the result set. So, what would be the query?


SELECT B.title,B.type,B.editor_id,E.first_name,E.last_name 
FROM BOOKS B 
LEFT JOIN editors E ON B.editor_id = E.id



--Example #5
--Let’s repeat our previous example, but this time, our task will be to keep all of the records from the editors table. 

SELECT B.ID,B.title,B.type,B.editor_id,E.first_name,E.last_name,E.id 
FROM BOOKS B 
RIGHT OUTER JOIN editors E ON B.editor_id = E.id


	--Example #6
	--To start with, let’s again join the books and editors tables, but this time, we’ll be keeping all records from both tables. 

SELECT B.ID,B.title,B.type,B.editor_id,E.first_name,E.last_name,E.id 
FROM BOOKS B 
FULL JOIN editors E ON B.editor_id = E.id

SELECT * FROM books
SELECT * FROM authors
SELECT * FROM editors
SELECT * FROM translators



--Example #7
--In our final example, we want to join all four tables to get information about all of 
--the books, authors, editors, and translators in one table. 
--So, we’ll be using FULL JOIN throughout our SQL query


SELECT 
B.ID,B.title,B.type,B.author_id,B.editor_id,B.translator_id,
A.id,A.first_name,A.last_name,
E.ID,E.first_name,E.last_name,
T.id,T.first_name,T.last_name
FROM books B 
FULL JOIN authors A ON B.author_id=A.id
FULL JOIN editors E ON B.editor_id = E.id
FULL JOIN translators T ON B.translator_id = T.id


SELECT A.id,B.id 
FROM TABLE_A A 
FULL JOIN TABLE_B B ON A.id = B.id


SELECT * FROM TABLE_A,TABLE_B


