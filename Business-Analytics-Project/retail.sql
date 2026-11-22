# CREATE DATABASE retail_business_analytics;

USE retail_business_analytics;


-- 1. Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50)
);

-- 2. Products Table
CREATE TABLE products (
    product_id VARCHAR(30) PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255)
);

-- 3. Orders Table
CREATE TABLE orders (
    order_id VARCHAR(30) PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    country_region VARCHAR(100),
    city VARCHAR(100),
    state_province VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

-- 4. Order Details Table
CREATE TABLE order_details (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(30),
    product_id VARCHAR(30),
    sales DECIMAL(12,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(12,2),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);
