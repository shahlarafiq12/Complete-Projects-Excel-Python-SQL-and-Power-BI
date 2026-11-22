# Customer ka naam, order ID, order date, product name, quantity aur total amount 
SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    p.product_name,
    o.quantity,
    o.total_amount
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id;

# Total Sales    
SELECT
    SUM(total_amount) AS total_sales
FROM orders;

# Sales by Customer
SELECT
    c.customer_name,
    SUM(o.total_amount) AS customer_sales
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

# Sales by Product
SELECT
    p.product_name,
    SUM(o.total_amount) AS product_sales
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_name;


-- Monthly Sales Analysis
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- Count Total Orders
SELECT
    COUNT(order_id) AS total_orders
FROM orders;

-- Average Order Value
SELECT
    AVG(total_amount) AS average_order_value
FROM orders;