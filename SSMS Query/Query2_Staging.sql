USE Ecommerce_Staging;
GO

CREATE TABLE dbo.stg_Orders
(
    OrderID INT,
    CustomerID VARCHAR(20),
    ProductID VARCHAR(20),
    OrderDate DATE,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Discount DECIMAL(5,2),
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(50),
    CreatedDate DATETIME
);

CREATE TABLE dbo.stg_Products
(
    ProductID VARCHAR(20),
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    SubCategory VARCHAR(100),
    Brand VARCHAR(100),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2),
    Supplier VARCHAR(255),
    StockQuantity INT
);

CREATE TABLE dbo.stg_Customers
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

use Ecommerce_Staging;
Select * from dbo.stg_Orders;
Select * from dbo.stg_Products;
Select * from dbo.stg_Customers;

-- TRUNCATE TABLE dbo.stg_Orders;
-- TRUNCATE TABLE dbo.stg_Products;
-- TRUNCATE TABLE dbo.stg_Customers;


SELECT 'dbo.stg_Orders' AS TableName, COUNT(*) AS RecordCount FROM dbo.stg_Orders
UNION ALL
SELECT 'dbo.stg_Products', COUNT(*) FROM dbo.stg_Products
UNION ALL
SELECT 'dbo.stg_Customers', COUNT(*) FROM dbo.stg_Customers;
GO