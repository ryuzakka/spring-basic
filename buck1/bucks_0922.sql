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
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `content` varchar(200) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `writeday` date DEFAULT NULL,
  `viewcnt` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (1,3,'이벤트 1 (수정)','event25.jpg','event2_con5.jpg','2022-09-13','2022-09-19','2022-09-15',11),(2,1,'이벤트 2','event21.jpg','event2_con1.jpg','2022-09-19','2022-09-30','2022-09-13',0),(4,2,'테스트 1','event11.jpg','event1_con1.jpg','2022-09-14','2022-09-16','2022-09-15',0),(5,3,'테스트 2','event26.jpg','event2_con6.jpg','2022-09-14','2022-09-16','2022-09-15',1),(6,0,'테스트 3','event3.jpg','event3_con.jpg','2022-09-14','2022-09-16','2022-09-15',0),(7,1,'테스트 4','event12.jpg','event1_con2.jpg','2022-09-14','2022-09-16','2022-09-15',3);
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT 0,
  `userid` varchar(20) DEFAULT NULL,
  `code` char(8) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `prod_cost` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `orderday` date DEFAULT NULL,
  `ordertime` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,9,'hong','01010123',1,5000,5000,NULL,'2022-08-03',NULL,NULL),(2,9,'hong','01040122',1,6300,6300,NULL,'2022-08-03',NULL,NULL),(3,1,'spider','01060112',2,4500,9000,NULL,'2022-08-03','2022-08-04',NULL),(4,1,'spider','01060212',2,5700,11400,NULL,'2022-08-03','2022-08-04',NULL),(5,9,'spider','01010324',2,6500,13000,NULL,'2022-08-03',NULL,NULL),(6,9,'hong','01050123',2,6400,12800,NULL,'2022-08-03',NULL,NULL),(7,9,'hong','01010324',4,6500,26000,NULL,'2022-08-26',NULL,NULL),(8,9,'spider','01010113',1,5000,5000,NULL,'2022-08-26',NULL,NULL),(9,1,'spider','01010122',14,4500,63000,NULL,'2022-08-26','2022-09-21',NULL),(10,0,'star','01010122',20,4500,90000,NULL,'2022-08-26',NULL,NULL),(11,0,'star','01040122',10,6300,63000,NULL,'2022-08-30',NULL,NULL),(12,1,'hong','01010122',2,4500,9000,NULL,'2022-09-19','2022-09-21',NULL),(13,1,'spider','01040123',1,6800,6800,NULL,'2022-09-19','2022-09-21',NULL),(14,9,'hong','01010123',1,5000,5000,NULL,'2022-09-20',NULL,NULL),(15,1,'hong','01010323',1,6000,6000,NULL,'2022-09-20','2022-09-21',NULL),(16,1,'spider','01010123',1,5000,5000,NULL,'2022-09-21','2022-09-21',NULL),(17,1,'hong','01010323',1,6000,6000,NULL,'2022-09-21','2022-09-21',NULL),(18,1,'hong','01060211',1,5200,5200,NULL,'2022-09-21','2022-09-22','09:24:48'),(19,1,'hong','01040124',1,7300,7300,NULL,'2022-09-21','2022-09-22','09:24:48'),(20,1,'hong','01030123',1,6000,6000,NULL,'2022-09-22','2022-09-22','09:24:48'),(21,0,'hong','01010322',1,5500,5500,NULL,'2022-09-22',NULL,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_220802`
--

DROP TABLE IF EXISTS `cart_220802`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_220802` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT 0,
  `userid` varchar(20) DEFAULT NULL,
  `prod_code` char(100) DEFAULT NULL,
  `prod_unit` char(100) DEFAULT NULL,
  `total_unit` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `prod_size` char(100) DEFAULT NULL,
  `prod_cost` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_220802`
--

LOCK TABLES `cart_220802` WRITE;
/*!40000 ALTER TABLE `cart_220802` DISABLE KEYS */;
INSERT INTO `cart_220802` VALUES (1,0,'hong','아이스 카페 아메리카노','1',1,4500,NULL,'2022-08-02','2','4500'),(2,0,'hong','01010122','1',NULL,4500,NULL,'2022-08-03',NULL,'4500');
/*!40000 ALTER TABLE `cart_220802` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `nickname` char(10) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `star` int(11) DEFAULT 0,
  `level` int(11) DEFAULT 0,
  `state` int(11) DEFAULT 0,
  `writeday` date DEFAULT NULL,
  `sbcard` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin','123','관리자',NULL,NULL,NULL,NULL,0,0,0,'2022-08-01',0),(2,'starbucks','123','스타벅스','스타벅스','2022-01-01','01012341234','starbucks@starbucks.com',0,0,0,'2022-08-01',0),(3,'star','123','스타','스타','2022-08-01','01011112222','@',0,0,9,'2022-08-01',0),(4,'hong','123','홍길동','홍길동','1892-01-01','010','hong@kong.com',0,0,0,'2022-08-01',24000),(5,'spider','123','피터파커','스파이더맨','2000-12-30','10319948111','peter@avangers.com',0,0,0,'2022-08-01',105000),(6,'test1','123','테스터','이삭토스트','2020-02-21','01012344321','info@isaac',0,0,9,'2022-08-24',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

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
  `price` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `state` int(11) DEFAULT 1,
  `img` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'01','01','01010111','카페 아메리카노',1,1,4000,'2022-08-02',1,NULL),(2,'01','01','01010112','카페 아메리카노',1,2,4500,'2022-08-02',1,NULL),(4,'01','01','01010113','카페 아메리카노',1,3,5000,'2022-08-02',1,NULL),(5,'01','01','01010114','카페 아메리카노',1,4,5500,'2022-08-02',1,NULL),(6,'01','01','01010122','아이스 카페 아메리카노',2,2,4500,'2022-08-02',1,NULL),(7,'01','01','01010123','아이스 카페 아메리카노',2,3,5000,'2022-08-02',1,NULL),(8,'01','01','01010124','아이스 카페 아메리카노',2,4,5500,'2022-08-02',1,NULL),(9,'01','01','01010211','카페 라떼',1,1,4500,'2022-08-02',1,NULL),(10,'01','01','01010212','카페 라떼',1,2,5000,'2022-08-02',1,NULL),(11,'01','01','01010213','카페 라떼',1,3,5500,'2022-08-02',1,NULL),(12,'01','01','01010214','카페 라떼',1,4,6000,'2022-08-02',1,NULL),(13,'01','01','01010222','아이스 카페 라떼',2,2,5000,'2022-08-02',1,NULL),(14,'01','01','01010223','아이스 카페 라떼',2,3,5500,'2022-08-02',1,NULL),(15,'01','01','01010224','아이스 카페 라떼',2,4,6000,'2022-08-02',1,NULL),(16,'01','01','01010311','카페 모카',1,1,5000,'2022-08-02',1,NULL),(17,'01','01','01010312','카페 모카',1,2,5500,'2022-08-02',1,NULL),(18,'01','01','01010313','카페 모카',1,3,6000,'2022-08-02',1,NULL),(19,'01','01','01010314','카페 모카',1,4,6500,'2022-08-02',1,NULL),(20,'01','01','01010322','아이스 카페 모카',2,2,5500,'2022-08-02',1,NULL),(21,'01','01','01010323','아이스 카페 모카',2,3,6000,'2022-08-02',1,NULL),(22,'01','01','01010324','아이스 카페 모카',2,4,6500,'2022-08-02',1,NULL),(23,'01','02','01020122','콜드 브루',2,2,4900,'2022-08-02',1,NULL),(24,'01','02','01020123','콜드 브루',2,3,5400,'2022-08-02',1,NULL),(25,'01','02','01020124','콜드 브루',2,4,5900,'2022-08-02',1,NULL),(26,'01','03','01030122','에스프레소 프라푸치노',2,2,5500,'2022-08-02',1,NULL),(27,'01','03','01030123','에스프레소 프라푸치노',2,3,6000,'2022-08-02',1,NULL),(28,'01','03','01030124','에스프레소 프라푸치노',2,4,6500,'2022-08-02',1,NULL),(29,'01','04','01040122','딸기 딜라이트 요거트 블렌디드',2,2,6300,'2022-08-02',1,NULL),(30,'01','04','01040123','딸기 딜라이트 요거트 블렌디드',2,3,6800,'2022-08-02',1,NULL),(31,'01','04','01040124','딸기 딜라이트 요거트 블렌디드',2,4,7300,'2022-08-02',1,NULL),(32,'01','05','01050122','쿨 라임 피지오',2,2,5900,'2022-08-02',1,NULL),(33,'01','05','01050123','쿨 라임 피지오',2,3,6400,'2022-08-02',1,NULL),(34,'01','05','01050124','쿨 라임 피지오',2,4,6900,'2022-08-02',1,NULL),(35,'01','06','01060112','얼 그레이 티',1,2,4500,'2022-08-02',1,NULL),(36,'01','06','01060114','얼 그레이 티',1,4,5500,'2022-08-02',1,NULL),(37,'01','06','01060122','아이스 얼 그레이 티',2,2,4500,'2022-08-02',1,NULL),(38,'01','06','01060124','아이스 얼 그레이 티',2,4,5500,'2022-08-02',1,NULL),(39,'01','06','01060211','자몽 허니 블랙 티',1,1,5200,'2022-08-02',1,NULL),(40,'01','06','01060212','자몽 허니 블랙 티',1,2,5700,'2022-08-02',1,NULL),(41,'01','06','01060213','자몽 허니 블랙 티',1,3,6200,'2022-08-02',1,NULL),(42,'01','06','01060214','자몽 허니 블랙 티',1,4,6700,'2022-08-02',1,NULL),(43,'01','06','01060222','아이스 자몽 허니 블랙 티',2,2,5700,'2022-08-02',1,NULL),(44,'01','06','01060223','아이스 자몽 허니 블랙 티',2,3,6200,'2022-08-02',1,NULL),(45,'01','06','01060224','아이스 자몽 허니 블랙 티',2,4,6700,'2022-08-02',1,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_cate`
--

DROP TABLE IF EXISTS `menu_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate1` char(2) DEFAULT NULL,
  `cate2` char(2) DEFAULT NULL,
  `catename` varchar(100) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_cate`
--

LOCK TABLES `menu_cate` WRITE;
/*!40000 ALTER TABLE `menu_cate` DISABLE KEYS */;
INSERT INTO `menu_cate` VALUES (1,'01','01','에스프레소','2022-08-02'),(2,'01','02','콜드브루','2022-08-02'),(3,'01','03','프라푸치노','2022-08-02'),(4,'01','04','블렌디드','2022-08-02'),(5,'01','05','피지오','2022-08-02'),(6,'01','06','티(티바나)','2022-08-02');
/*!40000 ALTER TABLE `menu_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `viewcnt` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (2,1,'사과문','sorry.jfif','sorry_con1.jpg,sorry_con2.jpg,sorry_con3.jpg,sorry_con4.jpg,',1,'2022-09-13',8),(6,3,'죄송요','sorry.jfif','sorry_con4.jpg',0,'2022-09-13',4),(8,2,'쏘리요','sorry.jfif','sorry.jfif',0,'2022-09-13',11),(9,2,'사과함요','sorry.jfif','sorry_con1.jpg,sorry_con2.jpg,sorry_con3.jpg,sorry_con4.jpg,',0,'2022-09-13',12),(11,1,'서머 캐리백 대체 상품 신청 안내','서머캐리백대체상품신청.jpg','서머캐리백대체상품신청_1.jpg,',1,'2022-09-13',4),(12,1,'서머 캐리백 대체 상품 신청 안내 (수정)','서머캐리백대체상품신청2.jpg','서머캐리백대체상품신청_1.jpg,',1,'2022-09-13',15),(13,1,'test11','대화역.jpg','대화역.jpg,',0,'2022-09-13',1),(14,2,'test22','문촌사거리.jpg','문촌사거리.jpg,',0,'2022-09-13',0),(15,3,'test33','일산가구단지.jpg','일산가구단지.jpg,',0,'2022-09-13',0);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewcnt` int(11) DEFAULT 0,
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'시스템 개선 및 점검 안내 ','안녕하세요. 스타벅스 코리아입니다.\r\n\r\n보다 나은 서비스를 제공하고자 아래와 같이 시스템 서버 작업을 진행합니다.\r\n\r\n \r\n\r\n- 일자 및 시간: 2022년 7월 21일(목) 00시~05시(5시간)\r\n\r\n- 대상 서비스 : 홈페이지 / APP / Bixby / 삼성카드 스타벅스 오더 / 신한PayFAN 스타벅스오더 / 네이버 주문 / 스타벅스 현대카드 발급 서비스\r\n\r\n- 점검 내용: 시스템 서버 작업\r\n\r\n \r\n\r\n해당 점검 시간 중 웹/앱 및 외부 채널 서비스 이용이 제한되오니 양해 부탁드리겠습니다.\r\n\r\n감사합니다.',19,'2022-09-09');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` char(20) DEFAULT NULL,
  `userid` char(20) DEFAULT NULL,
  `prod_code` char(8) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `state` int(11) DEFAULT 1,
  `store_id` int(11) DEFAULT NULL,
  `writetime` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,'202208030001','hong','01010123',1,'2022-08-03',1,NULL,NULL),(2,'202208030002','hong','01040122',1,'2022-08-03',1,NULL,NULL),(3,'202208030003','hong','01010123',1,'2022-08-03',1,NULL,NULL),(4,'202208030003','hong','01040122',1,'2022-08-03',1,NULL,NULL),(5,'202208030003','hong','01050123',2,'2022-08-03',1,NULL,NULL),(6,'202208030004','spider','01060112',2,'2022-08-03',1,NULL,NULL),(7,'202208030004','spider','01060212',2,'2022-08-03',1,NULL,NULL),(8,'1','hong','01010122',2,'2022-09-21',1,10,'16:11:07'),(9,'1','hong','01010323',1,'2022-09-21',1,10,NULL),(10,'202209210001','spider','01010122',14,'2022-09-21',1,13,NULL),(11,'202209210001','spider','01040123',1,'2022-09-21',1,13,NULL),(12,'202209210002','spider','01010123',1,'2022-09-21',4,19,NULL),(13,'202209210003','hong','01010323',1,'2022-09-21',1,17,NULL),(14,'202209220001','hong','01060211',1,'2022-09-22',1,15,'09:24:48'),(15,'202209220001','hong','01040124',1,'2022-09-22',1,15,'09:24:48'),(16,'202209220001','hong','01030123',1,'2022-09-22',1,15,'09:24:48');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storename` char(20) DEFAULT NULL,
  `storeimg` char(50) DEFAULT NULL,
  `zip` char(6) DEFAULT NULL,
  `addr1` varchar(200) DEFAULT NULL,
  `addr2` varchar(200) DEFAULT NULL,
  `lat` char(20) DEFAULT NULL,
  `lng` char(20) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (2,'마두역',NULL,NULL,'경기 고양시 일산동구 중앙로 1191','장항동','37.652929566286','126.776700276323','2022-09-01',-1),(3,'일산백마',NULL,NULL,'경기 고양시 일산동구 일산로 237','마두동','37.6571164293343','126.788083476822','2022-09-01',-1),(4,'대화역',NULL,NULL,'경기 고양시 일산서구 중앙로 1559','대화동','37.675418007671','126.74820446417','2022-09-01',-1),(5,'문촌사거리',NULL,NULL,'경기 고양시 일산서구 중앙로 1470','주엽동','37.6724166539713','126.75757055587','2022-09-01',-1),(6,'주엽강선',NULL,NULL,'경기 고양시 일산서구 중앙로 1371','주엽동, 강선마을13단지아파트','37.6671243360506','126.765471646111','2022-09-01',-1),(7,'현대킨텍스',NULL,NULL,'경기 고양시 일산서구 호수로 817','대화동','37.6679852145335','126.751647571454','2022-09-01',-1),(8,'일산가로수길R',NULL,NULL,'경기 고양시 일산서구 주엽로 80','대화동','37.6660625103382','126.756435827812','2022-09-01',-1),(9,'일산주엽',NULL,NULL,'경기 고양시 일산서구 중앙로 1420','주엽동','37.6699153737834','126.762672380349','2022-09-01',-1),(10,'일산주엽','일산주엽.jpg',NULL,'경기 고양시 일산서구 중앙로 1420','주엽동','37.6699153737834','126.762672380349','2022-09-05',2),(11,'매장테스트1','일산주엽2.jpg',NULL,'서울 은평구 통일로83길 18','갈현동','37.6209053566644','126.918008719126','2022-09-01',-1),(12,'주엽강선','주엽강선.jpg',NULL,'경기 고양시 일산서구 중앙로 1371','주엽동','37.6671243360506','126.765471646111','2022-09-05',2),(13,'일산후곡','일산후곡.jpg',NULL,'경기 고양시 일산서구 일산로 541','일산동','37.6774295763602','126.767583493766','2022-09-05',2),(14,'일산탄현동','일산탄현동.jpg',NULL,'경기 고양시 일산서구 일현로 91','탄현동','37.6951944697371','126.764583098824','2022-09-08',2),(15,'문촌사거리','문촌사거리.jpg',NULL,'경기 고양시 일산서구 중앙로 1470','주엽동','37.6724166539713','126.75757055587','2022-09-08',2),(16,'현대킨텍스','현대킨텍스.jpg',NULL,'경기 고양시 일산서구 호수로 817','대화동','37.6679852145335','126.751647571454','2022-09-08',2),(17,'대화역','대화역.jpg',NULL,'경기 고양시 일산서구 중앙로 1559','대화동','37.675418007671','126.74820446417','2022-09-08',2),(18,'일산탄현제니스','일산탄현제니스.jpg',NULL,'경기 고양시 일산서구 일현로 97-11','일산 위브더제니스스퀘어1동147-151','37.6952127333096','126.76201157783','2022-09-08',2),(19,'킨텍스이마트','킨텍스이마트.jpg',NULL,'경기 고양시 일산서구 킨텍스로 171','대화동','37.6615831401235','126.744065435785','2022-09-08',2),(20,'일산덕이DT','일산덕이DT.jpg',NULL,'경기 고양시 일산서구 탄중로 106','덕이동','37.6919107497693','126.75697444563','2022-09-08',2),(21,'일산가구단지','일산가구단지.jpg',NULL,'경기 고양시 일산서구 하이파크2로 67','덕이동','37.6995607176941','126.756701146606','2022-09-08',2),(22,'일산가로수길R','일산가로수길R.jpg',NULL,'경기 고양시 일산서구 주엽로 80','대화동','37.6660625103382','126.756435827812','2022-09-08',2);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-23  0:00:18
