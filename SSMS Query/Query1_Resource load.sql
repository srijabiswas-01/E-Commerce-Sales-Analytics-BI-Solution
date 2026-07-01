/* ==========================================
   CREATE DATABASES FOR E-COMMERCE ETL PROJECT
   ========================================== */

-- Create Source Database
IF DB_ID('Ecommerce_Source') IS NULL
BEGIN
    CREATE DATABASE Ecommerce_Source;
    PRINT 'Ecommerce_Source created successfully.';
END
ELSE
BEGIN
    PRINT 'Ecommerce_Source already exists.';
END
GO

-- Create Staging Database
IF DB_ID('Ecommerce_Staging') IS NULL
BEGIN
    CREATE DATABASE Ecommerce_Staging;
    PRINT 'Ecommerce_Staging created successfully.';
END
ELSE
BEGIN
    PRINT 'Ecommerce_Staging already exists.';
END
GO

-- Create Data Warehouse Database
IF DB_ID('Ecommerce_DW') IS NULL
BEGIN
    CREATE DATABASE Ecommerce_DW;
    PRINT 'Ecommerce_DW created successfully.';
END
ELSE
BEGIN
    PRINT 'Ecommerce_DW already exists.';
END
GO

-- Verify
use Ecommerce_Source;
SELECT COUNT(*)
FROM dbo.OrderDetails;

USE Ecommerce_Source;

SELECT COUNT(*)
FROM ProductDetails;

SELECT TOP 10 *
FROM dbo.ProductDetails;

USE Ecommerce_Source;
GO

CREATE TABLE dbo.CustomerDetails
(
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(255),
    Gender VARCHAR(50),
    Age INT,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    RegistrationDate DATE
);

USE Ecommerce_Source;
GO

SELECT * from dbo.CustomerDetails;
SELECT * FROM dbo.ProductDetails;
SELECT * FROM dbo.OrderDetails Order by CustomerID;
SELECT * FROM dbo.OrderDetails Order by ProductID;
SELECT * FROM dbo.OrderDetails;