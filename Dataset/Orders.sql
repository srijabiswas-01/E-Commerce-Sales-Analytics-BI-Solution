/*=========================================================
    E-COMMERCE ORDER GENERATOR FOR SSIS
=========================================================*/

---------------------------------------------------------
-- CREATE TABLE IF NOT EXISTS
---------------------------------------------------------
IF OBJECT_ID('dbo.OrderDetails','U') IS NULL
BEGIN
    CREATE TABLE dbo.OrderDetails
    (
        OrderID INT PRIMARY KEY,
        CustomerID VARCHAR(10) NOT NULL,
        ProductID VARCHAR(10) NOT NULL,
        OrderDate DATE NOT NULL,
        Quantity INT NOT NULL,
        UnitPrice DECIMAL(10,2) NOT NULL,
        Discount DECIMAL(5,2) NOT NULL,
        PaymentMethod VARCHAR(30) NOT NULL,
        OrderStatus VARCHAR(30) NOT NULL,
        CreatedDate DATETIME NOT NULL
            DEFAULT GETDATE()
    );
END;

---------------------------------------------------------
-- FIND LAST ORDER
---------------------------------------------------------
DECLARE @MaxOrderID INT;

SELECT
    @MaxOrderID = ISNULL(MAX(OrderID),1000)
FROM dbo.OrderDetails;

---------------------------------------------------------
-- NUMBER OF ORDERS TO GENERATE
---------------------------------------------------------
DECLARE @NumberOfOrders INT = 10000;
DECLARE @i INT = 1;
DECLARE @OrderID INT;

---------------------------------------------------------
-- GENERATE DATA
---------------------------------------------------------
WHILE @i <= @NumberOfOrders
BEGIN

    SET @OrderID = @MaxOrderID + @i;

    IF NOT EXISTS
    (
        SELECT 1
        FROM dbo.OrderDetails
        WHERE OrderID=@OrderID
    )
    BEGIN

        INSERT INTO dbo.OrderDetails
        (
            OrderID,
            CustomerID,
            ProductID,
            OrderDate,
            Quantity,
            UnitPrice,
            Discount,
            PaymentMethod,
            OrderStatus
        )
        VALUES
        (
            ------------------------------------------------
            -- Order ID
            ------------------------------------------------
            @OrderID,

            ------------------------------------------------
            -- Customer
            ------------------------------------------------
            'C' +
            RIGHT(
                '0000' +
                CAST(
                    (ABS(CHECKSUM(NEWID())) % 1000)+1
                    AS VARCHAR
                ),
                4
            ),

            ------------------------------------------------
            -- Product
            ------------------------------------------------
            'P' +
            RIGHT(
                '000' +
                CAST(
                    (ABS(CHECKSUM(NEWID())) % 250)+1
                    AS VARCHAR
                ),
                3
            ),

            ------------------------------------------------
            -- Order Date
            ------------------------------------------------
            DATEADD
            (
                DAY,
                -(ABS(CHECKSUM(NEWID())) % 730),
                CAST(GETDATE() AS DATE)
            ),

            ------------------------------------------------
            -- Quantity
            ------------------------------------------------
            (ABS(CHECKSUM(NEWID())) % 10)+1,

            ------------------------------------------------
            -- Unit Price
            ------------------------------------------------
            CASE ABS(CHECKSUM(NEWID())) % 15
                WHEN 0 THEN 199
                WHEN 1 THEN 299
                WHEN 2 THEN 399
                WHEN 3 THEN 499
                WHEN 4 THEN 599
                WHEN 5 THEN 699
                WHEN 6 THEN 799
                WHEN 7 THEN 899
                WHEN 8 THEN 999
                WHEN 9 THEN 1299
                WHEN 10 THEN 1499
                WHEN 11 THEN 1999
                WHEN 12 THEN 2499
                WHEN 13 THEN 2999
                ELSE 3499
            END,

            ------------------------------------------------
            -- Discount
            ------------------------------------------------
            CASE ABS(CHECKSUM(NEWID())) % 6
                WHEN 0 THEN 0
                WHEN 1 THEN 5
                WHEN 2 THEN 10
                WHEN 3 THEN 15
                WHEN 4 THEN 20
                ELSE 25
            END,

            ------------------------------------------------
            -- Payment
            ------------------------------------------------
            CASE ABS(CHECKSUM(NEWID())) % 6
                WHEN 0 THEN 'UPI'
                WHEN 1 THEN 'Credit Card'
                WHEN 2 THEN 'Debit Card'
                WHEN 3 THEN 'Cash'
                WHEN 4 THEN 'Wallet'
                ELSE 'Net Banking'
            END,

            ------------------------------------------------
            -- Status
            ------------------------------------------------
            CASE ABS(CHECKSUM(NEWID())) % 5
                WHEN 0 THEN 'Delivered'
                WHEN 1 THEN 'Shipped'
                WHEN 2 THEN 'Processing'
                WHEN 3 THEN 'Cancelled'
                ELSE 'Returned'
            END
        );

    END;

    SET @i = @i + 1;

END;

---------------------------------------------------------
-- VERIFY
---------------------------------------------------------
SELECT COUNT(*) AS TotalOrders
FROM dbo.OrderDetails;