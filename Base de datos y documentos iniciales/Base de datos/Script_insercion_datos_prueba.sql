USE electroservicios_db;

-- =============================
-- 🧑‍💼 CLIENTES
-- =============================
INSERT INTO clientes (nombre, direccion, codigo_postal, ciudad, provincia, telefono, email, password)
VALUES
('Carlos Pérez', 'Calle Mayor 10', '28013', 'Madrid', 'Madrid', '600123001', 'carlos@example.com', SHA2('cliente01', 256)),
('María López', 'Av. Andalucía 45', '29004', 'Málaga', 'Andalucía', '600123002', 'maria@example.com', SHA2('cliente02', 256)),
('Javier Torres', 'Calle Valencia 8', '46007', 'Valencia', 'Valencia', '600123003', 'javier@example.com', SHA2('cliente03', 256)),
('Laura Martín', 'Plaza España 5', '41001', 'Sevilla', 'Andalucía', '600123004', 'laura@example.com', SHA2('cliente04', 256)),
('Pedro Sánchez', 'Calle Real 12', '15002', 'A Coruña', 'Galicia', '600123005', 'pedro@example.com', SHA2('cliente05', 256)),
('Lucía Gómez', 'Gran Vía 25', '28010', 'Madrid', 'Madrid', '600123006', 'lucia@example.com', SHA2('cliente06', 256)),
('Ana Fernández', 'Av. Cataluña 11', '50001', 'Zaragoza', 'Aragón', '600123007', 'ana@example.com', SHA2('cliente07', 256)),
('David Ruiz', 'Calle del Sol 4', '03001', 'Alicante', 'Valencia', '600123008', 'david@example.com', SHA2('cliente08', 256)),
('Sara Ramos', 'Av. de Lugo 9', '15701', 'Santiago', 'Galicia', '600123009', 'sara@example.com', SHA2('cliente09', 256)),
('Alberto Romero', 'Calle Mayor 22', '39001', 'Santander', 'Cantabria', '600123010', 'alberto@example.com', SHA2('cliente10', 256)),
('Rosa Díaz', 'Calle Norte 5', '18001', 'Granada', 'Andalucía', '600123011', 'rosa@example.com', SHA2('cliente11', 256)),
('Pablo Vázquez', 'Calle Sur 3', '15001', 'A Coruña', 'Galicia', '600123012', 'pablo@example.com', SHA2('cliente12', 256)),
('Marta Iglesias', 'Av. España 20', '08001', 'Barcelona', 'Cataluña', '600123013', 'marta@example.com', SHA2('cliente13', 256)),
('Hugo Navarro', 'Calle Central 9', '33001', 'Oviedo', 'Asturias', '600123014', 'hugo@example.com', SHA2('cliente14', 256)),
('Elena Gil', 'Plaza Mayor 3', '26001', 'Logroño', 'La Rioja', '600123015', 'elena@example.com', SHA2('cliente15', 256)),
('Raúl Ramos', 'Av. del Mar 12', '12540', 'Castellón', 'Valencia', '600123016', 'raul@example.com', SHA2('cliente16', 256)),
('Carmen Ortega', 'Calle del Río 18', '24001', 'León', 'Castilla y León', '600123017', 'carmen@example.com', SHA2('cliente17', 256)),
('Manuel Prieto', 'Av. del Trabajo 4', '29010', 'Málaga', 'Andalucía', '600123018', 'manuel@example.com', SHA2('cliente18', 256)),
('Isabel Soto', 'Calle Jardines 2', '37001', 'Salamanca', 'Castilla y León', '600123019', 'isabel@example.com', SHA2('cliente19', 256)),
('Tomás Vega', 'Calle Prado 7', '28014', 'Madrid', 'Madrid', '600123020', 'tomas@example.com', SHA2('cliente20', 256));

-- =============================
-- 👷 USUARIOS
-- =============================
INSERT INTO usuarios (nombre, email, password, rol, estado)
VALUES
('Administrador', 'admin@electroservicios.com', SHA2('admin123', 256), 'administrador', 'activo'),
('Supervisor General', 'supervisor@electroservicios.com', SHA2('super123', 256), 'supervisor', 'activo'),
('Juan Pérez', 'juan@electroservicios.com', SHA2('tecnico01', 256), 'tecnico', 'activo'),
('Laura Gómez', 'laura@electroservicios.com', SHA2('tecnico02', 256), 'tecnico', 'activo'),
('Carlos Ruiz', 'carlos@electroservicios.com', SHA2('tecnico03', 256), 'tecnico', 'activo'),
('Lucía Martínez', 'lucia@electroservicios.com', SHA2('tecnico04', 256), 'tecnico', 'activo'),
('Pedro López', 'pedro@electroservicios.com', SHA2('tecnico05', 256), 'tecnico', 'activo'),
('María Torres', 'maria@electroservicios.com', SHA2('tecnico06', 256), 'tecnico', 'activo'),
('David Fernández', 'david@electroservicios.com', SHA2('tecnico07', 256), 'tecnico', 'activo'),
('Elena Ramos', 'elena@electroservicios.com', SHA2('tecnico08', 256), 'tecnico', 'activo'),
('Jorge Díaz', 'jorge@electroservicios.com', SHA2('tecnico09', 256), 'tecnico', 'activo'),
('Ana Vázquez', 'ana@electroservicios.com', SHA2('tecnico10', 256), 'tecnico', 'activo'),
('Luis Castro', 'luis@electroservicios.com', SHA2('tecnico11', 256), 'tecnico', 'activo'),
('Eva Morales', 'eva@electroservicios.com', SHA2('tecnico12', 256), 'tecnico', 'activo'),
('Rubén Gil', 'ruben@electroservicios.com', SHA2('tecnico13', 256), 'tecnico', 'activo'),
('Nuria Romero', 'nuria@electroservicios.com', SHA2('tecnico14', 256), 'tecnico', 'activo'),
('Héctor Ramos', 'hector@electroservicios.com', SHA2('tecnico15', 256), 'tecnico', 'activo'),
('Sofía Navarro', 'sofia@electroservicios.com', SHA2('tecnico16', 256), 'tecnico', 'activo'),
('Raquel Soto', 'raquel@electroservicios.com', SHA2('tecnico17', 256), 'tecnico', 'activo'),
('Alberto Peña', 'alberto@electroservicios.com', SHA2('tecnico18', 256), 'tecnico', 'activo');

-- =============================
-- 🏭 PROVEEDORES
-- =============================
INSERT INTO proveedores (nombre, cif_nif, direccion, codigo_postal, ciudad, provincia, telefono, email, tipo_proveedor, condiciones_pago)
VALUES
('Suministros Eléctricos S.A.', 'A12345678', 'Av. Industria 1', '28022', 'Madrid', 'Madrid', '910000001', 'contacto@sumelec.com', 'distribuidor', 'Pago a 30 días'),
('ElectroPartes Iberia', 'B23456789', 'Polígono Sur 22', '41012', 'Sevilla', 'Andalucía', '954000002', 'ventas@epiberia.com', 'fabricante', 'Pago a 45 días'),
('TecnoCable S.L.', 'C34567890', 'Calle Cables 5', '46015', 'Valencia', 'Valencia', '963000003', 'info@tecnocable.es', 'fabricante', 'Pago a 60 días'),
('LuzMax España', 'D45678901', 'Av. de la Luz 10', '08030', 'Barcelona', 'Cataluña', '932000004', 'contacto@luzmax.com', 'distribuidor', 'Pago a 30 días'),
('ElectroRepuestos Norte', 'E56789012', 'Polígono Norte 8', '39011', 'Santander', 'Cantabria', '942000005', 'info@elrepuestos.com', 'distribuidor', 'Contado'),
('Materiales del Sur', 'F67890123', 'Av. del Trabajo 3', '29006', 'Málaga', 'Andalucía', '952000006', 'ventas@materialessur.com', 'fabricante', 'Pago a 30 días'),
('InstalRed', 'G78901234', 'Calle Industria 17', '50015', 'Zaragoza', 'Aragón', '976000007', 'info@instalred.es', 'servicio_tecnico', 'Pago a 15 días'),
('PowerLine España', 'H89012345', 'Av. de la Energía 9', '28050', 'Madrid', 'Madrid', '917000008', 'ventas@powerline.es', 'fabricante', 'Pago a 45 días'),
('CableSur', 'I90123456', 'Calle Mayor 18', '41020', 'Sevilla', 'Andalucía', '954000009', 'info@cablesur.com', 'distribuidor', 'Pago a 30 días'),
('TecnoProveeduría', 'J01234567', 'Av. Central 45', '15004', 'A Coruña', 'Galicia', '981000010', 'info@tecnoproveeduria.es', 'otros', 'Pago a 30 días');

-- =============================
-- ⚙️ PRODUCTOS
-- =============================
INSERT INTO productos (codigo_referencia, nombre, descripcion, marca, modelo, categoria, id_proveedor, precio_unitario, stock_actual, stock_minimo, ubicacion)
VALUES
('PRD001', 'Cable 1.5mm', 'Cable eléctrico 1.5mm sección', 'General Cable', 'GC15', 'Cables', 1, 0.85, 500, 50, 'A1'),
('PRD002', 'Cable 2.5mm', 'Cable eléctrico 2.5mm sección', 'General Cable', 'GC25', 'Cables', 1, 1.10, 400, 40, 'A2'),
('PRD003', 'Interruptor Simple', 'Interruptor unipolar blanco', 'Simon', 'SIM100', 'Electricidad', 4, 2.50, 200, 20, 'B1'),
('PRD004', 'Interruptor Doble', 'Interruptor bipolar blanco', 'Simon', 'SIM200', 'Electricidad', 4, 3.80, 150, 15, 'B2'),
('PRD005', 'Enchufe Schuko', 'Toma de corriente tipo F', 'Legrand', 'LEG01', 'Electricidad', 4, 2.20, 300, 30, 'B3'),
('PRD006', 'Bombilla LED 10W', 'Luz blanca cálida E27', 'Philips', 'LED10W', 'Iluminación', 5, 4.50, 500, 50, 'C1'),
('PRD007', 'Bombilla LED 15W', 'Luz fría E27', 'Philips', 'LED15W', 'Iluminación', 5, 5.00, 400, 50, 'C2'),
('PRD008', 'Tubo LED 120cm', 'Tubo LED blanco frío', 'Osram', 'TLED120', 'Iluminación', 5, 8.50, 250, 25, 'C3'),
('PRD009', 'Cable Coaxial', 'Cable de antena TV 75Ω', 'TeleWire', 'TV75', 'Cables', 3, 0.95, 300, 30, 'A3'),
('PRD010', 'Canaleta 20x20', 'Canaleta PVC blanca', 'Canalplast', 'CP2020', 'Accesorios', 9, 1.75, 150, 20, 'D1'),
('PRD011', 'Regleta 4 enchufes', 'Regleta con interruptor', 'Orbis', 'ORB4E', 'Accesorios', 9, 9.00, 100, 10, 'D2'),
('PRD012', 'Disyuntor 16A', 'Protector magnetotérmico 16A', 'ABB', 'MCB16A', 'Protección', 8, 12.00, 120, 15, 'E1'),
('PRD013', 'Disyuntor 25A', 'Protector magnetotérmico 25A', 'ABB', 'MCB25A', 'Protección', 8, 14.00, 100, 10, 'E2'),
('PRD014', 'Interruptor diferencial', 'Interruptor diferencial 40A/30mA', 'Schneider', 'ID40', 'Protección', 8, 28.00, 80, 8, 'E3'),
('PRD015', 'Toma RJ45', 'Conector Ethernet Cat6', 'Leviton', 'LV-CAT6', 'Redes', 7, 3.50, 200, 25, 'F1'),
('PRD016', 'Módulo empalme', 'Empalme rápido 2 polos', 'Wago', 'W2P', 'Conectores', 7, 1.20, 500, 50, 'F2'),
('PRD017', 'Cinta aislante', 'Rollo cinta negra 20m', '3M', 'T20', 'Accesorios', 10, 0.90, 300, 30, 'F3'),
('PRD018', 'Tubos corrugados', 'Tubo flexible 25mm', 'Rehau', 'RE25', 'Cables', 3, 1.50, 200, 20, 'A4'),
('PRD019', 'Portalámparas', 'Portalámparas E27', 'Legrand', 'LEG27', 'Iluminación', 5, 2.10, 250, 25, 'C4'),
('PRD020', 'Caja de conexión', 'Caja estanca exterior IP65', 'Gewiss', 'GW65', 'Accesorios', 6, 5.50, 120, 15, 'G1');

-- =============================
-- 🧾 HOJAS DE SERVICIO (10 ejemplos)
-- =============================
INSERT INTO hojas_servicio (num_orden, fecha_servicio, id_cliente, id_tecnico, descripcion_intervencion, estado, observaciones)
VALUES
('ORD001', '2025-10-01', 1, 3, 'Instalación de puntos de luz en vivienda nueva.', 'en_curso', ''),
('ORD002', '2025-10-02', 2, 4, 'Revisión del cuadro eléctrico.', 'pendiente', ''),
('ORD003', '2025-10-03', 3, 5, 'Sustitución de luminarias LED.', 'finalizado', ''),
('ORD004', '2025-10-04', 4, 6, 'Cableado red informática.', 'pendiente', ''),
('ORD005', '2025-10-05', 5, 7, 'Reparación de enchufe en cocina.', 'finalizado', ''),
('ORD006', '2025-10-06', 6, 8, 'Instalación de toma de tierra.', 'en_curso', ''),
('ORD007', '2025-10-07', 7, 9, 'Mantenimiento general del sistema eléctrico.', 'pendiente', ''),
('ORD008', '2025-10-08', 8, 10, 'Instalación de lámparas exteriores.', 'en_curso', ''),
('ORD009', '2025-10-09', 9, 11, 'Revisión y sustitución de fusibles.', 'finalizado', ''),
('ORD010', '2025-10-10', 10, 12, 'Sustitución de enchufes deteriorados.', 'pendiente', '');

-- =============================
-- 🔩 MATERIALES USADOS (muestra)
-- =============================
INSERT INTO materiales_usados (id_servicio, id_producto, cantidad, precio_unitario)
VALUES
(1, 1, 20, 0.85),
(1, 3, 10, 2.50),
(2, 12, 2, 12.00),
(3, 7, 5, 5.00),
(4, 15, 8, 3.50),
(5, 5, 2, 2.20),
(6, 14, 1, 28.00),
(7, 4, 6, 3.80),
(8, 6, 4, 4.50),
(9, 16, 10, 1.20),
(10, 20, 2, 5.50),
(1, 17, 3, 0.90),
(2, 2, 15, 1.10),
(3, 10, 5, 1.75),
(4, 9, 8, 0.95),
(5, 11, 1, 9.00),
(6, 8, 4, 8.50),
(7, 18, 5, 1.50),
(8, 13, 2, 14.00),
(9, 19, 3, 2.10);

-- =============================
-- 💰 FACTURAS
-- =============================
INSERT INTO facturas (num_factura, id_servicio, fecha_emision, total, estado)
VALUES
('FAC001', 1, '2025-10-02', 350.00, 'pendiente'),
('FAC002', 2, '2025-10-03', 180.00, 'pendiente'),
('FAC003', 3, '2025-10-04', 250.00, 'pagada'),
('FAC004', 4, '2025-10-05', 120.00, 'pendiente'),
('FAC005', 5, '2025-10-06', 90.00, 'pagada'),
('FAC006', 6, '2025-10-07', 320.00, 'pendiente'),
('FAC007', 7, '2025-10-08', 210.00, 'pendiente'),
('FAC008', 8, '2025-10-09', 145.00, 'pagada'),
('FAC009', 9, '2025-10-10', 275.00, 'pendiente'),
('FAC010', 10, '2025-10-10', 310.00, 'cancelada');
