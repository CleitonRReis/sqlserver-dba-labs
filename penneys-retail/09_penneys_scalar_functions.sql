USE PenneysRetailDB;
GO

SELECT
    p.ProductSKU,
    p.RetailPrice,
    YEAR(GETDATE()) AS CurrentYear,
    DATENAME(dw, GETDATE()) AS TodayWeekDay
FROM Inventory.Products p;
GO

SELECT
    p.ProductSKU,
    p.RetailPrice,
    ROUND(p.RetailPrice, 0) AS RoundedPrice,
    FLOOR(p.RetailPrice) AS FloorPrice,
    CEILING(p.RetailPrice) AS CeilingPrice
FROM Inventory.Products p;
GO

SELECT
    p.ProductDescription,
    UPPER(p.ProductDescription) AS UpperCaseProductDescription,
    LEN(p.ProductDescription) AS DescriptionLength
FROM Inventory.Products p;
GO

SELECT
    p.ProductSKU,
    p.StockOnHand,
    p.ReorderLevel,
    IIF(p.StockOnHand <= p.ReorderLevel, 'Reorder', 'Ok') AS StockStatus
FROM Inventory.Products p;
GO

SELECT 
    p.ProductID,
    p.ProductSKU,
    p.ProductDescription,
    p.RetailPrice,
    RANK() OVER (ORDER BY p.RetailPrice DESC)       AS RankByPrice,
    ROW_NUMBER() OVER (ORDER BY p.RetailPrice DESC) AS RowNumByPrice
FROM Inventory.Products p
ORDER BY RankByPrice;
GO

SELECT
    s.SupplierName,
    p.ProductSKU,
    p.RetailPrice,
    RANK () OVER (
        PARTITION BY s.SupplierName
        ORDER BY p.RetailPrice DESC
    ) AS RankWithinSupplier
FROM Inventory.Products p
JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY s.SupplierName, RankWithinSupplier;
GO

SELECT ProductSKU, RetailPrice,
       RANK() OVER (ORDER BY RetailPrice DESC) AS Ranking
FROM Inventory.Products;

SELECT SupplierName, ProductSKU, RetailPrice,
    RANK() OVER (PARTITION BY SupplierName ORDER BY RetailPrice DESC) AS Ranking,
    ROW_NUMBER() OVER (ORDER BY RetailPrice DESC)                     AS RowNumByPrice
FROM Inventory.Products p JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID;


-- INSERT INTO Inventory.Products (ProductSKU, ProductDescription, RetailPrice, CostPrice, StockOnHand, ReorderLevel, SupplierID)
-- VALUES 
--     ('JACKET-BLK-MED', 'Black Winter Jacket Medium', 129.99, 75.00, 30, 10, 1),  -- Primark
--     ('SCARF-RED-ONESIZ', 'Red Wool Scarf', 19.99, 10.00, 80, 20, 1),            -- Primark
--     ('GLOVES-BLK-MED', 'Black Leather Gloves', 39.99, 22.00, 50, 15, 2),        -- Next
--     ('SOCKS-WHT-ONESIZ', 'White Sports Socks Pack', 12.99, 6.00, 150, 30, 2),   -- Next
--     ('HAT-GRY-ONESIZ', 'Grey Beanie Hat', 24.99, 14.00, 60, 20, 3);             -- Dunnes
-- GO

SELECT
    s.SupplierName,
    p.ProductSKU,
    p.RetailPrice,
    RANK() OVER (
        PARTITION BY s.SupplierName
        ORDER BY p.RetailPrice DESC) AS RankRetailPrice
FROM Inventory.Products p
INNER JOIN Inventory.Suppliers s ON p.SupplierID = s.SupplierID
