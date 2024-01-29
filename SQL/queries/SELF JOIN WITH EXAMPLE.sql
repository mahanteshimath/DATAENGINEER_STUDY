USE AdventureWorks2012


SELECT * FROM EMP E1

SELECT * FROM EMP E2


SELECT E1.EMP_ID,E1.EMP_NAME,E1.SALARY,
case when E1.MGR_ID is null then 'Super Manager' else E2.EMP_NAME END AS MANAGER_NAME 
FROM EMP E1 
LEFT JOIN EMP E2 ON E1.MGR_ID = E2.EMP_ID


SELECT E1.EMP_ID,E1.EMP_NAME,E1.SALARY,
--COALESCE(e2.EMP_NAME,'Super Manager')
--case when E1.MGR_ID is null then 'Super Manager' else E2.EMP_NAME END AS MANAGER_NAME 
FROM EMP E1 
LEFT JOIN EMP E2 ON E1.MGR_ID = E2.EMP_ID


----EXAMPLE SELF JOIN

SELECT E1.*,E2.EMP_NAME AS MANAGER_NAME FROM EMP E1 
LEFT JOIN EMP E2 ON E1.MGR_ID = E2.EMP_ID

SELECT E1.EMP_ID,E1.EMP_NAME,E1.SALARY,E2.EMP_NAME,
ISNULL(E2.EMP_NAME,'SUPER MANAGER') AS MANAGER_NAME 
FROM EMP E1 
LEFT JOIN EMP E2 ON 
			E1.MGR_ID = E2.EMP_ID


--findout those employees details whoes salary is more than their manager's salary 


CREATE TABLE Emps (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  salary INT,
  managerId INT
);


INSERT INTO Emps (id, name, salary, managerId) VALUES
  (1, 'Rahul', 5000, 3),
  (2, 'Rohit', 8000, 4),
  (3, 'Suresh', 6000, NULL),
  (4, 'Manish', 9000, 3);



select * from emps E1 
JOIN Emps E2 ON E1.managerId = E2.id-----------SELF JOIN 
WHERE E1.salary >E2.salary











SELECT e.id, e.name, e.salary, e.managerId
FROM Emps e
JOIN Emps m ON e.managerId = m.id
WHERE e.salary > m.salary;


--In this SQL query, we are performing a self-join on the “Employees” table by joining it to itself 
--based on the “managerId” and “id” columns. 


