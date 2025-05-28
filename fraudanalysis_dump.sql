-- MySQL dump 10.13  Distrib 9.0.0, for Win64 (x86_64)
--
-- Host: localhost    Database: fraudanalysis
-- ------------------------------------------------------
-- Server version	9.0.0

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('C001','Customer1',58,'M','North'),('C002','Customer2',65,'F','South'),('C003','Customer3',32,'M','North'),('C004','Customer4',61,'M','West'),('C005','Customer5',20,'M','North'),('C006','Customer6',31,'M','North'),('C007','Customer7',53,'M','West'),('C008','Customer8',32,'F','East'),('C009','Customer9',18,'M','West'),('C010','Customer10',39,'F','South');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_data`
--

DROP TABLE IF EXISTS `master_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_data` (
  `transaction_id` varchar(10) DEFAULT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `transaction_type` varchar(20) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `is_fraud` tinyint DEFAULT NULL,
  `risk_score` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_data`
--

LOCK TABLES `master_data` WRITE;
/*!40000 ALTER TABLE `master_data` DISABLE KEYS */;
INSERT INTO `master_data` VALUES ('T001','C001','Customer1',58,'M','North','2024-01-01 00:00:00',1689.61,'online','Houston',0,55),('T002','C002','Customer2',65,'F','South','2024-01-02 00:00:00',1329.96,'online','Houston',0,17),('T003','C003','Customer3',32,'M','North','2024-01-03 00:00:00',2764.68,'ATM','Miami',0,33),('T004','C004','Customer4',61,'M','West','2024-01-04 00:00:00',3309.70,'ATM','New York',1,63),('T005','C005','Customer5',20,'M','North','2024-01-05 00:00:00',1397.09,'ATM','Los Angeles',0,17),('T006','C006','Customer6',31,'M','North','2024-01-06 00:00:00',1342.22,'online','Miami',0,58),('T007','C007','Customer7',53,'M','West','2024-01-07 00:00:00',1231.61,'POS','Houston',0,59),('T008','C008','Customer8',32,'F','East','2024-01-08 00:00:00',3426.23,'online','Los Angeles',0,55),('T009','C009','Customer9',18,'M','West','2024-01-09 00:00:00',1346.03,'offline','Miami',1,7),('T010','C010','Customer10',39,'F','South','2024-01-10 00:00:00',3280.64,'POS','Houston',0,6);
/*!40000 ALTER TABLE `master_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_scores`
--

DROP TABLE IF EXISTS `risk_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_scores` (
  `transaction_id` varchar(10) DEFAULT NULL,
  `risk_score` int DEFAULT NULL,
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `risk_scores_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_scores`
--

LOCK TABLES `risk_scores` WRITE;
/*!40000 ALTER TABLE `risk_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` varchar(10) NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `transaction_type` varchar(20) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `is_fraud` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES ('T001','C004','2024-04-07',1689.61,'online','Houston',0),('T002','C006','2024-03-18',1329.96,'online','Houston',0),('T003','C007','2024-01-11',2764.68,'ATM','Miami',0),('T004','C002','2024-01-06',3309.70,'ATM','New York',1),('T005','C002','2024-02-18',1397.09,'ATM','Los Angeles',0),('T006','C004','2024-03-26',1342.22,'online','Miami',0),('T007','C009','2024-04-03',1231.61,'POS','Houston',0),('T008','C009','2024-01-29',3426.23,'online','Los Angeles',0),('T009','C006','2024-02-21',1346.03,'offline','Miami',1),('T010','C006','2024-01-28',3280.64,'POS','Houston',0),('T011','C003','2024-02-01',3727.50,'ATM','Miami',0),('T012','C010','2024-02-21',1816.36,'offline','Miami',0),('T013','C001','2024-04-20',557.15,'offline','Houston',0),('T014','C007','2024-02-18',2983.48,'POS','Miami',0),('T015','C009','2024-04-20',4712.73,'online','Miami',0),('T016','C006','2024-01-15',1474.57,'offline','Houston',0),('T017','C005','2024-03-05',3812.19,'online','Chicago',0),('T018','C009','2024-03-18',1002.57,'ATM','Los Angeles',0),('T019','C009','2024-04-27',12.85,'ATM','Houston',0),('T020','C006','2024-04-22',4926.75,'ATM','Los Angeles',0),('T021','C010','2024-01-11',437.41,'POS','New York',1),('T022','C009','2024-04-08',637.54,'POS','Miami',0),('T023','C009','2024-04-21',3036.90,'offline','Miami',0),('T024','C004','2024-04-01',1565.46,'ATM','Houston',1),('T025','C008','2024-01-16',1247.05,'online','Chicago',0),('T026','C009','2024-01-30',2946.32,'online','New York',0),('T027','C001','2024-01-30',346.33,'online','Chicago',0),('T028','C004','2024-02-05',3348.20,'offline','Miami',0),('T029','C010','2024-03-14',2368.63,'POS','Houston',0),('T030','C002','2024-03-25',2160.95,'POS','Houston',0),('T031','C001','2024-03-27',3270.74,'online','New York',0),('T032','C006','2024-04-12',4309.75,'offline','Los Angeles',0),('T033','C008','2024-01-18',2115.19,'ATM','Houston',0),('T034','C002','2024-02-26',4042.03,'online','New York',0),('T035','C009','2024-04-17',83.64,'online','Los Angeles',0),('T036','C008','2024-03-02',1076.60,'POS','New York',0),('T037','C001','2024-02-19',1333.36,'POS','Chicago',0),('T038','C009','2024-03-25',3594.86,'offline','Los Angeles',0),('T039','C001','2024-03-15',3681.33,'online','Chicago',0),('T040','C010','2024-03-02',2519.22,'offline','New York',1),('T041','C002','2024-04-18',937.27,'online','Los Angeles',0),('T042','C010','2024-02-01',2898.81,'online','Miami',0),('T043','C010','2024-03-13',2618.69,'ATM','Los Angeles',0),('T044','C006','2024-01-31',1335.42,'offline','Chicago',0),('T045','C002','2024-01-02',2296.84,'online','New York',0),('T046','C009','2024-02-03',670.96,'ATM','New York',1),('T047','C006','2024-02-06',797.16,'ATM','Miami',1),('T048','C009','2024-01-02',3342.64,'ATM','New York',1),('T049','C003','2024-02-03',585.99,'online','Miami',0),('T050','C005','2024-03-18',1061.04,'ATM','Los Angeles',0);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-28 16:09:51
