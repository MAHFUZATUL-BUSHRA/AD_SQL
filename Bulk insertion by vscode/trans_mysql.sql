use coffee_sales;
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    transaction_time TIME,
    transaction_qty INT,
    store_id INT,
    store_location VARCHAR(100),
    product_id INT,
    unit_price DECIMAL(6,2),
    product_category VARCHAR(50),
    product_type VARCHAR(100),
    product_detail VARCHAR(150)
);
SELECT * FROM transactions;
SELECT COUNT(*) AS total_rows FROM transactions;

