CREATE DATABASE  IF NOT EXISTS `baby_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `baby_shop`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: baby_shop
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `bday_loyalty_points_event`
--

DROP TABLE IF EXISTS `bday_loyalty_points_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bday_loyalty_points_event` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `current_birthday` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bday_loyalty_points_event`
--

LOCK TABLES `bday_loyalty_points_event` WRITE;
/*!40000 ALTER TABLE `bday_loyalty_points_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `bday_loyalty_points_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_loyalty_points`
--

DROP TABLE IF EXISTS `customer_loyalty_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_loyalty_points` (
  `Customer_id` int NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Loyalty_points` int DEFAULT NULL,
  KEY `fk_customer_id` (`Customer_id`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_loyalty_points`
--

LOCK TABLES `customer_loyalty_points` WRITE;
/*!40000 ALTER TABLE `customer_loyalty_points` DISABLE KEYS */;
INSERT INTO `customer_loyalty_points` VALUES (1,'John','Smith',100),(2,'Jane','Bowney',50),(3,'Bill','Donnolly',150),(4,'Pamela','Bland',450),(5,'Michelle','Jackson',375),(6,'James','Lan',650),(7,'Evelyn','Ridge',1050),(8,'Adrian','Green',50),(9,'Angela','Vernon',500),(10,'Thomas','Stevens',250);
/*!40000 ALTER TABLE `customer_loyalty_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Customer_id` int NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Birth_date` date DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Address` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John','Smith','2000-09-08','7411410664','36 Portal Close','London','HA4 6NN'),(2,'Jane','Bowney','1999-10-10','7415410997','15 Palm Street','Manchester','MA5 0PP'),(3,'Bill','Donnolly','1968-03-18','7984129843','1 Dana Cottage','Helensboro','G68 9QW'),(4,'Pamela','Bland','1961-10-15','7218346210','1560 Jason Way','Aberdeen','AB3 4EK'),(5,'Michelle','Jackson','1984-01-15','1335856420','4153 Elliston','Cardiff','CA3 2RD'),(6,'James','Lan','1980-08-14','1225678901','20B High Street','Lincoln','LN5 9GX'),(7,'Evelyn','Ridge','1950-11-09','7615410664','2 Blueberry Place','Glasgow','G68 1FL'),(8,'Adrian','Green','1948-02-03','1668123456','19 Tedder Drive','Windsor','TH7 5MD'),(9,'Angela','Vernon','1982-06-12','1990818273','20 Carely Road','Alnwick','AN7 3HG'),(10,'Thomas','Stevens','1988-09-13','7510729883','62 Nero Way','Warwick','WA4 8SD');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item_notes`
--

DROP TABLE IF EXISTS `order_item_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_notes` (
  `Note_id` int NOT NULL,
  `Order_id` int NOT NULL,
  `Product_id` int NOT NULL,
  `Note` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Note_id`),
  KEY `fk_order_id` (`Order_id`),
  KEY `fk_product_id` (`Product_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`Order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`Product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_notes`
--

LOCK TABLES `order_item_notes` WRITE;
/*!40000 ALTER TABLE `order_item_notes` DISABLE KEYS */;
INSERT INTO `order_item_notes` VALUES (1,10,2,'Order Shipped'),(2,9,3,'Order Complete'),(3,8,4,'Order cancelled by customer'),(4,7,5,'Order Delayed'),(5,6,6,'Order Shipped'),(6,5,7,'Order Complete'),(7,4,8,'Order cancelled by customer'),(8,3,9,'Order Shipped'),(9,2,10,'Order Delayed'),(10,1,4,'Order Complete');
/*!40000 ALTER TABLE `order_item_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `Order_id` int NOT NULL,
  `Product_id` int NOT NULL,
  `Quantity` int NOT NULL,
  `Unit_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`Order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,10,25,4.57),(2,9,85,2.65),(3,8,50,10.50),(4,7,105,3.75),(5,6,75,6.50),(6,5,48,3.75),(7,4,45,0.95),(8,3,150,4.50),(9,2,40,2.00),(10,1,50,1.50);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `Order_status_id` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'processed'),(2,'shipped'),(3,'delivered'),(4,'delayed'),(5,'cancelled');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Order_id` int NOT NULL,
  `Customer_id` int NOT NULL,
  `Order_date` date NOT NULL,
  `Status` int NOT NULL,
  `Comments` varchar(250) DEFAULT NULL,
  `Shipped_date` date DEFAULT NULL,
  `Shipper_id` int DEFAULT NULL,
  PRIMARY KEY (`Order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,10,'2022-08-23',1,'waiting to be shipped',NULL,NULL),(2,9,'2022-06-12',1,'shipped','2022-06-14',3),(3,8,'2022-07-05',2,'shipped','2022-07-10',4),(4,7,'2022-08-08',1,'shipped','2022-08-14',5),(5,6,'2022-08-25',2,'waiting to be shipped',NULL,NULL),(6,5,'2021-10-02',1,'shipped','2021-10-05',8),(7,4,'2022-04-18',1,'shipped','2022-04-22',10),(8,3,'2021-12-28',2,'shipped','2022-01-02',7),(9,2,'2022-09-02',1,'waiting to be shipped',NULL,NULL),(10,1,'2022-09-13',1,'waiting to be shipped',NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `Product_id` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Quantity_in_stock` int NOT NULL,
  `Unit_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`Product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Unisex Babygrow',50,1.50),(2,'Cotton Sleepsuits',40,2.00),(3,'Dinosaur Pyjamas',150,4.50),(4,'Pink Body Suits',45,0.95),(5,'Dribble Bibs',48,3.75),(6,'5 pack of Leggings',75,6.50),(7,'Grey Joggers',105,3.75),(8,'2 Tog Sleeping Bag',50,10.50),(9,'Printed Muslin Squares',85,2.65),(10,'Hooded Jacket',25,4.57),(11,'Dinosaur Joggers',32,1.45);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippers` (
  `Shipper_id` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Shipper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
INSERT INTO `shippers` VALUES (1,'KG Logistics'),(2,'Elite Shipping'),(3,'Transatlantic Shipping'),(4,'Narrow Shipping LTD'),(5,'DHL Express'),(6,'Express Cargo UK'),(7,'Federal Express'),(8,'Freightlink Logistics');
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_orders`
--

DROP TABLE IF EXISTS `vw_orders`;
/*!50001 DROP VIEW IF EXISTS `vw_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_orders` AS SELECT 
 1 AS `order_id`,
 1 AS `customer_id`,
 1 AS `order_date`,
 1 AS `status`,
 1 AS `comments`,
 1 AS `shipped_date`,
 1 AS `shipper_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `order_status_id`,
 1 AS `quantity`,
 1 AS `unit_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'baby_shop'
--

--
-- Final view structure for view `vw_orders`
--

/*!50001 DROP VIEW IF EXISTS `vw_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_orders` AS select `o`.`Order_id` AS `order_id`,`c`.`Customer_id` AS `customer_id`,`o`.`Order_date` AS `order_date`,`o`.`Status` AS `status`,`o`.`Comments` AS `comments`,`o`.`Shipped_date` AS `shipped_date`,`o`.`Shipper_id` AS `shipper_id`,`c`.`First_name` AS `first_name`,`c`.`Last_name` AS `last_name`,`os`.`Order_status_id` AS `order_status_id`,`oi`.`Quantity` AS `quantity`,`oi`.`Unit_price` AS `unit_price` from (((`orders` `o` join `customers` `c` on((`o`.`Customer_id` = `c`.`Customer_id`))) join `order_status` `os` on((`o`.`Status` = `os`.`Order_status_id`))) join `order_items` `oi` on((`o`.`Order_id` = `oi`.`Order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-06 18:25:51
