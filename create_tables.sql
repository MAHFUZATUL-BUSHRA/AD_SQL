-- Advanced SQL: Table Creation Script
-- This script creates all necessary tables for the examples

-- CREATE THE DATABASE TO STORE THE TABLE

DROP DATABASE IF EXISTS ADVANCED_SQL_DB;
CREATE DATABASE ADVANCED_SQL_DB;

USE ADVANCED_SQL_DB;

-- Drop tables if they exist to ensure clean setup
-- DROP TABLE IF EXISTS sales_targets;
-- DROP TABLE IF EXISTS inventory;
-- DROP TABLE IF EXISTS order_items;
-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS customers;
-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS categories;
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS departments;
-- DROP TABLE IF EXISTS regions;

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    budget DECIMAL(12, 2),
    location VARCHAR(50)
);

-- Create regions table
CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- Create employees table with self-referential relationship for managers
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE NOT NULL,
    department_id INT,
    region_id INT,
    manager_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (region_id) REFERENCES regions(region_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

-- Create categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description TEXT
);

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    unit_price DECIMAL(10, 2) NOT NULL,
    discontinued BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    contact_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    region_id INT,
    first_purchase_date DATE,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE NOT NULL,
    required_date DATE,
    shipped_date DATE,
    shipping_fee DECIMAL(10, 2) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Create order_items table
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    discount DECIMAL(4, 2) DEFAULT 0,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create inventory table
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    warehouse VARCHAR(50) NOT NULL,
    quantity_in_stock INT NOT NULL,
    reorder_level INT,
    last_stock_update DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create sales_targets table
CREATE TABLE sales_targets (
    target_id INT PRIMARY KEY,
    region_id INT,
    target_year INT NOT NULL,
    target_month INT NOT NULL,
    target_amount DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);
