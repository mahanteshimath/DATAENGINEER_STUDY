SELECT * FROM TABLE_A

SELECT * FROM TABLE_B


SELECT * FROM TABLE_A A
INNER JOIN TABLE_B B ON A.ID=B.ID

SELECT * FROM TABLE_A A
LEFT JOIN TABLE_B B ON A.ID=B.ID

SELECT * FROM TABLE_A A
RIGHT JOIN TABLE_B B ON A.ID=B.ID

SELECT * FROM TABLE_A A
FULL JOIN TABLE_B B ON A.ID=B.ID
