use [AdventureWorks2012]

--Simple CASE statement compares an expression to constant values,
 
--while the Searched CASE statement evaluates conditions.
-----------------------------------------------------------------------------------------------
--Simple CASE statement compares an expression
--to constant values, 
--while the Searched CASE
--statement evaluates conditions.


CREATE TABLE STUDENT
(
NAME VARCHAR(20),
GRADE VARCHAR(5),
GRADE_CATEGORY VARCHAR(50)
)

--INSERT INTO STUDENT VALUES('HARSHIT','A',NULL)

--INSERT INTO STUDENT VALUES('JANVI','B',NULL)

--INSERT INTO STUDENT VALUES('SAGAR','C',NULL)

--INSERT INTO STUDENT VALUES('KAJAL','C',NULL)

--INSERT INTO STUDENT VALUES('RAJ','A',NULL)

--INSERT INTO STUDENT VALUES('ASHWINI','B',NULL)

--INSERT INTO STUDENT VALUES('SNEHA','A',NULL)

SELECT * FROM STUDENT


SELECT DISTINCT GRADE FROM STUDENT


SELECT NAME,GRADE, 
CASE GRADE WHEN 'A' THEN 'EXCELLENT'
		   WHEN 'B' THEN 'GOOD'
		   WHEN 'C' THEN 'POOR' END	

FROM STUDENT

UPDATE STUDENT SET GRADE_CATEGORY = NULL

------------------------------------------------------------
UPDATE STUDENT       -------------1ST APPROACH
SET GRADE_CATEGORY = 
CASE GRADE WHEN 'A' THEN 'EXCELLENT'
		   WHEN 'B' THEN 'GOOD'
		   WHEN 'C' THEN 'POOR' END	


--(7 row(s) affected)

------------------------------------------------------------
UPDATE STD ---------------2ND APPROACH=----------TABLE NAME AS ALIAS NAME TABLE NAME STUDENT AND ALIAS NAME STD
SET 
GRADE_CATEGORY = 
CASE GRADE WHEN 'A' THEN 'EXCELLENT'
		   WHEN 'B' THEN 'GOOD'
		   WHEN 'C' THEN 'POOR' END	
FROM STUDENT AS STD


------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PERSONSS
(
PERSON_NAME VARCHAR(50),
AGE INT,
AGE_CATEGORY VARCHAR(50)
)

--INSERT INTO PERSONSS VALUES('HARSHIT',35,NULL)

--INSERT INTO PERSONSS VALUES('JITESH',13,NULL)

--INSERT INTO PERSONSS VALUES('JANVI',25,NULL)

--INSERT INTO PERSONSS VALUES('MANISH',14,NULL)

--INSERT INTO PERSONSS VALUES('JITESHI',28,NULL)

--INSERT INTO PERSONSS VALUES('FRANTY',38,NULL)

--INSERT INTO PERSONSS VALUES('HEMA',78,NULL)

----------------SEARCH CASE EXPRESSION

SELECT * FROM PERSONSS


SELECT PERSON_NAME,AGE,
CASE WHEN AGE <=20 THEN 'TEEN AGE' 
							WHEN AGE >=20 AND AGE<50 THEN 'ADULT'
							WHEN AGE >=50 THEN 'SENIOR' END
FROM PERSONSS

							 							  

UPDATE PERSONSS 
SET AGE_CATEGORY = 
CASE WHEN AGE <=20 THEN 'TEEN AGE' 
							WHEN AGE >=20 AND AGE<50 THEN 'ADULT'
							WHEN AGE >=50 THEN 'SENIOR' END

