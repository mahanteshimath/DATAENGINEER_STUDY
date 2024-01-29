--USE AdventureWorks2012

--RUNNING TOTAL EXAMPLE


SELECT * FROM EmpP

select sum(salary) over(order by id),* from EmpP


select sum(salary) over(partition by departmentid order by id),* from EmpP

