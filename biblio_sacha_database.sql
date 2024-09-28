-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: biblio_sacha
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
-- Table structure for table `auteur`
--

DROP TABLE IF EXISTS auteur;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE auteur (
  num_auteur varchar(10) NOT NULL,
  nom varchar(30) NOT NULL,
  adresse varchar(50) DEFAULT NULL,
  PRIMARY KEY (num_auteur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auteur`
--

LOCK TABLES auteur WRITE;
/*!40000 ALTER TABLE auteur DISABLE KEYS */;
INSERT INTO auteur VALUES ('A001','AKIRA TORIYAMA',''),('H','Hakim','Rue 123'),('M','Moujarrib','Rue 456'),('N','Neferiti','Rue 789'),('R','Ramsis','Rue 101'),('T','Tafih','Rue 102');
/*!40000 ALTER TABLE auteur ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editeur`
--

DROP TABLE IF EXISTS editeur;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE editeur (
  num_editeur varchar(10) NOT NULL,
  nom varchar(30) NOT NULL,
  adresse varchar(50) DEFAULT NULL,
  PRIMARY KEY (num_editeur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editeur`
--

LOCK TABLES editeur WRITE;
/*!40000 ALTER TABLE editeur DISABLE KEYS */;
INSERT INTO editeur VALUES ('DAO','Dar Al-Oujoum','rue abc'),('E001','jiji',''),('NP','Nul Part','Av DEF'),('PLB','Pour les Bêtes','RUE GHI');
/*!40000 ALTER TABLE editeur ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS etudiant;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE etudiant (
  num_etudiant int NOT NULL,
  nom varchar(30) NOT NULL,
  prenom varchar(30) NOT NULL,
  age int DEFAULT NULL,
  tel varchar(20) DEFAULT NULL,
  ville varchar(20) DEFAULT NULL,
  PRIMARY KEY (num_etudiant),
  CONSTRAINT chq_age CHECK ((`age` between 15 and 30))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES etudiant WRITE;
/*!40000 ALTER TABLE etudiant DISABLE KEYS */;
INSERT INTO etudiant VALUES (1,'SACHA','ILYAS',18,'1234567890','Paris'),(50,'Kaslani','Kassoul',28,'065555555','Tanger'),(51,'Kaslani','Kassoula',27,'065555556','Tanger'),(100,'Abbassi','Abbass',23,'070000607','Tanger'),(101,'Kaddouri','Kaddour',24,'077777700','Chefchaouen'),(102,'Jallouli','Jalloul',23,'066666660','Tétouan'),(103,'Ayyachi','Aicha',22,NULL,'Tétouan'),(113,'Slaoui','Salwa',21,'060000001','Tanger'),(202,'Khaldouni','Khalid',22,'060000002','Tanger'),(309,'Karimi','Karim',20,'066600005','Casablanca'),(310,'Karimi','Karima',20,NULL,'Casablanca'),(567,'Moussaoui','Moussa',21,'050070070','Tanger'),(580,'Moussi','Moussa',22,NULL,'Casablanca'),(998,'Moujtahida','Moujidda',21,NULL,'Tanger'),(999,'Moujtahid','Moujidd',21,NULL,'Tanger'),(1001,'Hammadi','Hamada',25,'061111111','Casa'),(1002,'Tahiri','Tahir',24,'066666600','Tanger'),(1003,'Sallami','Salma',26,NULL,'Tanger'),(1004,'Mimouni','Mimoun',23,NULL,'Casa');
/*!40000 ALTER TABLE etudiant ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livre`
--

DROP TABLE IF EXISTS livre;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE livre (
  num_livre varchar(10) NOT NULL,
  titre varchar(100) NOT NULL,
  num_auteur varchar(10) NOT NULL,
  num_editeur varchar(10) NOT NULL,
  num_theme varchar(10) NOT NULL,
  date_edition date DEFAULT NULL,
  PRIMARY KEY (num_livre),
  KEY FK_Livre_Auteur (num_auteur),
  KEY FK_Livre_Editeur (num_editeur),
  CONSTRAINT FK_Livre_Auteur FOREIGN KEY (num_auteur) REFERENCES auteur (num_auteur) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_Livre_Editeur FOREIGN KEY (num_editeur) REFERENCES editeur (num_editeur) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livre`
--

LOCK TABLES livre WRITE;
/*!40000 ALTER TABLE livre DISABLE KEYS */;
INSERT INTO livre VALUES ('BD1','Comment avoir 20 en BD','R','NP','Info','2015-01-01'),('BD2','Tout sur les BD','N','NP','Info','2014-12-01'),('BD3','Maitriser les BD','R','NP','Info','2014-07-07'),('BD4','SGBD Relationnels','R','DAO','Info','2014-01-01'),('BD5','SI et BD','N','DAO','Info','2003-02-04'),('BD6','Les BD : Pour les nuls','R','NP','Info','2014-01-01'),('ECO1','L\'économie du Maroc en l\'an 3050','M','DAO','Eco','2015-04-01'),('L001','Dragon ball','A001','E001','T001','2023-04-30'),('Math1','Algèbre','H','NP','Math','2014-09-02'),('Math2','Analyse','H','NP','Math','2014-08-02'),('Math3','Algèbre linéaire','H','DAO','Math','2015-08-02'),('Math4','Aimer les Maths','M','NP','Math','2014-08-04'),('SE1','Systèmes d\'exploitation','R','NP','Info','2003-08-06'),('SE2','Maitriser UNIX','R','DAO','Info','2002-10-02'),('SE3','Tout sur les SE','N','NP','Info','2001-08-07'),('TW1','Histoire','T','PLB','Div',NULL),('TW2','Personnes fameuses','T','PLB','Div',NULL),('TW3','Comment devenir un bon joueur en 5 jours et sans coach','T','PLB','Div',NULL);
/*!40000 ALTER TABLE livre ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pret`
--

DROP TABLE IF EXISTS pret;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pret (
  num_etudiant int NOT NULL,
  num_livre varchar(10) NOT NULL,
  date_pret date NOT NULL,
  rendu tinyint(1) DEFAULT '0',
  date_retour date DEFAULT NULL,
  PRIMARY KEY (num_etudiant,num_livre,date_pret),
  UNIQUE KEY uq_pret_uniquedate (num_livre,date_pret),
  UNIQUE KEY uq_numlivre_rendu_date_retour (num_livre,rendu,date_retour),
  CONSTRAINT fk_pret_etudiant FOREIGN KEY (num_etudiant) REFERENCES etudiant (num_etudiant),
  CONSTRAINT fk_pret_livre FOREIGN KEY (num_livre) REFERENCES livre (num_livre),
  CONSTRAINT CHK_Pret_DateRetour CHECK (((`date_retour` is null) or ((`date_retour` >= `date_pret`) and (0 <> `rendu`))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pret`
--

LOCK TABLES pret WRITE;
/*!40000 ALTER TABLE pret DISABLE KEYS */;
INSERT INTO pret VALUES (50,'BD1','2024-01-01',0,NULL),(51,'BD2','2024-01-05',0,NULL),(202,'BD3','2024-04-10',0,NULL),(309,'BD4','2024-04-20',1,'2024-05-05'),(101,'ECO1','2024-02-15',0,NULL),(100,'Math1','2024-02-01',0,NULL),(102,'Math2','2024-03-01',0,NULL),(310,'Math3','2024-05-01',0,NULL),(103,'SE1','2024-03-05',0,NULL),(113,'SE2','2024-04-01',1,'2024-04-15');
/*!40000 ALTER TABLE pret ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeur`
--

DROP TABLE IF EXISTS professeur;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE professeur (
  cin decimal(10,0) NOT NULL,
  nom varchar(20) NOT NULL,
  prenom varchar(20) NOT NULL,
  adresse text,
  email varchar(50) DEFAULT NULL,
  PRIMARY KEY (cin),
  UNIQUE KEY unique_nom_prenom (nom,prenom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeur`
--

LOCK TABLES professeur WRITE;
/*!40000 ALTER TABLE professeur DISABLE KEYS */;
/*!40000 ALTER TABLE professeur ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS theme;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE theme (
  num_theme varchar(10) NOT NULL,
  intitule_theme varchar(20) NOT NULL,
  PRIMARY KEY (num_theme)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES theme WRITE;
/*!40000 ALTER TABLE theme DISABLE KEYS */;
INSERT INTO theme VALUES ('Div','Divers'),('Eco','Economie'),('Info','Informatique'),('Math','Mathématiques'),('T001','shonen');
/*!40000 ALTER TABLE theme ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 16:48:09
