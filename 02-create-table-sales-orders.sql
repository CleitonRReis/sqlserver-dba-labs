USE SqlServerLab
GO

CREATE TABLE Sales.Orders
(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATE NOT NULL,
    Customer NVARCHAR(100) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL
);
GO

SELECT
    s.name AS SchemaName,
    t.name AS TableName
FROM sys.tables t
JOIN sys.schemas s
    ON t.schema_id = t.schema_id
WHERE s.name = 'Sales';