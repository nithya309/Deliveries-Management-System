USE delivery_project;

DROP FUNCTION IF EXISTS get_customer_order_value;

DELIMITER //

CREATE FUNCTION get_customer_order_value(
    p_customer_id INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_value DECIMAL(10,2);

    SELECT COALESCE(SUM(order_value), 0)
    INTO total_value
    FROM Orders
    WHERE customer_id = p_customer_id;

    RETURN total_value;
END //

DELIMITER ;


-- calculate total order value for customer 1
SELECT get_customer_order_value(1) AS total_order_value;