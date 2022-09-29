-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bucks
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate1` char(2) DEFAULT NULL,
  `cate2` char(2) DEFAULT NULL,
  `code` char(8) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `price` char(5) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `state` int(11) DEFAULT 1,
  `img` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'01','01','01010111','카페 아메리카노',1,1,'4000','2022-08-02',1,'카페 아메리카노.jpg'),(2,'01','01','01010112','카페 아메리카노',1,2,'4500','2022-08-02',1,'카페 아메리카노.jpg'),(4,'01','01','01010113','카페 아메리카노',1,3,'5000','2022-08-02',1,'카페 아메리카노.jpg'),(5,'01','01','01010114','카페 아메리카노',1,4,'5500','2022-08-02',1,'카페 아메리카노.jpg'),(6,'01','01','01010122','아이스 카페 아메리카노',2,2,'4500','2022-08-02',1,'아이스 카페 아메리카노.jpg'),(7,'01','01','01010123','아이스 카페 아메리카노',2,3,'5000','2022-08-02',1,'아이스 카페 아메리카노.jpg'),(8,'01','01','01010124','아이스 카페 아메리카노',2,4,'5500','2022-08-02',1,'아이스 카페 아메리카노.jpg'),(9,'01','01','01010211','카페 라떼',1,1,'4500','2022-08-02',1,'카페 라떼.jpg'),(10,'01','01','01010212','카페 라떼',1,2,'5000','2022-08-02',1,'카페 라떼.jpg'),(11,'01','01','01010213','카페 라떼',1,3,'5500','2022-08-02',1,'카페 라떼.jpg'),(12,'01','01','01010214','카페 라떼',1,4,'6000','2022-08-02',1,'카페 라떼.jpg'),(13,'01','01','01010222','아이스 카페 라떼',2,2,'5000','2022-08-02',1,'아이스 카페 라떼.jpg'),(14,'01','01','01010223','아이스 카페 라떼',2,3,'5500','2022-08-02',1,'아이스 카페 라떼.jpg'),(15,'01','01','01010224','아이스 카페 라떼',2,4,'6000','2022-08-02',1,'아이스 카페 라떼.jpg'),(16,'01','01','01010311','카페 모카',1,1,'5000','2022-08-02',1,'카페 모카.jpg'),(17,'01','01','01010312','카페 모카',1,2,'5500','2022-08-02',1,'카페 모카.jpg'),(18,'01','01','01010313','카페 모카',1,3,'6000','2022-08-02',1,'카페 모카.jpg'),(19,'01','01','01010314','카페 모카',1,4,'6500','2022-08-02',1,'카페 모카.jpg'),(20,'01','01','01010322','아이스 카페 모카',2,2,'5500','2022-08-02',1,'아이스 카페 모카.jpg'),(21,'01','01','01010323','아이스 카페 모카',2,3,'6000','2022-08-02',1,'아이스 카페 모카.jpg'),(22,'01','01','01010324','아이스 카페 모카',2,4,'6500','2022-08-02',1,'아이스 카페 모카.jpg'),(23,'01','02','01020122','콜드 브루',2,2,'4900','2022-08-02',1,'콜드 브루.jpg'),(24,'01','02','01020123','콜드 브루',2,3,'5400','2022-08-02',1,'콜드 브루.jpg'),(25,'01','02','01020124','콜드 브루',2,4,'5900','2022-08-02',1,'콜드 브루.jpg'),(26,'01','03','01030122','에스프레소 프라푸치노',2,2,'5500','2022-08-02',1,'에스프레소 프라푸치노.jpg'),(27,'01','03','01030123','에스프레소 프라푸치노',2,3,'6000','2022-08-02',1,'에스프레소 프라푸치노.jpg'),(28,'01','03','01030124','에스프레소 프라푸치노',2,4,'6500','2022-08-02',1,'에스프레소 프라푸치노.jpg'),(29,'01','04','01040122','딸기 딜라이트 요거트 블렌디드',2,2,'6300','2022-08-02',1,'딸기 딜라이트 요거트 블렌디드.jpg'),(30,'01','04','01040123','딸기 딜라이트 요거트 블렌디드',2,3,'6800','2022-08-02',1,'딸기 딜라이트 요거트 블렌디드.jpg'),(31,'01','04','01040124','딸기 딜라이트 요거트 블렌디드',2,4,'7300','2022-08-02',1,'딸기 딜라이트 요거트 블렌디드.jpg'),(32,'01','05','01050122','쿨 라임 피지오',2,2,'5900','2022-08-02',1,'쿨 라임 피지오.jpg'),(33,'01','05','01050123','쿨 라임 피지오',2,3,'6400','2022-08-02',1,'쿨 라임 피지오.jpg'),(34,'01','05','01050124','쿨 라임 피지오',2,4,'6900','2022-08-02',1,'쿨 라임 피지오.jpg'),(35,'01','06','01060112','얼 그레이 티',1,2,'4500','2022-08-02',1,'얼 그레이 티.jpg'),(36,'01','06','01060114','얼 그레이 티',1,4,'5500','2022-08-02',1,'얼 그레이 티.jpg'),(37,'01','06','01060122','아이스 얼 그레이 티',2,2,'4500','2022-08-02',1,'아이스 얼 그레이 티.jpg'),(38,'01','06','01060124','아이스 얼 그레이 티',2,4,'5500','2022-08-02',1,'아이스 얼 그레이 티.jpg'),(39,'01','06','01060211','자몽 허니 블랙 티',1,1,'5200','2022-08-02',1,'자몽 허니 블랙 티.jpg'),(40,'01','06','01060212','자몽 허니 블랙 티',1,2,'5700','2022-08-02',1,'자몽 허니 블랙 티.jpg'),(41,'01','06','01060213','자몽 허니 블랙 티',1,3,'6200','2022-08-02',1,'자몽 허니 블랙 티.jpg'),(42,'01','06','01060214','자몽 허니 블랙 티',1,4,'6700','2022-08-02',1,'자몽 허니 블랙 티.jpg'),(43,'01','06','01060222','아이스 자몽 허니 블랙 티',2,2,'5700','2022-08-02',1,'아이스 자몽 허니 블랙 티.jpg'),(44,'01','06','01060223','아이스 자몽 허니 블랙 티',2,3,'6200','2022-08-02',1,'아이스 자몽 허니 블랙 티.jpg'),(45,'01','06','01060224','아이스 자몽 허니 블랙 티',2,4,'6700','2022-08-02',1,'아이스 자몽 허니 블랙 티.jpg'),(56,'01','01','01010411','에스프레소 콘 파나',1,1,'4200','2022-09-29',1,'에스프레소 콘 파나13.jpg'),(57,'01','01','01010412','에스프레소 콘 파나',1,2,'4700','2022-09-29',1,'에스프레소 콘 파나13.jpg'),(59,'01','04','01040222','민트 초콜릿 칩 블렌디드',2,2,'6300','2022-09-29',1,'민크 초콜릿 칩 블렌디드2.jpg'),(60,'01','04','01040224','민트 초콜릿 칩 블렌디드',2,4,'7300','2022-09-29',1,'민크 초콜릿 칩 블렌디드2.jpg'),(61,'01','04','01040223','민트 초콜릿 칩 블렌디드',2,3,'6800','2022-09-29',1,'민크 초콜릿 칩 블렌디드2.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-30  0:20:09
