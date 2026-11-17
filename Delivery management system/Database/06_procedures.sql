USE delivery_project;

DROP PROCEDURE IF EXISTS get_deliveries_by_status;

DELIMITER //

CREATE PROCEDURE get_deliveries_by_status(
    IN p_status VARCHAR(20)
)
BEGIN
    SELECT
        d.delivery_id,
        o.order_id,
        c.customer_name,
        dr.driver_name,
        v.vehicle_type,
        d.delivery_status
    FROM Deliveries d
    JOIN Orders o
    ON d.order_id = o.order_id
    JOIN Customers c
    ON o.customer_id = c.customer_id
    JOIN Drivers dr
    ON d.driver_id = dr.driver_id
    JOIN Vehicles v
    ON d.vehicle_id = v.vehicle_id
    WHERE d.delivery_status = p_status;
END //

DELIMITER ;


-- display delivered orders
CALL get_deliveries_by_status('Delivered');

-- display pending orders
CALL get_deliveries_by_status('Pending');