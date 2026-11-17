USE delivery_project;

-- 1. display all customers
SELECT * FROM Customers1;

-- 2. display all orders
SELECT * FROM Orders;

-- 3. display all drivers
SELECT * FROM Drivers;

-- 4. display all vehicles
SELECT * FROM Vehicles;

-- 5. display all deliveries
SELECT * FROM Deliveries;


-- 6. count orders by service type
SELECT service_type,
       COUNT(*) AS total_orders
FROM Orders
GROUP BY service_type;


-- 7. count orders by priority
SELECT priority,
       COUNT(*) AS total_orders
FROM Orders
GROUP BY priority
ORDER BY total_orders DESC;


-- 8. calculate total order value by service type
SELECT service_type,
       SUM(order_value) AS total_value
FROM Orders
GROUP BY service_type;


-- 9. calculate total order value by customer
SELECT c.customer_name,
       SUM(o.order_value) AS total_value
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_value DESC;


-- 10. count deliveries by status
SELECT delivery_status,
       COUNT(*) AS total_deliveries
FROM Deliveries
GROUP BY delivery_status;


-- 11. find cities with the most orders
SELECT c.city,
       COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_orders DESC;


-- 12. count deliveries handled by each driver
SELECT dr.driver_name,
       COUNT(d.delivery_id) AS total_deliveries
FROM Drivers dr
LEFT JOIN Deliveries d
ON dr.driver_id = d.driver_id
GROUP BY dr.driver_id, dr.driver_name
ORDER BY total_deliveries DESC;


-- 13. find the most frequently used vehicles
SELECT v.vehicle_type,
       COUNT(d.delivery_id) AS total_deliveries
FROM Vehicles v
LEFT JOIN Deliveries d
ON v.vehicle_id = d.vehicle_id
GROUP BY v.vehicle_id, v.vehicle_type
ORDER BY total_deliveries DESC;


-- 14. display complete delivery details
SELECT
    d.delivery_id,
    o.order_id,
    c.customer_name,
    c.city AS customer_city,
    dr.driver_name,
    v.vehicle_type,
    d.delivery_status,
    d.delivery_minutes,
    d.attempts
FROM Deliveries d
JOIN Orders o
ON d.order_id = o.order_id
JOIN Customers c
ON o.customer_id = c.customer_id
JOIN Drivers dr
ON d.driver_id = dr.driver_id
JOIN Vehicles v
ON d.vehicle_id = v.vehicle_id;


-- 15. compare delivery outcomes for each driver
SELECT
    dr.driver_name,
    d.delivery_status,
    COUNT(*) AS total
FROM Drivers dr
JOIN Deliveries d
ON dr.driver_id = d.driver_id
GROUP BY dr.driver_name, d.delivery_status
ORDER BY dr.driver_name;


-- 16. find orders requiring multiple attempts
SELECT
    o.order_id,
    dr.driver_name,
    v.vehicle_type,
    d.delivery_status,
    d.attempts
FROM Deliveries d
JOIN Orders o
ON d.order_id = o.order_id
JOIN Drivers dr
ON d.driver_id = dr.driver_id
JOIN Vehicles v
ON d.vehicle_id = v.vehicle_id
WHERE d.attempts > 1;


-- 17. count deliveries requiring extra attempts
SELECT COUNT(*) AS extra_attempt_deliveries
FROM Deliveries
WHERE attempts > 1;


-- 18. calculate average delivery time
SELECT AVG(delivery_minutes) AS average_delivery_time
FROM Deliveries
WHERE delivery_status = 'Delivered';


-- 19. find the highest order value
SELECT MAX(order_value) AS highest_order_value
FROM Orders;


-- 20. find customers and their delivery status
SELECT
    c.customer_name,
    o.order_id,
    d.delivery_status
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Deliveries d
ON o.order_id = d.order_id;