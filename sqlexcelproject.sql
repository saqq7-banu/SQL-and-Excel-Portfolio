select * from pizza_sales
select sum(total_price) AS Total_Revenue from pizza_sales
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales  ---> distinct is used to eliminate the duplicates
select sum(quantity) as total_pizza_sold from pizza_sales
select count(distinct order_id) as total_orders from pizza_sales
select cast(cast(sum(quantity) as decimal(10,2))/ cast(count(distinct order_id)as decimal(10,2)) as decimal(10,2)) as Avg_pizza_perOrder from  pizza_sales 
---> here cast function is used and given as decimal (10,2),, 10 means total no. of decimals but we want 2 positions hence given 2 and casting to the whole query to get the actual result 


SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)


SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)

select pizza_category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales where month(order_id) = 1) as PCT 
from pizza_sales
where month(order_id) = 1
group by pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC


SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC



SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC


