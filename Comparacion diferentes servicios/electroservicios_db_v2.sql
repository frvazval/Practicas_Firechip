
-- ===========================================
-- Script Mejorado de la Base de Datos Electroservicios (v3)
-- ===========================================

CREATE DATABASE IF NOT EXISTS electroservicios_db_v2
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE electroservicios_db_v3;

-- ===========================================
-- Tabla entidades (clientes, proveedores, usuarios unificados)
-- ===========================================
CREATE TABLE entidades (
    id_entidad INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('cliente','proveedor','usuario') NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE,
    telefono VARCHAR(50),
    direccion VARCHAR(200),
    codigo_postal VARCHAR(10),
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    identificacion VARCHAR(50), -- DNI, CIF/NIF
    rol ENUM('tecnico','administrador','supervisor','ninguno') DEFAULT 'ninguno',
    estado ENUM('activo','inactivo') DEFAULT 'activo',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,
    updated_by INT,
    FOREIGN KEY (created_by) REFERENCES entidades(id_entidad),
    FOREIGN KEY (updated_by) REFERENCES entidades(id_entidad)
);

-- ===========================================
-- Tabla productos
-- ===========================================
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    codigo_referencia VARCHAR(50) UNIQUE,
    nombre VARCHAR(150) NOT NULL,
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
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_proveedor) REFERENCES entidades(id_entidad)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- ===========================================
-- Tabla movimientos de stock
-- ===========================================
CREATE TABLE movimientos_stock (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    tipo ENUM('entrada','salida','ajuste') NOT NULL,
    cantidad INT NOT NULL,
    fecha_movimiento DATETIME DEFAULT CURRENT_TIMESTAMP,
    referencia VARCHAR(100),
    usuario_id INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES entidades(id_entidad)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- ===========================================
-- Tabla servicios (tickets y órdenes de trabajo)
-- ===========================================
CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    num_orden VARCHAR(50) UNIQUE,
    tipo ENUM('ticket','orden_trabajo') DEFAULT 'orden_trabajo',
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_cierre DATETIME,
    id_cliente INT,
    id_tecnico INT,
    descripcion TEXT,
    estado ENUM('pendiente','en_curso','finalizado','entregado','cerrado') DEFAULT 'pendiente',
    prioridad ENUM('baja','media','alta','critica') DEFAULT 'media',
    impacto ENUM('bajo','medio','alto') DEFAULT 'medio',
    urgencia ENUM('baja','media','alta') DEFAULT 'media',
    sla_tiempo_respuesta INT, -- en horas
    sla_tiempo_resolucion INT, -- en horas
    observaciones TEXT,
    firma_cliente VARCHAR(255),
    firma_tecnico VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES entidades(id_entidad)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (id_tecnico) REFERENCES entidades(id_entidad)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- ===========================================
-- Tabla materiales usados en servicios
-- ===========================================
CREATE TABLE materiales_usados (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT,
    id_producto INT,
    cantidad INT DEFAULT 1,
    precio_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ===========================================
-- Facturación (cabecera + detalle)
-- ===========================================
CREATE TABLE facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    num_factura VARCHAR(50) UNIQUE,
    id_cliente INT,
    fecha_emision DATE,
    estado ENUM('pendiente','pagada','cancelada') DEFAULT 'pendiente',
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES entidades(id_entidad)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE factura_detalle (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT,
    concepto VARCHAR(255),
    cantidad INT DEFAULT 1,
    precio_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ===========================================
-- Adjuntos y comentarios
-- ===========================================
CREATE TABLE adjuntos (
    id_adjunto INT AUTO_INCREMENT PRIMARY KEY,
    tabla_origen ENUM('entidades','productos','servicios','facturas') NOT NULL,
    id_origen INT NOT NULL,
    nombre_archivo VARCHAR(255),
    ruta VARCHAR(255),
    fecha_subida DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES entidades(id_entidad)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    tabla_origen ENUM('entidades','productos','servicios','facturas') NOT NULL,
    id_origen INT NOT NULL,
    texto TEXT NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES entidades(id_entidad)
        ON UPDATE CASCADE ON DELETE SET NULL
);
