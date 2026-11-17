USE delivery_project;

-- 1. customers table
CREATE TABLE IF NOT EXISTS Customers1 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    customer_type VARCHAR(20),
    city VARCHAR(50),
    phone VARCHAR(15) UNIQUE
);

-- 2. orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    service_type VARCHAR(30),
    priority VARCHAR(20),
    order_value DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

-- 3. drivers table
CREATE TABLE IF NOT EXISTS Drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50)
);

-- 4. vehicles table
CREATE TABLE IF NOT EXISTS Vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_type VARCHAR(30) NOT NULL,
    registration_number VARCHAR(20) UNIQUE
);

-- 5. deliveries table
CREATE TABLE IF NOT EXISTS Deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    driver_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    delivery_status VARCHAR(20),
    delivery_minutes INT,
    attempts INT DEFAULT 1,

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    FOREIGN KEY (driver_id)
        REFERENCES Drivers(driver_id),

    FOREIGN KEY (vehicle_id)
        REFERENCES Vehicles(vehicle_id)
);