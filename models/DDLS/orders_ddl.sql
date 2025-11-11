-- Create the orders table
CREATE OR REPLACE TABLE <project>.<dataset>.orders (
  order_id INT64,
  customer_id INT64,
  order_date DATE,
  order_status STRING,
  order_amount FLOAT64
);


-- Insert 20 sample records
INSERT INTO <project>.<dataset>.orders (order_id, customer_id, order_date, order_status, order_amount)
VALUES
  (1, 101, DATE '2025-10-01', 'Completed', 120.50),
  (2, 102, DATE '2025-10-02', 'Pending', 89.99),
  (3, 103, DATE '2025-10-03', 'Cancelled', 45.00),
  (4, 104, DATE '2025-10-04', 'Completed', 250.00),
  (5, 105, DATE '2025-10-05', 'Shipped', 180.75),
  (6, 106, DATE '2025-10-06', 'Completed', 75.20),
  (7, 107, DATE '2025-10-07', 'Pending', 99.90),
  (8, 108, DATE '2025-10-08', 'Completed', 135.60),
  (9, 109, DATE '2025-10-09', 'Returned', 210.00),
  (10, 110, DATE '2025-10-10', 'Completed', 65.50),
  (11, 101, DATE '2025-10-11', 'Completed', 48.90),
  (12, 102, DATE '2025-10-12', 'Shipped', 320.40),
  (13, 103, DATE '2025-10-13', 'Completed', 199.99),
  (14, 104, DATE '2025-10-14', 'Pending', 84.75),
  (15, 105, DATE '2025-10-15', 'Completed', 512.30),
  (16, 106, DATE '2025-10-16', 'Cancelled', 72.10),
  (17, 107, DATE '2025-10-17', 'Completed', 150.00),
  (18, 108, DATE '2025-10-18', 'Shipped', 240.50),
  (19, 109, DATE '2025-10-19', 'Completed', 315.20),
  (20, 110, DATE '2025-10-20', 'Pending', 98.99);


-- To Query it
SELECT order_status, COUNT(*) AS total_orders, SUM(order_amount) AS total_amount
FROM <project>.<dataset>.orders
GROUP BY order_status;