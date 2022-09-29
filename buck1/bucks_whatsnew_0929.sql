-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bucks
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (8,0,'만원당 별 적립 이벤트','WEB_THUM_20211231080741168.jpg','wn_10000wonstar_220524.jpg','2022-01-01','2022-12-31','2022-09-27',0),(9,0,'온라인 스토어 별 2배 적립 혜택','WEB_THUM_20220630082548567.jpg','wn_Giftstar2_web_220920.jpg','2022-07-01','2022-12-31','2022-09-27',0),(10,0,'9월 e-Gift Item 보너스 스타','WEB_THUM_20220831080700403.jpg','wn_9_egiftitem_220829_web.jpg','2022-09-01','2022-09-30','2022-09-27',1),(11,0,'스타벅스 현대카드 9월 한정 혜택','WEB_THUM_20220914111141607.jpg','PlccEvent_20220901_01.jpg','2022-09-01','2022-09-30','2022-09-27',0),(12,0,'S.I.VILLAGE 제휴 프로모션','WEB_THUM_20220830100520706.jpg','wn_SIVILLAGE_detail_01_220826.jpg','2022-09-01','2022-10-31','2022-09-27',1),(14,0,'오트 밀크 커스텀 런칭 1주년 이벤트','WEB_THUM_20220901084718438.jpg','wn_oatmilkevent_220901.jpg','2022-09-02','2022-10-10','2022-09-27',1),(15,0,'Autumn 프로모션','WEB_THUM_20220901080312150.jpg','wn_Autumnpro_220829_01.jpg','2022-09-02','2022-10-10','2022-09-27',2),(16,0,'AUTUMN BARISTA FAVORITES','WEB_THUM_20220901091855499.jpg','wn_AUTUMN_BARISTA_FAVORITES_20220901.jpg','2022-09-02','2022-10-10','2022-09-27',2);
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (2,1,'사과문','sorry.jfif','sorry_con1.jpg,sorry_con2.jpg,sorry_con3.jpg,sorry_con4.jpg,',1,'2022-09-13',11),(17,2,'서머 캐리백 택배 수거 접수 종료','A0wUXa_WEB_THUM_20220922131644803.jpg','wn_carryDeli_220922.jpg,',1,'2022-09-27',0),(18,1,'서머 캐리백 자발적 리콜 안내','t9k5nY_WEB_THUM_20220927130618950.jpg','wn_bagrecall_220811_02.jpg,',1,'2022-09-27',0),(19,3,'[참여종료] 9월 스타벅스 일회용컵 없는 날 캠페인','bdbPSh_WEB_THUM_20220908092432955.jpg','wn_nocup9_220908.jpg,',0,'2022-09-27',2),(20,1,'9월 20일, 2022 하반기 제주 특화 음료/푸드 출시','DKmAqT_WEB_THUM_20220919082226798.jpg','wn_jeju_winter_web_1_220913.jpg,wn_jeju_winter_web_2_220913.jpg,wn_jeju_winter_web_3_220913.jpg,wn_jeju_winter_web_4_220913.jpg,',0,'2022-09-27',1),(21,1,'9월 27일, 티바나 동절기 특화 음료 3종 출시','JiZCTj_WEB_THUM_20220926080631976.jpg','wn_teavana_20220920.jpg,',0,'2022-09-27',1),(22,1,'시그니처 더 블랙 콜드브루를 매장에서 주문하고 받아보세요.','LHXppU_WEB_THUM_20220926083649534.jpg','wn_signature_the_black_220926.jpg,',0,'2022-09-27',1),(23,1,'9월 27일, 클렌즈 주스 음료 3종 출시 ','LHXppU_WEB_THUM_20220926090320690.jpg','wn_juice_cleanse_2209212.jpg,',0,'2022-09-27',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'시스템 개선 및 점검 안내 ','안녕하세요. 스타벅스 코리아입니다.\r\n\r\n보다 나은 서비스를 제공하고자 아래와 같이 시스템 서버 작업을 진행합니다.\r\n\r\n \r\n\r\n- 일자 및 시간: 2022년 7월 21일(목) 00시~05시(5시간)\r\n\r\n- 대상 서비스 : 홈페이지 / APP / Bixby / 삼성카드 스타벅스 오더 / 신한PayFAN 스타벅스오더 / 네이버 주문 / 스타벅스 현대카드 발급 서비스\r\n\r\n- 점검 내용: 시스템 서버 작업\r\n\r\n \r\n\r\n해당 점검 시간 중 웹/앱 및 외부 채널 서비스 이용이 제한되오니 양해 부탁드리겠습니다.\r\n\r\n감사합니다.',20,'2022-09-09'),(4,'시스템 개선 및 서비스 점검 안내','안녕하세요. 스타벅스 코리아입니다.\r\n보다 나은 서비스를 제공하고자 아래와 같이 서비스 업데이트 및 점검 작업을 진행합니다.\r\n \r\n- 일자 및 시간 : 2022년 9월 22일(목) 00시 00분 ~ 9월 22일(목) 08시 00분\r\n- 대상 서비스 : Gift 배송하기 서비스 전체\r\n \r\n해당 점검 시간 중 Gift 배송하기 서비스의 이용이 일시 중단되는 점 양해 부탁드립니다.\r\n감사합니다.',0,'2022-09-27'),(5,'고객의 소리 답변 운영 기준 변경 안내','안녕하세요, 스타벅스 커피 코리아입니다.\r\n\r\n당사에서 운영하는 “고객의 소리”의 답변 운영 기준이 아래와 같이 변경될 예정임을 안내 드립니다.\r\n\r\n \r\n\r\n- 시행일 : 2022년 9월 22일(목)\r\n\r\n- 변경내용 : 고객의 소리 문의 시, 이메일 답변 중지\r\n\r\n- 답변 확인 방법 : 답변 완료 시, APP PUSH 알림\r\n\r\n                 (APP) 스타벅스 앱 > Other > 고객지원 > 고객의 소리 > 나의 고객의 소리\r\n\r\n                 (WEB) 스타벅스 홈페이지 > Sign in > My Starbucks > My 고객의 소리\r\n\r\n \r\n\r\n보다 나은 서비스를 제공해 드리고자 노력하겠습니다.\r\n\r\n감사합니다.',1,'2022-09-27'),(6,'추석 연휴 스타벅스 딜리버스 운영 안내 ','안녕하세요. 스타벅스 코리아입니다.\r\n\r\n\r\n추석 연휴 기간 동안 스타벅스 딜리버스 서비스 운영 시간이 변경되오니 이용 시 참고해 주시기 바랍니다.\r\n\r\n\r\n추석 연휴 기간(9/09 - 9/12) 중 딜리버스 운영 여부 및 운영 시간은 매장에 따라 상이할 수 있어 아래 메뉴에서 확인해 주시기 바랍니다.\r\n\r\n\r\n(스타벅스 APP > Other > 매장정보 메뉴에서 \'딜리버스\' 옵션 선택 후 확인 가능)\r\n\r\n\r\n스타벅스와 함께 즐거운 추석 연휴 보내시기 바랍니다.\r\n\r\n감사합니다.',1,'2022-09-27'),(7,'신세계 기프트 카드 등 결제 제휴 종료 안내','안녕하세요. 스타벅스 코리아입니다.\r\n\r\n \r\n\r\n아래의 결제 제휴 종료로 인하여 하기와 같은 일정으로 서비스를 종료합니다.\r\n\r\n신세계 기프트 카드\r\n직불 카드(IC 카드 제외)\r\n신세계 모바일 상품권(MMS)\r\n\r\n\r\n□ 종료 예정일\r\n\r\n - 2022년 10월 5일 (22년 10월 4일까지 정상 서비스 예정)\r\n\r\n \r\n\r\n스타벅스 코리아는 앞으로도 더욱 편리한 서비스를 제공하기 위해 노력하겠습니다.\r\n\r\n\r\n\r\n감사합니다.',1,'2022-09-27');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-30  0:36:51
