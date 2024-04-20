use superstore;
select * from superstore1;
-- Total Sales and Profit:
select SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM 
    superstore1;
    
    -- Average Sales by Region:
SELECT 
    Region,
    AVG(Sales) AS AverageSales
FROM 
    superstore1
GROUP BY 
    Region;
    
    
    -- Top 5 Customers by Sales:
SELECT Customer_Name, SUM(Sales) AS TotalSales
FROM superstore1
GROUP BY Customer_Name
ORDER BY TotalSales DESC
LIMIT 5;

-- Total Sales by Year:
SELECT 
    YEAR(Order_Date) AS Year,
    SUM(Sales) AS TotalSales
FROM 
    superstore1
GROUP BY 
    YEAR(Order_Date);
    
    -- Sales Distribution by Category:
    SELECT 
    Category,
    SUM(Sales) AS TotalSales
FROM 
    superstore1
GROUP BY 
    Category;
    
   -- Profit Margin by Product Name:
SELECT 
    Product_Name,
    SUM(Profit) / SUM(Sales) AS ProfitMargin
FROM 
    superstore1
GROUP BY 
    Product_Name;
    
    -- Orders with Discounts:
SELECT 
    COUNT(Order_ID) AS NumOrdersWithDiscount
FROM 
    superstore1
WHERE 
    Discount > 0;

-- Top 3 Most Profitable Sub-Categories:
SELECT 
    Sub_Category,
    SUM(Profit) AS TotalProfit
FROM 
    superstore1
GROUP BY 
    Sub_Category
ORDER BY 
    TotalProfit DESC
LIMIT 3;

-- Customers with Multiple Orders:
SELECT 
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS NumOrders
FROM 
    superstore1
GROUP BY 
    Customer_ID, Customer_Name
HAVING 
    NumOrders > 1;


-- Sales Contribution Percentage by Product Category:
SELECT 
    Category,
    SUM(Sales) AS TotalSales,
    SUM(Sales) / (SELECT SUM(Sales) FROM superstore1) * 100 AS SalesContributionPercentage
FROM 
    superstore1
GROUP BY 
    Category;


-- Sales Rank within Each Category:
SELECT 
    Order_ID,
    Product_ID,
    Category,
    Sales,
    RANK() OVER (PARTITION BY Category ORDER BY Sales DESC) AS SalesRank
FROM 
    superstore1;


select * from superstore1;