-- Challenge 1: INNER JOIN invoices (PenneysRetailDB)

USE PenneysRetailDB;
GO

SELECT * FROM Inventory.Products;
SELECT * FROM Inventory.Suppliers;
GO

SELECT
    s.SupplierName,
    p.ProductSKU,
    p.ProductDescription,
    p.RetailPrice
FROM Inventory.Suppliers s
INNER JOIN Inventory.Products p ON s.SupplierID = p.SupplierID
ORDER BY s.SupplierName, p.ProductSKU;
GO

SELECT
    s.SupplierName,
    COUNT(*) AS ProductCount,
    SUM(p.RetailPrice) AS TotalRetailValue
FROM Inventory.Suppliers s
INNER JOIN Inventory.Products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierName;
GO
