-------------------------------------------------------------------------------------------------------------------
--Different categories SQL 

--String -------------
--Mathematical 
--Date 
-------------------------------------------------------------------------------------------------------------------
--STUFF 
--PATINDEX
--CHARINDEX 
--LEFT 
--SUBSTRING 
--REPLICATE
--REPLACE

--UPPER
--LOWER
--RIGHT

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

--SQL Server STUFF() function overview
--The STUFF() function deletes a part of a string and 
--then inserts a substring into the string, beginning at a specified position.

--The following shows the syntax of the STUFF() function:

--STUFF ( input_string , start_position , length , replace_with_substring )

--Code language: SQL (Structured Query Language) (sql)
--The STUFF() function accepts four arguments:


--input_string is the character string to be processed.
--start_position is an integer that identifies the position to start deletion and insertion. If start_position is negative, zero, or longer than the length of the string, the function will return NULL.
--length specifies the number of characters to delete. If the length is negative, the function returns NULL. If  length is longer than the length of the input_string, the function will delete the whole string. In case length is zero, the function will insert the replace_with_substring at the beginning of the input_string.
--replace_with_substring is a substring that replaces length characters of the input_string beginning at start_position.

--SQL Server STUFF() function examples

--Let’s take some examples of using the SQL Server STUFF() function.

--A) Using STUFF() function to insert a string into another string at a specific Location

--This example uses the STUFF() function to delete the first three characters of the string 'SQL Tutorial' 
--and then insert the string 'SQL Server' at the beginning of the string:

--SQL 
--SQL Server

SELECT 
    STUFF('SQL Tutorial', 1 , 3, 'SQL Server') result;

--SQL Server Tutorial


--B) Using the STUFF() function to convert time from HHMM to HH:MM
--The following example uses the STUFF() function to insert the colon (:) at the middle of the time in the format HHMM 
--and returns the new time value in the format HH:MM:

SELECT 
    STUFF('1230', 3, 0, ':') AS formatted_time;

--12:30


--C) Using the STUFF() function to format date from MMDDYYY format to MM/DD/YYYY:
--The following example calls the STUFF() function twice to format a date from MMDDYYY to MM/DD/YYY:

SELECT 
    STUFF('03102019', 3, 0, '/') formatted_date;

03/102019
03/10/2019

SELECT 
    STUFF(STUFF('03102019', 3, 0, '/'), 6, 0, '/') formatted_date;


--D) Using the STUFF() function to mask credit card numbers
--This example uses the STUFF() function to mask a credit card number. It reveals only the last four characters of the credit card no:

--4882584254460197
--XXXXXXXXXXXX0197

DECLARE 
    @ccn VARCHAR(20) = '4882584254460197';

SELECT LEN(@ccn) - 4


--4882584254460197
--XXXXXXXXXXXX0197


DECLARE 
    @ccn VARCHAR(20) = '4882584254460197';

SELECT 
    STUFF(@ccn, 1, LEN(@ccn) - 4, REPLICATE('X', LEN(@ccn) - 4))
    credit_card_no;


--XXXXXXXXXXXX0197


CREATE TABLE TEMP 
(
ID INT,
NAME VARCHAR(10)
)

INSERT INTO TEMP VALUES(1,'JANVI'),(2,'HARSHIT'),(3,'AMBIKA'),(4,'ADITI')

SELECT * FROM TEMP 

--JANVI,HARSHIT,AMBIKA,ADITI

JANVI -------ALL EMAIL ID OF THAT PARTICULAR PERSON IN SINGLE COLUMN AND SINGLE ROW WITH COMMA SEPARATED

SELECT ID, 
    abc = STUFF(
                 (SELECT ';' + name FROM temp FOR XML PATH ('')), 1, 1, ''
               ) 
FROM temp GROUP BY id


JANVI;HARSHIT;AMBIKA;ADITI

--Here is how it works:

--1. Get XML element string with FOR XML

--Adding FOR XML PATH to the end of a query allows you to output the results of the query as XML elements, 
--with the element name contained in the PATH argument. For example, if we were to run the following statement:

SELECT ',' + name 
              FROM temp1
              FOR XML PATH ('')

--By passing in a blank string (FOR XML PATH('')), we get the following instead:

--,aaa,bbb,ccc,ddd,eee
--2. Remove leading comma with STUFF

--The STUFF statement literally "stuffs” one string into another, replacing characters within the first string. We, however, are using it simply to remove the first character of the resultant list of values.

SELECT abc = STUFF((
            SELECT ',' + NAME
            FROM temp
            FOR XML PATH('')
            ), 1, 1, '')
FROM temp


--In this tutorial, you have learned how to use the SQL Server STUFF() function to delete a part of a string 
--and insert a new substring, starting at a specified position.

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
--SQL Server CHARINDEX Function


--SQL Server CHARINDEX() function searches for a substring inside a string starting from a specified location. 
--It returns the position of the substring found in the searched string, or zero if the substring is not found. 
--The starting position returned is 1-based, not 0-based.

--The following shows the syntax of the CHARINDEX() function:

--CHARINDEX(substring, string [, start_location])


--In this syntax:

--substring is the substring to search for. Its length is limited to 8,000 characters.
--string can be a literal string, expression or column. It is a string to search.
--start_location is the location at which the search starts. The start_location is an integer, big integer or an expression that evaluates to a value of those data types.
--The start_location parameter is optional. If it is skipped, zero, or negative value, the search starts at the beginning of the string.

--SQL Server CHARINDEX() function examples


--A) Using CHARINDEX() to perform a single search
--The following example uses the CHARINDEX() function to perform a simple search of the string 'SQL' 
--in the 'SQL Server CHARINDEX'

SELECT 
    CHARINDEX('SQL', 'SQL Server CHARINDEX') position;

--B) Using CHARINDEX() function to perform a case-insensitive search
--This statement shows a case-insensitive search for the string 'SERVER' in 'SQL Server CHARINDEX':

SELECT 
    CHARINDEX(
        'SERVER', 
        'SQL Server CHARINDEX'
    ) position;


--C) Using CHARINDEX() function to perform a case-sensitive search
--The following example shows a case-sensitive search for the string 'SERVER' in searched string SQL Server CHARINDEX.

SELECT 
    CHARINDEX(
        'SERVER', 
        'SQL Server CHARINDEX' 
        COLLATE Latin1_General_CS_AS
    ) position;


--D) Using CHARINDEX() function to search for a nonexistent substring
--The following example illustrates a search for the substring 'needle' in the string 'This is a haystack'

DECLARE @haystack VARCHAR(100);  
SELECT @haystack = 'This is a haystack';  
SELECT CHARINDEX('needle', @haystack);  


--E) Using CHARINDEX() function to searching from a specific position
--This example uses the start_location parameter to start the search for 'is' at the fifth and tenth character of the string 'This is a my sister':

SELECT 
    CHARINDEX('is','This is a my sister',5) start_at_fifth,
    CHARINDEX('is','This is a my sister',10) start_at_tenth;


--In this tutorial, you have learned how to use the SQL Server CHARINDEX() function to search for a substring in a string starting from a specified location and return the position of the substring.

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--SQL Server LEFT Function

--Summary: in this tutorial, you will learn how to use the SQL Server LEFT() function to extract a number of characters from the left side of a given string.


--SQL Server LEFT() function overview
--The LEFT() function extracts a given number of characters from the left side of a supplied string. For example, LEFT('SQL Server', 3) returns SQL.

--The syntax of the LEFT() function is as follows:

--LEFT ( input_string , number_of_characters )  

--SQL Server LEFT() function examples
--Let’s take some example of using the LEFT() function to understand it better.

--A) using LEFT() function with a literal character string
--The following statement uses LEFT() to return the three leftmost characters of the character string SQL Server:

SELECT LEFT('SQL Server',3) Result_string;

--B) Using the LEFT() function with a table column
--The following example returns the seven leftmost characters of each product name in the production.products table:

USE AdventureWorks2012

SELECT 
    Name,
    LEFT(Name, 2) first_7_characters
FROM 
    production.Product
ORDER BY 
    Name;

--C) Using LEFT() function with GROUP BY clause
--The following example uses the LEFT() function to return a set of initials of the product name and the number of each product for each initial:

SELECT
	LEFT(Name, 1) AS initial,  
	COUNT(Name) AS product_count
FROM 
	production.product
GROUP BY
	left(Name, 1)
ORDER BY 
	initial;

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

--SQL Server PATINDEX function
--Summary: in this tutorial, you have learned how to use the SQL Server PATINDEX() function to find the position of a pattern in a string.

--SQL Server PATINDEX() overview
--The PATINDEX() function returns the position of the first occurrence of a pattern in a string. The syntax of the PATINDEX() function is as follows:

--PATINDEX ( '%pattern%' , input_string )



--The PATINDEX() function accepts two arguments:

--pattern is a character expression to be found. It can contain wildcard characters such as % and '_' in the pattern. The meanings of the wildcards are the same as they are used with the LIKEoperator.
--input_string is a character string in which the pattern to be searched.
--The PATINDEX() returns an integer that specifies the position of the first occurrence of the pattern in the input_string, or zero of the pattern not found. The PATINDEX() function will return NULL if either pattern or input_string is NULL.

--Note that the PATINDEX() searches for the pattern based on the collation of the input. If you want to use a specific collation, you can use the COLLATE clause explicitly.


--SQL Server PATINDEX() function examples
--Let’s take some examples of using the PATINDEX() function.

--A) SQL Server PATINDEX() simple example
--This example returns the starting position of the substring 'ern' in the string 'SQL Pattern Index':

SELECT 
    PATINDEX('%ern%', 'SQL Pattern Index') position;

--B) Using SQL Server PATINDEX() with multiple wildcards example
--This example uses % and _ wildcards to find the position at which the pattern 'f', followed by any two characters and 'ction' starts in the 'SQL Server String Function' string:

SELECT 
    PATINDEX('%f__ction%', 'SQL Server String Function') position;

--C) Using SQL Server PATINDEX() function with table column example
--This example finds the position of the first occurrence of the pattern 2018  in values of the product_name column in the production.products table from the sample database.

SELECT    
    ProductNumber, 
    PATINDEX('%71%', ProductNumber) position

--SELECT *
FROM    
    production.product
WHERE 
    ProductNumber LIKE '%71%'
ORDER BY 
    ProductNumber;

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--SQL Server SUBSTRING Function

--SQL Server SUBSTRING() function overview
--The SUBSTRING() extracts a substring with a specified length starting from a location in an input string.

--The following shows the syntax of the SUBSTRING() function:

--SUBSTRING(input_string, start, length);

--In this syntax:

--input_string can be a character, binary, text, ntext, or image expression.
--start is an integer that specifies the location where the returned substring starts. Note that the first character in the input_string is 1, not zero.
--length is a positive integer that specifies the number of characters of the substring to be returned. The SUBSTRING() function raises an error if the length is negative. If start + length > the length of input_string, the substring will begin at the start and include the remaining characters of the input_string.


--A) Using SUBSTRING() function with literal strings
--This example extracts a substring with the length of 6, starting from the fifth character, in the 'SQL Server SUBSTRING' string.

SELECT 
    SUBSTRING('SQL Server SUBSTRING', 5, 6) result;

USE SQL_PROJECTS

SELECT email,CHARINDEX('@', email)+1,
LEN(email),
LEN(email)-CHARINDEX('@', email),
* FROM  sales.customers


--B) Using  SUBSTRING() function with table columns

SELECT 
    email, 
	LEN(email),
	CHARINDEX('@', email)+1,
    SUBSTRING(
        email, 
        CHARINDEX('@', email)+1, 
        LEN(email)-CHARINDEX('@', email)
    ) domain
FROM 
    sales.customers
ORDER BY 
    email;

--abbey.pugh@gmail.com


--aaron.knapp@yahoo.com

-------------------------------------------------------------------------------------------------------------------
----------------------------18-11-2023-------to be continued 25-11-2023
-------------------------------------------------------------------------------------------------------------------
--To count the number of emails per domain, you can use the following query:

SELECT 
    SUBSTRING(
        email, 
        CHARINDEX('@', email)+1, 
        LEN(email)-CHARINDEX('@', email)
    ) domain,
    COUNT(*) domain_count
FROM 
    sales.customers
GROUP BY 
    SUBSTRING(
            email, 
            CHARINDEX('@', email)+1, 
            LEN(email)-CHARINDEX('@', email)
        );

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
--SQL Server REPLICATE Function

--Summary: in this tutorial, you will learn how to use the SQL Server REPLICATE() function to replicate a string a specified number of times.

--SQL Server REPLICATE() function overview
--The REPLICATE() function repeats a string a specified number of times. 
--Its syntax is straightforward as follows:

--REPLICATE(input_string, count);


--In this syntax:

--input_string is an expression that evaluates to a value of the character or binary type.
--count is the number of times that the input_string will be repeated in the result string.
--SQL Server REPLICATE() function examples
--Let’s take some examples of using the REPLICATE()function.

--A) Using REPLICATE() function to repeat a literal string
--This example uses the REPLICATE() function to repeat the character z three times:

SELECT
    REPLICATE('z',3) result;

--zzz

--B) Using REPLICATE() function making columns with leading zero data
--First, create a new table named spare_parts in the production schema:

CREATE TABLE production.spare_parts (
    part_id INT IDENTITY PRIMARY KEY,
    part_no VARCHAR(10) NOT NULL UNIQUE,
    description VARCHAR(50) NOT NULL
);


--Suppose the part_no must always have 10 characters. If a spare part has less than 10 characters, 
--the application needs to pad leading zeros so that the length of the spare part always has 10 characters.

--Second, insert some values into the production.spare_parts table:


--INSERT INTO 
--    production.spare_parts(part_no, description)
--VALUES
--    ('FRMTUBE','Frame Tube'),
--    ('CHNCO','Chain Cover'),
--    ('CRKS','Cranks');

--000FRMTUBE
--00000CHNCO
--000000CRKS

SELECT 
    part_id,
	part_no,
	LEN(part_no),
    CONCAT(
        REPLICATE('0', 10 - LEN(part_no)), 
        part_no
    ) part_no,
    description
FROM 
    production.spare_parts;


--In this example:

--First, use the LEN() function to calculate the number of zeros to be padded:

--10 - LEN(part_no)
--Code language: SQL (Structured Query Language) (sql)
--Second, use the REPLICATE() function to replicate the necessary zeros to be padded:

--REPLICATE('0', 10 - LEN(part_no)
--Code language: SQL (Structured Query Language) (sql)
--Third, use the CONCAT() function to left pad the zeros to the part no:

--CONCAT(
--    REPLICATE('0', 10 - LEN(part_no)), 
--    part_no
--) part_no

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

--SQL Server REPLACE() function examples

--Let’s take some examples of using the REPLACE() function to understand how it works.

--A) Using REPLACE() function with literal strings
--The following example uses the REPLACE() function to replace the tea with the coffee in the string 'It is a good tea at the famous tea store.':


SELECT 
    REPLACE(
        'It is a good tea at the famous tea store.', 
        'tea', 
        'coffee'
    ) result;


--It is a good coffee at the famous coffee store.


--B) Using REPLACE() function with table columns
--In this example, we will use the sales.customers table from the sample database:

--This example calls the REPLACE() function twice to format the phone number in a new format:
--(  =''

--)  =''

--(914) 706-7576
--914 706-7576

--(619) 377-8586	619 377-8586
--				output

--(  =''

--)  =''

--(845) 707-6088

--(  =''

--914) 402-4335


SELECT    
	first_name, 
	last_name, 
	phone, 
	REPLACE(phone, '(', ''),
	REPLACE(REPLACE(phone, '(', ''), ')', '') phone_formatted
FROM    
	sales.customers
WHERE phone IS NOT NULL
ORDER BY 
	first_name, 
	last_name;


--How it works.

--The first call REPLACE(phone, '(', '') replaces the character ‘(‘ in the phone number by a space e.g., (916) 381-6003 -> 916) 381-6003
--The second call reuses the result of the first call and replaces the character ‘)’ by a space e.g., 916) 381-6003 -> 916 381-6003.
--C) Using REPLACE() function to correct data in tables
--The REPLACE() function is often used to correct data in a table. For example, replacing the outdated link with the new one.

--The following is the syntax:

--For example, to change the city code of the phone numbers from 916 to 917, you use the following statement:

UPDATE
    sales.customers
SET
    phone = REPLACE(phone,'(916)','(917)')
WHERE
    phone IS NOT NULL;


--(178 row(s) affected)

select * from sales.customers
where phone like '%(916)%'
 

--Notice that you should back up the table before performing replacements.
