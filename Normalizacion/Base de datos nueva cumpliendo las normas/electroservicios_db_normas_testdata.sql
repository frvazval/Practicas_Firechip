USE electroservicios_db_normas;

-- ===========================================
-- ENTIDADES (Clientes, Proveedores y Usuarios)
-- ===========================================
INSERT INTO entidades (tipo, nombre, email, telefono, direccion, codigo_postal, ciudad, provincia, identificacion, rol, estado)
VALUES
('cliente', 'Industrias Romero S.A.', 'mantenimiento@industriasromero.es', '911234567', 'Av. del Progreso 120', '28032', 'Madrid', 'Madrid', 'A12345678', 'ninguno', 'activo'),
('cliente', 'Electrodomésticos Vega', 'contacto@vegaelectro.com', '958441122', 'Calle Granada 45', '18004', 'Granada', 'Granada', 'B23456789', 'ninguno', 'activo'),
('proveedor', 'Siemens España S.L.', 'ventas@siemens.es', '934556677', 'C/ Aragó 385', '08013', 'Barcelona', 'Barcelona', 'A45678912', 'ninguno', 'activo'),
('proveedor', 'Schneider Electric Iberia', 'pedidos@schneider-electric.com', '914225577', 'C/ Albasanz 16', '28037', 'Madrid', 'Madrid', 'A78912345', 'ninguno', 'activo'),
('proveedor', 'Omron Electronics Iberia', 'soporte@omron.es', '935444210', 'C/ Balmes 231', '08006', 'Barcelona', 'Barcelona', 'A98765432', 'ninguno', 'activo'),
('usuario', 'Javier Torres', 'jtorres@electroservicios.com', '600111222', 'C/ Alcalá 45', '28014', 'Madrid', 'Madrid', '12345678A', 'tecnico', 'activo'),
('usuario', 'Lucía Navarro', 'lnavarro@electroservicios.com', '600333444', 'C/ Goya 12', '28001', 'Madrid', 'Madrid', '87654321B', 'administrador', 'activo'),
('usuario', 'Miguel Ruiz', 'mruiz@electroservicios.com', '601223344', 'C/ O’Donnell 18', '28009', 'Madrid', 'Madrid', '11223344C', 'supervisor', 'activo');

-- ===========================================
-- PRODUCTOS (Componentes y equipos eléctricos/electrónicos)
-- ===========================================
INSERT INTO productos (codigo_referencia, nombre, descripcion, marca, modelo, categoria, id_proveedor, precio_unitario, stock_actual, stock_minimo, ubicacion)
VALUES
('SMN-PLC-1001', 'PLC Siemens S7-1200', 'Controlador lógico programable modular', 'Siemens', 'CPU1212C', 'Control industrial', 3, 320.00, 15, 3, 'A1-01'),
('SCH-VFD-2002', 'Variador de frecuencia 2.2kW', 'Variador para motor trifásico 400V', 'Schneider Electric', 'Altivar 12', 'Control de motores', 4, 410.00, 8, 2, 'A2-03'),
('OMR-SEN-3003', 'Sensor de proximidad inductivo M12', 'Sensor NPN 12VDC alcance 4mm', 'Omron', 'E2E-X4D1', 'Sensores', 5, 25.00, 50, 10, 'B1-01'),
('SCH-RLY-4004', 'Relé de control 24VDC', 'Relé electromecánico con base incluida', 'Schneider Electric', 'RXM4AB2BD', 'Automatización', 4, 12.50, 100, 20, 'B2-01'),
('SMN-PSU-5005', 'Fuente de alimentación 24V 10A', 'Fuente con protección contra cortocircuitos', 'Siemens', 'Sitop PSU100S', 'Fuentes de alimentación', 3, 130.00, 25, 5, 'C1-01');

-- ===========================================
-- MOVIMIENTOS DE STOCK
-- ===========================================
INSERT INTO movimientos_stock (id_producto, tipo, cantidad, referencia, usuario_id)
VALUES
(1, 'entrada', 15, 'Pedido inicial SIEM2025-01', 7),
(2, 'entrada', 8, 'Pedido inicial SCH2025-01', 7),
(3, 'entrada', 50, 'Pedido inicial OMR2025-01', 7),
(4, 'entrada', 100, 'Pedido inicial SCH2025-02', 7),
(5, 'entrada', 25, 'Pedido inicial SIEM2025-02', 7),
(3, 'salida', 5, 'Servicio S001', 6);

-- ===========================================
-- SERVICIOS (Reparaciones, instalaciones y mantenimiento)
-- ===========================================
INSERT INTO servicios (num_orden, tipo, id_cliente, id_tecnico, descripcion, estado, prioridad, impacto, urgencia, sla_tiempo_respuesta, sla_tiempo_resolucion, observaciones)
VALUES
('OT-2025-001', 'orden_trabajo', 1, 6, 'Revisión de cuadro eléctrico en línea de producción', 'en_curso', 'alta', 'medio', 'alta', 4, 24, 'Cliente requiere reinicio de línea urgente'),
('OT-2025-002', 'orden_trabajo', 2, 6, 'Reparación de fuente de alimentación Siemens Sitop', 'finalizado', 'media', 'bajo', 'media', 8, 48, 'Reemplazo completado con éxito'),
('OT-2025-003', 'ticket', 1, 6, 'Configuración de variador Altivar 12', 'pendiente', 'media', 'medio', 'media', 6, 24, 'Pendiente visita programada para la semana próxima');

-- ===========================================
-- MATERIALES USADOS EN SERVICIOS
-- ===========================================
INSERT INTO materiales_usados (id_servicio, id_producto, cantidad, precio_unitario)
VALUES
(1, 4, 4, 12.50),
(1, 3, 2, 25.00),
(2, 5, 1, 130.00),
(3, 2, 1, 410.00);

-- ===========================================
-- FACTURAS Y DETALLES
-- ===========================================
INSERT INTO facturas (num_factura, id_cliente, fecha_emision, estado, total)
VALUES
('F-2025-001', 1, '2025-10-05', 'pagada', 200.00),
('F-2025-002', 2, '2025-10-10', 'pendiente', 130.00);

INSERT INTO factura_detalle (id_factura, concepto, cantidad, precio_unitario)
VALUES
(1, 'Revisión y reparación cuadro eléctrico', 1, 200.00),
(2, 'Reparación fuente de alimentación Siemens', 1, 130.00);

-- ===========================================
-- DOCUMENTOS DE CALIDAD
-- ===========================================
INSERT INTO documentos_calidad (codigo, titulo, tipo, version, fecha_emision, responsable_id, archivo, observaciones)
VALUES
('DOC-001', 'Manual de Calidad Electroservicios', 'manual', 'v2.0', '2025-02-15', 8, '/docs/calidad/manual_calidad_v2.pdf', 'Adaptado a ISO 9001:2015'),
('PROC-002', 'Procedimiento de mantenimiento preventivo', 'procedimiento', 'v1.1', '2025-03-10', 7, '/docs/calidad/procedimientos/mantenimiento_preventivo.pdf', 'Incluye nuevas rutinas de calibración');

-- ===========================================
-- NO CONFORMIDADES Y ACCIONES CORRECTIVAS
-- ===========================================
INSERT INTO no_conformidades (codigo, fecha_detectada, origen, descripcion, id_responsable, estado)
VALUES
('NC-2025-001', '2025-04-14', 'proceso_interno', 'No se registró calibración del multímetro Fluke', 8, 'en_proceso'),
('NC-2025-002', '2025-06-20', 'cliente', 'Retraso en entrega de reparación a cliente Vega', 7, 'abierta');

INSERT INTO acciones_correctivas (id_nc, descripcion, responsable_id, fecha_inicio, estado)
VALUES
(1, 'Actualizar registro de calibraciones mensuales', 7, '2025-04-20', 'implementada'),
(2, 'Revisar tiempos de reparación y optimizar planificación', 6, '2025-06-25', 'en_proceso');

-- ===========================================
-- AUDITORÍAS Y HALLAZGOS
-- ===========================================
INSERT INTO auditorias (tipo, fecha, auditor, norma_aplicable, estado, informe)
VALUES
('interna', '2025-04-10', 'Laura Sánchez', 'ISO9001', 'realizada', 'Auditoría interna de primer semestre. Hallazgos menores.'),
('proveedor', '2025-07-05', 'Miguel Ruiz', 'IATF16949', 'cerrada', 'Evaluación positiva de proveedores principales.');

INSERT INTO hallazgos_auditoria (id_auditoria, descripcion, clasificacion, responsable_id)
VALUES
(1, 'Control documental de calibraciones incompleto', 'no_conformidad_menor', 8),
(2, 'Evaluaciones de proveedores fuera de plazo', 'observacion', 7);

-- ===========================================
-- EVALUACIONES DE PROVEEDORES
-- ===========================================
INSERT INTO evaluaciones_proveedores (id_proveedor, fecha, criterio_calidad, criterio_entrega, criterio_costo, resultado, comentarios)
VALUES
(3, '2025-05-01', 9, 9, 8, 'aprobado', 'Proveedor confiable y con entrega puntual'),
(4, '2025-05-01', 8, 10, 9, 'aprobado', 'Excelente soporte técnico y documentación'),
(5, '2025-05-01', 7, 9, 8, 'condicional', 'Se requiere mejora en embalaje de sensores');

-- ===========================================
-- INDICADORES DE CALIDAD
-- ===========================================
INSERT INTO indicadores_calidad (nombre, descripcion, unidad_medida, meta, valor_actual, periodo, responsable_id)
VALUES
('Índice de reparaciones exitosas', 'Porcentaje de reparaciones resueltas sin reingresos', '%', 98.00, 96.50, '2025-09-30', 8),
('Tiempo medio de respuesta a incidencias', 'Horas promedio desde notificación hasta atención', 'horas', 6.00, 5.75, '2025-09-30', 7);

-- ===========================================
-- RIESGOS Y OPORTUNIDADES
-- ===========================================
INSERT INTO riesgos_oportunidades (tipo, descripcion, probabilidad, impacto, plan_accion, responsable_id)
VALUES
('riesgo', 'Dependencia de un único proveedor de PLCs', 'media', 'alto', 'Diversificar compras con otras marcas como Omron', 8),
('oportunidad', 'Certificación ISO 14001 para ampliación de mercado', 'baja', 'alto', 'Preparar plan de implementación ambiental', 7);
