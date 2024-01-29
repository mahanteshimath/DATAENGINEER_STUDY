---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
-----------DATEADD
-----------DATEDIFF
-----------DATEPART

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

--SQL Server DATEPART Function

--SQL Server DATEPART Function
--Summary: in this tutorial, you will learn how to use the SQL Server DATEPART() function 
--to extract a part of a date.

--SQL Server DATEPART() function overview
--The DATEPART() function returns an integer which is a part of a date such as a day, month, and year.

--The following shows the syntax of the DATEPART() function:

--DATEPART ( date_part , input_date )
--Code language: SQL (Structured Query Language) (sql)
--The DATEPART() takes two arguments:

--date_part is the part of a date to be extracted. ( See the valid date parts in the table below).
--input_date is the date from which the date part is extracted.


--SQL Server DATEPART() examples
--Let’s take some examples of using the DATEPART() function.

--A) Using DATEPART() function with variables
--This example uses the DATEPART() function to extract various parts of a date value stored in a variable:

DECLARE @d DATETIME = '2019-01-01 14:30:14';
SELECT 
   DATEPART(year, @d) year, 
   DATEPART(quarter, @d) quarter, 
   DATEPART(month, @d) month, 
   DATEPART(day, @d) day, 
   DATEPART(hour, @d) hour, 
   DATEPART(minute, @d) minute, 
   DATEPART(second, @d) second;


--B) Using DATEPART() function with table columns example

select shipped_date,quantity,list_price
FROM sales.orders o
     INNER JOIN sales.order_items i ON i.order_id = o.order_id
WHERE shipped_date IS NOT NULL



SELECT DATEPART(year, shipped_date) [year], 
       DATEPART(quarter, shipped_date) [quarter], 
       DATEPART(month, shipped_date) [month], 
       DATEPART(day, shipped_date) [day], 
       SUM(quantity * list_price) gross_sales
FROM sales.orders o
     INNER JOIN sales.order_items i ON i.order_id = o.order_id
WHERE shipped_date IS NOT NULL
GROUP BY DATEPART(year, shipped_date), 
         DATEPART(quarter, shipped_date), 
         DATEPART(month, shipped_date), 
         DATEPART(day, shipped_date)
ORDER BY [year] DESC


--In this example, we used the DATEPART() function to extract year, quarter, month, and day from the values in the shipped_date column. 
--In the GROUP BY clause, we aggregated the gross sales ( quantity * list_price) by these date parts.

--Note that you can use the DATEPART() function in the SELECT, WHERE, HAVING, GROUP BY, and ORDER BY clauses.

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

--SQL Server DATEDIFF Function


--To calculate the difference between two dates in years, months, weeks, etc., you use the DATEDIFF() function:

--DATEDIFF( date_part , start_date , end_date)
--Code language: SQL (Structured Query Language) (sql)
--The DATEDIFF() function accepts three arguments: date_part, start_date, and end_date.

--date_part is the part of date e.g., a year, a quarter, a month, a week that you want to compare between the start_date and end_date. See the valid date parts in the table below.
--start_date and end_date are the dates to be compared. They must be resolved to values of type DATE, DATETIME, DATETIMEOFFSET, DATETIME2, SMALLATETIME, or TIME.


--The DATEDIFF() function returns a value of integer indicating the difference between the start_date and end_date, with the unit specified by date_part.

--The DATEDIFF() function returns an error if the result is out of range for integer (-2,147,483,648 to +2,147,483,647). In this case, you should use the DATEDIFF_BIG() function instead.


--SQL Server DATEDIFF() function examples
--Let’s take some examples of using the DATEDIFF() function to understand it better.

--A) Using DATEDIFF() function to compare the differences between two date values
--This example uses the DATEDIFF() function to compare the difference between two dates in various date parts:


DECLARE 
    @start_dt DATETIME2= '2019-12-31 23:59:59.9999999', 
    @end_dt DATETIME2= '2020-01-01 00:00:00.0000000';

SELECT 
    DATEDIFF(year, @start_dt, @end_dt) diff_in_year, 
    DATEDIFF(quarter, @start_dt, @end_dt) diff_in_quarter, 
    DATEDIFF(month, @start_dt, @end_dt) diff_in_month, 
    DATEDIFF(dayofyear, @start_dt, @end_dt) diff_in_dayofyear, 
    DATEDIFF(day, @start_dt, @end_dt) diff_in_day, 
    DATEDIFF(week, @start_dt, @end_dt) diff_in_week, 
    DATEDIFF(hour, @start_dt, @end_dt) diff_in_hour, 
    DATEDIFF(minute, @start_dt, @end_dt) diff_in_minute, 
    DATEDIFF(second, @start_dt, @end_dt) diff_in_second, 
    DATEDIFF(millisecond, @start_dt, @end_dt) diff_in_millisecond;


--B) Using DATEDIFF() function with table column example
--The following example uses the DATEDIFF() function to compare the requested delivery date with the ship date in days and return if the order is on-time or late:

SELECT
    order_id, 
    required_date, 
    shipped_date,
	DATEDIFF(day, required_date, shipped_date),
    CASE
        WHEN DATEDIFF(day, required_date, shipped_date) < 0
        THEN 'Late'
        ELSE 'OnTime'
    END shipment
FROM 
    sales.orders
WHERE 
    shipped_date IS NOT NULL
ORDER BY 
    required_date;

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

--SQL Server DATEADD() function overview


--The DATEADD() function adds a number to a specified date part of an input date and returns the modified value.

--The following shows the syntax of the DATEADD() function:

--DATEADD (date_part , value , input_date ) 


--The DATEADD() function accepts three arguments:

--date_part is the part of date to which the DATEADD() function will add the value. (See the valid date parts in the table below)
--value is an integer number to be added to the date_part of the input_date. If the value evaluates to a decimal or float, the function DATEADD() will truncate the decimal fraction part. It will not round the number in this case.
--input_date is a literal date value or an expression which can resolve to a value of type DATE, DATETIME, DATETIMEOFFSET, DATETIME2, SMALLATETIME, or TIME

--The function DATEADD() function returns a new date value after adding the value to the date_part.

--SQL Server DATEADD() function examples
--Let’s take some examples of using the DATEADD() function.

--Add 1 second to 2018-12-31 23:59:59


SELECT 
    DATEADD(second, 1, '2018-12-31 23:59:59') result;


--2019-01-01 00:00:00.000


SELECT 
    DATEADD(day, 1, '2018-12-31 23:59:59') result;


--2019-01-01 23:59:59.000

--This example uses the DATEADD() function to calculate the estimated shipped date based on the ordered date:

SELECT 
    order_id, 
    customer_id, 
    order_date,
    DATEADD(day, 2, order_date) estimated_shipped_date
FROM 
    sales.orders
WHERE 
    shipped_date IS NULL
ORDER BY 
    estimated_shipped_date DESC;


--Handling month examples
--If you add a number of months to a date and the day of the date result does not exist, 
--the DATEADD() function will return the last day of the return month.

--See the following example:

SELECT 
    DATEADD(month, 4, '2019-05-31') AS result;

--2019-09-30 00:00:00.000

--2019-09-30

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

