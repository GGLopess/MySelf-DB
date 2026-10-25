CREATE DATABASE  IF NOT EXISTS "myself_tickets_db" /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myself_tickets_db`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: myself-db-myself-tickets.e.aivencloud.com    Database: myself_tickets_db
-- ------------------------------------------------------
-- Server version	8.4.11

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'f7f04f23-d09c-11f1-9164-02de7ceb9ae3:1-54';

--
-- Table structure for table `atracao_evento`
--

DROP TABLE IF EXISTS `atracao_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atracao_evento` (
  `id_evento` int NOT NULL,
  `atracao` varchar(100) NOT NULL,
  PRIMARY KEY (`id_evento`,`atracao`),
  CONSTRAINT `fk_atracao_eventos` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atracao_evento`
--

LOCK TABLES `atracao_evento` WRITE;
/*!40000 ALTER TABLE `atracao_evento` DISABLE KEYS */;
INSERT INTO `atracao_evento` VALUES (1,'DJ Echo Dimensional'),(1,'Trap Set Glock Boyz'),(2,'Hellsing Live'),(3,'Special Set After Apology'),(4,'DJ Resident MySelf');
/*!40000 ALTER TABLE `atracao_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Enzo Gabriel','111.222.333-01','enzo.gabriel@email.com','(11) 98765-4321'),(2,'Beatriz Ramos','222.333.444-02','beatriz.ramos@email.com','(11) 97654-3210'),(3,'Matheus Oliveira','333.444.555-03','matheus.trap@email.com','(11) 96543-2109'),(4,'Giulia Martins','444.555.666-04','giulia.martins@email.com','(11) 95432-1098'),(5,'Lucas Mendes','555.666.777-05','lucas.mendes@email.com','(11) 94321-0987');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `id_local` int NOT NULL,
  `nome_evento` varchar(150) NOT NULL,
  `data_hora` datetime NOT NULL,
  `tipo_evento` varchar(50) NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `fk_eventos_locais` (`id_local`),
  CONSTRAINT `fk_eventos_locais` FOREIGN KEY (`id_local`) REFERENCES `locais` (`id_local`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,1,'MYSELF x ECHO DIMENSIONAL FUTURE','2026-10-31 22:00:00','Edição Especial'),(2,2,'HELLSING GLOCK BOYZ x MYSELF WEB','2026-11-14 23:00:00','Edição Especial'),(3,3,'MYSELF WEB: AFTER APOLOGY','2026-11-28 16:00:00','Edição Especial'),(4,4,'MYSELF TRAP NIGHT #12','2026-12-12 22:00:00','Mensal');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedido` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_tipo_ingresso` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `fk_itens_pedido_pedidos` (`id_pedido`),
  KEY `fk_itens_pedido_tipos_ingresso` (`id_tipo_ingresso`),
  CONSTRAINT `fk_itens_pedido_pedidos` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  CONSTRAINT `fk_itens_pedido_tipos_ingresso` FOREIGN KEY (`id_tipo_ingresso`) REFERENCES `tipos_ingresso` (`id_tipo_ingresso`) ON DELETE CASCADE,
  CONSTRAINT `itens_pedido_chk_1` CHECK ((`quantidade` > 0)),
  CONSTRAINT `itens_pedido_chk_2` CHECK ((`preco_unitario` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (1,1,2,2,180.00),(2,2,1,1,80.00),(3,3,3,1,90.00),(4,4,6,1,250.00),(5,5,5,2,60.00);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locais`
--

DROP TABLE IF EXISTS `locais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locais` (
  `id_local` int NOT NULL AUTO_INCREMENT,
  `nome_local` varchar(100) NOT NULL,
  `bairro` varchar(60) NOT NULL,
  `capacidade_maxima` int NOT NULL,
  PRIMARY KEY (`id_local`),
  CONSTRAINT `locais_chk_1` CHECK ((`capacidade_maxima` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais`
--

LOCK TABLES `locais` WRITE;
/*!40000 ALTER TABLE `locais` DISABLE KEYS */;
INSERT INTO `locais` VALUES (1,'Complexo Zona Sul','Santo Amaro',2500),(2,'Espaço MySelf Club','Vila Olímpia',1200),(3,'Rooftop Zona Sul','Itaim Bibi',800),(4,'Arena Sunset','Interlagos',3500);
/*!40000 ALTER TABLE `locais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `data_pedido` datetime NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `status_pagamento` varchar(20) NOT NULL DEFAULT 'Aprovado',
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedidos_clientes` (`id_cliente`),
  CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE,
  CONSTRAINT `pedidos_chk_1` CHECK ((`valor_total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2026-10-15 14:20:00',360.00,'Aprovado'),(2,2,'2026-10-16 18:45:00',80.00,'Aprovado'),(3,3,'2026-10-17 20:10:00',90.00,'Aprovado'),(4,4,'2026-10-18 11:30:00',250.00,'Aprovado'),(5,5,'2026-10-19 15:00:00',120.00,'Aprovado');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promoters_evento`
--

DROP TABLE IF EXISTS `promoters_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promoters_evento` (
  `id_evento` int NOT NULL,
  `promoter` varchar(100) NOT NULL,
  PRIMARY KEY (`id_evento`,`promoter`),
  CONSTRAINT `fk_promoters_eventos` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promoters_evento`
--

LOCK TABLES `promoters_evento` WRITE;
/*!40000 ALTER TABLE `promoters_evento` DISABLE KEYS */;
INSERT INTO `promoters_evento` VALUES (1,'Promoter Carol Silva'),(1,'Promoter Felipe ZS'),(2,'Promoter Lucas ZS'),(3,'Promoter Felipe ZS'),(4,'Promoter Amanda ZS');
/*!40000 ALTER TABLE `promoters_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_ingresso`
--

DROP TABLE IF EXISTS `tipos_ingresso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_ingresso` (
  `id_tipo_ingresso` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `setor` varchar(50) NOT NULL,
  `lote` int NOT NULL DEFAULT '1',
  `preco` decimal(10,2) NOT NULL,
  `quantidade_disponivel` int NOT NULL,
  PRIMARY KEY (`id_tipo_ingresso`),
  KEY `fk_tipos_ingresso_eventos` (`id_evento`),
  CONSTRAINT `fk_tipos_ingresso_eventos` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE CASCADE,
  CONSTRAINT `tipos_ingresso_chk_1` CHECK ((`preco` >= 0)),
  CONSTRAINT `tipos_ingresso_chk_2` CHECK ((`quantidade_disponivel` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_ingresso`
--

LOCK TABLES `tipos_ingresso` WRITE;
/*!40000 ALTER TABLE `tipos_ingresso` DISABLE KEYS */;
INSERT INTO `tipos_ingresso` VALUES (1,1,'Pista Trap',1,80.00,500),(2,1,'Área VIP Backstage',1,180.00,200),(3,2,'Pista Geral',1,90.00,400),(4,3,'VIP Rooftop',1,150.00,150),(5,4,'Pista Lote Único',1,60.00,600),(6,4,'Camarote Exclusivo',1,250.00,50);
/*!40000 ALTER TABLE `tipos_ingresso` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-25 15:09:14
