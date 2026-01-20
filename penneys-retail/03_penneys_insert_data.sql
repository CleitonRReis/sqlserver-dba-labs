USE PenneysRetailDB;

-- EXEC sp_rename 'Inventory.Products.ReodrderLevel', 'ReorderLevel', 'COLUMN';
-- GO

-- SELECT COLUMN_NAME 
-- FROM INFORMATION_SCHEMA.COLUMNS 
-- WHERE TABLE_SCHEMA = 'Inventory' 
--   AND TABLE_NAME = 'Products' 
--   AND COLUMN_NAME = 'ReorderLevel';
-- GO

INSERT INTO Inventory.Products 
    (ProductSKU, ProductDescription, RetailPrice, CostPrice, StockOnHand, ReorderLevel)
VALUES
    ('SHIRT-BLU-MED', N'Blue Cotton T-Shirt Medium', 29.99, 15.50, 150, 50),
    ('JEANS-BLK-LRG', N'Black Skinny Jeans Large',     59.99, 32.00,  75, 30),
    ('SNEAK-WHT-SML', N'White Sneakers Small',         89.99, 45.00,  40, 20);
GO

SELECT * FROM Inventory.Products

INSERT INTO Inventory.Suppliers
    (SupplierCode, SupplierName, CountryCode, IsActive)
VALUES
    ('SUP001-IE', N'Primark Manufacturing Ireland', 'IE', 1),
    ('SUP002-UK', N'Next Clothing Suppliers UK',    'UK', 1),
    ('SUP003-IE', N'Dunnes Stores Wholesale',       'IE', 1);
GO

SELECT * FROM Inventory.Suppliers

SELECT 'Products' AS TableName, COUNT(*) AS RowsInserted 
FROM Inventory.Products
UNION ALL
SELECT 'Suppliers', COUNT(*)
FROM Inventory.Suppliers;
GO

SELECT
    ProductSKU,
    ProductDescription,
    RetailPrice,
    StockOnHand,
    ReorderLevel
FROM Inventory.Products
WHERE StockOnHand > ReorderLevel
ORDER BY RetailPrice DESC;
GO