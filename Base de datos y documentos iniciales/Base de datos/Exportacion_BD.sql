CREATE DATABASE  IF NOT EXISTS `electroservicios_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `electroservicios_db`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: electroservicios_db
-- ------------------------------------------------------
-- Server version	8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_postal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Carlos Pérez','Calle Mayor 10','28013','Madrid','Madrid','600123001','carlos@example.com','7b178ffd6ccf8a83bf4bc4058a4c0d4316a4be30caa48924f3c2cdbbd417088a','2025-10-08 13:04:04'),(2,'María López','Av. Andalucía 45','29004','Málaga','Andalucía','600123002','maria@example.com','57cb1206859abbce5423259359e8b711aa1c19df59b9b8834008a9b4ec4a48cd','2025-10-08 13:04:04'),(3,'Javier Torres','Calle Valencia 8','46007','Valencia','Valencia','600123003','javier@example.com','ce02e9009f924a9648c5af4a75c973a417365d173a7fe009552c4be3e680d06b','2025-10-08 13:04:04'),(4,'Laura Martín','Plaza España 5','41001','Sevilla','Andalucía','600123004','laura@example.com','519c1acebb9a2dff08577a3f4817fecd44213ad0d794addc0fbe8050af4987e9','2025-10-08 13:04:04'),(5,'Pedro Sánchez','Calle Real 12','15002','A Coruña','Galicia','600123005','pedro@example.com','12e33bf3079318e33f441c77ecb402bb21434973d0debf67b8d5c659e440b8f6','2025-10-08 13:04:04'),(6,'Lucía Gómez','Gran Vía 25','28010','Madrid','Madrid','600123006','lucia@example.com','c4afe4f0f0d55f304aeb8cf9733835f729069bc1aaabb45ce8fd3dccd42edcb3','2025-10-08 13:04:04'),(7,'Ana Fernández','Av. Cataluña 11','50001','Zaragoza','Aragón','600123007','ana@example.com','f911288b9564bf47cbb8037990be381037efeae3a04f2004bd5effd1820a56b6','2025-10-08 13:04:04'),(8,'David Ruiz','Calle del Sol 4','03001','Alicante','Valencia','600123008','david@example.com','0d8f1d50f0cca00bae06186736905ca7bee89a123d6afee70b4246d6ee007604','2025-10-08 13:04:04'),(9,'Sara Ramos','Av. de Lugo 9','15701','Santiago','Galicia','600123009','sara@example.com','d17d366691c490150290f6f47b8289168b2a91606191998fd4e63d96864082ee','2025-10-08 13:04:04'),(10,'Alberto Romero','Calle Mayor 22','39001','Santander','Cantabria','600123010','alberto@example.com','8ae0cbf1b336987081cd7d86fd83ef02d872db9808bef06601fffd4bdb4edfc9','2025-10-08 13:04:04'),(11,'Rosa Díaz','Calle Norte 5','18001','Granada','Andalucía','600123011','rosa@example.com','f6f06a02fd8f143930192a825646f6a89d9a7b0935b243e59edffa1d5436400a','2025-10-08 13:04:04'),(12,'Pablo Vázquez','Calle Sur 3','15001','A Coruña','Galicia','600123012','pablo@example.com','1472edfa073c0e550f4d4fcc8bfbc67617687e44e6ef4ceb648740b594d4446f','2025-10-08 13:04:04'),(13,'Marta Iglesias','Av. España 20','08001','Barcelona','Cataluña','600123013','marta@example.com','54cd65d02656c976a9872ed6e48f8bb58d0b090a350d56f239187595ce786dd2','2025-10-08 13:04:04'),(14,'Hugo Navarro','Calle Central 9','33001','Oviedo','Asturias','600123014','hugo@example.com','3160f4c0a33bbbe4c571652e27d2234d309afb38fd642f8b431b7cce73c55698','2025-10-08 13:04:04'),(15,'Elena Gil','Plaza Mayor 3','26001','Logroño','La Rioja','600123015','elena@example.com','22808fc4e5e499adad36ee21077733b831a3b88c96ecd3be9a641345192df161','2025-10-08 13:04:04'),(16,'Raúl Ramos','Av. del Mar 12','12540','Castellón','Valencia','600123016','raul@example.com','7b68de73dfee34e76df0148ded6146e8a33aba946e4a95f056d7b98e56f9810c','2025-10-08 13:04:04'),(17,'Carmen Ortega','Calle del Río 18','24001','León','Castilla y León','600123017','carmen@example.com','743516f1538fc7eb8dd4f286b548498ea308d69b5c4c8f45129e86767566778b','2025-10-08 13:04:04'),(18,'Manuel Prieto','Av. del Trabajo 4','29010','Málaga','Andalucía','600123018','manuel@example.com','b444a2ebe67d23377093e9ca19bf4324230e195f158b846e7506925140a899ae','2025-10-08 13:04:04'),(19,'Isabel Soto','Calle Jardines 2','37001','Salamanca','Castilla y León','600123019','isabel@example.com','bfd3c29732c689ba13ad7bcda5ff5104250244566050f8dcc09eed5c121881e4','2025-10-08 13:04:04'),(20,'Tomás Vega','Calle Prado 7','28014','Madrid','Madrid','600123020','tomas@example.com','ec834c1fbc4da7fd6ca1782174869def5898ead7ba9f938bfd2b8db2e56bd51d','2025-10-08 13:04:04');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `num_factura` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_servicio` int DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estado` enum('pendiente','pagada','cancelada') COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `num_factura` (`num_factura`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `hojas_servicio` (`id_servicio`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'FAC001',1,'2025-10-02',350.00,'pendiente'),(2,'FAC002',2,'2025-10-03',180.00,'pendiente'),(3,'FAC003',3,'2025-10-04',250.00,'pagada'),(4,'FAC004',4,'2025-10-05',120.00,'pendiente'),(5,'FAC005',5,'2025-10-06',90.00,'pagada'),(6,'FAC006',6,'2025-10-07',320.00,'pendiente'),(7,'FAC007',7,'2025-10-08',210.00,'pendiente'),(8,'FAC008',8,'2025-10-09',145.00,'pagada'),(9,'FAC009',9,'2025-10-10',275.00,'pendiente'),(10,'FAC010',10,'2025-10-10',310.00,'cancelada');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojas_servicio`
--

DROP TABLE IF EXISTS `hojas_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojas_servicio` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `num_orden` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_servicio` date DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_tecnico` int DEFAULT NULL,
  `descripcion_intervencion` text COLLATE utf8mb4_unicode_ci,
  `estado` enum('pendiente','en_curso','finalizado','entregado') COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `firma_cliente` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firma_tecnico` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `num_orden` (`num_orden`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_tecnico` (`id_tecnico`),
  CONSTRAINT `hojas_servicio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `hojas_servicio_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_servicio`
--

LOCK TABLES `hojas_servicio` WRITE;
/*!40000 ALTER TABLE `hojas_servicio` DISABLE KEYS */;
INSERT INTO `hojas_servicio` VALUES (1,'ORD001','2025-10-01',1,3,'Instalación de puntos de luz en vivienda nueva.','en_curso','',NULL,NULL),(2,'ORD002','2025-10-02',2,4,'Revisión del cuadro eléctrico.','pendiente','',NULL,NULL),(3,'ORD003','2025-10-03',3,5,'Sustitución de luminarias LED.','finalizado','',NULL,NULL),(4,'ORD004','2025-10-04',4,6,'Cableado red informática.','pendiente','',NULL,NULL),(5,'ORD005','2025-10-05',5,7,'Reparación de enchufe en cocina.','finalizado','',NULL,NULL),(6,'ORD006','2025-10-06',6,8,'Instalación de toma de tierra.','en_curso','',NULL,NULL),(7,'ORD007','2025-10-07',7,9,'Mantenimiento general del sistema eléctrico.','pendiente','',NULL,NULL),(8,'ORD008','2025-10-08',8,10,'Instalación de lámparas exteriores.','en_curso','',NULL,NULL),(9,'ORD009','2025-10-09',9,11,'Revisión y sustitución de fusibles.','finalizado','',NULL,NULL),(10,'ORD010','2025-10-10',10,12,'Sustitución de enchufes deteriorados.','pendiente','',NULL,NULL);
/*!40000 ALTER TABLE `hojas_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiales_usados`
--

DROP TABLE IF EXISTS `materiales_usados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales_usados` (
  `id_material` int NOT NULL AUTO_INCREMENT,
  `id_servicio` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT '1',
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS ((`cantidad` * `precio_unitario`)) STORED,
  PRIMARY KEY (`id_material`),
  KEY `id_servicio` (`id_servicio`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `materiales_usados_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `hojas_servicio` (`id_servicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materiales_usados_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales_usados`
--

LOCK TABLES `materiales_usados` WRITE;
/*!40000 ALTER TABLE `materiales_usados` DISABLE KEYS */;
INSERT INTO `materiales_usados` (`id_material`, `id_servicio`, `id_producto`, `cantidad`, `precio_unitario`) VALUES (1,1,1,20,0.85),(2,1,3,10,2.50),(3,2,12,2,12.00),(4,3,7,5,5.00),(5,4,15,8,3.50),(6,5,5,2,2.20),(7,6,14,1,28.00),(8,7,4,6,3.80),(9,8,6,4,4.50),(10,9,16,10,1.20),(11,10,20,2,5.50),(12,1,17,3,0.90),(13,2,2,15,1.10),(14,3,10,5,1.75),(15,4,9,8,0.95),(16,5,11,1,9.00),(17,6,8,4,8.50),(18,7,18,5,1.50),(19,8,13,2,14.00),(20,9,19,3,2.10);
/*!40000 ALTER TABLE `materiales_usados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `codigo_referencia` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `marca` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `stock_actual` int DEFAULT '0',
  `stock_minimo` int DEFAULT '0',
  `ubicacion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_referencia` (`codigo_referencia`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'PRD001','Cable 1.5mm','Cable eléctrico 1.5mm sección','General Cable','GC15','Cables',1,0.85,500,50,'A1',NULL),(2,'PRD002','Cable 2.5mm','Cable eléctrico 2.5mm sección','General Cable','GC25','Cables',1,1.10,400,40,'A2',NULL),(3,'PRD003','Interruptor Simple','Interruptor unipolar blanco','Simon','SIM100','Electricidad',4,2.50,200,20,'B1',NULL),(4,'PRD004','Interruptor Doble','Interruptor bipolar blanco','Simon','SIM200','Electricidad',4,3.80,150,15,'B2',NULL),(5,'PRD005','Enchufe Schuko','Toma de corriente tipo F','Legrand','LEG01','Electricidad',4,2.20,300,30,'B3',NULL),(6,'PRD006','Bombilla LED 10W','Luz blanca cálida E27','Philips','LED10W','Iluminación',5,4.50,500,50,'C1',NULL),(7,'PRD007','Bombilla LED 15W','Luz fría E27','Philips','LED15W','Iluminación',5,5.00,400,50,'C2',NULL),(8,'PRD008','Tubo LED 120cm','Tubo LED blanco frío','Osram','TLED120','Iluminación',5,8.50,250,25,'C3',NULL),(9,'PRD009','Cable Coaxial','Cable de antena TV 75Ω','TeleWire','TV75','Cables',3,0.95,300,30,'A3',NULL),(10,'PRD010','Canaleta 20x20','Canaleta PVC blanca','Canalplast','CP2020','Accesorios',9,1.75,150,20,'D1',NULL),(11,'PRD011','Regleta 4 enchufes','Regleta con interruptor','Orbis','ORB4E','Accesorios',9,9.00,100,10,'D2',NULL),(12,'PRD012','Disyuntor 16A','Protector magnetotérmico 16A','ABB','MCB16A','Protección',8,12.00,120,15,'E1',NULL),(13,'PRD013','Disyuntor 25A','Protector magnetotérmico 25A','ABB','MCB25A','Protección',8,14.00,100,10,'E2',NULL),(14,'PRD014','Interruptor diferencial','Interruptor diferencial 40A/30mA','Schneider','ID40','Protección',8,28.00,80,8,'E3',NULL),(15,'PRD015','Toma RJ45','Conector Ethernet Cat6','Leviton','LV-CAT6','Redes',7,3.50,200,25,'F1',NULL),(16,'PRD016','Módulo empalme','Empalme rápido 2 polos','Wago','W2P','Conectores',7,1.20,500,50,'F2',NULL),(17,'PRD017','Cinta aislante','Rollo cinta negra 20m','3M','T20','Accesorios',10,0.90,300,30,'F3',NULL),(18,'PRD018','Tubos corrugados','Tubo flexible 25mm','Rehau','RE25','Cables',3,1.50,200,20,'A4',NULL),(19,'PRD019','Portalámparas','Portalámparas E27','Legrand','LEG27','Iluminación',5,2.10,250,25,'C4',NULL),(20,'PRD020','Caja de conexión','Caja estanca exterior IP65','Gewiss','GW65','Accesorios',6,5.50,120,15,'G1',NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cif_nif` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_postal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_proveedor` enum('fabricante','distribuidor','servicio_tecnico','otros') COLLATE utf8mb4_unicode_ci DEFAULT 'otros',
  `condiciones_pago` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Suministros Eléctricos S.A.','A12345678','Av. Industria 1','28022','Madrid','Madrid','910000001','contacto@sumelec.com','distribuidor','Pago a 30 días'),(2,'ElectroPartes Iberia','B23456789','Polígono Sur 22','41012','Sevilla','Andalucía','954000002','ventas@epiberia.com','fabricante','Pago a 45 días'),(3,'TecnoCable S.L.','C34567890','Calle Cables 5','46015','Valencia','Valencia','963000003','info@tecnocable.es','fabricante','Pago a 60 días'),(4,'LuzMax España','D45678901','Av. de la Luz 10','08030','Barcelona','Cataluña','932000004','contacto@luzmax.com','distribuidor','Pago a 30 días'),(5,'ElectroRepuestos Norte','E56789012','Polígono Norte 8','39011','Santander','Cantabria','942000005','info@elrepuestos.com','distribuidor','Contado'),(6,'Materiales del Sur','F67890123','Av. del Trabajo 3','29006','Málaga','Andalucía','952000006','ventas@materialessur.com','fabricante','Pago a 30 días'),(7,'InstalRed','G78901234','Calle Industria 17','50015','Zaragoza','Aragón','976000007','info@instalred.es','servicio_tecnico','Pago a 15 días'),(8,'PowerLine España','H89012345','Av. de la Energía 9','28050','Madrid','Madrid','917000008','ventas@powerline.es','fabricante','Pago a 45 días'),(9,'CableSur','I90123456','Calle Mayor 18','41020','Sevilla','Andalucía','954000009','info@cablesur.com','distribuidor','Pago a 30 días'),(10,'TecnoProveeduría','J01234567','Av. Central 45','15004','A Coruña','Galicia','981000010','info@tecnoproveeduria.es','otros','Pago a 30 días');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` enum('tecnico','administrador','supervisor') COLLATE utf8mb4_unicode_ci DEFAULT 'tecnico',
  `estado` enum('activo','inactivo') COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Administrador','admin@electroservicios.com','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9','administrador','activo'),(2,'Supervisor General','supervisor@electroservicios.com','4e4c56e4a15f89f05c2f4c72613da2a18c9665d4f0d6acce16415eb06f9be776','supervisor','activo'),(3,'Juan Pérez','juan@electroservicios.com','d13f98e958fa13fdb05117f622a447285583ae82c43a2ae9b41daf64b4b48e50','tecnico','activo'),(4,'Laura Gómez','laura@electroservicios.com','c289afd8482f111822fea77d87a957e4a3f07ae79bda353fda46bfa46d50d8e5','tecnico','activo'),(5,'Carlos Ruiz','carlos@electroservicios.com','01e402eabc63c52bd88d9bb5e329588b60573e1ec424f966fd51cf3650b57c61','tecnico','activo'),(6,'Lucía Martínez','lucia@electroservicios.com','b0447c57ebb14ace3b7316b92e41c0f47f78a2507d178ae37954b4994d63a1ce','tecnico','activo'),(7,'Pedro López','pedro@electroservicios.com','f3d957310116cbebc467ba7afe889194b6b9e0baf7396737350dd74e4829323f','tecnico','activo'),(8,'María Torres','maria@electroservicios.com','11cfa854064ce9300d368f8ba9deacfc54e3bd2a501eb8e2843ab15109807878','tecnico','activo'),(9,'David Fernández','david@electroservicios.com','23fa68ef462ec50bfc5e1d3bc864ef1d45f3f31c8adb3eb4e7cff966c21ef9e0','tecnico','activo'),(10,'Elena Ramos','elena@electroservicios.com','a5cb340e62546ccf76105f04489ea892f6c2a0f6d4e021df4a6401f5c6a05c31','tecnico','activo'),(11,'Jorge Díaz','jorge@electroservicios.com','75aa3e2f7a8cb807d14b1ef7b13e4493b2bd7481d6df1e56a3bf981659a201c7','tecnico','activo'),(12,'Ana Vázquez','ana@electroservicios.com','f6544442e17239df5433334af29e422e71a86a12393b65cde0928cb11916af63','tecnico','activo'),(13,'Luis Castro','luis@electroservicios.com','af85a105d0395e95bf3048ea5010d2e0a6a91e0c8b8480fc1ee53846211a96be','tecnico','activo'),(14,'Eva Morales','eva@electroservicios.com','acc080ba0f50cf7bf646e8b17b5c8dee5e66effe0e7c0ddcd265f9eb41127dbc','tecnico','activo'),(15,'Rubén Gil','ruben@electroservicios.com','4f858364604d1080b714b166fb1b6791fc0c5c5a3ff7abfe29f834051a5cfb0c','tecnico','activo'),(16,'Nuria Romero','nuria@electroservicios.com','7ae9a5b0c4fcbaad1555c8f06af6535e5347d618bb374330c7d95076f7864025','tecnico','activo'),(17,'Héctor Ramos','hector@electroservicios.com','7cf691fa3fd44202b0c1b3f04edb4b8026d8f3ad0225e1db357e537d1825fd00','tecnico','activo'),(18,'Sofía Navarro','sofia@electroservicios.com','f0e5e37c34b3594c4bd757f7ae3b84a01b877a1ad7004ec567caa883533408b7','tecnico','activo'),(19,'Raquel Soto','raquel@electroservicios.com','c06a9933384725d3b1e43dbe0b2529bc2f0bcc106af23d11ca80a4155906826f','tecnico','activo'),(20,'Alberto Peña','alberto@electroservicios.com','8f17223e6b2369b65674f33cea06ce1842f0d94114151cb1539f2101300f6612','tecnico','activo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'electroservicios_db'
--

--
-- Dumping routines for database 'electroservicios_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-08 13:35:41
