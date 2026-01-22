USE PenneysRetailDB;
GO

SELECT * FROM Inventory.Products
SELECT * FROM Inventory.Suppliers

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Inventory.Products') AND name = 'SupplierID')
    ALTER TABLE Inventory.Products ADD SupplierID INT  NULL;
GO

UPDATE Inventory.Products SET SupplierID = 1 WHERE ProductSKU = 'SHIRT-BLU-MED';
UPDATE Inventory.Products SET SupplierID = 2 WHERE  ProductSKU = 'JEANS-BLK-LRG';
UPDATE Inventory.Products SET SupplierID = 3 WHERE ProductSKU = 'SNEAK-WHT-SML';
GO

--ANSI SQL-89
SELECT
    p.ProductSKU, p.ProductDescription, p.RetailPrice,
    s.SupplierName, s.CountryCode
FROM Inventory.Products p, Inventory.Suppliers s
WHERE p.SupplierID = s.SupplierID;
GO

SELECT
    p.ProductSKU, p.ProductDescription, p.RetailPrice,
    s.SupplierName, s.CountryCode
FROM Inventory.Products p
INNER JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID;
GO

SELECT
    p.CostPrice,
    p.ProductDescription,
    p.RetailPrice,
    COALESCE(p.SupplierQuotedPrice, 0) AS SupplierQuotedPrice, 
    s.CountryCode
FROM Inventory.Products p
LEFT JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID;
GO

SELECT
    p.CostPrice,
    p.ProductDescription,
    s.SupplierName,
    s.CountryCode
FROM Inventory.Products p
CROSS JOIN Inventory.Suppliers s;
GO

SELECT
    p.ProductSKU + ' via ' + s.SupplierName AS TestScenario,
    p.RetailPrice * 0.9 AS DiscountedPrice
FROM Inventory.Products p
CROSS JOIN Inventory.Suppliers s;
GO

ALTER TABLE Inventory.Suppliers ADD ParentSupplierID INT NULL;
GO

UPDATE Inventory.Suppliers SET ParentSupplierID = 1 WHERE SupplierID = 2;
UPDATE Inventory.Suppliers SET ParentSupplierID = 1 WHERE SupplierID = 3;
GO

SELECT
    child.SupplierName AS ChildSupplier,
    parent.SupplierName AS ParentSupplier
FROM Inventory.Suppliers child
LEFT JOIN Inventory.Suppliers parent ON child.ParentSupplierID = parent.SupplierID;
GO