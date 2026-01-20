

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'PenneysRetailDB')
BEGIN
    CREATE DATABASE PenneysRetailDB
END;
GO

USE PenneysRetailDB;
GO

SELECT DB_NAME() AS Current_DATABASE;
GO