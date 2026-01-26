-- Challenge 3: CROSS JOIN scenarios (PenneysRetailDB)

USE PenneysRetailDB;
GO

SELECT
    p.ProductSKU,
    p.RetailPrice,
    s.SupplierName,
    ScenarioPrice = p.RetailPrice * 0.9
FROM Inventory.Products p
CROSS JOIN Inventory.Suppliers s
ORDER BY p.ProductSKU, s.SupplierName;

SELECT
    p.ProductSKU,
    p.RetailPrice,
    s.SupplierName,
    ScenarioPrice = p.RetailPrice * 0.9,
    s.CountryCode
FROM Inventory.Products p
CROSS JOIN Inventory.Suppliers s
WHERE s.CountryCode = 'IE'
ORDER BY p.ProductSKU, s.SupplierName;
