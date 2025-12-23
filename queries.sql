
--Create DB

CREATE database vehicle_rental_db


-- Create Table


CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(20) CHECK (role IN ('Admin', 'Customer'))
);

CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    model VARCHAR(50),
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    rental_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('available', 'rented', 'maintenance'))
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')),
    total_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);


INSERT INTO Users VALUES (1, 'Alice', 'alice@example.com', 'pass123', '1234567890', 'Customer');
INSERT INTO Users VALUES (2, 'Bob', 'bob@example.com', 'pass456', '0987654321', 'Admin');
INSERT INTO Users VALUES (3, 'Charlie', 'charlie@example.com', 'pass789', '1122334455', 'Customer');

INSERT INTO Vehicles VALUES (1, 'Toyota Corolla', 'car', '2022', 'ABC-123', 50, 'available');
INSERT INTO Vehicles VALUES (2, 'Honda Civic', 'car', '2021', 'DEF-456', 60, 'rented');
INSERT INTO Vehicles VALUES (3, 'Yamaha R15', 'bike', '2023', 'GHI-789', 30, 'available');
INSERT INTO Vehicles VALUES (4, 'Ford F-150', 'truck', '2020', 'JKL-012', 100, 'maintenance');

INSERT INTO Bookings VALUES (1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240);
INSERT INTO Bookings VALUES (2, 1, 2, '2023-11-01', '2023-11-03', 'cancelled', 0);
INSERT INTO Bookings VALUES (3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60);
INSERT INTO Bookings VALUES (4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);



-- Query 1: JOIN (Customer and Vehicle names)
SELECT b.booking_id, u.name AS customer_name, v.name AS vehicle_name, b.start_date, b.end_date, b.status
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Vehicles v ON b.vehicle_id = v.vehicle_id;


-- Query 2: EXISTS (Vehicles never booked)
SELECT * FROM Vehicles v
WHERE NOT EXISTS (
    SELECT 1 FROM Bookings b WHERE b.vehicle_id = v.vehicle_id
);


-- Query 3: WHERE (Available cars)
SELECT * FROM Vehicles
WHERE type = 'car' AND status = 'available';




-- Query 4: GROUP BY & HAVING (More than 2 bookings)
SELECT v.name AS vehicle_name, COUNT(b.booking_id) AS total_bookings
FROM Vehicles v
JOIN Bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;