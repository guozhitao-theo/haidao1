/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - newshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`newshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `newshop`;

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `class_id` varchar(10) NOT NULL,
  `class_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `class` */

insert  into `class`(`class_id`,`class_name`) values ('01','家居'),('0101','沙发'),('0102','茶几'),('02','数码'),('0201','手机'),('020101','华为手机'),('02010101','华为P30手机'),('03','服装');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `detail` longtext,
  `spu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_foreign` (`class`),
  CONSTRAINT `class_foreign` FOREIGN KEY (`class`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`title`,`price`,`img`,`brand`,`stock`,`class`,`detail`,`spu`) values (1,'senma/秋季新款韩版潮流帅气棒球服',89.00,'clothes.jpg','森马',299,'03','没有详情',1),(2,'VDG夏季2019新品运动防晒',99.00,'clothes2.jpg','狄佳模',20,'01','没有详情',2),(3,'明星喷雾 活泉补水',69.00,'xxx.jpg','eau',21,'03','没有详情',3),(4,'华为P30 8GB+128GB全网通',3688.00,'phone.jpg','华为',6,'02','没有详情',4);

/*Table structure for table `spu` */

DROP TABLE IF EXISTS `spu`;

CREATE TABLE `spu` (
  `spu_id` int(11) NOT NULL AUTO_INCREMENT,
  `spu_name` varchar(20) DEFAULT NULL,
  `spu_class` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`spu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `spu` */

insert  into `spu`(`spu_id`,`spu_name`,`spu_class`) values (1,'颜色','蓝,红,白,绿,紫'),(2,'尺寸','M,S,L,XL,XXL'),(4,'鞋码','34,36,38,40,42');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
