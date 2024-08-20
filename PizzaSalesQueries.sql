Create database PizzaSales
USE PizzaSales 
GO
---------------------------------------------------------
Select * From pizza_sales

update pizza_sales
set pizza_name = 'The Vegetables Pizza'
where pizza_name = 'The Vegetables + Vegetables Pizza'

--Total Revenue
Select Round(SUM(total_price), 2) as "Total Revenue"
From pizza_sales 

--Total Orders
Select COUNT(Distinct order_id) as "Total Orders"
From pizza_sales

--Average Order Value
Select Round((SUM(total_price) / Count(Distinct order_id)), 2) 
as "Average Order Value"
From pizza_sales

--Average Pizzas Per Order
Select Round((SUM(quantity) / Count(Distinct order_id)), 2) 
as "Average Pizzas Per Order"
From pizza_sales

--Daily Trend for Total Orders
Select Datename(WEEKDAY, order_date) as "Order Day", 
COUNT(Distinct order_id) as "Total Orders"
From pizza_sales
Group by Datename(DW, order_date)
Order by "Total Orders"

--Hourly Trend for Orders
Select Datepart(HOUR, order_time) as "Order Hour", 
COUNT(Distinct order_id) as "Total Orders"
From pizza_sales
Group by Datepart(HOUR, order_time)
Order by "Total Orders"

--Show the whole hours of the day
--Using a CTE
WITH Hours AS (
    SELECT 0 AS "Order Hour" UNION ALL
    SELECT 1 UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5 UNION ALL
    SELECT 6 UNION ALL
    SELECT 7 UNION ALL
    SELECT 8 UNION ALL
    SELECT 9 UNION ALL
    SELECT 10 UNION ALL
    SELECT 11 UNION ALL
    SELECT 12 UNION ALL
    SELECT 13 UNION ALL
    SELECT 14 UNION ALL
    SELECT 15 UNION ALL
    SELECT 16 UNION ALL
    SELECT 17 UNION ALL
    SELECT 18 UNION ALL
    SELECT 19 UNION ALL
    SELECT 20 UNION ALL
    SELECT 21 UNION ALL
    SELECT 22 UNION ALL
    SELECT 23
)
SELECT 
    H.[Order Hour],
    COUNT(Distinct order_id) as "Total Orders"
FROM 
    Hours H
LEFT JOIN 
    pizza_sales O 
ON DATEPART(HOUR, O.order_time) = H.[Order Hour]
GROUP BY 
    H.[Order Hour]
ORDER BY 
    H.[Order Hour];

--% of Sales by Pizza Category
Select pizza_category,
Round(SUM(total_price), 2) as "Total Revenue",
CAST(Round(SUM(total_price) * 100 / (Select SUM(total_price) From pizza_sales), 2) as varchar) + ' %'
as "% of Sales by Pizza Category"
From pizza_sales
Group by pizza_category
Order by "% of Sales by Pizza Category" DESC

--% of Sales by Pizza Size
Select pizza_size,
Round(SUM(total_price), 2) as "Total Revenue",
CAST(Round(SUM(total_price) * 100 / (Select SUM(total_price) From pizza_sales), 2) as varchar) + ' %'
as "% of Sales by Pizza Category"
From pizza_sales
Group by pizza_size
Order by "% of Sales by Pizza Category" DESC

--Total Pizzas Sold by Pizza Category
Select pizza_category, SUM(quantity) as "Total Pizzas Sold"
From pizza_sales
Group by pizza_category
Order by "Total Pizzas Sold" DESC

--Total Pizzas Sold by Pizza Size
Select pizza_size, SUM(quantity) as "Total Pizzas Sold"
From pizza_sales
Group by pizza_size
Order by "Total Pizzas Sold" DESC

--Top 5 Best Sellers by Total Pizzas Sold
Select Top 5 pizza_name, SUM(quantity) as "Total Pizzas Sold"
From pizza_sales
Group by pizza_name
Order by "Total Pizzas Sold" DESC

--Bottom 5 Best Sellers by Total Pizzas Sold
Select Top 5 pizza_name, SUM(quantity) as "Total Pizzas Sold"
From pizza_sales
Group by pizza_name
Order by "Total Pizzas Sold" 
