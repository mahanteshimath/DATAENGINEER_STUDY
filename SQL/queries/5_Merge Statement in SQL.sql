CREATE TABLE SourceProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO

INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300)
GO
    
CREATE TABLE TargetProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO
    
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Desk',180)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',50)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',300)
GO
    
    
SELECT * FROM SourceProducts
SELECT * FROM TargetProducts

--DROP TABLE SourceProducts

--DROP TABLE TargetProducts


MERGE TargetProducts AS Target
USING SourceProducts	AS Source
ON Source.ProductID = Target.ProductID
WHEN NOT MATCHED BY Target THEN
    INSERT (ProductID,ProductName, Price) 
    VALUES (Source.ProductID,Source.ProductName, Source.Price);


SELECT * FROM SourceProducts
SELECT * FROM TargetProducts


 MERGE TargetProducts AS Target
    USING SourceProducts	AS Source
    ON Source.ProductID = Target.ProductID
    
    -- For Inserts
    WHEN NOT MATCHED BY Target THEN
        INSERT (ProductID,ProductName, Price) 
        VALUES (Source.ProductID,Source.ProductName, Source.Price)
    
    -- For Updates
    WHEN MATCHED THEN UPDATE SET
        Target.ProductName	= Source.ProductName,
        Target.Price		= Source.Price;

																				
SELECT * FROM SourceProducts
SELECT * FROM TargetProducts



MERGE TargetProducts AS Target
USING SourceProducts	AS Source
ON Source.ProductID = Target.ProductID
    
-- For Inserts
WHEN NOT MATCHED BY Target THEN
    INSERT (ProductID,ProductName, Price) 
    VALUES (Source.ProductID,Source.ProductName, Source.Price)
    
-- For Updates
WHEN MATCHED THEN UPDATE SET
    Target.ProductName	= Source.ProductName,
    Target.Price		= Source.Price
    
-- For Deletes
WHEN NOT MATCHED BY Source THEN
    DELETE;




MERGE TargetProducts AS Target
USING SourceProducts	AS Source
ON Source.ProductID = Target.ProductID
    
-- For Inserts
WHEN NOT MATCHED BY Target THEN
    INSERT (ProductID,ProductName, Price) 
    VALUES (Source.ProductID,Source.ProductName, Source.Price)
    
-- For Updates
WHEN MATCHED THEN UPDATE SET
    Target.ProductName	= Source.ProductName,
    Target.Price		= Source.Price
    
-- For Deletes
WHEN NOT MATCHED BY Source THEN
    DELETE
        
-- Checking the actions by MERGE statement
OUTPUT $action, 
DELETED.ProductID AS TargetProductID, 
DELETED.ProductName AS TargetProductName, 
DELETED.Price AS TargetPrice, 
INSERTED.ProductID AS SourceProductID, 
INSERTED.ProductName AS SourceProductName, 
INSERTED.Price AS SourcePrice;

--Important things to remember while implementing SQL MERGE

--Although we have now understood how to write the MERGE statement from scratch 
--and how to modify the script to include logic for handling inserts, updates and deletes, 
--there are also some other key important points that we should keep in mind while preparing the scripts.

--1.Every MERGE statement must end with a semi-colon. If a semi-colon is not present at the end of the MERGE statement, then an error will be thrown
--2.You can use SELECT @@RowCount after writing the MERGE statement which will return the number of records that have been modified by the transaction
--3.It is mandatory that one of the MATCHED clauses is provided in order for the MERGE statement to operate

