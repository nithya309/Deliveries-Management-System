USE delivery_project;

-- view 1: customer order summary
CREATE OR REPLACE VIEW customer_order_summary AS
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.order_value), 0) AS total_order_value
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


-- view 2: delivery details summary
CREATE OR REPLACE VIEW delivery_details_summary AS
SELECT
    d.delivery_id,
    o.order_id,
    c.customer_name,
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


-- view 3: delivery status summary
CREATE OR REPLACE VIEW delivery_status_summary AS
SELECT
    delivery_status,
    COUNT(*) AS total_deliveries
FROM Deliveries
GROUP BY delivery_status;


-- display views
SELECT * FROM customer_order_summary;

SELECT * FROM delivery_details_summary;

SELECT * FROM delivery_status_summary;