CREATE DATABASE  IF NOT EXISTS `MARCO` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `MARCO`;
-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: MARCO
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACTIVIDAD`
--

DROP TABLE IF EXISTS `ACTIVIDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACTIVIDAD` (
  `idActividad` int(11) NOT NULL AUTO_INCREMENT,
  `tituloActividad` varchar(50) NOT NULL,
  `fechaActividad` date NOT NULL,
  `horaActividad` varchar(45) NOT NULL,
  `duracionActividad` float NOT NULL,
  `cuposActividad` int(11) NOT NULL,
  `precioActividad` double DEFAULT NULL,
  `EMPRESA_nit` int(11) NOT NULL,
  `estadoActividad` varchar(15) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `descuento` varchar(3) DEFAULT NULL,
  `fk_empresa` int(11) NOT NULL,
  `fk_lugar` int(11) NOT NULL,
  `fk_categoria` int(11) NOT NULL,
  PRIMARY KEY (`idActividad`),
  KEY `fk_ACTIVIDAD_EMPRESA1_idx` (`fk_empresa`,`EMPRESA_nit`),
  KEY `fk_ACTIVIDAD_LUGAR1_idx` (`fk_lugar`),
  KEY `fk_ACTIVIDAD_CATEGORIA1_idx` (`fk_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVIDAD`
--

LOCK TABLES `ACTIVIDAD` WRITE;
/*!40000 ALTER TABLE `ACTIVIDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTIVIDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORIA` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `tipoCategoria` varchar(20) NOT NULL,
  `EMPRESA_nit` int(11) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `fk_CATEGORIA_EMPRESA1_idx` (`EMPRESA_nit`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA`
--

LOCK TABLES `CATEGORIA` WRITE;
/*!40000 ALTER TABLE `CATEGORIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `CATEGORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCUMENTO`
--

DROP TABLE IF EXISTS `DOCUMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCUMENTO` (
  `idDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `tipoDocumento` varchar(15) NOT NULL,
  `numeroDocumento` varchar(15) NOT NULL,
  PRIMARY KEY (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCUMENTO`
--

LOCK TABLES `DOCUMENTO` WRITE;
/*!40000 ALTER TABLE `DOCUMENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `DOCUMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPRESA`
--

DROP TABLE IF EXISTS `EMPRESA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPRESA` (
  `nit` int(11) NOT NULL,
  `razonSocial` varchar(65) NOT NULL,
  `correoEmpresa` varchar(45) NOT NULL,
  `ROL_idRol` int(11) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `pass` varchar(16) NOT NULL,
  PRIMARY KEY (`nit`,`ROL_idRol`),
  KEY `fk_EMPRESA_ROL1_idx` (`ROL_idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPRESA`
--

LOCK TABLES `EMPRESA` WRITE;
/*!40000 ALTER TABLE `EMPRESA` DISABLE KEYS */;
/*!40000 ALTER TABLE `EMPRESA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LUGAR`
--

DROP TABLE IF EXISTS `LUGAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LUGAR` (
  `idLugar` int(11) NOT NULL AUTO_INCREMENT,
  `direccionLugar` varchar(45) NOT NULL,
  `zonaLugar` varchar(45) NOT NULL,
  `aforoLugar` int(11) NOT NULL,
  `EMPRESA_nit` int(11) NOT NULL,
  PRIMARY KEY (`idLugar`),
  KEY `fk_LUGAR_EMPRESA1_idx` (`EMPRESA_nit`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LUGAR`
--

LOCK TABLES `LUGAR` WRITE;
/*!40000 ALTER TABLE `LUGAR` DISABLE KEYS */;
/*!40000 ALTER TABLE `LUGAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Multimedia`
--

DROP TABLE IF EXISTS `Multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Multimedia` (
  `idMultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(150) DEFAULT NULL,
  `ACTIVIDAD_idActividad` int(11) NOT NULL,
  `EMPRESA_nit` int(11) NOT NULL,
  PRIMARY KEY (`idMultimedia`),
  KEY `fk_Multimedia_ACTIVIDAD1_idx` (`ACTIVIDAD_idActividad`),
  KEY `fk_Multimedia_EMPRESA1_idx` (`EMPRESA_nit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Multimedia`
--

LOCK TABLES `Multimedia` WRITE;
/*!40000 ALTER TABLE `Multimedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESERVA`
--

DROP TABLE IF EXISTS `RESERVA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESERVA` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadReservas` int(11) NOT NULL,
  `precioTotal` varchar(45) NOT NULL,
  `nombreComprador` varchar(45) NOT NULL,
  `apellidoComprador` varchar(45) NOT NULL,
  `documentoComprador` varchar(45) NOT NULL,
  `correoComprador` varchar(45) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `opinion` varchar(300) DEFAULT NULL,
  `fk_usuario` int(11) NOT NULL,
  `fk_actividad` int(11) NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `fk_RESERVA_USUARIO1_idx` (`fk_usuario`),
  KEY `fk_RESERVA_ACTIVIDAD1_idx` (`fk_actividad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVA`
--

LOCK TABLES `RESERVA` WRITE;
/*!40000 ALTER TABLE `RESERVA` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESERVA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROL`
--

DROP TABLE IF EXISTS `ROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROL` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `tipoRol` varchar(10) NOT NULL,
  `estadoRol` varchar(10) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROL`
--

LOCK TABLES `ROL` WRITE;
/*!40000 ALTER TABLE `ROL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `correoUsuario` varchar(45) NOT NULL,
  `contraseñaUsuario` varchar(16) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `DOCUMENTO_idDocumento` int(11) DEFAULT NULL,
  `ROL_idRol` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `celular` varchar(12) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_USUARIO_DOCUMENTO1_idx` (`DOCUMENTO_idDocumento`),
  KEY `fk_USUARIO_ROL1_idx` (`ROL_idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-08 16:52:55
