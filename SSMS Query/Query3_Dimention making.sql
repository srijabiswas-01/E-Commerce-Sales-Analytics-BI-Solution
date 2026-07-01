USE Ecommerce_DW;
GO

CREATE TABLE dbo.DimLocation
(
    LocationKey INT IDENTITY(1,1) PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100)
);

CREATE TABLE dbo.DimCustomer
(
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(255),
    Gender VARCHAR(50),
    Age INT,
    RegistrationDate DATE,
    LocationKey INT
);

CREATE TABLE dbo.DimProduct
(
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductID VARCHAR(20),
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    SubCategory VARCHAR(100),
    Brand VARCHAR(100),
    Supplier VARCHAR(255),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2),
	StockQuantity INT
);

CREATE TABLE dbo.DimPayment
(
    PaymentKey INT IDENTITY(1,1) PRIMARY KEY,
    PaymentMethod VARCHAR(50) UNIQUE
);

CREATE TABLE dbo.DimDate
(
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Quarter INT,
    Month INT,
    MonthName VARCHAR(20),
    WeekNo INT,
    DayNo INT,
    DayName VARCHAR(20)
);

CREATE TABLE dbo.FactSales
(
    SalesKey BIGINT IDENTITY(1,1) PRIMARY KEY,

    OrderID INT NOT NULL,

    DateKey INT NOT NULL,
    CustomerKey INT NOT NULL,
    ProductKey INT NOT NULL,
    PaymentKey INT NOT NULL,
    LocationKey INT NULL,

    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Discount DECIMAL(10,2),

    GrossSales DECIMAL(18,2),
    DiscountAmount DECIMAL(18,2),
    NetSales DECIMAL(18,2),

    CreatedDate DATETIME DEFAULT GETDATE()
);


-- TRUNCATE TABLE dbo.FactSales;
-- TRUNCATE TABLE dbo.DimLocation;
-- TRUNCATE TABLE dbo.DimCustomer;
-- TRUNCATE TABLE dbo.DimProduct;
-- TRUNCATE TABLE dbo.DimPayment;
-- TRUNCATE TABLE dbo.DimDate;

-- TRUNCATE TABLE dbo.FactSales;

use Ecommerce_DW;
SELECT *
FROM dbo.DimLocation;
SELECT *
FROM dbo.DimCustomer;
SELECT *
FROM dbo.DimProduct;
SELECT *
FROM dbo.DimPayment;
SELECT *
FROM dbo.DimDate;
SELECT *
FROM dbo.FactSales;


SELECT 'dbo.DimLocation' AS TableName, COUNT(*) AS RecordCount FROM dbo.DimLocation
UNION ALL
SELECT 'dbo.DimCustomer', COUNT(*) FROM dbo.DimCustomer
UNION ALL
SELECT 'dbo.DimProduct', COUNT(*) FROM dbo.DimProduct
UNION ALL
SELECT 'dbo.DimPayment', COUNT(*) FROM dbo.DimPayment
UNION ALL
SELECT 'dbo.DimDate', COUNT(*) FROM dbo.DimDate
UNION ALL
SELECT 'dbo.FactSales', COUNT(*) FROM dbo.FactSales;
GO