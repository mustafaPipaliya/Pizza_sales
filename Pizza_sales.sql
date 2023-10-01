CREATE database pizza_sales;


select * from pizza_sales.pizza_sales ps ;

select  * from pizza_sales ps ;

-- Total Revenue: The Sum of the total price of all pizza orders --

select  
	sum(ps.total_price) as total_revenue 
from pizza_sales ps ;

-- Average Order Value: The average amount spent per order, calculated by dividing the
-- total revenue by the total number of orders --

select sum(total_price) / count(distinct order_id) as average_value from pizza_sales;

-- Total Pizzas Sold: The sum of the quantities of all pizzas sold --

select  
	sum(ps.quantity) as total_pizza_sold 
from pizza_sales ps 

-- Total Orders: The total number of orders placed --

select 
	count(distinct ps.order_id) as total_orders
from pizza_sales ps; 

-- Average Pizzas Per Order: The average number of pizzas sold per order, calculated by
-- dividing the total number of pizzas sold by the total number of orders.

select
	cast(
	cast(sum(quantity) as decimal(10,2))/
	cast(count(distinct order_id) as decimal(10,2))
	as decimal(10,2)) as avg_pizza_per_order
from pizza_sales ps;

-- Daily Trend for Total Orders: --
-- I am getting null values here , what to do ? --

select 
	year (ps.order_date) as order_day,
	count(distinct ps.order_id) as total_orders
from pizza_sales ps 
group by year (ps.order_date);

-- Hourly Trend for Total Orders -- 
-- Percentage of Sales by Pizza Category: --

select 
 pizza_category,
 sum(total_price) as total_sales,
 sum(total_price) *100 / (select sum(total_price) from pizza_sales ) as PCT
from pizza_sales
group by pizza_category;

-- Percentage of Sales by Pizza size

SELECT 
	pizza_size, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- Top 5 Pizzas by Revenue --
select * from pizza_sales ps ;

select
	pizza_name ,
	sum(total_price) as total_revenue
from pizza_sales ps
group by pizza_name 
order by total_revenue desc limit 5;

-- Top 5 Pizzas by Quantity

select 
	pizza_name,
	sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by total_pizza_sold desc limit 5;

-- Top 5 Pizzas by Total Orders --
select * from pizza_sales ps;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders desc limit 5;



