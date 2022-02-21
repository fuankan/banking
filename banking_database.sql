-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banking
-- ------------------------------------------------------
-- Server version	8.0.27

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

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idclients` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `moneysom` float DEFAULT NULL,
  `moneydollar` float DEFAULT NULL,
  PRIMARY KEY (`idclients`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Jimmy','Page','zoso','qwerty',10000,200),(2,'John','Lennon','beatles','lalala',0,1000),(3,'Azamat','Marklenov','azabraza','neangime',50000,0),(4,'Jackie','Chan','whoami','kiyaa',0,60000),(5,'Brad','Pitt','bradyy','fury',10000,70000),(8,'Robert','Plant','ledzeppelin','ledzeppelin',0,50000),(9,'Nurkal','Tursunbekov','nurkal1611','nur67775',100,0),(10,'Atabek','Shamshidinov','atabek','qwerty123',500000,0),(11,'Kalyibek','Kenenbaev','kkaly','123',1000,0),(12,'qwe','Ramzan','qwe','Kadyrov',0,0),(13,'Tilek','Joldoshbek','tilya','qwerty',3000,0),(14,'erlan','chodurov','xuvoss','12345',99999,0),(15,'Altynbek','Amytov','takenoff','takeshka',0,0),(16,'Asylbek','Asylbekov','asylka123','trololo',2999,5000),(17,'Balajan','Balajanov','bpp','pass123',3333,2324);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_requests`
--

DROP TABLE IF EXISTS `credit_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_requests` (
  `idrequest` int NOT NULL AUTO_INCREMENT,
  `sum` float NOT NULL,
  `trusted_person` varchar(45) NOT NULL,
  `address` varchar(70) NOT NULL,
  `city` varchar(45) NOT NULL,
  `currency` varchar(45) NOT NULL,
  `creditor_username` varchar(45) NOT NULL,
  PRIMARY KEY (`idrequest`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_requests`
--

LOCK TABLES `credit_requests` WRITE;
/*!40000 ALTER TABLE `credit_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credits`
--

DROP TABLE IF EXISTS `credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credits` (
  `idcredits` int NOT NULL AUTO_INCREMENT,
  `sum` float NOT NULL,
  `currency` varchar(45) NOT NULL,
  `credit_date` date NOT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`idcredits`),
  KEY `client_id_idx` (`client_id`),
  CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`idclients`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits`
--

LOCK TABLES `credits` WRITE;
/*!40000 ALTER TABLE `credits` DISABLE KEYS */;
INSERT INTO `credits` VALUES (1,30000,'KGS','2021-12-10',2),(2,100000,'USD','2021-04-12',4),(3,500000,'KGS','2021-08-23',8),(4,2000,'USD','2022-02-21',1),(5,100,'USD','2022-02-21',1);
/*!40000 ALTER TABLE `credits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `idtransactions` int NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `sum` float NOT NULL,
  `currency` varchar(45) NOT NULL,
  `sender` varchar(45) NOT NULL,
  `receiver` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`idtransactions`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'USA','Los-Angeles',50000,'USD','Kalyibek Kenenbaev','Brad Pitt','cBv4IdUe','2022-01-24'),(2,'Kyrgyzstan','Bishkek',150,'KGS','Asylbek Kenenbaev','Toktobek Kenenbaev','a2V9g8sq','2022-12-04'),(3,'Korea','Seul',2500,'USD','Almagul Dyikanbaeva','Lee Min Ho','99HC6ySu','2022-07-12'),(4,'Russia','Moscow',2500,'USD','Azamat Musagaliev ','Nurlan Saburov','1uEU8wxh','2021-04-13'),(5,'Kyrgyzstan','Balykchy',750,'KGS','Belek Jayloobaev','Altynbek Maamytov','P0P10UKM','2021-04-13'),(6,'USA','New-York',2500,'USD','Fred Johnson','Kate Hudson','ltPdlFNb','2021-04-13'),(7,'China','Pekin',47500,'USD','Jackie Chan','Dony Yen','0VRP7aX6','2021-04-13'),(8,'Kyrgyzstan','Bishkek',49250,'KGS','Erlan Chodurov','Kalyibek Kenenbaev','KenDa0Rf','2021-04-13'),(9,'Kyrgyzstan','Osh',38809,'KGS','Saikal Mambetova','Sapar Janyshev','m0p70y0g','2022-01-23'),(10,'USA','New-York',47500,'USD','Jason Statham','Eddie Brock','Y6FbWE4J','2022-01-23'),(11,'Japan','Tokyo',57000,'USD','Marjan Mahmetova','Ken Kaneki','tGl36KBd','2022-01-27'),(12,'Kyrgyzstan','Bishkek',49250,'KGS','Atabek Shamshidinov','Kalyibek Kenenbaev','xGvpUsT4','2022-02-16');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers` (
  `idworkers` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idworkers`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (1,'Kalyibek','Kenenbaev','kkaly','qwerty'),(2,'Peter','Parker','spiderman','12345'),(3,'Leo','Messi','barcaonelove','101010'),(4,'Jackie','Chan','whoami','007'),(5,'Nurkal','Tursunbekov','nurkal1611','nur161123'),(6,'Тилек','Жолдошбек','tilya','asdasd'),(7,'Beka','Kenenbaev','bek','qweasd'),(8,'fsdfd','sdf','sdf','sdf'),(9,'Adil','Azamatov','adil','qwerty'),(10,'Байдолот','Жумабек уулу','bahakg','93o25m'),(11,'lol','asd','qwe','123'),(12,'Nursultan','Azamatov','nurs','qwerty'),(13,'Alan','Gaziev','London','12345'),(14,'sffsdf','sfdsf','dsfdsf','sdfsdf');
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-21 14:20:25
