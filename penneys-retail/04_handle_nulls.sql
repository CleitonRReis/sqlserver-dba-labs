USE PenneysRetailDB
GO

ALTER TABLE Inventory.Products
ADD SupplierQuotedPrice DECIMAL(8,2) NULL;
GO

SELECT * FROM Inventory.Products;

UPDATE Inventory.Products
SET SupplierQuotedPrice = NULL
WHERE ProductSKU IN ('SHIRT-BLU-MED', 'SNEAK-WHT-SML');
GO

SELECT
    ProductSKU,
    RetailPrice,
    RetailPrice + ISNULL(SupplierQuotedPrice, 0) AS TotalQuotedPrice
FROM Inventory.Products;
GO