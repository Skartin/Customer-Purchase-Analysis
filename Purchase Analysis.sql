


-- 1. Explore customer demographics
-- Distribution of customers by age and gender
SELECT 
 gender,
 COUNT(*) AS total_customers
FROM 
 customers
GROUP BY 
 gender;

-- Top locations with the highest number of customers
SELECT 
 location,
 COUNT(*) AS total_customers
FROM 
 customers
GROUP BY 
 location
ORDER BY 
 total_customers DESC
LIMIT 5;

-- 2. Analyze purchase behavior
-- Total revenue generated from sales
SELECT 
 SUM(o.quantity * p.price) AS total_revenue
FROM 
 orders o
JOIN 
 products p ON o.product_id = p.product_id;

-- Average order value
SELECT 
 AVG(o.quantity * p.price) AS avg_order_value
FROM 
 orders o
JOIN 
 products p ON o.product_id = p.product_id;

-- Most popular products based on sales volume
SELECT 
 p.product_name,
 SUM(o.quantity) AS total_sales
FROM 
 orders o
JOIN 
 products p ON o.product_id = p.product_id
GROUP BY 
 p.product_name
ORDER BY 
 total_sales DESC
LIMIT 5;


-- 3. Examine sales trends
-- Monthly sales trends
SELECT 
  STRFTIME('%Y-%m', o.order_date) AS month,
  SUM(o.quantity * p.price) AS total_sales
FROM 
  orders o
JOIN 
  products p ON o.product_id = p.product_id
GROUP BY 
  STRFTIME('%Y-%m', o.order_date)
ORDER BY 
  month;

