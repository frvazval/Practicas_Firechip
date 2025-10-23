CREATE DATABASE  IF NOT EXISTS `electroservicios_db_normas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `electroservicios_db_normas`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: electroservicios_db_normas
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
-- Table structure for table `acciones_correctivas`
--

DROP TABLE IF EXISTS `acciones_correctivas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acciones_correctivas` (
  `id_accion` int NOT NULL AUTO_INCREMENT,
  `id_nc` int DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable_id` int DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` enum('pendiente','en_proceso','implementada','verificada') COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  PRIMARY KEY (`id_accion`),
  KEY `id_nc` (`id_nc`),
  KEY `responsable_id` (`responsable_id`),
  CONSTRAINT `acciones_correctivas_ibfk_1` FOREIGN KEY (`id_nc`) REFERENCES `no_conformidades` (`id_nc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `acciones_correctivas_ibfk_2` FOREIGN KEY (`responsable_id`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acciones_correctivas`
--

LOCK TABLES `acciones_correctivas` WRITE;
/*!40000 ALTER TABLE `acciones_correctivas` DISABLE KEYS */;
INSERT INTO `acciones_correctivas` VALUES (1,5,'Accion correctiva 1',9,'2023-03-01','2023-03-15','pendiente'),(2,10,'Accion correctiva 2',4,'2023-03-01','2023-03-15','pendiente'),(3,5,'Accion correctiva 3',2,'2023-03-01','2023-03-15','pendiente'),(4,4,'Accion correctiva 4',9,'2023-03-01','2023-03-15','pendiente'),(5,6,'Accion correctiva 5',1,'2023-03-01','2023-03-15','pendiente'),(6,10,'Accion correctiva 6',6,'2023-03-01','2023-03-15','pendiente'),(7,6,'Accion correctiva 7',8,'2023-03-01','2023-03-15','pendiente'),(8,8,'Accion correctiva 8',3,'2023-03-01','2023-03-15','pendiente'),(9,3,'Accion correctiva 9',4,'2023-03-01','2023-03-15','pendiente'),(10,3,'Accion correctiva 10',6,'2023-03-01','2023-03-15','pendiente');
/*!40000 ALTER TABLE `acciones_correctivas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjuntos`
--

DROP TABLE IF EXISTS `adjuntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adjuntos` (
  `id_adjunto` int NOT NULL AUTO_INCREMENT,
  `tabla_origen` enum('entidades','productos','servicios','facturas') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_origen` int NOT NULL,
  `nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_subida` datetime DEFAULT CURRENT_TIMESTAMP,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id_adjunto`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `adjuntos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjuntos`
--

LOCK TABLES `adjuntos` WRITE;
/*!40000 ALTER TABLE `adjuntos` DISABLE KEYS */;
INSERT INTO `adjuntos` VALUES (1,'entidades',1,'archivo1.pdf','/uploads/archivo1.pdf','2025-10-17 13:07:36',1),(2,'facturas',10,'archivo2.pdf','/uploads/archivo2.pdf','2025-10-17 13:07:36',6),(3,'servicios',5,'archivo3.pdf','/uploads/archivo3.pdf','2025-10-17 13:07:36',9),(4,'entidades',7,'archivo4.pdf','/uploads/archivo4.pdf','2025-10-17 13:07:36',7),(5,'productos',2,'archivo5.pdf','/uploads/archivo5.pdf','2025-10-17 13:07:36',3),(6,'productos',9,'archivo6.pdf','/uploads/archivo6.pdf','2025-10-17 13:07:36',1),(7,'entidades',5,'archivo7.pdf','/uploads/archivo7.pdf','2025-10-17 13:07:36',2),(8,'facturas',5,'archivo8.pdf','/uploads/archivo8.pdf','2025-10-17 13:07:36',2),(9,'facturas',5,'archivo9.pdf','/uploads/archivo9.pdf','2025-10-17 13:07:36',6),(10,'productos',3,'archivo10.pdf','/uploads/archivo10.pdf','2025-10-17 13:07:36',6);
/*!40000 ALTER TABLE `adjuntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditorias`
--

DROP TABLE IF EXISTS `auditorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditorias` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('interna','externa','proveedor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `auditor` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `norma_aplicable` enum('ISO9001','IATF16949','otro') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('planificada','realizada','cerrada') COLLATE utf8mb4_unicode_ci DEFAULT 'planificada',
  `informe` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditorias`
--

LOCK TABLES `auditorias` WRITE;
/*!40000 ALTER TABLE `auditorias` DISABLE KEYS */;
INSERT INTO `auditorias` VALUES (1,'interna','2023-04-01','Auditor 1','ISO9001','planificada','Informe auditoria 1'),(2,'interna','2023-04-02','Auditor 2','ISO9001','planificada','Informe auditoria 2'),(3,'interna','2023-04-03','Auditor 3','ISO9001','planificada','Informe auditoria 3'),(4,'interna','2023-04-04','Auditor 4','ISO9001','planificada','Informe auditoria 4'),(5,'interna','2023-04-05','Auditor 5','ISO9001','planificada','Informe auditoria 5'),(6,'interna','2023-04-06','Auditor 6','ISO9001','planificada','Informe auditoria 6'),(7,'interna','2023-04-07','Auditor 7','ISO9001','planificada','Informe auditoria 7'),(8,'interna','2023-04-08','Auditor 8','ISO9001','planificada','Informe auditoria 8'),(9,'interna','2023-04-09','Auditor 9','ISO9001','planificada','Informe auditoria 9'),(10,'interna','2023-04-10','Auditor 10','ISO9001','planificada','Informe auditoria 10');
/*!40000 ALTER TABLE `auditorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `tabla_origen` enum('entidades','productos','servicios','facturas') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_origen` int NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'productos',4,'Comentario de prueba 1','2025-10-17 13:07:36',5),(2,'servicios',5,'Comentario de prueba 2','2025-10-17 13:07:36',8),(3,'facturas',2,'Comentario de prueba 3','2025-10-17 13:07:36',2),(4,'facturas',8,'Comentario de prueba 4','2025-10-17 13:07:36',4),(5,'facturas',10,'Comentario de prueba 5','2025-10-17 13:07:36',4),(6,'productos',7,'Comentario de prueba 6','2025-10-17 13:07:36',10),(7,'servicios',10,'Comentario de prueba 7','2025-10-17 13:07:36',9),(8,'facturas',2,'Comentario de prueba 8','2025-10-17 13:07:36',8),(9,'productos',6,'Comentario de prueba 9','2025-10-17 13:07:36',10),(10,'servicios',6,'Comentario de prueba 10','2025-10-17 13:07:36',6);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos_calidad`
--

DROP TABLE IF EXISTS `documentos_calidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentos_calidad` (
  `id_documento` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titulo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('manual','procedimiento','instruccion','formato','otro') COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('vigente','obsoleto','borrador') COLLATE utf8mb4_unicode_ci DEFAULT 'vigente',
  `fecha_emision` date NOT NULL,
  `responsable_id` int DEFAULT NULL,
  `archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_documento`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `responsable_id` (`responsable_id`),
  CONSTRAINT `documentos_calidad_ibfk_1` FOREIGN KEY (`responsable_id`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos_calidad`
--

LOCK TABLES `documentos_calidad` WRITE;
/*!40000 ALTER TABLE `documentos_calidad` DISABLE KEYS */;
INSERT INTO `documentos_calidad` VALUES (1,'DOC001','Documento 1','procedimiento','v1.0','vigente','2023-01-01',2,'/docs/doc1.pdf','Obs doc 1'),(2,'DOC002','Documento 2','procedimiento','v1.0','vigente','2023-01-02',3,'/docs/doc2.pdf','Obs doc 2'),(3,'DOC003','Documento 3','procedimiento','v1.0','vigente','2023-01-03',10,'/docs/doc3.pdf','Obs doc 3'),(4,'DOC004','Documento 4','procedimiento','v1.0','vigente','2023-01-04',2,'/docs/doc4.pdf','Obs doc 4'),(5,'DOC005','Documento 5','procedimiento','v1.0','vigente','2023-01-05',5,'/docs/doc5.pdf','Obs doc 5'),(6,'DOC006','Documento 6','procedimiento','v1.0','vigente','2023-01-06',6,'/docs/doc6.pdf','Obs doc 6'),(7,'DOC007','Documento 7','procedimiento','v1.0','vigente','2023-01-07',2,'/docs/doc7.pdf','Obs doc 7'),(8,'DOC008','Documento 8','procedimiento','v1.0','vigente','2023-01-08',1,'/docs/doc8.pdf','Obs doc 8'),(9,'DOC009','Documento 9','procedimiento','v1.0','vigente','2023-01-09',7,'/docs/doc9.pdf','Obs doc 9'),(10,'DOC010','Documento 10','procedimiento','v1.0','vigente','2023-01-10',1,'/docs/doc10.pdf','Obs doc 10');
/*!40000 ALTER TABLE `documentos_calidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades`
--

DROP TABLE IF EXISTS `entidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidades` (
  `id_entidad` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('cliente','proveedor','usuario') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_postal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identificacion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol` enum('tecnico','administrador','supervisor','ninguno') COLLATE utf8mb4_unicode_ci DEFAULT 'ninguno',
  `estado` enum('activo','inactivo') COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id_entidad`),
  UNIQUE KEY `email` (`email`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `entidades_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `entidades` (`id_entidad`),
  CONSTRAINT `entidades_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `entidades` (`id_entidad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades`
--

LOCK TABLES `entidades` WRITE;
/*!40000 ALTER TABLE `entidades` DISABLE KEYS */;
INSERT INTO `entidades` VALUES (1,'proveedor','Entidad 1','entidad1@mail.com','6000001','Calle Falsa 1','28001','Ciudad 1','Provincia 1','ID1','ninguno','activo','2025-10-17 13:07:35','2025-10-17 13:07:35',NULL,NULL),(2,'cliente','Entidad 2','entidad2@mail.com','6000002','Calle Falsa 2','28002','Ciudad 2','Provincia 2','ID2','ninguno','activo','2025-10-17 13:07:35','2025-10-17 13:07:35',NULL,NULL),(3,'proveedor','Entidad 3','entidad3@mail.com','6000003','Calle Falsa 3','28003','Ciudad 3','Provincia 3','ID3','ninguno','activo','2025-10-17 13:07:35','2025-10-17 13:07:35',NULL,NULL),(4,'cliente','Entidad 4','entidad4@mail.com','6000004','Calle Falsa 4','28004','Ciudad 4','Provincia 4','ID4','ninguno','activo','2025-10-17 13:07:35','2025-10-17 13:07:35',NULL,NULL),(5,'cliente','Entidad 5','entidad5@mail.com','6000005','Calle Falsa 5','28005','Ciudad 5','Provincia 5','ID5','ninguno','activo','2025-10-17 13:07:35','2025-10-17 13:07:35',NULL,NULL),(6,'cliente','Entidad 6','entidad6@mail.com','6000006','Calle Falsa 6','28006','Ciudad 6','Provincia 6','ID6','ninguno','activo','2025-10-17 13:07:35','2025-10-17 13:07:35',NULL,NULL),(7,'proveedor','Entidad 7','entidad7@mail.com','6000007','Calle Falsa 7','28007','Ciudad 7','Provincia 7','ID7','ninguno','activo','2025-10-17 13:07:35','2025-10-17 13:07:35',NULL,NULL),(8,'usuario','Entidad 8','entidad8@mail.com','6000008','Calle Falsa 8','28008','Ciudad 8','Provincia 8','ID8','tecnico','activo','2025-10-17 13:07:35','2025-10-17 13:07:35',NULL,NULL),(9,'usuario','Entidad 9','entidad9@mail.com','6000009','Calle Falsa 9','28009','Ciudad 9','Provincia 9','ID9','administrador','activo','2025-10-17 13:07:35','2025-10-17 13:07:35',NULL,NULL),(10,'usuario','Entidad 10','entidad10@mail.com','60000010','Calle Falsa 10','280010','Ciudad 10','Provincia 10','ID10','administrador','activo','2025-10-17 13:07:35','2025-10-17 13:07:35',NULL,NULL);
/*!40000 ALTER TABLE `entidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluaciones_proveedores`
--

DROP TABLE IF EXISTS `evaluaciones_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluaciones_proveedores` (
  `id_eval` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int DEFAULT NULL,
  `fecha` date NOT NULL,
  `criterio_calidad` int DEFAULT NULL,
  `criterio_entrega` int DEFAULT NULL,
  `criterio_costo` int DEFAULT NULL,
  `resultado` enum('aprobado','condicional','rechazado') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comentarios` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_eval`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `evaluaciones_proveedores_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `entidades` (`id_entidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones_proveedores`
--

LOCK TABLES `evaluaciones_proveedores` WRITE;
/*!40000 ALTER TABLE `evaluaciones_proveedores` DISABLE KEYS */;
INSERT INTO `evaluaciones_proveedores` VALUES (1,3,'2023-05-01',50,64,89,'aprobado','Comentarios eval 1'),(2,1,'2023-05-02',93,71,85,'aprobado','Comentarios eval 2'),(3,2,'2023-05-03',66,81,58,'aprobado','Comentarios eval 3'),(4,5,'2023-05-04',97,75,62,'aprobado','Comentarios eval 4'),(5,3,'2023-05-05',72,65,61,'aprobado','Comentarios eval 5'),(6,2,'2023-05-06',71,82,98,'aprobado','Comentarios eval 6'),(7,1,'2023-05-07',96,84,90,'aprobado','Comentarios eval 7'),(8,4,'2023-05-08',52,86,65,'aprobado','Comentarios eval 8'),(9,2,'2023-05-09',62,68,51,'aprobado','Comentarios eval 9'),(10,3,'2023-05-10',56,71,58,'aprobado','Comentarios eval 10');
/*!40000 ALTER TABLE `evaluaciones_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_detalle`
--

DROP TABLE IF EXISTS `factura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_detalle` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_factura` int DEFAULT NULL,
  `concepto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad` int DEFAULT '1',
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS ((`cantidad` * `precio_unitario`)) STORED,
  PRIMARY KEY (`id_detalle`),
  KEY `id_factura` (`id_factura`),
  CONSTRAINT `factura_detalle_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalle`
--

LOCK TABLES `factura_detalle` WRITE;
/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
INSERT INTO `factura_detalle` (`id_detalle`, `id_factura`, `concepto`, `cantidad`, `precio_unitario`) VALUES (1,7,'Concepto 1',5,182.00),(2,7,'Concepto 2',5,187.00),(3,6,'Concepto 3',5,89.00),(4,1,'Concepto 4',3,40.00),(5,8,'Concepto 5',3,134.00),(6,9,'Concepto 6',3,87.00),(7,4,'Concepto 7',1,29.00),(8,3,'Concepto 8',2,184.00),(9,7,'Concepto 9',2,48.00),(10,7,'Concepto 10',1,59.00);
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;
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
  `id_cliente` int DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `estado` enum('pendiente','pagada','cancelada') COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `num_factura` (`num_factura`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'F001',4,'2023-09-07','pendiente',538.00),(2,'F002',2,'2023-04-02','pendiente',636.00),(3,'F003',4,'2023-05-05','pendiente',176.00),(4,'F004',4,'2023-05-03','pendiente',331.00),(5,'F005',3,'2023-07-03','pendiente',541.00),(6,'F006',5,'2023-03-04','pendiente',290.00),(7,'F007',4,'2023-05-04','pendiente',833.00),(8,'F008',1,'2023-06-05','pendiente',577.00),(9,'F009',2,'2023-05-01','pendiente',512.00),(10,'F010',4,'2023-03-02','pendiente',318.00);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hallazgos_auditoria`
--

DROP TABLE IF EXISTS `hallazgos_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hallazgos_auditoria` (
  `id_hallazgo` int NOT NULL AUTO_INCREMENT,
  `id_auditoria` int DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `clasificacion` enum('observacion','no_conformidad_menor','no_conformidad_mayor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable_id` int DEFAULT NULL,
  `estado` enum('pendiente','en_proceso','cerrado') COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  PRIMARY KEY (`id_hallazgo`),
  KEY `id_auditoria` (`id_auditoria`),
  KEY `responsable_id` (`responsable_id`),
  CONSTRAINT `hallazgos_auditoria_ibfk_1` FOREIGN KEY (`id_auditoria`) REFERENCES `auditorias` (`id_auditoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hallazgos_auditoria_ibfk_2` FOREIGN KEY (`responsable_id`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hallazgos_auditoria`
--

LOCK TABLES `hallazgos_auditoria` WRITE;
/*!40000 ALTER TABLE `hallazgos_auditoria` DISABLE KEYS */;
INSERT INTO `hallazgos_auditoria` VALUES (1,6,'Hallazgo 1','no_conformidad_menor',6,'pendiente'),(2,3,'Hallazgo 2','observacion',4,'pendiente'),(3,3,'Hallazgo 3','no_conformidad_mayor',6,'pendiente'),(4,8,'Hallazgo 4','observacion',1,'pendiente'),(5,5,'Hallazgo 5','no_conformidad_menor',7,'pendiente'),(6,6,'Hallazgo 6','no_conformidad_menor',8,'pendiente'),(7,5,'Hallazgo 7','no_conformidad_menor',1,'pendiente'),(8,1,'Hallazgo 8','no_conformidad_mayor',5,'pendiente'),(9,10,'Hallazgo 9','observacion',10,'pendiente'),(10,5,'Hallazgo 10','no_conformidad_menor',8,'pendiente');
/*!40000 ALTER TABLE `hallazgos_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicadores_calidad`
--

DROP TABLE IF EXISTS `indicadores_calidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indicadores_calidad` (
  `id_indicador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `unidad_medida` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` decimal(10,2) DEFAULT NULL,
  `valor_actual` decimal(10,2) DEFAULT NULL,
  `periodo` date DEFAULT NULL,
  `responsable_id` int DEFAULT NULL,
  PRIMARY KEY (`id_indicador`),
  KEY `responsable_id` (`responsable_id`),
  CONSTRAINT `indicadores_calidad_ibfk_1` FOREIGN KEY (`responsable_id`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicadores_calidad`
--

LOCK TABLES `indicadores_calidad` WRITE;
/*!40000 ALTER TABLE `indicadores_calidad` DISABLE KEYS */;
INSERT INTO `indicadores_calidad` VALUES (1,'Indicador 1','Desc indicador 1','%',100.00,71.00,'2023-06-01',9),(2,'Indicador 2','Desc indicador 2','%',100.00,96.00,'2023-06-02',3),(3,'Indicador 3','Desc indicador 3','%',100.00,70.00,'2023-06-03',1),(4,'Indicador 4','Desc indicador 4','%',100.00,79.00,'2023-06-04',10),(5,'Indicador 5','Desc indicador 5','%',100.00,92.00,'2023-06-05',10),(6,'Indicador 6','Desc indicador 6','%',100.00,75.00,'2023-06-06',7),(7,'Indicador 7','Desc indicador 7','%',100.00,76.00,'2023-06-07',4),(8,'Indicador 8','Desc indicador 8','%',100.00,80.00,'2023-06-08',9),(9,'Indicador 9','Desc indicador 9','%',100.00,67.00,'2023-06-09',10),(10,'Indicador 10','Desc indicador 10','%',100.00,78.00,'2023-06-10',4);
/*!40000 ALTER TABLE `indicadores_calidad` ENABLE KEYS */;
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
  CONSTRAINT `materiales_usados_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materiales_usados_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales_usados`
--

LOCK TABLES `materiales_usados` WRITE;
/*!40000 ALTER TABLE `materiales_usados` DISABLE KEYS */;
INSERT INTO `materiales_usados` (`id_material`, `id_servicio`, `id_producto`, `cantidad`, `precio_unitario`) VALUES (1,4,6,2,41.00),(2,3,9,5,95.00),(3,7,10,5,70.00),(4,10,10,4,46.00),(5,4,6,4,81.00),(6,9,7,3,79.00),(7,9,7,5,70.00),(8,5,5,1,20.00),(9,1,6,5,93.00),(10,6,5,2,95.00);
/*!40000 ALTER TABLE `materiales_usados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_stock`
--

DROP TABLE IF EXISTS `movimientos_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_stock` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `tipo` enum('entrada','salida','ajuste') COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` int NOT NULL,
  `fecha_movimiento` datetime DEFAULT CURRENT_TIMESTAMP,
  `referencia` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_producto` (`id_producto`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `movimientos_stock_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_stock_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_stock`
--

LOCK TABLES `movimientos_stock` WRITE;
/*!40000 ALTER TABLE `movimientos_stock` DISABLE KEYS */;
INSERT INTO `movimientos_stock` VALUES (1,7,'entrada',10,'2025-10-17 13:07:35','REF1',6),(2,3,'salida',6,'2025-10-17 13:07:35','REF2',2),(3,5,'entrada',17,'2025-10-17 13:07:36','REF3',9),(4,3,'salida',5,'2025-10-17 13:07:36','REF4',2),(5,1,'ajuste',5,'2025-10-17 13:07:36','REF5',8),(6,1,'entrada',2,'2025-10-17 13:07:36','REF6',4),(7,5,'ajuste',1,'2025-10-17 13:07:36','REF7',5),(8,10,'salida',16,'2025-10-17 13:07:36','REF8',6),(9,2,'entrada',4,'2025-10-17 13:07:36','REF9',2),(10,2,'entrada',19,'2025-10-17 13:07:36','REF10',8);
/*!40000 ALTER TABLE `movimientos_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_conformidades`
--

DROP TABLE IF EXISTS `no_conformidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_conformidades` (
  `id_nc` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_detectada` date NOT NULL,
  `origen` enum('cliente','proveedor','proceso_interno','auditoria') COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_responsable` int DEFAULT NULL,
  `estado` enum('abierta','en_proceso','cerrada') COLLATE utf8mb4_unicode_ci DEFAULT 'abierta',
  `fecha_cierre` date DEFAULT NULL,
  PRIMARY KEY (`id_nc`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `id_responsable` (`id_responsable`),
  CONSTRAINT `no_conformidades_ibfk_1` FOREIGN KEY (`id_responsable`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_conformidades`
--

LOCK TABLES `no_conformidades` WRITE;
/*!40000 ALTER TABLE `no_conformidades` DISABLE KEYS */;
INSERT INTO `no_conformidades` VALUES (1,'NC001','2023-02-01','proceso_interno','Descripcion NC 1',3,'abierta',NULL),(2,'NC002','2023-02-02','cliente','Descripcion NC 2',6,'abierta',NULL),(3,'NC003','2023-02-03','proceso_interno','Descripcion NC 3',8,'abierta',NULL),(4,'NC004','2023-02-04','auditoria','Descripcion NC 4',7,'abierta',NULL),(5,'NC005','2023-02-05','proceso_interno','Descripcion NC 5',2,'abierta',NULL),(6,'NC006','2023-02-06','auditoria','Descripcion NC 6',10,'abierta',NULL),(7,'NC007','2023-02-07','cliente','Descripcion NC 7',9,'abierta',NULL),(8,'NC008','2023-02-08','cliente','Descripcion NC 8',6,'abierta',NULL),(9,'NC009','2023-02-09','cliente','Descripcion NC 9',5,'abierta',NULL),(10,'NC010','2023-02-10','auditoria','Descripcion NC 10',9,'abierta',NULL);
/*!40000 ALTER TABLE `no_conformidades` ENABLE KEYS */;
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
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_referencia` (`codigo_referencia`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'P001','Producto 1','Descripcion producto 1','Marca1','Modelo1','Categoria1',3,134.00,32,5,'Estante 1','Obs producto 1','2025-10-17 13:07:35','2025-10-17 13:07:35'),(2,'P002','Producto 2','Descripcion producto 2','Marca2','Modelo2','Categoria2',3,73.00,45,5,'Estante 2','Obs producto 2','2025-10-17 13:07:35','2025-10-17 13:07:35'),(3,'P003','Producto 3','Descripcion producto 3','Marca3','Modelo3','Categoria3',3,177.00,19,5,'Estante 3','Obs producto 3','2025-10-17 13:07:35','2025-10-17 13:07:35'),(4,'P004','Producto 4','Descripcion producto 4','Marca4','Modelo4','Categoria4',1,166.00,2,5,'Estante 4','Obs producto 4','2025-10-17 13:07:35','2025-10-17 13:07:35'),(5,'P005','Producto 5','Descripcion producto 5','Marca5','Modelo5','Categoria5',2,71.00,9,5,'Estante 5','Obs producto 5','2025-10-17 13:07:35','2025-10-17 13:07:35'),(6,'P006','Producto 6','Descripcion producto 6','Marca6','Modelo6','Categoria6',3,70.00,32,5,'Estante 6','Obs producto 6','2025-10-17 13:07:35','2025-10-17 13:07:35'),(7,'P007','Producto 7','Descripcion producto 7','Marca7','Modelo7','Categoria7',3,94.00,33,5,'Estante 7','Obs producto 7','2025-10-17 13:07:35','2025-10-17 13:07:35'),(8,'P008','Producto 8','Descripcion producto 8','Marca8','Modelo8','Categoria8',3,126.00,47,5,'Estante 8','Obs producto 8','2025-10-17 13:07:35','2025-10-17 13:07:35'),(9,'P009','Producto 9','Descripcion producto 9','Marca9','Modelo9','Categoria9',2,152.00,35,5,'Estante 9','Obs producto 9','2025-10-17 13:07:35','2025-10-17 13:07:35'),(10,'P010','Producto 10','Descripcion producto 10','Marca10','Modelo10','Categoria10',1,85.00,45,5,'Estante 10','Obs producto 10','2025-10-17 13:07:35','2025-10-17 13:07:35');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riesgos_oportunidades`
--

DROP TABLE IF EXISTS `riesgos_oportunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riesgos_oportunidades` (
  `id_riesgo` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('riesgo','oportunidad') COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `probabilidad` enum('baja','media','alta') COLLATE utf8mb4_unicode_ci NOT NULL,
  `impacto` enum('bajo','medio','alto') COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_accion` text COLLATE utf8mb4_unicode_ci,
  `responsable_id` int DEFAULT NULL,
  `estado` enum('abierto','en_proceso','cerrado') COLLATE utf8mb4_unicode_ci DEFAULT 'abierto',
  PRIMARY KEY (`id_riesgo`),
  KEY `responsable_id` (`responsable_id`),
  CONSTRAINT `riesgos_oportunidades_ibfk_1` FOREIGN KEY (`responsable_id`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riesgos_oportunidades`
--

LOCK TABLES `riesgos_oportunidades` WRITE;
/*!40000 ALTER TABLE `riesgos_oportunidades` DISABLE KEYS */;
INSERT INTO `riesgos_oportunidades` VALUES (1,'oportunidad','Descripcion oportunidad 1','alta','bajo','Plan accion 1',7,'abierto'),(2,'oportunidad','Descripcion oportunidad 2','media','alto','Plan accion 2',7,'abierto'),(3,'riesgo','Descripcion riesgo 3','media','alto','Plan accion 3',7,'abierto'),(4,'oportunidad','Descripcion oportunidad 4','alta','medio','Plan accion 4',10,'abierto'),(5,'oportunidad','Descripcion oportunidad 5','alta','medio','Plan accion 5',1,'abierto'),(6,'oportunidad','Descripcion oportunidad 6','media','bajo','Plan accion 6',4,'abierto'),(7,'riesgo','Descripcion riesgo 7','alta','alto','Plan accion 7',5,'abierto'),(8,'oportunidad','Descripcion oportunidad 8','alta','medio','Plan accion 8',7,'abierto'),(9,'riesgo','Descripcion riesgo 9','alta','alto','Plan accion 9',1,'abierto'),(10,'oportunidad','Descripcion oportunidad 10','media','bajo','Plan accion 10',4,'abierto');
/*!40000 ALTER TABLE `riesgos_oportunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `num_orden` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` enum('ticket','orden_trabajo') COLLATE utf8mb4_unicode_ci DEFAULT 'orden_trabajo',
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_cierre` datetime DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_tecnico` int DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `estado` enum('pendiente','en_curso','finalizado','entregado','cerrado') COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  `prioridad` enum('baja','media','alta','critica') COLLATE utf8mb4_unicode_ci DEFAULT 'media',
  `impacto` enum('bajo','medio','alto') COLLATE utf8mb4_unicode_ci DEFAULT 'medio',
  `urgencia` enum('baja','media','alta') COLLATE utf8mb4_unicode_ci DEFAULT 'media',
  `sla_tiempo_respuesta` int DEFAULT NULL,
  `sla_tiempo_resolucion` int DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `firma_cliente` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firma_tecnico` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `num_orden` (`num_orden`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_tecnico` (`id_tecnico`),
  CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `servicios_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `entidades` (`id_entidad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'ORD001','orden_trabajo','2025-10-17 13:07:36',NULL,4,9,'Servicio 1','pendiente','media','medio','media',24,72,'Obs servicio 1',NULL,NULL),(2,'ORD002','orden_trabajo','2025-10-17 13:07:36',NULL,4,6,'Servicio 2','pendiente','media','medio','media',24,72,'Obs servicio 2',NULL,NULL),(3,'ORD003','orden_trabajo','2025-10-17 13:07:36',NULL,2,6,'Servicio 3','pendiente','media','medio','media',24,72,'Obs servicio 3',NULL,NULL),(4,'ORD004','orden_trabajo','2025-10-17 13:07:36',NULL,5,9,'Servicio 4','pendiente','media','medio','media',24,72,'Obs servicio 4',NULL,NULL),(5,'ORD005','orden_trabajo','2025-10-17 13:07:36',NULL,5,10,'Servicio 5','pendiente','media','medio','media',24,72,'Obs servicio 5',NULL,NULL),(6,'ORD006','orden_trabajo','2025-10-17 13:07:36',NULL,2,9,'Servicio 6','pendiente','media','medio','media',24,72,'Obs servicio 6',NULL,NULL),(7,'ORD007','orden_trabajo','2025-10-17 13:07:36',NULL,2,8,'Servicio 7','pendiente','media','medio','media',24,72,'Obs servicio 7',NULL,NULL),(8,'ORD008','orden_trabajo','2025-10-17 13:07:36',NULL,4,7,'Servicio 8','pendiente','media','medio','media',24,72,'Obs servicio 8',NULL,NULL),(9,'ORD009','orden_trabajo','2025-10-17 13:07:36',NULL,4,9,'Servicio 9','pendiente','media','medio','media',24,72,'Obs servicio 9',NULL,NULL),(10,'ORD010','orden_trabajo','2025-10-17 13:07:36',NULL,3,8,'Servicio 10','pendiente','media','medio','media',24,72,'Obs servicio 10',NULL,NULL);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'electroservicios_db_normas'
--

--
-- Dumping routines for database 'electroservicios_db_normas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-23 13:28:43
