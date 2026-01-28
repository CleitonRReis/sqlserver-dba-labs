USE PenneysRetailDB;
GO

-- ============================================
-- Query 1: Global inventory statistics
-- ============================================

SELECT
    COUNT(*) AS TotalProducts,
    COUNT(DISTINCT SupplierID) AS TotalSuppliers,
    SUM(StockOnHand) AS TotalStock,
    AVG(RetailPrice) AS AvgPrice,
    MIN(RetailPrice) AS CheapestProduct,
    MAX(RetailPrice) AS MostExpensiveProduct
FROM Inventory.Products;
GO

-- ============================================
-- Query 2: Products and stock BY SUPPLIER
-- ============================================

SELECT
    s.SupplierName,
    COUNT(p.ProductID) AS ProductCount,
    SUM(p.StockOnHand) AS TotalStock,
    AVG(p.RetailPrice) AS AvgPrice,
    MAX(p.RetailPrice) AS HighestPrice
FROM Inventory.Products p
JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY s.SupplierName
ORDER BY ProductCount DESC;
GO

-- ============================================
-- Query 3: Profit margin BY SUPPLIER
-- ============================================

SELECT
    s.SupplierName,
    COUNT(*) AS Products,
    AVG(p.RetailPrice - p.CostPrice) AS AvgProfitMargin,
    SUM((p.RetailPrice - p.CostPrice) * p.StockOnHand) AS TotalPotentialProfit
FROM Inventory.Products p
JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY s.SupplierName
ORDER BY TotalPotentialProfit DESC;
GO


-- ============================================
-- HAVING Clause
-- ============================================

SELECT 
    s.SupplierName,
    COUNT(*) AS Products
FROM Inventory.Products p
JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY s.SupplierName
HAVING COUNT(*) > 2;
GO

SELECT
    -- s.*,
    -- p.*
    s.SupplierName,
    COUNT(*) AS Products,
    AVG(p.RetailPrice) AS AvgPrice
FROM Inventory.Products p 
JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.StockOnHand > 50
GROUP BY s.SupplierName
HAVING COUNT(*) > 1;
GO