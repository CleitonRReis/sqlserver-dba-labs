USE SqlServerLab;
GO

INSERT INTO Sales.Orders
(
    OrderDate,
    Customer,
    Amount
)
VALUES
('2026-01-18', 'Cliente A', 150.00),
('2026-01-19', 'Cliente B', 299.90),
('2026-01-20', 'Cliente C', 75.50);

SELECT * FROM Sales.Orders;