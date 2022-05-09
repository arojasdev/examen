-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: examen
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblacciones`
--

DROP TABLE IF EXISTS `tblacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblacciones` (
  `id_accion` int(11) NOT NULL AUTO_INCREMENT,
  `desAccion` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_accion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacciones`
--

LOCK TABLES `tblacciones` WRITE;
/*!40000 ALTER TABLE `tblacciones` DISABLE KEYS */;
INSERT INTO `tblacciones` VALUES (1,'inicio sesion',1),(2,'Consultar examenes',1);
/*!40000 ALTER TABLE `tblacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbitacoras`
--

DROP TABLE IF EXISTS `tblbitacoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblbitacoras` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_accion` int(11) DEFAULT NULL,
  `fecha_movimiento` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_bitacora`),
  KEY `cveAccion_idx` (`id_accion`),
  KEY `idUsuario_idx` (`id_usuario`),
  CONSTRAINT `cveAccion` FOREIGN KEY (`id_accion`) REFERENCES `tblacciones` (`id_accion`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`id_usuario`) REFERENCES `tblusuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbitacoras`
--

LOCK TABLES `tblbitacoras` WRITE;
/*!40000 ALTER TABLE `tblbitacoras` DISABLE KEYS */;
INSERT INTO `tblbitacoras` VALUES (1,1,1,'2022-05-09 13:18:01','2022-05-09 13:18:01','obs'),(2,1,1,'2022-05-09 19:02:22','2022-05-09 19:02:22','Sin observacion'),(3,1,1,'2022-05-09 22:31:00','2022-05-09 22:31:00','Sin observacion'),(4,1,2,'2022-05-09 22:46:20','2022-05-09 22:46:20','Sin observacion'),(5,1,1,'2022-05-09 23:03:23','2022-05-09 23:03:23','Sin observacion'),(6,1,2,'2022-05-09 23:03:37','2022-05-09 23:03:37','Sin observacion');
/*!40000 ALTER TABLE `tblbitacoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblexamenes`
--

DROP TABLE IF EXISTS `tblexamenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblexamenes` (
  `id_examen` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `num_preguntas` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_examen`),
  KEY `idUsuario_idx` (`id_usuario`),
  KEY `idUsuarioexam_idx` (`id_usuario`),
  CONSTRAINT `idUserexam` FOREIGN KEY (`id_usuario`) REFERENCES `tblusuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblexamenes`
--

LOCK TABLES `tblexamenes` WRITE;
/*!40000 ALTER TABLE `tblexamenes` DISABLE KEYS */;
INSERT INTO `tblexamenes` VALUES (1,1,4,'2022-05-09 16:33:31','2022-05-09 16:33:31'),(2,1,4,'2022-05-09 16:33:39','2022-05-09 16:33:39');
/*!40000 ALTER TABLE `tblexamenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblexamenespreguntas`
--

DROP TABLE IF EXISTS `tblexamenespreguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblexamenespreguntas` (
  `id_examen_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `id_examen` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_examen_pregunta`),
  KEY `idExamen_idx` (`id_examen`),
  KEY `cvePregunta_idx` (`id_pregunta`),
  CONSTRAINT `cvePregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `tblpreguntas` (`id_pregunta`),
  CONSTRAINT `idExamen` FOREIGN KEY (`id_examen`) REFERENCES `tblexamenes` (`id_examen`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblexamenespreguntas`
--

LOCK TABLES `tblexamenespreguntas` WRITE;
/*!40000 ALTER TABLE `tblexamenespreguntas` DISABLE KEYS */;
INSERT INTO `tblexamenespreguntas` VALUES (1,1,2,1,'2022-05-09 16:33:31','2022-05-09 16:33:31'),(2,1,4,1,'2022-05-09 16:33:31','2022-05-09 16:33:31'),(3,1,3,1,'2022-05-09 16:33:31','2022-05-09 16:33:31'),(4,1,7,1,'2022-05-09 16:33:31','2022-05-09 16:33:31'),(5,2,1,1,'2022-05-09 16:33:31','2022-05-09 16:33:31'),(6,2,4,1,'2022-05-09 16:33:31','2022-05-09 16:33:31'),(7,2,5,1,'2022-05-09 16:33:31','2022-05-09 16:33:31'),(8,2,7,1,'2022-05-09 16:33:31','2022-05-09 16:33:31');
/*!40000 ALTER TABLE `tblexamenespreguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpreguntas`
--

DROP TABLE IF EXISTS `tblpreguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblpreguntas` (
  `id_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `desPregunta` varchar(500) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpreguntas`
--

LOCK TABLES `tblpreguntas` WRITE;
/*!40000 ALTER TABLE `tblpreguntas` DISABLE KEYS */;
INSERT INTO `tblpreguntas` VALUES (1,'Cual es la capital de Veracruz',1,'2022-05-09 16:33:25','2022-05-09 16:33:25'),(2,'Cual es la capital de Michoacan',1,'2022-05-09 16:33:28','2022-05-09 16:33:28'),(3,'Cual es la capital de Yucatan',1,'2022-05-09 16:33:31','2022-05-09 16:33:31'),(4,'Cual es la capital de Sonora',1,'2022-05-09 16:33:34','2022-05-09 16:33:34'),(5,'Cual es la capital de Jalisco',1,'2022-05-09 16:33:37','2022-05-09 16:33:37'),(6,'Cual es la capital de Tamaulipas',1,'2022-05-09 16:33:40','2022-05-09 16:33:40'),(7,'Cual es la capital de Tabasco',1,'2022-05-09 16:33:43','2022-05-09 16:33:43');
/*!40000 ALTER TABLE `tblpreguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrespuestas`
--

DROP TABLE IF EXISTS `tblrespuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblrespuestas` (
  `id_respuesta` int(11) NOT NULL AUTO_INCREMENT,
  `id_pregunta` int(11) DEFAULT NULL,
  `desRespuesta` varchar(500) DEFAULT NULL,
  `correcta` int(11) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_respuesta`),
  KEY `cvePregunta_idx` (`id_pregunta`),
  KEY `cvePreguntares_idx` (`id_pregunta`),
  CONSTRAINT `cvePreguntaRes` FOREIGN KEY (`id_pregunta`) REFERENCES `tblpreguntas` (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrespuestas`
--

LOCK TABLES `tblrespuestas` WRITE;
/*!40000 ALTER TABLE `tblrespuestas` DISABLE KEYS */;
INSERT INTO `tblrespuestas` VALUES (1,1,'Xalapa',1,1,'2022-05-09 16:39:23','2022-05-09 16:39:23'),(2,1,'Acatlan',0,1,'2022-05-09 16:39:23','2022-05-09 16:39:23'),(3,1,'Actopan',0,1,'2022-05-09 16:40:18','2022-05-09 16:40:18'),(4,1,'Acajete',0,1,'2022-05-09 16:40:27','2022-05-09 16:40:27'),(5,2,'Morelia',1,1,'2022-05-09 16:42:11','2022-05-09 16:42:11'),(6,2,'Aguililla',0,1,'2022-05-09 16:42:11','2022-05-09 16:42:11'),(7,2,'Acuitzio',0,1,'2022-05-09 16:42:11','2022-05-09 16:42:11'),(8,2,'Angamacutiro',0,1,'2022-05-09 16:42:11','2022-05-09 16:42:11'),(9,3,'Mérida',1,1,'2022-05-09 16:43:18','2022-05-09 16:43:18'),(10,3,'Abalá',0,1,'2022-05-09 16:43:18','2022-05-09 16:43:18'),(11,3,'Ixil',0,1,'2022-05-09 16:43:18','2022-05-09 16:43:18'),(12,3,'Conkal',0,1,'2022-05-09 16:43:18','2022-05-09 16:43:18'),(13,4,'Hermosillo',1,1,'2022-05-09 16:44:16','2022-05-09 16:44:16'),(14,4,'Alamos',0,1,'2022-05-09 16:44:16','2022-05-09 16:44:16'),(15,4,'Aconchi',0,1,'2022-05-09 16:44:17','2022-05-09 16:44:17'),(16,4,'	Agua Prieta',0,1,'2022-05-09 16:44:17','2022-05-09 16:44:17'),(17,5,'Guadalajara',1,1,'2022-05-09 16:45:33','2022-05-09 16:45:33'),(18,5,'Acatic',0,1,'2022-05-09 16:45:33','2022-05-09 16:45:33'),(19,5,'Ahualulco',0,1,'2022-05-09 16:45:33','2022-05-09 16:45:33'),(20,5,'Chapala',0,1,'2022-05-09 16:45:33','2022-05-09 16:45:33'),(21,6,'Ciudad Victoria',1,1,'2022-05-09 16:46:37','2022-05-09 16:46:37'),(22,6,'Abasolo',0,1,'2022-05-09 16:46:37','2022-05-09 16:46:37'),(23,6,'Aldama',0,1,'2022-05-09 16:46:37','2022-05-09 16:46:37'),(24,6,'Altamira',0,1,'2022-05-09 16:46:37','2022-05-09 16:46:37'),(25,7,'Villahermosa',1,1,'2022-05-09 16:47:47','2022-05-09 16:47:47'),(26,7,'Balancan',0,1,'2022-05-09 16:47:47','2022-05-09 16:47:47'),(27,7,'Cardenas',0,1,'2022-05-09 16:47:47','2022-05-09 16:47:47'),(28,7,'Centla',0,1,'2022-05-09 16:47:47','2022-05-09 16:47:47');
/*!40000 ALTER TABLE `tblrespuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusuarios`
--

DROP TABLE IF EXISTS `tblusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblusuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `paterno` varchar(45) DEFAULT NULL,
  `materno` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusuarios`
--

LOCK TABLES `tblusuarios` WRITE;
/*!40000 ALTER TABLE `tblusuarios` DISABLE KEYS */;
INSERT INTO `tblusuarios` VALUES (1,'antonio','hernandez','rojas','antonio','1234',1);
/*!40000 ALTER TABLE `tblusuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-09 18:26:27
