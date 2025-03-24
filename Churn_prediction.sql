-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS customerers_db;
USE customerers_db;

-- Step 2: Create Table for Customer Churn Prediction
CREATE TABLE IF NOT EXISTS customs(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,  -- Unique Customer ID
    name VARCHAR(255) NOT NULL,                  -- Customer Name
    age INT NOT NULL,                            -- Age of the Customer
    gender ENUM('Male', 'Female') NOT NULL,      -- Gender (Categorical)
    tenure INT NOT NULL,                         -- Number of months the customer has been active
    monthly_spending FLOAT NOT NULL,             -- Monthly spending
    total_spent FLOAT NOT NULL,                  -- Total amount spent
    num_support_tickets INT DEFAULT 0,           -- Number of customer support tickets
    num_transactions INT NOT NULL,               -- Total number of purchases made
    last_transaction_date DATE,                  -- Date of last transaction
    subscription_type ENUM('Basic', 'Standard', 'Premium') NOT NULL,  -- Subscription Type
    payment_method ENUM('Credit Card', 'Debit Card', 'PayPal', 'Net Banking') NOT NULL, -- Payment Method
    is_churned BOOLEAN DEFAULT 0                 -- Churn status (1 = churned, 0 = retained)
);

-- Step 3: Insert Sample Data
INSERT INTO customs
(name, age, gender, tenure, monthly_spending, total_spent, num_support_tickets, num_transactions, last_transaction_date, subscription_type, payment_method, is_churned)
VALUES 
('Alice Johnson', 29, 'Female', 12, 50.5, 600.0, 2, 20, '2024-03-01', 'Standard', 'Credit Card', 0),
('Bob Smith', 35, 'Male', 24, 75.0, 1800.0, 1, 40, '2024-02-15', 'Premium', 'PayPal', 0),
('Charlie Brown', 41, 'Male', 36, 30.0, 1080.0, 3, 35, '2023-12-20', 'Basic', 'Debit Card', 1),
('Diana Prince', 27, 'Female', 6, 95.0, 570.0, 0, 10, '2024-03-10', 'Premium', 'Credit Card', 0),
('Ethan Hunt', 50, 'Male', 48, 20.0, 960.0, 5, 50, '2023-10-05', 'Basic', 'Net Banking', 1),
('Fiona Davis', 31, 'Female', 18, 60.0, 1080.0, 2, 25, '2024-02-20', 'Standard', 'Debit Card', 0);
