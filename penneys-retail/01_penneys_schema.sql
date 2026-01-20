USE PenneysRetailDB;

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Inventory')
    EXEC('CREATE SCHEMA Inventory');
GO

SELECT * FROM sys.schemas WHERE name = 'Inventory';

-- SELECT
--     s.name as SchemaName,
--     o.name as ObjectName,
--     type_desc
-- FROM sys.schemas s
-- JOIN sys.objects o ON o.schema_id = s.schema_id
-- WHERE s.name = 'Inventory';

-- DROP SCHEMA Inventory;