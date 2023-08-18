SELECT * FROM retail.store;

-- Top selling product
create view Total_selling_product as
(SELECT Product_Name, SUM(Quantity) AS TotalQuantitySold
FROM store
GROUP BY Product_Name
ORDER BY TotalQuantitySold DESC
LIMIT 10);
 
 
-- top customers by sales
create view top_10_customers_by_quantity as 
(select CustomerName, sum(Quantity) as product_buy
from store
group by CustomerName
order by product_buy desc
limit 10);



-- sales by region
create view sales_by_region as
( select Region, sum(sales) as total_sales 
from store 
group by Region
order by total_sales desc
);


-- profit by category 
create view profit_by_category as
(select Category, sum(Profit) as total_profit
from store 
group by Category 
order by total_profit desc);


--  total discount per category 
create view total_discount_per_category as
(select category , sum(discount) as total_discount
from store 
group by category 
order by total_discount desc);


select distinct(city) from store;

-- quantity sold per city
select city , sum(quantity) as total_quantity
from store 
group by city
order by total_quantity desc 
limit 10; 

create view city_sales as (
select city , sum(quantity) as total_quantity
from store 
group by city
order by total_quantity desc
);



--
-- quantity sold per sub category 
select subcategory , sum(quantity) as total_quantity
from store 
group by subcategory
order by total_quantity desc;

create INDEX city_name
on store(City(40));



-- total profit by sub category 
select subcategory , sum(profit) as total_profit, sum(discount) as total_discount,sum(quantity) as total_quantity
from store 
where city = 'New York City'
group by subcategory
order by total_discount desc;



city_name

-- total discount by subcategory 
select subcategory , sum(discount) as total_discount
from store 
group by subcategory
order by total_discount desc;


select * from store 
where city = ' New York City' 
;




select * from store ;

UPDATE store
SET OrderDate = str_TO_DATE(OrderDate, '%m/%d/%Y');

ALTER TABLE `retail`.`store`
CHANGE COLUMN `OrderDate` `OrderDate` DATE NULL DEFAULT NULL;



UPDATE store
SET orderdate = DATE_FORMAT((orderdate, '%m/%d/%Y'), '%Y/%m/%d');


SELECT DATE_FORMAT(orderdate , '%Y/%m/%d') AS formatted_date
FROM store;


select year(orderdate), max(Quantity) as Max_Sale
from store 
group by year(orderdate)
order by Max_Sale desc;



SELECT OrderID, CustomerName, Product_Name, Quantity, Discount
FROM store
WHERE Discount > 0.3 AND Quantity < 5
ORDER BY Discount DESC, Quantity ASC
LIMIT 10;




SELECT CustomerName, COUNT(DISTINCT OrderID) AS NumberOfOrders,
       AVG(Sales) AS AvgOrderValue, SUM(Sales) AS TotalSpending
FROM store
GROUP BY CustomerName
ORDER BY TotalSpending DESC;


SELECT Product_Name, Sales, Profit
FROM store
WHERE Profit < 0 AND (Sales + Profit) < 0;


SELECT ShipMode, COUNT(*) AS NumberOfOrders, SUM(Sales) AS TotalSales
FROM store
GROUP BY ShipMode;


SELECT Product_Name, Category, SubCategory,
       SUM(Profit) AS TotalProfit, SUM(Sales) AS TotalSales,
       (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100 AS ProfitMargin
FROM store
GROUP BY Product_Name, Category, SubCategory
ORDER BY ProfitMargin DESC
LIMIT 10;


SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, Region,
       SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM store
GROUP BY OrderYear, OrderMonth, Region
ORDER BY OrderYear, OrderMonth, Region;

SELECT CustomerName, COUNT(DISTINCT OrderID) AS NumberOfOrders, SUM(Sales) AS TotalSpending
FROM store
GROUP BY CustomerName
HAVING NumberOfOrders > 1 AND TotalSpending > 1000
ORDER BY TotalSpending DESC;


SELECT Category, SubCategory, AVG(Discount) AS AvgDiscount
FROM store
GROUP BY Category, SubCategory
ORDER BY AvgDiscount DESC;


SELECT Segment, Category, SUM(Profit) AS TotalProfit
FROM store
GROUP BY Segment, Category
ORDER BY TotalProfit DESC;


SELECT OrderID, CustomerName, Sales, Profit
FROM store
WHERE Profit < 0
ORDER BY Profit ASC
LIMIT 10;

SELECT Category, AVG(Profit) AS AvgProfit, AVG(Sales) AS AvgSales
FROM store
GROUP BY Category
ORDER BY AvgProfit DESC;


SELECT Discount, AVG(Sales) AS AvgSales
FROM store
GROUP BY Discount
ORDER BY Discount;


SELECT Category, SUM(Profit) AS TotalProfit
FROM store
GROUP BY Category
ORDER BY TotalProfit DESC;

SELECT CustomerName, SUM(Sales) AS TotalSpending
FROM store
GROUP BY CustomerName
ORDER BY TotalSpending DESC
LIMIT 10;

SELECT Product_Name, SUM(Quantity) AS TotalQuantitySold
FROM store
GROUP BY Product_Name
ORDER BY TotalQuantitySold DESC
LIMIT 10;


SELECT SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM store;







SELECT DATE_FORMAT(orderdate, '%Y-%m-%d') AS formatted_date
FROM store;


SELECT CustomerName, COUNT(DISTINCT OrderID) AS NumberOfOrders,
       MAX(OrderDate) AS LastOrderDate
FROM store
GROUP BY CustomerName
ORDER BY LastOrderDate ;



SELECT Discount, AVG(Profit) AS AvgProfit, AVG(Sales) AS AvgSales
FROM store
GROUP BY Discount
ORDER BY Discount;


SELECT year(OrderDate) AS OrderYear, Category, SUM(Profit) AS TotalProfit
FROM store
GROUP BY OrderYear, Category
ORDER BY OrderYear, TotalProfit DESC;


SELECT SubCategory, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM store
GROUP BY SubCategory
ORDER BY TotalProfit DESC;


SELECT CustomerName, COUNT(DISTINCT OrderID) AS NumberOfOrders,
       DATEDIFF(MAX(OrderDate), MIN(OrderDate)) AS DaysBetweenFirstAndLastOrder
FROM store
GROUP BY CustomerName
ORDER BY NumberOfOrders DESC;




SELECT DAYOFWEEK(OrderDate) AS DayOfWeek, AVG(Sales) AS AvgSales
FROM store
GROUP BY DayOfWeek
ORDER BY DayOfWeek;


SELECT Product_Name, OrderDate, Sales,Quantity
FROM store
WHERE Product_Name = 'staples'
ORDER BY OrderDate;


SELECT CustomerName, COUNT(DISTINCT OrderID) AS NumberOfOrders,
       DATEDIFF(MAX(OrderDate), MIN(OrderDate)) AS DaysBetweenFirstAndLastOrder
FROM store
GROUP BY CustomerName
ORDER BY NumberOfOrders DESC;


SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth,
       COUNT(*) AS TotalOrders, AVG(Sales) AS AvgSales
FROM store
GROUP BY OrderYear, OrderMonth
ORDER BY OrderYear, OrderMonth;



SELECT Product_Name, SUM(Sales) AS TotalSales, AVG(Discount) AS AvgDiscount
FROM store
GROUP BY Product_Name
ORDER BY TotalSales DESC, AvgDiscount DESC
LIMIT 10;


SELECT Country, State, City, COUNT(*) AS TotalOrders,
       SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM store
GROUP BY Country, State, City
ORDER BY TotalSales DESC;


SELECT YEAR(OrderDate) AS OrderYear, COUNT(DISTINCT CustomerID) AS NewCustomers
FROM store
GROUP BY OrderYear
ORDER BY OrderYear;


SELECT Product_Name, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM store
GROUP BY Product_Name
HAVING TotalSales < 1000 AND TotalProfit > 100
ORDER BY TotalProfit DESC;


create view seasonality as (
SELECT MONTH(OrderDate) AS OrderMonth,
       SUM(Sales) AS TotalSales, AVG(Sales) AS AvgSales
FROM store
GROUP BY OrderMonth
ORDER BY OrderMonth);


SELECT City, COUNT(*) AS TotalOrders, SUM(Sales) AS TotalSales
FROM store
GROUP BY City
ORDER BY TotalSales DESC;


SELECT CustomerName, Category, SubCategory,
       COUNT(DISTINCT OrderID) AS TotalOrders, SUM(Sales) AS TotalSales
FROM store
GROUP BY CustomerName, Category, SubCategory
ORDER BY TotalSales DESC;



SELECT CustomerName, COUNT(DISTINCT OrderID) AS OrderCount
FROM store
GROUP BY CustomerName
ORDER BY OrderCount DESC;


SELECT Category, Product_Name, SUM(Quantity) AS TotalQuantitySold
FROM store
GROUP BY Category, Product_Name
ORDER BY Category, TotalQuantitySold DESC;

SELECT CustomerName, COUNT(*) AS TotalOrders,
       SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM store
WHERE Discount > 0.2 AND Profit > 100
GROUP BY CustomerName
ORDER BY TotalProfit DESC;


SELECT Product_Name, Category, SubCategory, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM store
GROUP BY Product_Name, Category, SubCategory
HAVING TotalProfit < 0
ORDER BY TotalProfit;


SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth,
       AVG(Discount) AS AvgDiscount
FROM store
GROUP BY OrderYear, OrderMonth
ORDER BY OrderYear, OrderMonth;
