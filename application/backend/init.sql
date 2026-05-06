CREATE DATABASE IF NOT EXISTS app_db;
USE app_db;

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample Data
INSERT INTO users (name, email) VALUES
('Rishika Sharma', 'rishika@example.com'),
('Dev Ops', 'devops@example.com');

INSERT INTO products (name, price) VALUES
('Laptop', 75000.00),
('Phone', 30000.00);
