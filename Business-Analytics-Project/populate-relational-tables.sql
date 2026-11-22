
USE retail_business_analytics;

-- 1. Customers Table
INSERT IGNORE INTO customers
(customer_id, customer_name, segment)
SELECT DISTINCT
customer_id, customer_name, segment
FROM superstore_raw;

-- 2. Products Table
INSERT IGNORE INTO products
(product_id, category, sub_category, product_name)
SELECT DISTINCT
product_id, category, sub_category, product_name
FROM superstore_raw;

-- 3. Orders Table
INSERT IGNORE INTO orders
(order_id, order_date, ship_date, ship_mode,
 customer_id, country_region, city,
 state_province, postal_code, region)
SELECT
order_id,
MIN(order_date),
MIN(ship_date),
MIN(ship_mode),
MIN(customer_id),
MIN(country_region),
MIN(city),
MIN(state_province),
MIN(postal_code),
MIN(region)
FROM superstore_raw
GROUP BY order_id;

-- 4. Order Details Table
INSERT IGNORE INTO order_details
(row_id, order_id, product_id, sales,
 quantity, discount, profit)
SELECT
row_id, order_id, product_id, sales,
quantity, discount, profit
FROM superstore_raw;
