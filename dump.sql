-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mymath
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `required_time` int NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,'Just Getting Started',3600,'You have studied for 1 hour!'),(2,'Real Beginner',36000,'You have studied for 10 hours!'),(3,'Rookie Learner',360000,'You have studied for 100 hours!'),(4,'Novice Learner',1800000,'You have studied for 500 hours!'),(5,'1000 is Just Another Number',3600000,'You have studied for 1000 hours!'),(6,'Advanced Learner',18000000,'You have studied for 5000 hours!'),(7,'Never Gave Up!',36000000,'You have studied for 10000 hours!'),(8,'Expert',36000000,'Ultimate achievement unlocked!');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Math Basics','mathbasics.png'),(2,'Geometry','geometry.png'),(3,'Algebra 1','algebra1.png'),(4,'Algebra 2','algebra2.png'),(5,'Precalculus','precalculas.png'),(6,'Trigonometry','triganometry.png'),(7,'Calculus 1','calculas1.png'),(8,'Calculus 2','calculas2.png'),(9,'Calculus 3','calculas3.png'),(10,'Discrete Mathematics','discretemathematics.png'),(11,'Differential EQ','differentialeq.png'),(12,'Statistics','statistics.png');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_achievements`
--

DROP TABLE IF EXISTS `user_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_achievements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `achievement` varchar(255) DEFAULT NULL,
  `unlocked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_achievements_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_achievements`
--

LOCK TABLES `user_achievements` WRITE;
/*!40000 ALTER TABLE `user_achievements` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_chats`
--

DROP TABLE IF EXISTS `user_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_chats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role` enum('user','ai') NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_chats_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_chats`
--

LOCK TABLES `user_chats` WRITE;
/*!40000 ALTER TABLE `user_chats` DISABLE KEYS */;
INSERT INTO `user_chats` VALUES (207,15,'user','hello','2025-05-21 21:46:33'),(208,15,'ai','Hello! How can I assist you with Math Basics today?','2025-05-21 21:46:33'),(209,15,'user','give me some practice problems!','2025-05-21 21:46:55'),(210,15,'ai','Sure! Here are some practice problems covering various math basics topics suitable for kindergarten to grade 5:\n\n### Addition and Subtraction\n1. What is 35 + 27?\n2. Subtract: 48 - 19 = ?\n3. If you have 15 apples and give away 7, how many apples do you have left?\n\n### Multiplication and Division\n4. What is 6 × 4?\n5. Divide: 36 ÷ 6 = ?\n6. If there are 4 groups of 5 candies, how many candies are there in total?\n\n### Place Value\n7. What is the value of the digit 7 in the number 572?\n8. Write the number 345 in expanded form.\n\n### Fractions\n9. What fraction of a pizza is left if 2 out of 8 slices have been eaten?\n10. Simplify the fraction 6/9.\n\n### Word Problems\n11. Sarah has 3 packs of stickers. Each pack contains 12 stickers. How many stickers does she have in total?\n12. If a book costs $15 and you have $50, how much money will you have left after buying the book?\n\nFeel free to ask for step-by-step solutions for any of these problems!','2025-05-21 21:46:55'),(211,15,'user','can I get a step by step breakdown of 36 / 6','2025-05-21 21:47:56'),(212,15,'ai','Sure! Let\'s break down the division of \\(36 \\div 6\\) step by step.\n\n### Step 1: Understand the Division\nDivision is the process of determining how many times one number (the divisor) can fit into another number (the dividend). In this case:\n- **Dividend**: 36 (the number we are dividing)\n- **Divisor**: 6 (the number we are dividing by)\n\n### Step 2: Set Up the Problem\nYou can set it up as:\n\\[ 36 \\div 6 \\]\n\n### Step 3: Think About the Multiplication\nTo find \\(36 \\div 6\\), you can think about it in terms of multiplication. You\'re looking for a number (let\'s call it \\(x\\)) such that:\n\\[ 6 \\times x = 36 \\]\n\n### Step 4: Find the Missing Number\nNow, think about the multiples of 6:\n- \\(6 \\times 1 = 6\\)\n- \\(6 \\times 2 = 12\\)\n- \\(6 \\times 3 = 18\\)\n- \\(6 \\times 4 = 24\\)\n- \\(6 \\times 5 = 30\\)\n- \\(6 \\times 6 = 36\\)\n\nYou can see that:\n\\[ 6 \\times 6 = 36 \\]\n\n### Step 5: Solve for x\nSince \\(6 \\times 6 = 36\\), we find that:\n\\[ x = 6 \\]\n\n### Step 6: Conclusion\nThus, \\(36 \\div 6 = 6\\).\n\n### Final Answer\nSo, the result of \\(36 \\div 6\\) is \\(6\\).','2025-05-21 21:47:56');
/*!40000 ALTER TABLE `user_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_courses`
--

DROP TABLE IF EXISTS `user_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_courses` (
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `user_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_courses`
--

LOCK TABLES `user_courses` WRITE;
/*!40000 ALTER TABLE `user_courses` DISABLE KEYS */;
INSERT INTO `user_courses` VALUES (15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7),(15,8);
/*!40000 ALTER TABLE `user_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `session_start` datetime DEFAULT NULL,
  `session_end` datetime DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_image` varchar(255) DEFAULT NULL,
  `total_time_spent` int DEFAULT '0',
  `last_login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Danielle Aguon','testuserupdateyes@domain.com','$2b$10$YRyLQ7nJafxo.n7gCDYche3FxRRgzU/WV6E.Z.lFbq67WgSYKgAWC','2025-04-23 22:45:05',NULL,0,NULL),(6,'Danny','baileymashore2@gmail.com','$2b$10$xlGrEAH87VwowT49SwaWaOSPg8SRBXdg5YL1z8asnSo14QQC6rlNu','2025-04-25 21:03:13',NULL,0,NULL),(7,'danny','baileymashore1@gmail.com','$2b$10$CoSZF7kb8SAUzbrjbt/kZeFR0wu9LYM10561QNVe20/GhVaSUylcy','2025-04-25 21:10:24',NULL,0,NULL),(8,'bailey','baileymashore0@gmail.com','$2b$10$wRK8hUFIV4GGqhGoN4Rxr.aUE005hiTOsehcfkD3H7XajE2SQZBTu','2025-04-25 21:37:22',NULL,0,NULL),(9,'','','$2b$10$bfQ/wGzobmcZH/VX14/gLOwPdqYAzvW1niTWFdR6UkplAL2n9.4L2','2025-04-26 21:35:15',NULL,0,NULL),(10,'bailey','baileymashore27@gmail.com','$2b$10$HNCaTYqIzeqipGamqP5jrOTvZNIVKJRJ/hWImpTnfWc53rOL2f0YS','2025-04-27 17:52:48',NULL,0,NULL),(11,'bailey','baileymashore28@gmail.com','$2b$10$nHDoYZ80T9rtcFPW8s6Y9Otzg92ovBp27fgcE89md6Fw7NE3zFSy2','2025-04-27 17:55:31',NULL,0,NULL),(12,'Bailey','baileymashore99@gmail.com','$2b$10$9cjccxyu41c0dSeSaFW0Ke/gtd5X3OfYSUdCSkqECAjnvJrTvDx8m','2025-04-28 21:57:53',NULL,0,NULL),(13,'bailey','baileymashore70@gmail.com','$2b$10$V3OoCRGZ1LiBWmxFrE5pXusXUG.HVpZ9FtRXUx7TQZ7hgA6BZMBhi','2025-04-29 21:37:56',NULL,0,NULL),(15,'Bailey Mashore','baileymashore13@gmail.com','$2b$10$a6nPt6z1nHdY3c4YkQF3P.gzds8JshGvIzcCO0qPdf8M0fxOa1Y2.','2025-05-04 18:41:27','/uploads/profile/15.png',167409,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-22 17:17:36
