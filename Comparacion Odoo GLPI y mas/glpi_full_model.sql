-- Modelo EER ampliado de GLPI para MySQL Workbench (entidades principales y relaciones)
-- Puedes importar este archivo directamente en MySQL Workbench
create database glpi;
use glpi;

CREATE TABLE glpi_entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE glpi_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    realname VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE glpi_groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE glpi_locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE glpi_suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE glpi_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    filepath VARCHAR(255)
);

CREATE TABLE glpi_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    suppliers_id INT,
    FOREIGN KEY (suppliers_id) REFERENCES glpi_suppliers(id)
);

CREATE TABLE glpi_software (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    version VARCHAR(100)
);

CREATE TABLE glpi_computers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    entities_id INT,
    users_id INT,
    locations_id INT,
    suppliers_id INT,
    FOREIGN KEY (entities_id) REFERENCES glpi_entities(id),
    FOREIGN KEY (users_id) REFERENCES glpi_users(id),
    FOREIGN KEY (locations_id) REFERENCES glpi_locations(id),
    FOREIGN KEY (suppliers_id) REFERENCES glpi_suppliers(id)
);

CREATE TABLE glpi_printers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    entities_id INT,
    locations_id INT,
    suppliers_id INT,
    FOREIGN KEY (entities_id) REFERENCES glpi_entities(id),
    FOREIGN KEY (locations_id) REFERENCES glpi_locations(id),
    FOREIGN KEY (suppliers_id) REFERENCES glpi_suppliers(id)
);

CREATE TABLE glpi_networkequipments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    entities_id INT,
    locations_id INT,
    suppliers_id INT,
    FOREIGN KEY (entities_id) REFERENCES glpi_entities(id),
    FOREIGN KEY (locations_id) REFERENCES glpi_locations(id),
    FOREIGN KEY (suppliers_id) REFERENCES glpi_suppliers(id)
);

CREATE TABLE glpi_phones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    entities_id INT,
    locations_id INT,
    suppliers_id INT,
    FOREIGN KEY (entities_id) REFERENCES glpi_entities(id),
    FOREIGN KEY (locations_id) REFERENCES glpi_locations(id),
    FOREIGN KEY (suppliers_id) REFERENCES glpi_suppliers(id)
);

CREATE TABLE glpi_tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    users_id_recipient INT,
    status INT,
    priority INT,
    date DATETIME,
    FOREIGN KEY (users_id_recipient) REFERENCES glpi_users(id)
);

CREATE TABLE glpi_devices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE glpi_peripherals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE glpi_monitors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Relaciones muchos a muchos entre activos y otras entidades (simplificadas)
CREATE TABLE glpi_items_tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tickets_id INT,
    itemtype VARCHAR(100),
    items_id INT,
    FOREIGN KEY (tickets_id) REFERENCES glpi_tickets(id)
);

CREATE TABLE glpi_items_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    users_id INT,
    itemtype VARCHAR(100),
    items_id INT,
    FOREIGN KEY (users_id) REFERENCES glpi_users(id)
);

CREATE TABLE glpi_items_groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    groups_id INT,
    itemtype VARCHAR(100),
    items_id INT,
    FOREIGN KEY (groups_id) REFERENCES glpi_groups(id)
);

CREATE TABLE glpi_items_entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entities_id INT,
    itemtype VARCHAR(100),
    items_id INT,
    FOREIGN KEY (entities_id) REFERENCES glpi_entities(id)
);

CREATE TABLE glpi_items_locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    locations_id INT,
    itemtype VARCHAR(100),
    items_id INT,
    FOREIGN KEY (locations_id) REFERENCES glpi_locations(id)
);

CREATE TABLE glpi_items_suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    suppliers_id INT,
    itemtype VARCHAR(100),
    items_id INT,
    FOREIGN KEY (suppliers_id) REFERENCES glpi_suppliers(id)
);

CREATE TABLE glpi_items_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    documents_id INT,
    itemtype VARCHAR(100),
    items_id INT,
    FOREIGN KEY (documents_id) REFERENCES glpi_documents(id)
);

CREATE TABLE glpi_items_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contracts_id INT,
    itemtype VARCHAR(100),
    items_id INT,
    FOREIGN KEY (contracts_id) REFERENCES glpi_contracts(id)
);

CREATE TABLE glpi_items_software (
    id INT AUTO_INCREMENT PRIMARY KEY,
    software_id INT,
    itemtype VARCHAR(100),
    items_id INT,
    FOREIGN KEY (software_id) REFERENCES glpi_software(id)
);

-- Relación entre usuarios y grupos (muchos a muchos)
CREATE TABLE glpi_groups_users (
    groups_id INT,
    users_id INT,
    PRIMARY KEY (groups_id, users_id),
    FOREIGN KEY (groups_id) REFERENCES glpi_groups(id),
    FOREIGN KEY (users_id) REFERENCES glpi_users(id)
);

-- Ejemplo de plugin (FusionInventory, inventario de hardware)
CREATE TABLE glpi_plugin_fusioninventory_inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    computers_id INT,
    date DATETIME,
    inventory_data TEXT,
    FOREIGN KEY (computers_id) REFERENCES glpi_computers(id)
);