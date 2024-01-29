CREATE TABLE  tbEmployee
(
EmployeeId                INT PRIMARY KEY,
EmployeeName         VARCHAR(50),
ManagerId                 INT
)


INSERT tbEmployee 
VALUES 
(25,'Salman',NULL),
(26,'Ranbeer', 25),
(27,'Hrithik',25),
(28,'Aamir',27),
(29,'Shahid',28),
(30,'Sidharth', NULL),
(31,'Varun', 30),
(32,'Kabeer', 30),
(33,'Raj', 29); 


SELECT * FROM tbEmployee


--CTE recursive query to get employee and manager relationship hierarchy with level.


;WITH EMP_CTE AS
(
SELECT EmployeeId, EmployeeName, ManagerId, CAST('' AS VARCHAR(50)) ManagerName, 0 AS EmployeeLevel 
FROM tbEmployee WHERE ManagerId IS NULL
UNION ALL
SELECT T.EmployeeId,T.EmployeeName, T.ManagerId,
CAST(C.EmployeeName AS VARCHAR(50)) ManagerName, EmployeeLevel + 1 AS EmployeeLevel 
FROM tbEmployee AS T
INNER JOIN EMP_CTE  AS C ON C.EmployeeId=T.ManagerId
)
SELECT * FROM EMP_CTE


--Explanation: The base record for the CTE is obtained by the first select query above UNION ALL. It gets all EmployeeId which don’t have ManagerId ie. NULL value. This means they are the top most employees of the organization so their Employee Level is set to 0.

--Second select query below UNION ALL is executed recursively to get results and it will continue until it returns no rows. E.g. Result will have EmployeeIds which have ManagerId (i.e, EmployeeId of the first result).  This is obtained by joining our CTE result with tbEmployee table on columns EmployeeId of CTE with ManagerId of table tbEmployee. 


