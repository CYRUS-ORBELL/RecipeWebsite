-- MySQL dump 10.13  Distrib 9.6.0, for macos26.2 (arm64)
--
-- Host: localhost    Database: RecipeWebsite
-- ------------------------------------------------------
-- Server version 9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '9fd0b998-0d47-11f1-b4de-06cae51bd5dd:1-113';

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fact` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (8,'Ground Beef','Ground beef in the United States may contain a meat-based product used as a food additive produced using technology known as advanced meat recovery systems or alternatively by using the slime system.'),(9,'Rice','rice was first domesticated in China 9,000 years ago'),(10,'Chicken Breast','Chicken Breast is white meat and relatively dry'),(11,'Steak','Beef steak can be cooked to levels including very rare (bleu, with a cold raw center), rare, medium rare, medium, medium well, or well done.'),(12,'Pinto Beans','Pinto beans are the most widely produced bean in Northern Mexico and are commonly used in refried beans and burritos.'),(13,'Kidney Beans','Raw red kidney beans contain relatively high levels of phytohemagglutinin, making them more toxic than most other bean varieties if not properly cooked.'),(14,'Black Beans','Black beans have a dense, meaty texture, which makes them popular in vegetarian dishes.'),(15,'Tofu','Tofu originated in China and has been consumed for over 2,000 years.'),(16,'Carrots','A myth that carrots help people see in the dark was spread as propaganda during the Second World War.'),(17,'Onion','Onions have been cultivated for over 5,000 years and were highly valued in ancient Egypt.'),(18,'Onion','Onions have been cultivated for over 5,000 years and were highly valued in ancient Egypt.'),(19,'Soy Sauce','Soy sauce originated in China over 2,000 years ago and is produced through the fermentation of soybeans, wheat, salt, and water.'),(20,'Salt','Salt has been used for thousands of years as both a seasoning and a preservative, and was once so valuable it was used as currency in parts of the world.'),(21,'Cumin','Cumin is a spice native to the Mediterranean and South Asia and is widely used in Mexican, Indian, and Middle Eastern cuisines.'),(22,'Garlic','Garlic has been used for both culinary and medicinal purposes for thousands of years and is known for its strong aroma and flavor.'),(23,'Tortillas','Tortillas originated in Mesoamerica and were traditionally made from maize; flour tortillas became common later in northern Mexico.'),(24,'Butter','Butter is a dairy product made by churning cream to separate the butterfat from the buttermilk and has been used in cooking for thousands of years.'),(25,'Tomato','Tomatoes originated in western South America and were introduced to Europe in the 16th century following Spanish exploration.'),(26,'Bell Pepper','Bell peppers are rich in vitamin C and were domesticated in Central and South America over 6,000 years ago.'),(27,'Chili Powder','Chili powder is typically a blend of ground dried chilies and spices such as cumin and garlic powder.'),(28,'Paprika','Paprika is made from dried and ground peppers and can range from sweet to hot depending on the variety.'),(29,'Oregano','Oregano is a Mediterranean herb commonly used in Italian, Mexican, and Greek cuisine.'),(30,'Basil','Basil is a fragrant herb widely used in Italian cooking and is a key ingredient in pesto.'),(31,'Lime','Limes are high in vitamin C and are commonly used to add acidity and brightness to dishes.'),(32,'Bell Pepper','Bell peppers are rich in vitamin C and were domesticated in Central and South America over 6,000 years ago.'),(33,'Chili Powder','Chili powder is typically a blend of ground dried chilies and spices such as cumin and garlic powder.'),(34,'Paprika','Paprika is made from dried and ground peppers and can range from sweet to hot depending on the variety.'),(35,'Oregano','Oregano is a Mediterranean herb commonly used in Italian, Mexican, and Greek cuisine.'),(36,'Basil','Basil is a fragrant herb widely used in Italian cooking and is a key ingredient in pesto.'),(37,'Lime','Limes are high in vitamin C and are commonly used to add acidity and brightness to dishes.'),(38,'Bell Pepper','Bell peppers are rich in vitamin C and were domesticated in Central and South America over 6,000 years ago.'),(39,'Chili Powder','Chili powder is typically a blend of ground dried chilies and spices such as cumin and garlic powder.'),(40,'Paprika','Paprika is made from dried and ground peppers and can range from sweet to hot depending on the variety.'),(41,'Oregano','Oregano is a Mediterranean herb commonly used in Italian, Mexican, and Greek cuisine.'),(42,'Basil','Basil is a fragrant herb widely used in Italian cooking and is a key ingredient in pesto.'),(43,'Lime','Limes are high in vitamin C and are commonly used to add acidity and brightness to dishes.'),(44,'Tomato','A red juicy fruit.'),(45,'Chicken','Poultry used in many dishes.'),(46,'Salt','Common seasoning.');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients` (
  `recipe_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`,`ingredient_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (31,8,'1/2 Pound'),(31,18,'2oz Diced'),(31,21,'1 teaspoon'),(31,23,'4'),(31,38,'2oz DIced'),(31,39,'1 teaspoon'),(32,10,'1'),(32,17,'sprinkle'),(32,21,'sprinkle'),(32,22,'1/4 clove'),(32,33,'sprinkle'),(32,37,'one slice'),(33,14,''),(33,23,''),(34,15,''),(34,19,''),(34,21,''),(34,22,'');
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `instructions` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (31,'Beef Burritos','Beef','Cook the beef with all the spices and vegetables and then wrap in a tortilla','2026-03-03 04:32:57'),(32,'Chicken Burrito','Chicken','Shred the chicken and cook with the spices and onion and garlic. Add lime juice on top','2026-03-03 04:35:21'),(33,'Bean Burrito','Beans','Add Black Beans to a tortillas, this one is pretty lame so dont make it ','2026-03-03 04:36:23'),(34,'TOFU WITH RANDOM STUFF','Other','Add the tofu to a pan with oil and cook until brown on the outside. Add bellpepers and spices. and use soy sauce too if you wnat','2026-03-03 04:38:10'),(35,'Tomato Soup','Other','Blend tomatoes and cook.','2026-03-03 05:06:07'),(36,'Grilled Chicken','Chicken','Season and grill the chicken.','2026-03-03 05:06:07');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
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

-- Dump completed on 2026-03-02 23:56:39