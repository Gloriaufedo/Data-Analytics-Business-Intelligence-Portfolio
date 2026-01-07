-- 1. Setup Tables
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Category VARCHAR(50),
    ProductName VARCHAR(100),
    UnitCost DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    Revenue DECIMAL(10,2),
    Region VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 2. Analysis Query: Profitability and Regional Performance
-- Demonstrates CTEs (Common Table Expressions) and Advanced Math
WITH ProfitCalc AS (
    SELECT 
        S.SaleID,
        S.Region,
        S.Revenue,
        (S.Quantity * P.UnitCost) AS TotalCost,
        (S.Revenue - (S.Quantity * P.UnitCost)) AS NetProfit
    FROM Sales S
    JOIN Products P ON S.ProductID = P.ProductID
)
SELECT 
    Region,
    SUM(Revenue) AS Total_Revenue,
    SUM(NetProfit) AS Total_Profit,
    ROUND((SUM(NetProfit) / SUM(Revenue)) * 100, 2) AS Profit_Margin_Percentage
FROM ProfitCalc
GROUP BY Region
ORDER BY Total_Profit DESC;
