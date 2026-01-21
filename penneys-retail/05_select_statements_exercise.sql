USE PenneysRetailDB;
GO

SELECT * FROM Inventory.Products;
GO

SELECT
    ProductSKU AS SKU,
    ProductDescription AS Description,
    RetailPrice,
    StockOnHand AS CurrentStock
FROM Inventory.Products
GO

SELECT
    ProductSKU,
    RetailPrice,
    StockOnHand
FROM Inventory.Products
WHERE RetailPrice > 50.00
ORDER BY StockOnHand ASC;
GO

SELECT
    ProductSKU,
    RetailPrice,
    CostPrice,
    RetailPrice - CostPrice AS ProfitPerUnit,
    StockOnHand * (RetailPrice - CostPrice) AS TotalPotentialProfit
FROM Inventory.Products;
GO

SELECT DISTINCT RetailPrice
FROM Inventory.Products
ORDER BY RetailPrice;
GO