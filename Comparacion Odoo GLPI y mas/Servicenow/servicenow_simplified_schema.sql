
-- ===========================================
-- Script SQL Simplificado de la Base de Datos ServiceNow
-- Para uso en MySQL Workbench
-- ===========================================

create database servicenow;
use servicenow;

CREATE TABLE sys_user (
    sys_id CHAR(36) PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    active BOOLEAN DEFAULT TRUE
);

CREATE TABLE sys_user_group (
    sys_id CHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE cmn_company (
    sys_id CHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    website VARCHAR(255)
);

CREATE TABLE cmn_location (
    sys_id CHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE task (
    sys_id CHAR(36) PRIMARY KEY,
    number VARCHAR(100) NOT NULL,
    short_description VARCHAR(255),
    priority VARCHAR(50),
    state VARCHAR(50),
    assigned_to CHAR(36),
    assignment_group CHAR(36),
    FOREIGN KEY (assigned_to) REFERENCES sys_user(sys_id),
    FOREIGN KEY (assignment_group) REFERENCES sys_user_group(sys_id)
);

CREATE TABLE incident (
    sys_id CHAR(36) PRIMARY KEY,
    impact VARCHAR(50),
    urgency VARCHAR(50),
    category VARCHAR(100),
    FOREIGN KEY (sys_id) REFERENCES task(sys_id)
);

CREATE TABLE problem (
    sys_id CHAR(36) PRIMARY KEY,
    root_cause TEXT,
    known_error BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (sys_id) REFERENCES task(sys_id)
);

CREATE TABLE change_request (
    sys_id CHAR(36) PRIMARY KEY,
    type VARCHAR(50),
    risk VARCHAR(50),
    implementation_plan TEXT,
    FOREIGN KEY (sys_id) REFERENCES task(sys_id)
);

CREATE TABLE cmdb_ci (
    sys_id CHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ci_type VARCHAR(100),
    serial_number VARCHAR(100),
    company CHAR(36),
    location CHAR(36),
    FOREIGN KEY (company) REFERENCES cmn_company(sys_id),
    FOREIGN KEY (location) REFERENCES cmn_location(sys_id)
);

CREATE TABLE kb_knowledge (
    sys_id CHAR(36) PRIMARY KEY,
    short_description VARCHAR(255),
    text TEXT,
    author CHAR(36),
    FOREIGN KEY (author) REFERENCES sys_user(sys_id)
);
