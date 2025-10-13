-- Advanced SQL: Sample Data Insertion Script
-- This script populates all tables with sample data for the examples

-- Insert data into departments
INSERT INTO departments VALUES
(1, 'Executive', 1000000.00, 'Floor 10'),
(2, 'Sales', 500000.00, 'Floor 3'),
(3, 'Marketing', 350000.00, 'Floor 4'),
(4, 'Finance', 400000.00, 'Floor 5'),
(5, 'IT', 450000.00, 'Floor 2'),
(6, 'Customer Service', 300000.00, 'Floor 1'),
(7, 'Human Resources', 250000.00, 'Floor 5'),
(8, 'Research', 550000.00, 'Floor 6');

-- Insert data into regions
INSERT INTO regions VALUES
(1, 'North America', 'USA'),
(2, 'Europe', 'Germany'),
(3, 'Asia Pacific', 'Singapore'),
(4, 'Latin America', 'Brazil'),
(5, 'Middle East', 'UAE');

-- Insert data into employees (with hierarchical structure)
INSERT INTO employees VALUES
-- Executive team
(1, 'John', 'Smith', 'john.smith@example.com', '2010-06-15', 1, 1, NULL, 150000.00),
(2, 'Sarah', 'Johnson', 'sarah.johnson@example.com', '2012-03-22', 1, 1, 1, 120000.00),
-- Sales team
(3, 'Michael', 'Williams', 'michael.williams@example.com', '2014-08-10', 2, 1, 2, 95000.00),
(4, 'Emily', 'Jones', 'emily.jones@example.com', '2016-05-18', 2, 2, 3, 85000.00),
(5, 'David', 'Brown', 'david.brown@example.com', '2017-11-03', 2, 3, 3, 82000.00),
(6, 'Jessica', 'Miller', 'jessica.miller@example.com', '2018-02-15', 2, 4, 3, 80000.00),
(7, 'Daniel', 'Davis', 'daniel.davis@example.com', '2019-07-22', 2, 5, 3, 78000.00),
-- Marketing team
(8, 'Lisa', 'Garcia', 'lisa.garcia@example.com', '2015-04-12', 3, 1, 2, 90000.00),
(9, 'Robert', 'Martinez', 'robert.martinez@example.com', '2017-09-28', 3, 2, 8, 75000.00),
(10, 'Jennifer', 'Robinson', 'jennifer.robinson@example.com', '2018-06-05', 3, 3, 8, 72000.00),
-- Finance team
(11, 'William', 'Lee', 'william.lee@example.com', '2013-12-01', 4, 1, 2, 105000.00),
(12, 'Elizabeth', 'Walker', 'elizabeth.walker@example.com', '2016-10-15', 4, 1, 11, 88000.00),
(13, 'Thomas', 'Hall', 'thomas.hall@example.com', '2018-03-20', 4, 2, 11, 82000.00),
-- IT team
(14, 'Patricia', 'Allen', 'patricia.allen@example.com', '2014-05-10', 5, 1, 2, 98000.00),
(15, 'James', 'Young', 'james.young@example.com', '2016-08-22', 5, 1, 14, 87000.00),
(16, 'Linda', 'Wright', 'linda.wright@example.com', '2018-01-15', 5, 2, 14, 84000.00),
(17, 'Richard', 'Scott', 'richard.scott@example.com', '2019-04-03', 5, 3, 14, 81000.00),
-- Customer Service team
(18, 'Susan', 'Green', 'susan.green@example.com', '2015-07-18', 6, 1, 2, 86000.00),
(19, 'Joseph', 'Adams', 'joseph.adams@example.com', '2017-05-22', 6, 2, 18, 70000.00),
(20, 'Margaret', 'Baker', 'margaret.baker@example.com', '2018-09-10', 6, 3, 18, 68000.00);

-- Insert data into categories
INSERT INTO categories VALUES
(1, 'Electronics', 'Electronic devices and accessories'),
(2, 'Clothing', 'Apparel and fashion items'),
(3, 'Home & Kitchen', 'Household and kitchen products'),
(4, 'Books', 'Books and publications'),
(5, 'Sports & Outdoors', 'Sporting goods and outdoor equipment');

-- Insert data into products
INSERT INTO products VALUES
(1, 'Smartphone X', 1, 799.99, FALSE),
(2, 'Laptop Pro', 1, 1299.99, FALSE),
(3, 'Wireless Headphones', 1, 149.99, FALSE),
(4, 'Smart Watch', 1, 249.99, FALSE),
(5, 'Men\'s Casual Shirt', 2, 39.99, FALSE),
(6, 'Women\'s Dress', 2, 59.99, FALSE),
(7, 'Athletic Shoes', 2, 89.99, FALSE),
(8, 'Coffee Maker', 3, 79.99, FALSE),
(9, 'Blender', 3, 49.99, FALSE),
(10, 'Cookware Set', 3, 129.99, FALSE),
(11, 'Bestselling Novel', 4, 24.99, FALSE),
(12, 'Business Book', 4, 19.99, FALSE),
(13, 'Science Textbook', 4, 59.99, FALSE),
(14, 'Yoga Mat', 5, 29.99, FALSE),
(15, 'Dumbbells Set', 5, 119.99, FALSE),
(16, 'Tennis Racket', 5, 89.99, FALSE),
(17, 'Tablet Mini', 1, 399.99, FALSE),
(18, 'Bluetooth Speaker', 1, 79.99, FALSE),
(19, 'Winter Jacket', 2, 129.99, FALSE),
(20, 'Fitness Tracker', 1, 99.99, FALSE);

-- Insert data into customers
INSERT INTO customers VALUES
(1, 'ABC Corporation', 'Alice Johnson', 'alice@abccorp.com', '555-123-4567', 1, '2020-01-15'),
(2, 'XYZ Ltd', 'Bob Smith', 'bob@xyzltd.com', '555-234-5678', 2, '2020-02-20'),
(3, 'Acme Inc', 'Charlie Brown', 'charlie@acmeinc.com', '555-345-6789', 1, '2020-03-10'),
(4, 'Global Services', 'Diana Prince', 'diana@globalservices.com', '555-456-7890', 3, '2020-04-05'),
(5, 'Tech Solutions', 'Edward Jones', 'edward@techsolutions.com', '555-567-8901', 1, '2020-05-12'),
(6, 'Local Business', 'Fiona Taylor', 'fiona@localbusiness.com', '555-678-9012', 4, '2020-06-18'),
(7, 'Big Enterprise', 'George Miller', 'george@bigenterprise.com', '555-789-0123', 2, '2020-07-22'),
(8, 'Small Startup', 'Hannah Davis', 'hannah@smallstartup.com', '555-890-1234', 5, '2020-08-30'),
(9, 'Mid-Size Company', 'Ian Wilson', 'ian@midsizecompany.com', '555-901-2345', 3, '2020-09-14'),
(10, 'Family Business', 'Julia Roberts', 'julia@familybusiness.com', '555-012-3456', 1, '2020-10-25'),
(11, 'New Ventures', 'Kevin Thompson', 'kevin@newventures.com', '555-123-4567', 4, '2021-01-05'),
(12, 'Old Established', 'Laura Martin', 'laura@oldestablished.com', '555-234-5678', 2, '2021-02-15'),
(13, 'Innovative Corp', 'Mark Anderson', 'mark@innovativecorp.com', '555-345-6789', 3, '2021-03-20'),
(14, 'Traditional Ltd', 'Nancy White', 'nancy@traditionalltd.com', '555-456-7890', 5, '2021-04-10'),
(15, 'Modern Solutions', 'Oliver Green', 'oliver@modernsolutions.com', '555-567-8901', 1, '2021-05-22');

-- Insert data into orders (spanning multiple years for time-series analysis)
INSERT INTO orders VALUES
-- 2022 Orders
(1, 1, 3, '2022-01-10', '2022-01-15', '2022-01-12', 15.00, 'Delivered'),
(2, 2, 4, '2022-01-25', '2022-02-01', '2022-01-30', 20.00, 'Delivered'),
(3, 3, 5, '2022-02-05', '2022-02-10', '2022-02-08', 12.50, 'Delivered'),
(4, 4, 6, '2022-02-15', '2022-02-20', '2022-02-18', 25.00, 'Delivered'),
(5, 5, 3, '2022-03-01', '2022-03-06', '2022-03-04', 15.00, 'Delivered'),
(6, 6, 4, '2022-03-15', '2022-03-20', '2022-03-18', 18.00, 'Delivered'),
(7, 7, 5, '2022-04-02', '2022-04-07', '2022-04-05', 22.50, 'Delivered'),
(8, 8, 6, '2022-04-18', '2022-04-23', '2022-04-20', 30.00, 'Delivered'),
(9, 9, 3, '2022-05-05', '2022-05-10', '2022-05-08', 15.00, 'Delivered'),
(10, 10, 4, '2022-05-20', '2022-05-25', '2022-05-22', 20.00, 'Delivered'),
(11, 11, 5, '2022-06-10', '2022-06-15', '2022-06-12', 12.50, 'Delivered'),
(12, 12, 6, '2022-06-25', '2022-06-30', '2022-06-28', 25.00, 'Delivered'),
-- 2023 Orders
(13, 13, 3, '2023-01-05', '2023-01-10', '2023-01-08', 15.00, 'Delivered'),
(14, 14, 4, '2023-01-20', '2023-01-25', '2023-01-22', 20.00, 'Delivered'),
(15, 15, 5, '2023-02-01', '2023-02-06', '2023-02-04', 12.50, 'Delivered'),
(16, 1, 6, '2023-02-15', '2023-02-20', '2023-02-18', 25.00, 'Delivered'),
(17, 2, 3, '2023-03-05', '2023-03-10', '2023-03-08', 15.00, 'Delivered'),
(18, 3, 4, '2023-03-20', '2023-03-25', '2023-03-22', 18.00, 'Delivered'),
(19, 4, 5, '2023-04-01', '2023-04-06', '2023-04-04', 22.50, 'Delivered'),
(20, 5, 6, '2023-04-15', '2023-04-20', '2023-04-18', 30.00, 'Delivered'),
(21, 6, 3, '2023-05-01', '2023-05-06', '2023-05-04', 15.00, 'Delivered'),
(22, 7, 4, '2023-05-15', '2023-05-20', '2023-05-18', 20.00, 'Delivered'),
(23, 8, 5, '2023-06-01', '2023-06-06', '2023-06-04', 12.50, 'Delivered'),
(24, 9, 6, '2023-06-15', '2023-06-20', '2023-06-18', 25.00, 'Delivered'),
-- 2024 Orders
(25, 10, 3, '2024-01-05', '2024-01-10', '2024-01-08', 15.00, 'Delivered'),
(26, 11, 4, '2024-01-20', '2024-01-25', '2024-01-22', 20.00, 'Delivered'),
(27, 12, 5, '2024-02-01', '2024-02-06', '2024-02-04', 12.50, 'Delivered'),
(28, 13, 6, '2024-02-15', '2024-02-20', '2024-02-18', 25.00, 'Delivered'),
(29, 14, 3, '2024-03-01', '2024-03-06', '2024-03-04', 15.00, 'Delivered'),
(30, 15, 4, '2024-03-15', '2024-03-20', '2024-03-18', 18.00, 'Delivered'),
(31, 1, 5, '2024-04-01', '2024-04-06', '2024-04-04', 22.50, 'Delivered'),
(32, 2, 6, '2024-04-15', '2024-04-20', '2024-04-18', 30.00, 'Delivered'),
(33, 3, 3, '2024-05-01', '2024-05-06', '2024-05-04', 15.00, 'Delivered'),
(34, 4, 4, '2024-05-15', '2024-05-20', NULL, 20.00, 'Shipped'),
(35, 5, 5, '2024-05-25', '2024-05-30', NULL, 12.50, 'Processing'),
(36, 6, 6, '2024-05-28', '2024-06-02', NULL, 25.00, 'Pending');

-- Insert data into order_items
INSERT INTO order_items VALUES
-- Order 1
(1, 1, 799.99, 1, 0.00),
(1, 3, 149.99, 2, 0.05),
-- Order 2
(2, 2, 1299.99, 1, 0.10),
(2, 4, 249.99, 1, 0.00),
-- Order 3
(3, 5, 39.99, 3, 0.15),
(3, 7, 89.99, 1, 0.00),
-- Order 4
(4, 8, 79.99, 1, 0.00),
(4, 9, 49.99, 2, 0.10),
-- Order 5
(5, 11, 24.99, 5, 0.20),
(5, 12, 19.99, 3, 0.10),
-- Order 6
(6, 14, 29.99, 2, 0.00),
(6, 16, 89.99, 1, 0.05),
-- Order 7
(7, 17, 399.99, 1, 0.00),
(7, 18, 79.99, 1, 0.00),
-- Order 8
(8, 19, 129.99, 2, 0.10),
(8, 20, 99.99, 1, 0.00),
-- Order 9
(9, 1, 799.99, 1, 0.05),
(9, 4, 249.99, 1, 0.00),
-- Order 10
(10, 6, 59.99, 2, 0.15),
(10, 7, 89.99, 1, 0.00),
-- Orders 11-36 (simplified for brevity)
(11, 10, 129.99, 1, 0.00),
(12, 13, 59.99, 2, 0.10),
(13, 15, 119.99, 1, 0.05),
(14, 2, 1299.99, 1, 0.15),
(15, 5, 39.99, 4, 0.20),
(16, 8, 79.99, 2, 0.00),
(17, 11, 24.99, 10, 0.25),
(18, 14, 29.99, 3, 0.00),
(19, 17, 399.99, 1, 0.10),
(20, 19, 129.99, 1, 0.00),
(21, 3, 149.99, 2, 0.05),
(22, 6, 59.99, 3, 0.15),
(23, 9, 49.99, 2, 0.00),
(24, 12, 19.99, 5, 0.10),
(25, 1, 799.99, 1, 0.00),
(26, 4, 249.99, 2, 0.10),
(27, 7, 89.99, 2, 0.05),
(28, 10, 129.99, 1, 0.00),
(29, 13, 59.99, 3, 0.15),
(30, 16, 89.99, 1, 0.00),
(31, 2, 1299.99, 1, 0.20),
(32, 5, 39.99, 5, 0.10),
(33, 8, 79.99, 2, 0.00),
(34, 11, 24.99, 8, 0.15),
(35, 14, 29.99, 3, 0.00),
(36, 17, 399.99, 1, 0.10);

-- Insert data into inventory
INSERT INTO inventory VALUES
(1, 1, 'Main Warehouse', 50, 10, '2024-05-15'),
(2, 2, 'Main Warehouse', 25, 5, '2024-05-15'),
(3, 3, 'Main Warehouse', 100, 20, '2024-05-15'),
(4, 4, 'Main Warehouse', 75, 15, '2024-05-15'),
(5, 5, 'Apparel Warehouse', 200, 50, '2024-05-15'),
(6, 6, 'Apparel Warehouse', 150, 30, '2024-05-15'),
(7, 7, 'Apparel Warehouse', 100, 25, '2024-05-15'),
(8, 8, 'Home Warehouse', 80, 20, '2024-05-15'),
(9, 9, 'Home Warehouse', 60, 15, '2024-05-15'),
(10, 10, 'Home Warehouse', 40, 10, '2024-05-15'),
(11, 11, 'Book Warehouse', 300, 50, '2024-05-15'),
(12, 12, 'Book Warehouse', 250, 40, '2024-05-15'),
(13, 13, 'Book Warehouse', 150, 30, '2024-05-15'),
(14, 14, 'Sports Warehouse', 120, 30, '2024-05-15'),
(15, 15, 'Sports Warehouse', 80, 20, '2024-05-15'),
(16, 16, 'Sports Warehouse', 60, 15, '2024-05-15'),
(17, 17, 'Main Warehouse', 45, 10, '2024-05-15'),
(18, 18, 'Main Warehouse', 90, 20, '2024-05-15'),
(19, 19, 'Apparel Warehouse', 70, 20, '2024-05-15'),
(20, 20, 'Main Warehouse', 110, 25, '2024-05-15');

-- Insert data into sales_targets (for 2022-2024)
INSERT INTO sales_targets VALUES
-- 2022 Targets
(1, 1, 2022, 1, 50000.00),
(2, 1, 2022, 2, 55000.00),
(3, 1, 2022, 3, 60000.00),
(4, 1, 2022, 4, 65000.00),
(5, 1, 2022, 5, 70000.00),
(6, 1, 2022, 6, 75000.00),
(7, 1, 2022, 7, 80000.00),
(8, 1, 2022, 8, 85000.00),
(9, 1, 2022, 9, 90000.00),
(10, 1, 2022, 10, 95000.00),
(11, 1, 2022, 11, 100000.00),
(12, 1, 2022, 12, 110000.00),
-- 2023 Targets (North America)
(13, 1, 2023, 1, 60000.00),
(14, 1, 2023, 2, 65000.00),
(15, 1, 2023, 3, 70000.00),
(16, 1, 2023, 4, 75000.00),
(17, 1, 2023, 5, 80000.00),
(18, 1, 2023, 6, 85000.00),
(19, 1, 2023, 7, 90000.00),
(20, 1, 2023, 8, 95000.00),
(21, 1, 2023, 9, 100000.00),
(22, 1, 2023, 10, 105000.00),
(23, 1, 2023, 11, 110000.00),
(24, 1, 2023, 12, 120000.00),
-- 2024 Targets (North America)
(25, 1, 2024, 1, 70000.00),
(26, 1, 2024, 2, 75000.00),
(27, 1, 2024, 3, 80000.00),
(28, 1, 2024, 4, 85000.00),
(29, 1, 2024, 5, 90000.00),
(30, 1, 2024, 6, 95000.00),
-- 2023 Targets (Europe)
(31, 2, 2023, 1, 45000.00),
(32, 2, 2023, 2, 50000.00),
(33, 2, 2023, 3, 55000.00),
(34, 2, 2023, 4, 60000.00),
(35, 2, 2023, 5, 65000.00),
(36, 2, 2023, 6, 70000.00),
-- 2023 Targets (Asia Pacific)
(37, 3, 2023, 1, 40000.00),
(38, 3, 2023, 2, 45000.00),
(39, 3, 2023, 3, 50000.00),
(40, 3, 2023, 4, 55000.00),
(41, 3, 2023, 5, 60000.00),
(42, 3, 2023, 6, 65000.00);
