/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop`;

/*Table structure for table `collection` */

DROP TABLE IF EXISTS `collection`;

CREATE TABLE `collection` (
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`user_id`),
  KEY `collection_user` (`user_id`),
  CONSTRAINT `collection_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `collection_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collection` */

insert  into `collection`(`goods_id`,`user_id`) values (1,1),(2,1),(1,2),(1,3);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(300) DEFAULT NULL,
  `user_avatar` varchar(1000) DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_goods` (`goods_id`),
  KEY `comment_user_i` (`user_id`),
  CONSTRAINT `comment_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `comment_user_i` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`comment_id`,`goods_id`,`user_id`,`user_name`,`user_avatar`,`comment_content`) values (1,1,2,'蚂蚁子','avater2.jpg','空间都个按揭贷款及文件到我家卡大家都喊我回家哈德的的'),(2,2,2,'手机贷','avater3.jpg','说的就是看到开始的离开的看数据端口技术角度看世界第五我的空间'),(3,4,4,'蚂蚁子','avater4.jpg','是的咯三季度今晚就是大家还是还是刚刚据世界问候和韩国');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(300) DEFAULT NULL,
  `goods_price` double(8,2) DEFAULT NULL,
  `goods_img` varchar(1000) DEFAULT NULL,
  `goods_brand` varchar(300) DEFAULT NULL,
  `goods_stock` int(11) DEFAULT NULL,
  `goods_classify` int(11) DEFAULT NULL,
  `goods_details` varchar(500) DEFAULT NULL,
  `goods_specifications` int(11) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `goods_goodsClassify` (`goods_classify`),
  KEY `goods_specifications` (`goods_specifications`),
  CONSTRAINT `goods_goodsClassify` FOREIGN KEY (`goods_classify`) REFERENCES `goodsclassify` (`classify_id`),
  CONSTRAINT `goods_specifications` FOREIGN KEY (`goods_specifications`) REFERENCES `specifications` (`specifications_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`goods_id`,`goods_name`,`goods_price`,`goods_img`,`goods_brand`,`goods_stock`,`goods_classify`,`goods_details`,`goods_specifications`) values (1,'senma/秋季新款韩版潮流帅气棒球服',89.00,'clothes.jpg','森马',299,1,'没有详情',1),(2,'VDG夏季2019新品运动防晒',99.00,'clothes2.jpg','狄佳模',20,1,'没有详情',2),(3,'明星喷雾 活泉补水',69.00,'xxx.jpg','eau',21,2,'没有详情',3),(4,'华为P30 8GB+128GB全网通',3688.00,'phone.jpg','华为',6,5,'没有详情',4);

/*Table structure for table `goodsclassify` */

DROP TABLE IF EXISTS `goodsclassify`;

CREATE TABLE `goodsclassify` (
  `classify_id` int(11) NOT NULL AUTO_INCREMENT,
  `classify_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`classify_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `goodsclassify` */

insert  into `goodsclassify`(`classify_id`,`classify_name`) values (1,'服装'),(2,'美妆'),(3,'母婴'),(4,'家电'),(5,'数码');

/*Table structure for table `orderlist` */

DROP TABLE IF EXISTS `orderlist`;

CREATE TABLE `orderlist` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(300) DEFAULT NULL,
  `order_list` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_total` double(10,2) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_user` (`user_id`),
  CONSTRAINT `order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `orderlist` */

insert  into `orderlist`(`order_id`,`order_number`,`order_list`,`user_id`,`order_total`,`order_status`) values (1,'223502691362','1,2,8,12,52',3,555.90,'待付款'),(2,'124512256215','2,5,8,50,56',2,355.02,'待发货'),(3,'152251552155','5,565,66,82,92',1,10000.00,'待发货');

/*Table structure for table `specifications` */

DROP TABLE IF EXISTS `specifications`;

CREATE TABLE `specifications` (
  `specifications_id` int(11) NOT NULL AUTO_INCREMENT,
  `specifications_name` varchar(100) DEFAULT NULL,
  `specifications_values` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`specifications_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `specifications` */

insert  into `specifications`(`specifications_id`,`specifications_name`,`specifications_values`) values (1,'','L'),(2,'大小','S'),(3,'大小','M'),(4,'颜色','黄色'),(5,'颜色','绿色'),(6,'颜色','蓝色'),(7,'大小','L,M,S,SM,XL,XXL'),(8,'颜色','黄,绿,黄,白,灰,蓝'),(9,'鞋码','42,34,36,38,40');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(300) DEFAULT NULL,
  `user_avatar` varchar(1000) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `user_tel` varchar(30) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_level` varchar(20) DEFAULT NULL,
  `user_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_avatar`,`user_address`,`user_tel`,`user_email`,`user_level`,`user_status`) values (1,'张三','avatar1.jpg','重庆市沙坪坝区精英公寓','183235335','2425655@qq.com','白银','会员'),(2,'李四','avatar2.jpg','重庆市沙坪坝区足下','183235335','2425655@qq.com','白银','会员'),(3,'王五','avatar3.jpg','重庆市沙坪坝区足下','183235335','2425655@qq.com','钻石','会员'),(4,'陈六','avatar4.jpg','重庆市沙坪坝区足下','183235335','2425655@qq.com','白银','非会员');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
