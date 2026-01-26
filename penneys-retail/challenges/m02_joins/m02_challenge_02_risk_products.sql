-- Challenge 2: LEFT JOIN risk products (PenneysRetailDB)

USE PenneysRetailDB;
GO

SELECT
    p.ProductSKU,
    p.ProductDescription,
    COALESCE(s.SupplierName,  'No Supplier Assigned') AS SupplierName,
    s.CountryCode
FROM Inventory.Products p
LEFT JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID;
GO

SELECT
    p.ProductSKU,
    p.ProductDescription,
    COALESCE(s.SupplierName,  'No Supplier Assigned') AS SupplierName,
    s.CountryCode
FROM Inventory.Products p
LEFT JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierID IS NULL;
GO
