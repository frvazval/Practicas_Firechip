-- Crear la Base de datos
CREATE DATABASE IF NOT EXISTS electroservicios_db
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Poner la BD en uso
USE electroservicios_db;

-- Crear las tablas

-- Tabla clientes
CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(200),
    codigo_postal VARCHAR(10),
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    password VARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla usuarios (Personal interno)
CREATE TABLE usuarios (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol ENUM('tecnico', 'administrador', 'supervisor') DEFAULT 'tecnico',
    estado ENUM('activo', 'inactivo') DEFAULT 'activo'
);

-- Tabla proveedores
CREATE TABLE proveedores (
	id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    cif_nif VARCHAR(20) NOT NULL,
    direccion VARCHAR(200),
    codigo_postal VARCHAR(10),
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(150),
    tipo_proveedor ENUM('fabricante', 'distribuidor', 'servicio_tecnico', 'otros') DEFAULT 'otros',
    condiciones_pago VARCHAR(200)
);

-- Tabla productos (repuestos o materiales)
CREATE TABLE productos (
	id_producto INT AUTO_INCREMENT PRIMARY KEY,
    codigo_referencia VARCHAR(50) UNIQUE,
    nombre VARCHAR(30) NOT NULL,
    descripcion TEXT,
    marca VARCHAR(100),
    modelo VARCHAR(100),
    categoria VARCHAR(100),
    id_proveedor INT,
    precio_unitario DECIMAL(10,2),
    stock_actual INT DEFAULT 0,
    stock_minimo INT DEFAULT 0,
    ubicacion VARCHAR(100),
    observaciones TEXT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- Tabla hojas_servicio
CREATE TABLE hojas_servicio (
	id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    num_orden VARCHAR(50) UNIQUE,
    fecha_servicio DATE,
    id_cliente INT,
    id_tecnico INT,
    descripcion_intervencion TEXT,
    estado ENUM('pendiente', 'en_curso', 'finalizado', 'entregado') DEFAULT 'pendiente',
    observaciones TEXT,
    firma_cliente VARCHAR(255),
    firma_tecnico VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
		ON UPDATE CASCADE
        ON DELETE SET NULL,
	FOREIGN KEY (id_tecnico) REFERENCES usuarios(id_usuario)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- Tabla materiales_usados (intermedia)
CREATE TABLE materiales_usados (
	id_material INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT,
    id_producto INT,
    cantidad INT DEFAULT 1,
    precio_unitario decimal(10,2),
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (id_servicio) REFERENCES hojas_servicio(id_servicio)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Tabla facturas
CREATE TABLE facturas (
	id_factura INT AUTO_INCREMENT PRIMARY KEY,
    num_factura VARCHAR(50) UNIQUE,
    id_servicio INT,
    fecha_emision DATE,
    total DECIMAL(10,2),
    estado ENUM('pendiente', 'pagada', 'cancelada') DEFAULT 'pendiente',
    FOREIGN KEY (id_servicio) REFERENCES hojas_servicio(id_servicio)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);
