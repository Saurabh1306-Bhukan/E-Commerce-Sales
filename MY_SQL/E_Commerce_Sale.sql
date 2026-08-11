create database e_commerce_sale;
use e_commerce_sale;
select * from cleaned_e_commerce_sale;

-- Find the total number of orders.
select count(*) as total_order
from cleaned_e_commerce_sale;

-- Find the total number of orders per category.
SELECT category, COUNT(*) AS total_orders
FROM cleaned_e_commerce_sale
GROUP BY category
ORDER BY total_orders DESC;

-- Calculate the total revenue generated.

select sum(total_amount) as total_revenue
from cleaned_e_commerce_sale;

-- Find the average order value.
select avg(total_amount) as average_order_value
from cleaned_e_commerce_sale;
-- ----------- or -------------- 
SELECT ROUND(AVG(total_amount), 2) AS average_order_value
FROM cleaned_e_commerce_sale;

-- Display all unique product categories.
select distinct(category) as unique_product
from cleaned_e_commerce_sale
order by category;

-- Count the number of customers.
select count(distinct(customer_id)) as total_customer
from cleaned_e_commerce_sale;

-- Find the minimum and maximum product price.
select min(price) as min_price,
       max(price) as max_price
from cleaned_e_commerce_sale;

-- Calculate the average shipping cost.
select round(avg(shipping_cost),3) as avg_shipping_cost
from cleaned_e_commerce_sale;
    
    
-- show dataset
select * from cleaned_e_commerce_sale;


-- Find the average discount offered.
select round(avg(discount),3) as avg_discount
from cleaned_e_commerce_sale;

-- Count the number of returned orders.
select count(returned) as return_orders
from cleaned_e_commerce_sale
where returned = "Yes";

-- ------------ or ---------------

SELECT COUNT(*) AS returned_orders
FROM cleaned_e_commerce_sale
WHERE returned = 'Yes';

-- Find the average delivery time.
select avg(delivery_time) as avg_delivery_time
from cleaned_e_commerce_sale;

-- show dataset
select * from cleaned_e_commerce_sale;

-- Category Analysis:-

-- Which product category generates the highest revenue?
select category, round(sum(total_amount),2) as total_revenue
from cleaned_e_commerce_sale
group by category
order by total_revenue desc
limit 1;     -- remove limit show all product

-- Find the average profit margin for each category.
select category, round(avg(profit_margin),2) as avg_profit_margin
from cleaned_e_commerce_sale
group by category
order by avg_profit_margin desc;

-- Which category has the highest average selling price?
select category, round(avg(price),2) as high_avg_selling_price
from cleaned_e_commerce_sale
group by category
order by high_avg_selling_price desc;

-- show dataset
select * from cleaned_e_commerce_sale;

-- Find the total quantity sold by category.
select category, sum(quantity) as tot_qnt_sold_category
from cleaned_e_commerce_sale
group by category
order by tot_qnt_sold_category desc;

-- Which category has the highest return rate?
SELECT category,
    COUNT(CASE WHEN returned = 'Yes' THEN 1 END) AS returned_orders
FROM cleaned_e_commerce_sale
GROUP BY category
ORDER BY returned_orders DESC;

-- Region Analysis:-

-- Which region generates the highest revenue?
select region, round(sum(total_amount),3) as highest_revenue
from cleaned_e_commerce_sale
group by region
order by highest_revenue desc;

-- Find the average shipping cost by region.
select region, round(avg(shipping_cost),2) as avg_shipping_cost
from cleaned_e_commerce_sale
group by region
order by avg_shipping_cost desc;

-- Which region has the highest average delivery time?
select region, round(avg(delivery_time),2) as avg_delivery_time
from cleaned_e_commerce_sale
group by region
order by avg_delivery_time desc;

-- show dataset
select * from cleaned_e_commerce_sale;

-- Find the total quantity sold by category.
select category, round(sum(quantity)) as quantity_sold_by_category
from cleaned_e_commerce_sale
group by category
order by quantity_sold_by_category desc;

-- Number of returned orders in each category.
select category, 
count( case when returned = "Yes" then 1 end ) as category_return_rate
from cleaned_e_commerce_sale
group by category
order by category_return_rate desc;

--  Which category has the highest return rate?  
SELECT
    category,
    COUNT(CASE WHEN returned = 'Yes' THEN 1 END) AS returned_orders,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(CASE WHEN returned = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS return_rate
FROM cleaned_e_commerce_sale
GROUP BY category
ORDER BY return_rate DESC;

-- Region Analysis

-- show dataset
select * from cleaned_e_commerce_sale;

-- Which region generates the highest revenue?
select region, round(sum(total_amount),2) as highest_revenue
from cleaned_e_commerce_sale
group by region
order by highest_revenue desc;

-- Find the average shipping cost by region.
select region, round(avg(shipping_cost),2) as avg_shipping_cost
from cleaned_e_commerce_sale
group by region
order by avg_shipping_cost desc;

-- Which region has the highest average delivery time?
select region, round(avg(delivery_time),2) as avg_delivery_time
from cleaned_e_commerce_sale
group by region
order by avg_delivery_time desc;

-- Find the total orders placed in each region.
select region, count(*) as total_order
from cleaned_e_commerce_sale
group by region
order by total_order desc;

-- Which region has the highest profit margin?
select region, round(sum(profit_margin),2) as highest_profit_margin
from cleaned_e_commerce_sale
group by region
order by highest_profit_margin desc;

-- Customer Analysis
-- show dataset
select * from cleaned_e_commerce_sale;

-- Find the top 10 customers based on total spending.

select customer_id, round(sum(total_amount),2) as top10_spending_cus
from cleaned_e_commerce_sale
group by customer_id
order by top10_spending_cus desc
limit 10;

-- Which customer placed the highest number of orders?
select customer_id , count(*) as num_order
from cleaned_e_commerce_sale
group by customer_id
order by num_order desc;

-- Which age group spends the most?
select age_group , round(sum(total_amount),2) as spend_most
from cleaned_e_commerce_sale
group by age_group
order by spend_most desc;

-- Compare spending by gender.
select gender , round(sum(total_amount),2) as spend_most
from cleaned_e_commerce_sale
group by gender
order by spend_most desc;

-- Payment Analysis
-- Which payment method is used the most?
select payment_method, count(*) as payment_method_used
from cleaned_e_commerce_sale
group by payment_method
order by payment_method_used desc;

-- Which payment method has the highest average order value?
SELECT payment_method,ROUND(AVG(total_amount), 2) AS average_order_value
FROM cleaned_e_commerce_sale
GROUP BY payment_method
ORDER BY average_order_value DESC;

-- Discount Analysis:-

-- Which category receives the highest average discount?
SELECT category, ROUND(AVG(discount), 2) AS average_discount
FROM cleaned_e_commerce_sale
GROUP BY category
ORDER BY average_discount DESC
LIMIT 1;

-- Find the average profit margin for each discount level.
SELECT discount, ROUND(AVG(profit_margin), 2) AS average_profit_margin
FROM cleaned_e_commerce_sale
GROUP BY discount
ORDER BY discount;

-- or ------------

SELECT discount,
    ROUND((SUM(profit_margin) / SUM(total_amount)) * 100, 2) AS average_profit_margin
FROM cleaned_e_commerce_sale
GROUP BY discount
ORDER BY average_profit_margin desc;

-- Which discount percentage generates the highest revenue?
SELECT
    discount,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM cleaned_e_commerce_sale
GROUP BY discount
ORDER BY total_revenue DESC;

-- Discount Analysis:-
-- Which category receives the highest average discount?
SELECT
    category,
    ROUND(AVG(discount), 2) AS average_discount
FROM cleaned_e_commerce_sale
GROUP BY category
ORDER BY average_discount DESC;

-- Find the average profit margin for each discount level.
SELECT
    discount,
    ROUND(AVG(profit_margin), 2) AS average_profit_margin
FROM cleaned_e_commerce_sale
GROUP BY discount
ORDER BY discount;

-- ------------or -------------
SELECT
    discount,
    ROUND((SUM(profit_margin) / SUM(total_amount)) * 100, 2) AS average_profit_margin
FROM cleaned_e_commerce_sale
GROUP BY discount
ORDER BY discount;

-- Which discount percentage generates the highest revenue?
SELECT
    discount,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM cleaned_e_commerce_sale
GROUP BY discount
ORDER BY total_revenue DESC
LIMIT 1;

-- Delivery Analysis:-
-- Does longer delivery time increase return rates?
SELECT
    delivery_time,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN returned = 'Yes' THEN 1 END) AS returned_orders,
    ROUND(
        COUNT(CASE WHEN returned = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS return_rate
FROM cleaned_e_commerce_sale
GROUP BY delivery_time
ORDER BY delivery_time;

-- Which category has the fastest delivery?
SELECT
    category,
    ROUND(AVG(delivery_time), 2) AS average_delivery_time
FROM cleaned_e_commerce_sale
GROUP BY category
ORDER BY average_delivery_time ASC
LIMIT 1;

-- Which category has the slowest delivery?
SELECT
    category,
    ROUND(AVG(delivery_time), 2) AS average_delivery_time
FROM cleaned_e_commerce_sale
GROUP BY category
ORDER BY average_delivery_time DESC
LIMIT 1;


-- Rank product categories by total revenue.
SELECT
    category,
    SUM(total_amount) AS total_revenue,
    RANK() OVER (ORDER BY SUM(total_amount) DESC) AS revenue_rank
FROM cleaned_e_commerce_sale
GROUP BY category;

-- --------------or  using dense_rank -------------
SELECT
    category,
    SUM(total_amount) AS total_revenue,
    DENSE_RANK() OVER (ORDER BY SUM(total_amount) DESC) AS revenue_rank
FROM cleaned_e_commerce_sale
GROUP BY category;

