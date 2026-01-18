USE SqlServerLab;
GO

CREATE SCHEMA Sales;
GO

SELECT Name
FROM sys.schemas
WHERE name = 'Sales';