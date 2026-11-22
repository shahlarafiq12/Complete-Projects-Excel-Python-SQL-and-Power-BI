SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.segment,
    p.category,
    p.sub_category,
    od.sales,
    od.quantity,
    od.profit
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN order_details od
    ON o.order_id = od.order_id
INNER JOIN products p
    ON od.product_id = p.product_id
LIMIT 10;