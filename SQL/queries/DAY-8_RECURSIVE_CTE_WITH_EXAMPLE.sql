--Introduction to SQL Server recursive CTE

A recursive common table expression (CTE) is a CTE that references itself. By doing so,
the CTE repeatedly executes, returns subsets of data,
until it returns the complete result set.

 
A recursive CTE is useful in querying hierarchical data such as organization charts
where one employee reports to a manager or multi-level bill of materials when a product consists of many components,
and each component itself also consists of many other components.

In general, a recursive CTE has three parts:

An initial query that returns the base result set of the CTE.-----------Anchor member
The initial query is called an anchor member.

A recursive query that references the common table expression, therefore, it is called the recursive member.
The recursive member is union-all with the anchor member using the UNION ALL operator.

A termination condition specified in the recursive member that terminates
the execution of the recursive member.

--drop table DBO.staffs

 
CREATE TABLE DBO.staffs (

       staff_id INT IDENTITY (1, 1),

       first_name VARCHAR (50) NOT NULL,

       last_name VARCHAR (50) NOT NULL,

       email VARCHAR (255) NOT NULL,

       phone VARCHAR (25),

       active tinyint NOT NULL,

       store_id INT NOT NULL,

       manager_id INT

);

SET IDENTITY_INSERT DBO.staffs ON; 

INSERT INTO DBO.staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(1,'Fabiola','Jackson','fabiola.jackson@bikes.shop','(831) 555-5554',1,1,NULL);
INSERT INTO DBO.staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(2,'Mireya','Copeland','mireya.copeland@bikes.shop','(831) 555-5555',1,1,1);
INSERT INTO DBO.staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(3,'Genna','Serrano','genna.serrano@bikes.shop','(831) 555-5556',1,1,2);
INSERT INTO DBO.staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(4,'Virgie','Wiggins','virgie.wiggins@bikes.shop','(831) 555-5557',1,1,2);
INSERT INTO DBO.staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(5,'Jannette','David','jannette.david@bikes.shop','(516) 379-4444',1,2,1);
INSERT INTO DBO.staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(6,'Marcelene','Boyer','marcelene.boyer@bikes.shop','(516) 379-4445',1,2,5);
INSERT INTO DBO.staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(7,'Venita','Daniel','venita.daniel@bikes.shop','(516) 379-4446',1,2,5);
INSERT INTO DBO.staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(8,'Kali','Vargas','kali.vargas@bikes.shop','(972) 530-5555',1,3,1);
INSERT INTO DBO.staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(9,'Layla','Terrell','layla.terrell@bikes.shop','(972) 530-5556',1,3,7);
INSERT INTO DBO.staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(10,'Bernardine','Houston','bernardine.houston@bikes.shop','(972) 530-5557',1,3,7);



SET IDENTITY_INSERT DBO.staffs OFF; 


SELECT * FROM DBO.staffs ORDER BY MANAGER_ID
GO


WITH cte_org AS (
    SELECT      ----------------------Anchor member 
        staff_id,
        first_name,
        manager_id,
		cast('Main Manager' as varchar(50)) AS MGR_NAME
       FROM      
        DBO.staffs
    WHERE manager_id IS NULL

    UNION ALL

    SELECT----------------recursive query also has the same number of columns as of anchor query , data types also matches respectively in all four columns
        e.staff_id,
        e.first_name,
        e.manager_id,
		o.first_name
    FROM
        DBO.staffs e
        INNER JOIN cte_org o
            ON o.staff_id = e.manager_id
)
SELECT * FROM cte_org
ORDER BY MANAGER_ID

