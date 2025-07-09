-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: job_portal
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `job_id` int DEFAULT NULL,
  `resume` text,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,1,1,'1751899724263-John_Resume.pdf','John','john.dev@example.com'),(2,1,4,'1752070803004-ALEX1.pdf','Alex','alex23@gmail.com');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `description` text,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Front-End Developer','CodeNova Technologies','Hyderabad, India','We are looking for a creative Frontend Developer to design and build beautiful, responsive web interfaces. You will work closely with designers and backend developers to deliver great user experiences. \r\n\r\nRequired Skills: HTML, CSS, JavaScript React.js or Vue.js Responsive design REST API integration Git & GitHub','1751899564523-codenova.png','2025-07-07 20:16:04'),(2,'Backend Developer','StackGrid Solutions','Hyderabad, India','We are looking for a passionate and skilled Backend Developer to join our team. As a backend developer, you will be responsible for building and maintaining the server-side logic of our applications. You will work closely with frontend developers and other team members to ensure seamless integration, performance, and reliability of our systems.\r\n\r\nYou should have a solid understanding of backend technologies, database systems, and RESTful APIs. The ideal candidate is self-motivated, writes clean code, and is eager to learn and grow in a fast-paced environment.\r\n\r\nRequired Skills:\r\nStrong knowledge of Node.js and Express.js\r\n\r\nExperience with MySQL or MongoDB databases\r\n\r\nFamiliarity with RESTful API development\r\n\r\nUnderstanding of authentication and security practices\r\n\r\nProficient in JavaScript (ES6+)\r\n\r\nBasic knowledge of deployment platforms like Heroku, Render, or AWS\r\n\r\nVersion control using Git and GitHub\r\n\r\nGood debugging and problem-solving skills\r\n\r\n','1751992366176-stackgrid.png','2025-07-08 16:32:46'),(3,'Full Stack Developer','CodeSphere Solutions','Chennai, India','We are hiring a Full Stack Developer to design, develop, and maintain both the frontend and backend of our web applications. You will be responsible for building responsive interfaces, integrating APIs, and managing databases. This role requires a strong understanding of both client-side and server-side development.\r\n\r\nRequired Skills:\r\n\r\nHTML, CSS, JavaScript, React.js, Node.js, Express.js, MySQL, REST API, Git, GitHub, Postman, basic authentication (JWT), responsive design, deployment knowledge (like Vercel or Render), problem-solving skills, debugging, and clean code practices.','1751992711324-codesphere.png','2025-07-08 16:38:31'),(4,'UI/UX Developer','PixelSoft Pvt. Ltd.','Bangalore','We are seeking a creative and detail-oriented UI/UX Developer to craft beautiful, user-friendly interfaces for our web applications. You will collaborate with developers and designers to turn ideas into clean, intuitive, and engaging digital experiences. Your work will directly impact the user journey and overall feel of our product.\r\n\r\nRequired Skills:\r\n\r\nFigma, Adobe XD, HTML, CSS, JavaScript, responsive design, wireframing, prototyping, user flow creation, design systems, accessibility standards, color theory, typography, attention to detail, and collaboration with frontend developers.','1751992824404-pixelcraft-studio.png','2025-07-08 16:40:24');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Karishma','ckarish01@gmail.com','$2b$10$8Cijzl07Ld9XIFa6ifz/se5dHnFsxxYrjAAods.BrIUAouwWxzm/W');
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

-- Dump completed on 2025-07-09 20:27:32
