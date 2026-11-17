USE delivery_project;

-- insert customer records
INSERT INTO Customers1 VALUES
(1, 'Ravi', 'Individual', 'Hyderabad', '9000000001'),
(2, 'Priya', 'Individual', 'Secunderabad', '9000000002'),
(3, 'ABC Stores', 'Business', 'Hyderabad', '9000000003'),
(4, 'Kiran', 'Individual', 'Warangal', '9000000004'),
(5, 'Fresh Mart', 'Business', 'Hyderabad', '9000000005'),
(6, 'Sneha', 'Individual', 'Nizamabad', '9000000006'),
(7, 'City Mobiles', 'Business', 'Warangal', '9000000007'),
(8, 'Arjun', 'Individual', 'Hyderabad', '9000000008'),
(9, 'Meena', 'Individual', 'Secunderabad', '9000000009'),
(10, 'Daily Needs', 'Business', 'Nizamabad', '9000000010');


-- insert order records
INSERT INTO Orders VALUES
(101, 1, '2026-09-01', 'Express', 'High', 500.00),
(102, 2, '2026-09-01', 'Standard', 'Medium', 300.00),
(103, 3, '2026-09-02', 'Express', 'High', 1500.00),
(104, 1, '2026-09-03', 'Standard', 'Low', 250.00),
(105, 4, '2026-09-03', 'Same Day', 'High', 800.00),
(106, 5, '2026-09-04', 'Express', 'High', 2000.00),
(107, 6, '2026-09-05', 'Standard', 'Medium', 450.00),
(108, 3, '2026-09-06', 'Same Day', 'High', 1200.00),
(109, 7, '2026-09-07', 'Standard', 'Low', 700.00),
(110, 8, '2026-09-08', 'Express', 'Medium', 600.00),
(111, 2, '2026-09-09', 'Same Day', 'High', 350.00),
(112, 9, '2026-09-10', 'Standard', 'Low', 400.00),
(113, 10, '2026-09-11', 'Express', 'High', 1800.00),
(114, 5, '2026-09-12', 'Standard', 'Medium', 900.00),
(115, 1, '2026-09-13', 'Express', 'High', 650.00);


-- insert driver records
INSERT INTO Drivers VALUES
(1, 'Rahul', '9111111111', 'Hyderabad'),
(2, 'Suresh', '9222222222', 'Secunderabad'),
(3, 'Amit', '9333333333', 'Warangal');


-- insert vehicle records
INSERT INTO Vehicles VALUES
(1, 'Bike', 'TS09AB1234'),
(2, 'Van', 'TS09CD5678'),
(3, 'Truck', 'TS09EF9012');


-- insert delivery records
INSERT INTO Deliveries VALUES
(1, 101, 1, 1, 'Delivered', 30, 1),
(2, 102, 2, 1, 'Delivered', 45, 1),
(3, 103, 3, 2, 'Delivered', 60, 2),
(4, 104, 1, 1, 'Delivered', 25, 1),
(5, 105, 2, 2, 'Rescheduled', 80, 2),
(6, 106, 3, 3, 'Delivered', 90, 1),
(7, 107, 1, 1, 'Pending', 0, 1),
(8, 108, 2, 2, 'Delivered', 55, 1),
(9, 109, 3, 1, 'Failed', 70, 3),
(10, 110, 1, 1, 'Delivered', 35, 1),
(11, 111, 2, 1, 'Delivered', 40, 1),
(12, 112, 3, 2, 'Delivered', 50, 1),
(13, 113, 1, 3, 'Delivered', 85, 2),
(14, 114, 2, 2, 'Delivered', 65, 1),
(15, 115, 3, 1, 'Delivered', 30, 1);