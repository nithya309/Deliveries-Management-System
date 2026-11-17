USE delivery_project;

-- example 1: update and cancel the change
START TRANSACTION;

UPDATE Deliveries
SET delivery_status = 'Delivered'
WHERE delivery_id = 7;

ROLLBACK;


-- example 2: update and save the change
START TRANSACTION;

UPDATE Deliveries
SET delivery_status = 'Delivered'
WHERE delivery_id = 7;

COMMIT;