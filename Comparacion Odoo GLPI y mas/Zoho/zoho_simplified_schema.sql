
-- ===========================================
-- Script SQL Simplificado de la Base de Datos Zoho CRM
-- Para uso en MySQL Workbench
-- ===========================================

create database zoho;
use zoho;

CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    industry VARCHAR(255),
    phone VARCHAR(50),
    website VARCHAR(255),
    billing_address TEXT
);

CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE leads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company VARCHAR(255),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(50),
    status VARCHAR(50),
    converted BOOLEAN DEFAULT FALSE
);

CREATE TABLE deals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    contact_id INT,
    name VARCHAR(255) NOT NULL,
    stage VARCHAR(100),
    amount DECIMAL(12,2),
    close_date DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY (contact_id) REFERENCES contacts(id)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    unit_price DECIMAL(12,2),
    stock_qty INT
);

CREATE TABLE quotes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    contact_id INT,
    quote_date DATE,
    total DECIMAL(12,2),
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY (contact_id) REFERENCES contacts(id)
);

CREATE TABLE sales_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quote_id INT,
    account_id INT,
    contact_id INT,
    order_date DATE,
    status VARCHAR(50),
    total DECIMAL(12,2),
    FOREIGN KEY (quote_id) REFERENCES quotes(id),
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY (contact_id) REFERENCES contacts(id)
);

CREATE TABLE invoices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sales_order_id INT,
    invoice_date DATE,
    due_date DATE,
    total DECIMAL(12,2),
    status VARCHAR(50),
    FOREIGN KEY (sales_order_id) REFERENCES sales_orders(id)
);

CREATE TABLE vendors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(50),
    address TEXT
);

CREATE TABLE purchase_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vendor_id INT,
    order_date DATE,
    total DECIMAL(12,2),
    status VARCHAR(50),
    FOREIGN KEY (vendor_id) REFERENCES vendors(id)
);

CREATE TABLE sales_order_lines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sales_order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(12,2),
    FOREIGN KEY (sales_order_id) REFERENCES sales_orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE purchase_order_lines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(12,2),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
