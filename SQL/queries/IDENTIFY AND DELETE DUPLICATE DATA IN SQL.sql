
CREATE TABLE EP
    ( 
    [FirstName] Varchar(100), 
    [LastName] Varchar(100), 
    [Country] Varchar(100), 
    ) 
    GO 

insert into ep values ('harshit','soni','india')
insert into ep values ('ambika','soni','india')
insert into ep values ('harshit','soni','india')
insert into ep values ('ambika','soni','india')
insert into ep values ('janvi','soni','india')


select * from ep 

select firstname,lastname,country,count(*) as cnt 
from ep 
group by firstname,lastname,country
having count(*) >1

with cte 
as 
(
select *, 
ROW_NUMBER() over(PARTITION by FirstName,LastName,Country order by FirstName) as rn 
from ep 
)
--select * 
DELETE
from cte 
where rn >1


select * from ep 





CREATE TABLE Employe
    ( 
    [ID] INT identity(1,1), 
    [FirstName] Varchar(100), 
    [LastName] Varchar(100), 
    [Country] Varchar(100), 
    ) 
    GO 
    
    --Insert into Employe ([FirstName],[LastName],[Country] )values('Raj','Gupta','India'),
    --                            ('Raj','Gupta','India'),
    --                            ('Mohan','Kumar','USA'),
    --                            ('James','Barry','UK'),
    --                            ('James','Barry','UK'),
    --                            ('James','Barry','UK')

SELECT * FROM EMPLOYE 

--SELECT * INTO EMP2910 FROM Employe
--SELECT * INTO EMP2911 FROM Employe

SELECT * FROM EMPLOYE 

TRUNCATE TABLE EMPLOYE


SELECT * INTO EMPLOYE FROM EMP2911

SET IDENTITY_INSERT EMPLOYE ON 

INSERT INTO EMPLOYE 
SELECT *
FROM EMP2911

SET IDENTITY_INSERT EMPLOYE OFF

table 'EMPLOYE' can only be specified
1....when a column list is used and 
2....IDENTITY_INSERT is ON.



INSERT INTO EMPLOYE 
(
FirstName,
LastName,
Country
)
SELECT
FirstName,
LastName,
Country
FROM EMP2911


SELECT * FROM EMPLOYE


--SQL delete duplicate Rows using Group By and having clause

SELECT 
    [FirstName], 
    [LastName], 
    [Country], 
    COUNT(*) AS CNT ---------------AGGREGATE FUNCTION
FROM [Employe]
GROUP BY 
      [FirstName], 
      [LastName], 
      [Country]
HAVING COUNT(*) > 1;

SELECT *
    FROM [Employe]

SELECT MAX(ID)
FROM [Employe]
GROUP BY [FirstName], 
         [LastName], 
         [Country]

SELECT *
    FROM [Employe]
    WHERE ID NOT IN
    (
        SELECT MAX(ID)
        FROM [Employe]
        GROUP BY [FirstName], 
                 [LastName], 
                 [Country]
    );


DELETE FROM EMPLOYE
    WHERE ID NOT IN
    (
        SELECT MAX(ID)
        FROM [Employe]
        GROUP BY [FirstName], 
                 [LastName], 
                 [Country]
    );

-----------------------
--To remove this data, replace the first Select with the SQL delete statement as per the following query.

DELETE FROM [Employe]
    WHERE ID NOT IN
    (
        SELECT MAX(ID) AS MaxRecordID
        FROM [Employe]
        GROUP BY [FirstName], 
                 [LastName], 
                 [Country]
    );

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

--SQL delete duplicate Rows using Common Table Expressions (CTE)

SELECT * FROM EMPLOYE 


WITH CTE
AS 
(
SELECT [firstname], 
           [lastname], 
           [country], 
           ROW_NUMBER() OVER(PARTITION BY [firstname], 
                                          [lastname], 
                                          [country]
           ORDER BY id) AS DuplicateCount
    FROM [employe]
)
--SELECT *
DELETE 
FROM CTE
WHERE DuplicateCount>1




WITH CTE
AS 
(
SELECT [firstname], 
           [lastname], 
           [country], 
           ROW_NUMBER() OVER(PARTITION BY [firstname], 
                                          [lastname], 
                                          [country]
           ORDER BY id) AS DuplicateCount
    FROM [employe]
)
SELECT *
-----DELETE
FROM CTE
WHERE DuplicateCount >1

SELECT * FROM EMPLOYE 

(
SELECT *, 
        RANK() OVER(PARTITION BY firstname, 
                                 lastname, 
                                 country
        ORDER BY id) rank
 FROM [Employe]
 ) AS T 

------------------------------------------------

--SELECT 
--    E.ID, 
--    E.firstname, 
--    E.lastname, 
--    E.country, 
--    T.rank

DELETE E 
FROM [Employe] E
  INNER JOIN
(
 SELECT ID,FIRSTNAME,LASTNAME,Country, 
        RANK() OVER(PARTITION BY firstname, 
                                 lastname, 
                                 country
        ORDER BY id) rank
 FROM [Employe]
) T 
ON E.ID = t.ID
WHERE RANK >1

SELECT * FROM EMPLOYE 


----------------------

DELETE E
    FROM [Employe] E
         INNER JOIN
    (
        SELECT *, 
               RANK() OVER(PARTITION BY firstname, 
                                        lastname, 
                                        country
               ORDER BY id) rank
        FROM [Employe]
    ) T ON E.ID = t.ID
    WHERE rank > 1;

