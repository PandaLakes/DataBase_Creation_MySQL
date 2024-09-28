-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tp_sgbd_sacha
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS clients;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE clients (
  Refclient varchar(20) NOT NULL,
  nom_ste varchar(50) DEFAULT NULL,
  ville varchar(50) DEFAULT NULL,
  code_postal varchar(10) DEFAULT NULL,
  PRIMARY KEY (Refclient)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES clients WRITE;
/*!40000 ALTER TABLE clients DISABLE KEYS */;
INSERT INTO clients VALUES ('C1','Acom','Tanger','90000'),('C2','B2C','CASA','40000'),('C3','Tcom','Rabat','40000');
/*!40000 ALTER TABLE clients ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS commandes;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE commandes (
  Refcom varchar(50) NOT NULL,
  ste varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  somme decimal(10,2) DEFAULT NULL,
  TVA decimal(5,2) DEFAULT NULL,
  Refclient varchar(20) DEFAULT NULL,
  PRIMARY KEY (Refcom),
  KEY ste (ste),
  KEY commandes_ibfk_1 (Refclient),
  CONSTRAINT commandes_ibfk_1 FOREIGN KEY (Refclient) REFERENCES clients (Refclient)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES commandes WRITE;
/*!40000 ALTER TABLE commandes DISABLE KEYS */;
INSERT INTO commandes VALUES ('CMD001','Acom','2023-05-01',1000.00,20.00,'C1'),('CMD002','B2C','2023-05-02',1500.50,30.00,'C2'),('CMD003','Acom','2023-05-03',750.75,15.00,'C1'),('CMD004','Tcom','2023-05-04',2000.00,40.00,'C3'),('CMD005','B2C','2023-05-05',300.00,6.00,'C2');
/*!40000 ALTER TABLE commandes ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employes`
--

DROP TABLE IF EXISTS employes;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE employes (
  num_employe int NOT NULL AUTO_INCREMENT,
  nom varchar(35) DEFAULT NULL,
  prenom varchar(35) DEFAULT NULL,
  tel varchar(13) DEFAULT NULL,
  PRIMARY KEY (num_employe)
) ENGINE=InnoDB AUTO_INCREMENT=1114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employes`
--

LOCK TABLES employes WRITE;
/*!40000 ALTER TABLE employes DISABLE KEYS */;
INSERT INTO employes VALUES (1111,'Sacha','ilyas','0654479883'),(1112,'son','goku','0689754125'),(1113,'aimane','achhab','0656560565');
/*!40000 ALTER TABLE employes ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 16:47:36
