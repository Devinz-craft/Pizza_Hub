-- KPI --
-- 1.Total Revenue --
-- 2.Average Order Value -- 
-- 3.Total Pizzas Sold --
-- 4.Total Orders--
-- 5.Average Pizzas Per Order --


Select*
From `pizza_sale`;

-- 1.Total Revenue --
CREATE VIEW Total_revenue AS
select sum(total_price) as Total_Revenue 
from `pizza_sale`;

-- 2.Average Order Value --
CREATE VIEW AOV AS
select sum(total_price) / count(distinct (order_id)) AS AVG_Order_Id
from `pizza_sale`;

-- 3.Total Pizzas Sold --
CREATE VIEW Total_Pizza_Sold  AS
select sum(quantity) as Quantity
from `pizza_sale`;

-- 4.Total Orders--
CREATE VIEW Total_Orders  AS 
select count(distinct (order_id)) AS Total_Orders
from `pizza_sale`;

-- 5.Average Pizzas Per Order --
CREATE VIEW AVG_Pizza_Per_Order  AS 
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM `pizza_sale`;




-- TREND ANALYSIS--
-- A. Daily Order Trend --
CREATE VIEW Daily_Trend AS 
Select dayname(order_date_new) AS Order_Day, Count(Distinct(order_id)) AS Daily_Total_Orders
from `pizza_sale`
Group by dayname(order_date_new);

-- B.Monthly Trend --
CREATE VIEW Monthly_Trend AS 
Select monthname(order_date_new) AS Order_Day, Count(Distinct(order_id)) AS Monthly_Total_Orders
from `pizza_sale`
Group by monthname(order_date_new);

-- C.% Sales By Category -- 
CREATE VIEW Sales_By_Category AS 
Select pizza_category, CAST(SUM(total_price) AS DECIMAL (10,2)) as Total_Revenue_Cat,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sale) AS DECIMAL (10,2)) AS PCT
FROM pizza_sale
group by pizza_category;

-- E. % of Sales by Pizza Size-- 
CREATE VIEW Sales_By_Size AS 
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue_size,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sale) AS DECIMAL(10,2)) AS PCT
FROM pizza_sale
Group By pizza_size
Order By pizza_size;

-- F.Quantity of Pizzas Sold by Pizza Category -- 
Create VIew Quatity_Sold_By_Category AS
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sale
WHERE MONTH(order_date_new) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;


-- G.Top 5 Pizzas generating the most Revenue -- 
Create View Most_Selling_Pizza AS
SELECT  pizza_name, SUM(total_price) AS Revenue 
FROM pizza_sale
GROUP BY pizza_name
ORDER BY Revenue DESC
LIMIT 5;

-- H. LEAST 5 GENERATING Pizzas by Revenue -- 
CREATE VIEW Least_pizzas_sold AS 
SELECT  pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sale
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

-- I. Top 5 Pizzas Sold By  Quantity--
CREATE VIEW Pizzas_Sold_By_Quantity AS 
SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sale
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

-- J. Least 5 Pizzas Sold By  Quantity--
CREATE VIEW Least_Pizzas_Sold_By_Quantity AS 
SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sale
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;



