
-- Script simplificado de la estructura de Odoo para MySQL Workbench
create database odoo;
use odoo;

CREATE TABLE res_company (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    currency_id INT,
    partner_id INT
);

CREATE TABLE res_partner (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(50),
    is_company BOOLEAN DEFAULT FALSE,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES res_company(id)
);

CREATE TABLE res_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255),
    active BOOLEAN DEFAULT TRUE,
    partner_id INT,
    company_id INT,
    FOREIGN KEY (partner_id) REFERENCES res_partner(id),
    FOREIGN KEY (company_id) REFERENCES res_company(id)
);

CREATE TABLE product_template (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    list_price DECIMAL(12,2),
    uom_id INT,
    type VARCHAR(50)
);

CREATE TABLE sale_order (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_order DATETIME,
    partner_id INT,
    user_id INT,
    company_id INT,
    FOREIGN KEY (partner_id) REFERENCES res_partner(id),
    FOREIGN KEY (user_id) REFERENCES res_users(id),
    FOREIGN KEY (company_id) REFERENCES res_company(id)
);

CREATE TABLE sale_order_line (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    product_uom_qty DECIMAL(12,2),
    price_unit DECIMAL(12,2),
    FOREIGN KEY (order_id) REFERENCES sale_order(id),
    FOREIGN KEY (product_id) REFERENCES product_template(id)
);

CREATE TABLE purchase_order (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_order DATETIME,
    partner_id INT,
    company_id INT,
    FOREIGN KEY (partner_id) REFERENCES res_partner(id),
    FOREIGN KEY (company_id) REFERENCES res_company(id)
);

CREATE TABLE purchase_order_line (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    product_qty DECIMAL(12,2),
    price_unit DECIMAL(12,2),
    FOREIGN KEY (order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (product_id) REFERENCES product_template(id)
);

CREATE TABLE stock_picking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    scheduled_date DATETIME,
    company_id INT,
    partner_id INT,
    FOREIGN KEY (company_id) REFERENCES res_company(id),
    FOREIGN KEY (partner_id) REFERENCES res_partner(id)
);

CREATE TABLE stock_move (
    id INT AUTO_INCREMENT PRIMARY KEY,
    picking_id INT,
    product_id INT,
    product_uom_qty DECIMAL(12,2),
    state VARCHAR(50),
    FOREIGN KEY (picking_id) REFERENCES stock_picking(id),
    FOREIGN KEY (product_id) REFERENCES product_template(id)
);

CREATE TABLE account_move (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date DATE,
    move_type VARCHAR(50),
    partner_id INT,
    company_id INT,
    FOREIGN KEY (partner_id) REFERENCES res_partner(id),
    FOREIGN KEY (company_id) REFERENCES res_company(id)
);

CREATE TABLE account_move_line (
    id INT AUTO_INCREMENT PRIMARY KEY,
    move_id INT,
    account_id INT,
    debit DECIMAL(12,2),
    credit DECIMAL(12,2),
    balance DECIMAL(12,2),
    FOREIGN KEY (move_id) REFERENCES account_move(id)
);

CREATE TABLE hr_employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    work_email VARCHAR(255),
    work_phone VARCHAR(50),
    company_id INT,
    partner_id INT,
    FOREIGN KEY (company_id) REFERENCES res_company(id),
    FOREIGN KEY (partner_id) REFERENCES res_partner(id)
);

CREATE TABLE hr_contract (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    wage DECIMAL(12,2),
    date_start DATE,
    date_end DATE,
    FOREIGN KEY (employee_id) REFERENCES hr_employee(id)
);

CREATE TABLE hr_attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    check_in DATETIME,
    check_out DATETIME,
    FOREIGN KEY (employee_id) REFERENCES hr_employee(id)
);

CREATE TABLE mail_message (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(255),
    body TEXT,
    author_id INT,
    res_id INT,
    model VARCHAR(255),
    FOREIGN KEY (author_id) REFERENCES res_users(id)
);

CREATE TABLE ir_attachment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    datas LONGBLOB,
    res_model VARCHAR(255),
    res_id INT,
    create_uid INT,
    FOREIGN KEY (create_uid) REFERENCES res_users(id)
);
