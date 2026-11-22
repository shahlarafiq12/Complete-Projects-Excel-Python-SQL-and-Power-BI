CREATE DATABASE retail_sales;

USE retail_sales;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

INSERT INTO customers
(customer_name, email, city, phone)
VALUES
('Ali Ahmed', 'ali@gmail.com', 'Lahore', '03001234567'),
('Sara Khan', 'sara@gmail.com', 'Karachi', '03011234567'),
('Ahmed Raza', 'ahmed@gmail.com', 'Islamabad', '03021234567'),
('Ayesha Noor', 'ayesha@gmail.com', 'Lahore', '03031234567'),
('Usman Ali', 'usman@gmail.com', 'Multan', '03041234567'),
('Fatima Khan', 'fatima@gmail.com', 'Faisalabad', '03051234567'),
('Hamza Malik', 'hamza@gmail.com', 'Lahore', '03061234567'),
('Zara Ahmed', 'zara@gmail.com', 'Karachi', '03071234567'),
('Bilal Hussain', 'bilal@gmail.com', 'Peshawar', '03081234567'),
('Hina Rauf', 'hina@gmail.com', 'Islamabad', '03091234567');

SELECT * FROM customers;

INSERT INTO products
(product_name, category, price, stock)
VALUES
('Laptop', 'Electronics', 120000, 15),
('Mobile Phone', 'Electronics', 65000, 20),
('Keyboard', 'Accessories', 2500, 40),
('Mouse', 'Accessories', 1200, 50),
('Headphones', 'Electronics', 4500, 30),
('Office Chair', 'Furniture', 18000, 12),
('Desk Lamp', 'Furniture', 3500, 25),
('Monitor', 'Electronics', 42000, 10),
('USB Drive', 'Accessories', 1800, 60),
('Printer', 'Electronics', 28000, 8);

SELECT * FROM products;

INSERT INTO orders
(customer_id, product_id, order_date, quantity, total_amount)
VALUES
(1, 1, '2026-01-05', 1, 120000),
(2, 2, '2026-01-06', 2, 130000),
(3, 3, '2026-01-07', 2, 5000),
(4, 4, '2026-01-08', 3, 3600),
(5, 5, '2026-01-09', 1, 4500),
(6, 6, '2026-01-10', 2, 36000),
(7, 7, '2026-01-11', 1, 3500),
(8, 8, '2026-01-12', 2, 84000),
(9, 9, '2026-01-13', 5, 9000),
(10, 10, '2026-01-14', 1, 28000);

SELECT * FROM orders;

SELECT * FROM customers;
SELECT * FROM products
WHERE price > 5000;
SELECT * FROM orders
ORDER BY order_date DESC;
SELECT * FROM customers
WHERE city = 'Lahore';