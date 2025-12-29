-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.2

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin@1234','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appointment_time` datetime(6) NOT NULL,
  `notes` text,
  `reason_for_visit` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `doctor_id` bigint NOT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK51y2ce12yp0g0hgsa39p2u9jq` (`doctor_id`),
  KEY `FK3mbue9w5cldlnxx3hm15t5sfo` (`patient_id`),
  CONSTRAINT `FK3mbue9w5cldlnxx3hm15t5sfo` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `FK51y2ce12yp0g0hgsa39p2u9jq` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2025-05-01 09:00:00.000000',NULL,NULL,0,1,1),(2,'2025-05-02 10:00:00.000000',NULL,NULL,0,1,2),(3,'2025-05-03 11:00:00.000000',NULL,NULL,0,1,3),(4,'2025-05-04 14:00:00.000000',NULL,NULL,0,1,4),(5,'2025-05-05 15:00:00.000000',NULL,NULL,0,1,5),(6,'2025-05-06 13:00:00.000000',NULL,NULL,0,1,6),(7,'2025-05-07 09:00:00.000000',NULL,NULL,0,1,7),(8,'2025-05-08 16:00:00.000000',NULL,NULL,0,1,8),(9,'2025-05-09 11:00:00.000000',NULL,NULL,0,1,9),(10,'2025-05-10 10:00:00.000000',NULL,NULL,0,1,10),(11,'2025-05-11 12:00:00.000000',NULL,NULL,0,1,11),(12,'2025-05-12 15:00:00.000000',NULL,NULL,0,1,12),(13,'2025-05-13 13:00:00.000000',NULL,NULL,0,1,13),(14,'2025-05-14 10:00:00.000000',NULL,NULL,0,1,14),(15,'2025-05-15 11:00:00.000000',NULL,NULL,0,1,15),(16,'2025-05-16 14:00:00.000000',NULL,NULL,0,1,16),(17,'2025-05-17 09:00:00.000000',NULL,NULL,0,1,17),(18,'2025-05-18 12:00:00.000000',NULL,NULL,0,1,18),(19,'2025-05-19 13:00:00.000000',NULL,NULL,0,1,19),(20,'2025-05-20 16:00:00.000000',NULL,NULL,0,1,20),(21,'2025-05-21 14:00:00.000000',NULL,NULL,0,1,21),(22,'2025-05-22 10:00:00.000000',NULL,NULL,0,1,22),(23,'2025-05-23 11:00:00.000000',NULL,NULL,0,1,23),(24,'2025-05-24 15:00:00.000000',NULL,NULL,0,1,24),(25,'2025-05-25 09:00:00.000000',NULL,NULL,0,1,25),(26,'2025-05-01 10:00:00.000000',NULL,NULL,0,2,1),(27,'2025-05-02 11:00:00.000000',NULL,NULL,0,3,2),(28,'2025-05-03 14:00:00.000000',NULL,NULL,0,4,3),(29,'2025-05-04 15:00:00.000000',NULL,NULL,0,5,4),(30,'2025-05-05 10:00:00.000000',NULL,NULL,0,6,5),(31,'2025-05-06 11:00:00.000000',NULL,NULL,0,7,6),(32,'2025-05-07 14:00:00.000000',NULL,NULL,0,8,7),(33,'2025-05-08 15:00:00.000000',NULL,NULL,0,9,8),(34,'2025-05-09 10:00:00.000000',NULL,NULL,0,10,9),(35,'2025-05-10 14:00:00.000000',NULL,NULL,0,11,10),(36,'2025-05-11 13:00:00.000000',NULL,NULL,0,12,11),(37,'2025-05-12 14:00:00.000000',NULL,NULL,0,13,12),(38,'2025-05-13 15:00:00.000000',NULL,NULL,0,14,13),(39,'2025-05-14 10:00:00.000000',NULL,NULL,0,15,14),(40,'2025-05-15 11:00:00.000000',NULL,NULL,0,16,15),(41,'2025-05-16 14:00:00.000000',NULL,NULL,0,17,16),(42,'2025-05-17 10:00:00.000000',NULL,NULL,0,18,17),(43,'2025-05-18 13:00:00.000000',NULL,NULL,0,19,18),(44,'2025-05-19 14:00:00.000000',NULL,NULL,0,20,19),(45,'2025-05-20 11:00:00.000000',NULL,NULL,0,21,20),(46,'2025-05-21 13:00:00.000000',NULL,NULL,0,22,21),(47,'2025-05-22 14:00:00.000000',NULL,NULL,0,23,22),(48,'2025-05-23 10:00:00.000000',NULL,NULL,0,24,23),(49,'2025-05-24 15:00:00.000000',NULL,NULL,0,25,24),(50,'2025-05-25 13:00:00.000000',NULL,NULL,0,25,25),(51,'2025-04-01 10:00:00.000000',NULL,NULL,1,1,2),(52,'2025-04-02 11:00:00.000000',NULL,NULL,1,2,3),(53,'2025-04-03 14:00:00.000000',NULL,NULL,1,3,4),(54,'2025-04-04 15:00:00.000000',NULL,NULL,1,4,5),(55,'2025-04-05 10:00:00.000000',NULL,NULL,1,5,6),(56,'2025-04-06 11:00:00.000000',NULL,NULL,1,6,7),(57,'2025-04-07 14:00:00.000000',NULL,NULL,1,7,8),(58,'2025-04-08 15:00:00.000000',NULL,NULL,1,8,9),(59,'2025-04-09 10:00:00.000000',NULL,NULL,1,9,10),(60,'2025-04-10 14:00:00.000000',NULL,NULL,1,10,11),(61,'2025-04-11 13:00:00.000000',NULL,NULL,1,11,12),(62,'2025-04-12 14:00:00.000000',NULL,NULL,1,12,13),(63,'2025-04-13 15:00:00.000000',NULL,NULL,1,13,14),(64,'2025-04-14 10:00:00.000000',NULL,NULL,1,14,15),(65,'2025-04-15 11:00:00.000000',NULL,NULL,1,15,16),(66,'2025-04-16 14:00:00.000000',NULL,NULL,1,16,17),(67,'2025-04-17 10:00:00.000000',NULL,NULL,1,17,18),(68,'2025-04-18 13:00:00.000000',NULL,NULL,1,18,19),(69,'2025-04-19 14:00:00.000000',NULL,NULL,1,19,20),(70,'2025-04-20 11:00:00.000000',NULL,NULL,1,20,21),(71,'2025-04-21 13:00:00.000000',NULL,NULL,1,21,22),(72,'2025-04-22 14:00:00.000000',NULL,NULL,1,22,23),(73,'2025-04-23 10:00:00.000000',NULL,NULL,1,23,24),(74,'2025-04-24 15:00:00.000000',NULL,NULL,1,24,25),(75,'2025-04-25 13:00:00.000000',NULL,NULL,1,25,25),(76,'2025-04-01 09:00:00.000000',NULL,NULL,1,1,1),(77,'2025-04-02 10:00:00.000000',NULL,NULL,1,1,2),(78,'2025-04-03 11:00:00.000000',NULL,NULL,1,1,3),(79,'2025-04-04 14:00:00.000000',NULL,NULL,1,1,4),(80,'2025-04-05 10:00:00.000000',NULL,NULL,1,1,5),(81,'2025-04-10 10:00:00.000000',NULL,NULL,1,1,6),(82,'2025-04-11 09:00:00.000000',NULL,NULL,1,1,7),(83,'2025-04-14 13:00:00.000000',NULL,NULL,1,1,8),(84,'2025-04-01 10:00:00.000000',NULL,NULL,1,2,1),(85,'2025-04-01 11:00:00.000000',NULL,NULL,1,2,2),(86,'2025-04-02 09:00:00.000000',NULL,NULL,1,2,3),(87,'2025-04-02 10:00:00.000000',NULL,NULL,1,2,4),(88,'2025-04-03 11:00:00.000000',NULL,NULL,1,2,5),(89,'2025-04-03 12:00:00.000000',NULL,NULL,1,2,6),(90,'2025-04-04 14:00:00.000000',NULL,NULL,1,2,7),(91,'2025-04-04 15:00:00.000000',NULL,NULL,1,2,8),(92,'2025-04-05 10:00:00.000000',NULL,NULL,1,2,9),(93,'2025-04-05 11:00:00.000000',NULL,NULL,1,2,10),(94,'2025-04-06 13:00:00.000000',NULL,NULL,1,2,11),(95,'2025-04-06 14:00:00.000000',NULL,NULL,1,2,12),(96,'2025-04-07 09:00:00.000000',NULL,NULL,1,2,13),(97,'2025-04-07 10:00:00.000000',NULL,NULL,1,2,14),(98,'2025-04-08 11:00:00.000000',NULL,NULL,1,2,15),(99,'2025-04-08 12:00:00.000000',NULL,NULL,1,2,16),(100,'2025-04-09 13:00:00.000000',NULL,NULL,1,2,17),(101,'2025-04-09 14:00:00.000000',NULL,NULL,1,2,18),(102,'2025-04-10 11:00:00.000000',NULL,NULL,1,2,19),(103,'2025-04-10 12:00:00.000000',NULL,NULL,1,2,20),(104,'2025-04-11 14:00:00.000000',NULL,NULL,1,2,21),(105,'2025-04-11 15:00:00.000000',NULL,NULL,1,2,22),(106,'2025-04-12 10:00:00.000000',NULL,NULL,1,2,23),(107,'2025-04-12 11:00:00.000000',NULL,NULL,1,2,24),(108,'2025-04-13 13:00:00.000000',NULL,NULL,1,2,25),(109,'2025-04-13 14:00:00.000000',NULL,NULL,1,2,1),(110,'2025-04-14 09:00:00.000000',NULL,NULL,1,2,2),(111,'2025-04-14 10:00:00.000000',NULL,NULL,1,2,3),(112,'2025-04-15 12:00:00.000000',NULL,NULL,1,2,4),(113,'2025-04-15 13:00:00.000000',NULL,NULL,1,2,5),(114,'2025-04-01 12:00:00.000000',NULL,NULL,1,3,1),(115,'2025-04-02 11:00:00.000000',NULL,NULL,1,3,2),(116,'2025-04-03 13:00:00.000000',NULL,NULL,1,3,3),(117,'2025-04-04 15:00:00.000000',NULL,NULL,1,3,4),(118,'2025-04-05 12:00:00.000000',NULL,NULL,1,3,5),(119,'2025-04-08 13:00:00.000000',NULL,NULL,1,3,6),(120,'2025-04-09 10:00:00.000000',NULL,NULL,1,3,7),(121,'2025-04-10 14:00:00.000000',NULL,NULL,1,3,8),(122,'2025-04-11 13:00:00.000000',NULL,NULL,1,3,9),(123,'2025-04-12 09:00:00.000000',NULL,NULL,1,3,10),(124,'2025-04-01 14:00:00.000000',NULL,NULL,1,4,1),(125,'2025-04-02 12:00:00.000000',NULL,NULL,1,4,2),(126,'2025-04-03 14:00:00.000000',NULL,NULL,1,4,3),(127,'2025-04-04 16:00:00.000000',NULL,NULL,1,4,4),(128,'2025-04-05 14:00:00.000000',NULL,NULL,1,4,5),(129,'2025-04-09 11:00:00.000000',NULL,NULL,1,4,6),(130,'2025-04-10 13:00:00.000000',NULL,NULL,1,4,7);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_locations`
--

DROP TABLE IF EXISTS `clinic_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_locations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_locations`
--

LOCK TABLES `clinic_locations` WRITE;
/*!40000 ALTER TABLE `clinic_locations` DISABLE KEYS */;
INSERT INTO `clinic_locations` VALUES (1,'Av. Paulista, 1000 - SP','São Paulo','11999990001','Hospital Central'),(2,'Rua das Flores, 200 - RJ','Rio de Janeiro','21988880002','Clínica Vida Saudável'),(3,'Av. Amazonas, 500 - MG','Belo Horizonte','31977770003','Centro Médico Norte'),(4,'Rua XV de Novembro, 300 - PR','Curitiba','41966660004','Hospital Santa Clara'),(5,'Av. Boa Viagem, 150 - PE','Recife','81955550005','Clínica Bem Estar');
/*!40000 ALTER TABLE `clinic_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_availability`
--

DROP TABLE IF EXISTS `doctor_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_availability` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `available_date` date NOT NULL,
  `end_time` time(6) NOT NULL,
  `is_booked` bit(1) NOT NULL,
  `start_time` time(6) NOT NULL,
  `doctor_id` bigint NOT NULL,
  `available_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKff1k1vuvpn024x0t76qu3gcq5` (`doctor_id`),
  CONSTRAINT `FKff1k1vuvpn024x0t76qu3gcq5` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_availability`
--

LOCK TABLES `doctor_availability` WRITE;
/*!40000 ALTER TABLE `doctor_availability` DISABLE KEYS */;
INSERT INTO `doctor_availability` VALUES (1,'2025-06-01','10:00:00.000000',_binary '\0','09:00:00.000000',1,NULL),(2,'2025-06-01','11:00:00.000000',_binary '\0','10:00:00.000000',1,NULL),(3,'2025-06-01','12:00:00.000000',_binary '\0','11:00:00.000000',1,NULL),(4,'2025-06-01','15:00:00.000000',_binary '\0','14:00:00.000000',1,NULL),(5,'2025-06-01','11:00:00.000000',_binary '\0','10:00:00.000000',2,NULL),(6,'2025-06-01','12:00:00.000000',_binary '\0','11:00:00.000000',2,NULL),(7,'2025-06-01','15:00:00.000000',_binary '\0','14:00:00.000000',2,NULL),(8,'2025-06-01','16:00:00.000000',_binary '\0','15:00:00.000000',2,NULL),(9,'2025-06-01','10:00:00.000000',_binary '\0','09:00:00.000000',3,NULL),(10,'2025-06-01','12:00:00.000000',_binary '\0','11:00:00.000000',3,NULL),(11,'2025-06-01','15:00:00.000000',_binary '\0','14:00:00.000000',3,NULL),(12,'2025-06-01','17:00:00.000000',_binary '\0','16:00:00.000000',3,NULL),(13,'2025-06-01','10:00:00.000000',_binary '\0','09:00:00.000000',4,NULL),(14,'2025-06-01','11:00:00.000000',_binary '\0','10:00:00.000000',4,NULL),(15,'2025-06-01','16:00:00.000000',_binary '\0','15:00:00.000000',4,NULL),(16,'2025-06-01','17:00:00.000000',_binary '\0','16:00:00.000000',4,NULL),(17,'2025-06-01','10:00:00.000000',_binary '\0','09:00:00.000000',5,NULL),(18,'2025-06-01','11:00:00.000000',_binary '\0','10:00:00.000000',5,NULL),(19,'2025-06-01','15:00:00.000000',_binary '\0','14:00:00.000000',5,NULL),(20,'2025-06-01','16:00:00.000000',_binary '\0','15:00:00.000000',5,NULL);
/*!40000 ALTER TABLE `doctor_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `rating` double DEFAULT NULL,
  `specialty` varchar(50) NOT NULL,
  `years_of_experience` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `doctors_chk_1` CHECK (((`rating` <= 5) and (`rating` >= 0))),
  CONSTRAINT `doctors_chk_2` CHECK ((`years_of_experience` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'dr.adams@example.com','Dr. Emily Adams','pass12345','5551012020',4.9,'Cardiologist',15),(2,'dr.johnson@example.com','Dr. Mark Johnson','secure4567','5552023030',4.7,'Neurologist',10),(3,'dr.lee@example.com','Dr. Sarah Lee','leePass987','5553034040',4.8,'Orthopedist',8),(4,'dr.wilson@example.com','Dr. Tom Wilson','w!ls0nPwd','5554045050',4.6,'Pediatrician',20),(5,'dr.brown@example.com','Dr. Alice Brown','brownie123','5555056060',4.5,'Dermatologist',5),(6,'dr.taylor@example.com','Dr. Taylor Grant','taylor321','5556067070',4.8,'Cardiologist',12),(7,'dr.white@example.com','Dr. Sam White','whiteSecure1','5557078080',4.3,'Neurologist',7),(8,'dr.clark@example.com','Dr. Emma Clark','clarkPass456','5558089090',4.7,'Orthopedist',9),(9,'dr.davis@example.com','Dr. Olivia Davis','davis789','5559090101',4.9,'Pediatrician',3),(10,'dr.miller@example.com','Dr. Henry Miller','millertime!','5550101111',4.2,'Dermatologist',25),(11,'dr.moore@example.com','Dr. Ella Moore','ellapass33','5551112222',4.6,'Cardiologist',6),(12,'dr.martin@example.com','Dr. Leo Martin','martinpass','5552223333',5,'Neurologist',18),(13,'dr.jackson@example.com','Dr. Ivy Jackson','jackson11','5553334444',4.4,'Orthopedist',11),(14,'dr.thomas@example.com','Dr. Owen Thomas','thomasPWD','5554445555',4.8,'Pediatrician',14),(15,'dr.hall@example.com','Dr. Ava Hall','hallhall','5555556666',4.1,'Dermatologist',4),(16,'dr.green@example.com','Dr. Mia Green','greenleaf','5556667777',4.9,'Cardiologist',22),(17,'dr.baker@example.com','Dr. Jack Baker','bakeitup','5557778888',4.5,'Neurologist',8),(18,'dr.walker@example.com','Dr. Nora Walker','walkpass12','5558889999',4.7,'Orthopedist',16),(19,'dr.young@example.com','Dr. Liam Young','young123','5559990000',4,'Pediatrician',2),(20,'dr.king@example.com','Dr. Zoe King','kingkong1','5550001111',4.6,'Dermatologist',13),(21,'dr.scott@example.com','Dr. Lily Scott','scottish','5551112223',4.8,'Cardiologist',9),(22,'dr.evans@example.com','Dr. Lucas Evans','evansEv1','5552223334',4.9,'Neurologist',19),(23,'dr.turner@example.com','Dr. Grace Turner','turnerBurner','5553334445',4.5,'Orthopedist',7),(24,'dr.hill@example.com','Dr. Ethan Hill','hillclimb','5554445556',4.3,'Pediatrician',5),(25,'dr.ward@example.com','Dr. Ruby Ward','wardWard','5555556667',4.7,'Dermatologist',10);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_insurances`
--

DROP TABLE IF EXISTS `patient_insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_insurances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coverage_percentage` decimal(38,2) DEFAULT NULL,
  `policy_number` varchar(255) NOT NULL,
  `provider_name` varchar(255) NOT NULL,
  `patient_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8pgdmaquaawu5audlt6w5ei7x` (`patient_id`),
  CONSTRAINT `FK8pgdmaquaawu5audlt6w5ei7x` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_insurances`
--

LOCK TABLES `patient_insurances` WRITE;
/*!40000 ALTER TABLE `patient_insurances` DISABLE KEYS */;
INSERT INTO `patient_insurances` VALUES (1,80.00,'UNI-123456789','Unimed Nacional',1),(2,90.00,'BRA-987654321','Bradesco Saúde',2),(3,75.50,'AMI-456123789','Amil Assistência',3),(4,100.00,'SUL-789123456','SulAmérica Saúde',4),(5,60.00,'NOT-321654987','Intermédica',5),(6,80.00,'UNI-111222333','Unimed Rio',6),(7,85.00,'BRA-444555666','Bradesco Saúde',7),(8,70.00,'AMI-777888999','Amil Assistência',8),(9,95.00,'POR-000111222','Porto Seguro',9),(10,50.00,'ALL-333222111','Allianz Saúde',10);
/*!40000 ALTER TABLE `patient_insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `emergency_contact` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'101 Oak St, Cityville',NULL,'jane.doe@example.com',NULL,'Jane Doe','passJane1','8881111111'),(2,'202 Maple Rd, Townsville',NULL,'john.smith@example.com',NULL,'John Smith','smithSecure','8882222222'),(3,'303 Pine Ave, Villageton',NULL,'emily.rose@example.com',NULL,'Emily Rose','emilyPass99','8883333333'),(4,'404 Birch Ln, Metropolis',NULL,'michael.j@example.com',NULL,'Michael Jordan','airmj23','8884444444'),(5,'505 Cedar Blvd, Springfield',NULL,'olivia.m@example.com',NULL,'Olivia Moon','moonshine12','8885555555'),(6,'606 Spruce Ct, Gotham',NULL,'liam.k@example.com',NULL,'Liam King','king321','8886666666'),(7,'707 Aspen Dr, Riverdale',NULL,'sophia.l@example.com',NULL,'Sophia Lane','sophieLane','8887777777'),(8,'808 Elm St, Newtown',NULL,'noah.b@example.com',NULL,'Noah Brooks','noahBest!','8888888888'),(9,'909 Willow Way, Star City',NULL,'ava.d@example.com',NULL,'Ava Daniels','avaSecure8','8889999999'),(10,'111 Chestnut Pl, Midvale',NULL,'william.h@example.com',NULL,'William Harris','willH2025','8880000000'),(11,'112 Redwood St, Fairview',NULL,'mia.g@example.com',NULL,'Mia Green','miagreen1','8891111111'),(12,'113 Cypress Rd, Edgewater',NULL,'james.b@example.com',NULL,'James Brown','jamiebrown','8892222222'),(13,'114 Poplar Ave, Crestwood',NULL,'amelia.c@example.com',NULL,'Amelia Clark','ameliacool','8893333333'),(14,'115 Sequoia Dr, Elmwood',NULL,'ben.j@example.com',NULL,'Ben Johnson','bennyJ','8894444444'),(15,'116 Palm Blvd, Harborview',NULL,'ella.m@example.com',NULL,'Ella Monroe','ellam123','8895555555'),(16,'117 Cottonwood Ct, Laketown',NULL,'lucas.t@example.com',NULL,'Lucas Turner','lucasTurn','8896666666'),(17,'118 Sycamore Ln, Hilltop',NULL,'grace.s@example.com',NULL,'Grace Scott','graceful','8897777777'),(18,'119 Magnolia Pl, Brookside',NULL,'ethan.h@example.com',NULL,'Ethan Hill','hill2025','8898888888'),(19,'120 Fir St, Woodland',NULL,'ruby.w@example.com',NULL,'Ruby Ward','rubypass','8899999999'),(20,'121 Beech Way, Lakeside',NULL,'jack.b@example.com',NULL,'Jack Baker','bakerjack','8890000000'),(21,'122 Alder Ave, Pinehill',NULL,'mia.h@example.com',NULL,'Mia Hall','hallMia','8901111111'),(22,'123 Hawthorn Blvd, Meadowbrook',NULL,'owen.t@example.com',NULL,'Owen Thomas','owen123','8902222222'),(23,'124 Dogwood Dr, Summit',NULL,'ivy.j@example.com',NULL,'Ivy Jackson','ivyIvy','8903333333'),(24,'125 Juniper Ct, Greenwood',NULL,'leo.m@example.com',NULL,'Leo Martin','leopass','8904444444'),(25,'126 Olive Rd, Ashville',NULL,'ella.moore2@example.com',NULL,'Ella Moore Two','ellamoore','8905555555');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(38,2) NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `appointment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK2kxb37oip0md9ggekjbjmana4` (`appointment_id`),
  CONSTRAINT `FKmq6cipl73ca80eqof2lw4v528` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,150.00,'CREDIT_CARD','2025-05-01 10:00:00.000000','COMPLETED',1),(2,200.00,'DEBIT_CARD','2025-05-02 11:00:00.000000','COMPLETED',2),(3,150.00,'CASH','2025-05-03 12:00:00.000000','PENDING',3),(4,300.00,'INSURANCE','2025-05-04 15:00:00.000000','PROCESSING',4),(5,120.00,'PIX','2025-05-05 16:00:00.000000','COMPLETED',5),(6,150.00,'CREDIT_CARD','2025-05-06 14:00:00.000000','REFUNDED',6),(7,180.00,'DEBIT_CARD','2025-05-07 10:00:00.000000','COMPLETED',7),(8,150.00,'CASH','2025-05-08 17:00:00.000000','COMPLETED',8),(9,250.00,'INSURANCE','2025-05-09 12:00:00.000000','COMPLETED',9),(10,150.00,'PIX','2025-05-10 11:00:00.000000','PENDING',10);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29  6:51:37
