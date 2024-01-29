--String --  LTRIM, RTRIM, LEN, LEFT, RIGHT, LOWER, UPPER

---LTRIM

SELECT '     Five spaces are at the beginning of this string.';

     --Five spaces are at the beginning of this string.

     Five spaces are at the beginning of this string.

SELECT LTRIM('     Five spaces are at the beginning of this string.');

--Five spaces are at the beginning of this string.

Five spaces are at the beginning of this string.


---RTRIM

SELECT 'I have 10 years of experience        ';

I have 10 years of experience               

SELECT RTRIM('I have 10 years of experience        ');

--I have 10 years of experience

I have 10 years of experience


select len('        master sql with harshit bhadiyadra                       ')

--34


SELECT * FROM Sales.SalesOrderHeader

--10-4020-000676

SELECT LEN(AccountNumber) FROM Sales.SalesOrderHeader

SELECT 
AccountNumber,
LEFT(AccountNumber,2) AS ACC_NUM_2_DIGIT 
FROM Sales.SalesOrderHeader


SELECT 
AccountNumber,
RIGHT(AccountNumber,6) AS ACC_NUM_2_DIGIT 
FROM Sales.SalesOrderHeader



SELECT * FROM Production.Product

SELECT UPPER(Name) FROM Production.Product

SELECT LOWER(NAME) FROM Production.Product

SELECT * FROM Sales.SalesOrderHeader


--10-4020-000117

10

SELECT 
AccountNumber,
CHARINDEX('-',AccountNumber),
CHARINDEX('-',AccountNumber,4),
substring(accountnumber,1,CHARINDEX('-',AccountNumber)-1) as first_two_digit_account_num,
SUBSTRING(AccountNumber,CHARINDEX('-',AccountNumber)+1,CHARINDEX('-',AccountNumber)+1),
* FROM Sales.SalesOrderHeader



SELECT 
AccountNumber,
CHARINDEX('-',AccountNumber),
CHARINDEX('-',AccountNumber,4),
SUBSTRING(AccountNumber,1,CHARINDEX('-',AccountNumber)-1),
SUBSTRING(ACCOUNTNUMBER,CHARINDEX('-',AccountNumber)+1,CHARINDEX('-',AccountNumber)+1), 
SUBSTRING(ACCOUNTNUMBER,CHARINDEX('-',AccountNumber,4)+1,LEN(AccountNumber)) 
FROM Sales.SalesOrderHeader

SELECT PATINDEX('%schools%', 'W3Schools.com');


select * into sales.salesorder 
from Sales.SalesOrderHeader

--(31465 row(s) affected)


select * from sales.salesorder 





