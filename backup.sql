/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - fcb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fcb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fcb`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add booking',7,'add_booking'),
(26,'Can change booking',7,'change_booking'),
(27,'Can delete booking',7,'delete_booking'),
(28,'Can view booking',7,'view_booking'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add vendor',9,'add_vendor'),
(34,'Can change vendor',9,'change_vendor'),
(35,'Can delete vendor',9,'delete_vendor'),
(36,'Can view vendor',9,'view_vendor'),
(37,'Can add user',10,'add_user'),
(38,'Can change user',10,'change_user'),
(39,'Can delete user',10,'delete_user'),
(40,'Can view user',10,'view_user'),
(41,'Can add review',11,'add_review'),
(42,'Can change review',11,'change_review'),
(43,'Can delete review',11,'delete_review'),
(44,'Can view review',11,'view_review'),
(45,'Can add project',12,'add_project'),
(46,'Can change project',12,'change_project'),
(47,'Can delete project',12,'delete_project'),
(48,'Can view project',12,'view_project'),
(49,'Can add payment',13,'add_payment'),
(50,'Can change payment',13,'change_payment'),
(51,'Can delete payment',13,'delete_payment'),
(52,'Can view payment',13,'view_payment'),
(53,'Can add equipment',14,'add_equipment'),
(54,'Can change equipment',14,'change_equipment'),
(55,'Can delete equipment',14,'delete_equipment'),
(56,'Can view equipment',14,'view_equipment'),
(57,'Can add complaint',15,'add_complaint'),
(58,'Can change complaint',15,'change_complaint'),
(59,'Can delete complaint',15,'delete_complaint'),
(60,'Can view complaint',15,'view_complaint'),
(61,'Can add feedback',16,'add_feedback'),
(62,'Can change feedback',16,'change_feedback'),
(63,'Can delete feedback',16,'delete_feedback'),
(64,'Can view feedback',16,'view_feedback');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(2,'auth','permission'),
(3,'auth','group'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'fcb_app','booking'),
(8,'fcb_app','login'),
(9,'fcb_app','vendor'),
(10,'fcb_app','user'),
(11,'fcb_app','review'),
(12,'fcb_app','project'),
(13,'fcb_app','payment'),
(14,'fcb_app','equipment'),
(15,'fcb_app','complaint'),
(16,'fcb_app','feedback');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-03-05 06:18:49.130434'),
(2,'auth','0001_initial','2024-03-05 06:18:49.211498'),
(3,'admin','0001_initial','2024-03-05 06:18:49.286296'),
(4,'admin','0002_logentry_remove_auto_add','2024-03-05 06:18:49.302996'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-03-05 06:18:49.312130'),
(6,'contenttypes','0002_remove_content_type_name','2024-03-05 06:18:49.326719'),
(7,'auth','0002_alter_permission_name_max_length','2024-03-05 06:18:49.336336'),
(8,'auth','0003_alter_user_email_max_length','2024-03-05 06:18:49.346239'),
(9,'auth','0004_alter_user_username_opts','2024-03-05 06:18:49.350904'),
(10,'auth','0005_alter_user_last_login_null','2024-03-05 06:18:49.358275'),
(11,'auth','0006_require_contenttypes_0002','2024-03-05 06:18:49.361564'),
(12,'auth','0007_alter_validators_add_error_messages','2024-03-05 06:18:49.366095'),
(13,'auth','0008_alter_user_username_max_length','2024-03-05 06:18:49.375527'),
(14,'auth','0009_alter_user_last_name_max_length','2024-03-05 06:18:49.383176'),
(15,'auth','0010_alter_group_name_max_length','2024-03-05 06:18:49.392939'),
(16,'auth','0011_update_proxy_permissions','2024-03-05 06:18:49.397644'),
(17,'auth','0012_alter_user_first_name_max_length','2024-03-05 06:18:49.406023'),
(18,'fcb_app','0001_initial','2024-03-05 06:18:49.507900'),
(19,'sessions','0001_initial','2024-03-05 06:18:49.566260'),
(20,'fcb_app','0002_review_vendor','2024-03-05 06:30:12.341053'),
(21,'fcb_app','0003_auto_20240305_1339','2024-03-05 08:09:14.161449'),
(22,'fcb_app','0004_remove_complaint_status','2024-03-05 08:58:05.369754'),
(23,'fcb_app','0005_booking_date','2024-03-05 11:39:42.353172'),
(24,'fcb_app','0006_booking_amount','2024-03-05 12:07:00.649986'),
(25,'fcb_app','0007_auto_20240305_1805','2024-03-05 12:35:32.543119');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('s5a5w84rl8gm3qy5z398o7cnawmfec0j','eyJsb2dpbl9pZCI6MywidmlkIjoyfQ:1rhUBM:JgWD8Ey9gwk2QOmgVgGLyzL81VuaRbzE7UPLdYEa7oI','2024-03-19 12:46:08.773736');

/*Table structure for table `fcb_app_booking` */

DROP TABLE IF EXISTS `fcb_app_booking`;

CREATE TABLE `fcb_app_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_date` varchar(225) NOT NULL,
  `return_date` varchar(225) NOT NULL,
  `status` varchar(225) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(225) NOT NULL,
  `amount` varchar(225) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fcb_app_booking_equipment_id_87d9ebce` (`equipment_id`),
  KEY `fcb_app_booking_user_id_b8714f05` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `fcb_app_booking` */

insert  into `fcb_app_booking`(`booking_id`,`book_date`,`return_date`,`status`,`equipment_id`,`user_id`,`date`,`amount`) values 
(1,'12/12/12','12/12/12','pay',1,1,'1','1000'),
(3,'14/14/14','14/14/14','pending',1,2,'2024-03-05','pending');

/*Table structure for table `fcb_app_complaint` */

DROP TABLE IF EXISTS `fcb_app_complaint`;

CREATE TABLE `fcb_app_complaint` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint` varchar(225) NOT NULL,
  `reply` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `fcb_app_complaint_user_id_0cfe46dd` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `fcb_app_complaint` */

insert  into `fcb_app_complaint`(`complaint_id`,`complaint`,`reply`,`date`,`user_id`) values 
(1,'qqq','adafa','12/12/12',1),
(2,'chch','asdsadf','2024-03-05 15:14:35.191638',2);

/*Table structure for table `fcb_app_equipment` */

DROP TABLE IF EXISTS `fcb_app_equipment`;

CREATE TABLE `fcb_app_equipment` (
  `equipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  `price_per_day` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`equipment_id`),
  KEY `fcb_app_equipment_vendor_id_244e0622` (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `fcb_app_equipment` */

insert  into `fcb_app_equipment`(`equipment_id`,`name`,`description`,`price_per_day`,`date`,`vendor_id`) values 
(1,'crain','ghdewbhjcdbhjcdbhjcdwbhj','2000','',2);

/*Table structure for table `fcb_app_feedback` */

DROP TABLE IF EXISTS `fcb_app_feedback`;

CREATE TABLE `fcb_app_feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `fcb_app_feedback_user_id_80b78e22` (`user_id`),
  KEY `fcb_app_feedback_vendor_id_a04b6429` (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `fcb_app_feedback` */

insert  into `fcb_app_feedback`(`feedback_id`,`description`,`date`,`user_id`,`vendor_id`) values 
(1,'qqqq','12/12/12',1,2),
(2,'hdhdh','2024-03-05',2,2);

/*Table structure for table `fcb_app_login` */

DROP TABLE IF EXISTS `fcb_app_login`;

CREATE TABLE `fcb_app_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `usertype` varchar(225) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `fcb_app_login` */

insert  into `fcb_app_login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(3,'avm','avm','vendor'),
(4,'rono','rono','user');

/*Table structure for table `fcb_app_payment` */

DROP TABLE IF EXISTS `fcb_app_payment`;

CREATE TABLE `fcb_app_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `status` varchar(225) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fcb_app_payment_booking_id_35814304` (`booking_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `fcb_app_payment` */

/*Table structure for table `fcb_app_project` */

DROP TABLE IF EXISTS `fcb_app_project`;

CREATE TABLE `fcb_app_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  `duration` varchar(225) NOT NULL,
  `start_date` varchar(225) NOT NULL,
  `end_date` varchar(225) NOT NULL,
  `budget` varchar(225) NOT NULL,
  `equipment_requirement` varchar(225) NOT NULL,
  `posted_date` varchar(225) NOT NULL,
  `status` varchar(225) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `fcb_app_project_user_id_94d4eb98` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `fcb_app_project` */

insert  into `fcb_app_project`(`project_id`,`project_name`,`description`,`duration`,`start_date`,`end_date`,`budget`,`equipment_requirement`,`posted_date`,`status`,`user_id`) values 
(1,'qq','q','q','q','q','q','q','q','q',2),
(2,'Avatar','djjdjdjdjdjdjdjdj','2 months','12/12/12','12/12/12','200cr','ehdhbbdjxobveodhhdud','2024-03-05','pending',2);

/*Table structure for table `fcb_app_review` */

DROP TABLE IF EXISTS `fcb_app_review`;

CREATE TABLE `fcb_app_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(225) NOT NULL,
  `rate` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fcb_app_review_user_id_ec8e2570` (`user_id`),
  KEY `fcb_app_review_vendor_id_16871157` (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `fcb_app_review` */

insert  into `fcb_app_review`(`review_id`,`description`,`rate`,`date`,`user_id`,`vendor_id`) values 
(1,'qq','3','12/12/12',1,2),
(2,'hdjdjdjd','4','2024-03-05',2,2);

/*Table structure for table `fcb_app_user` */

DROP TABLE IF EXISTS `fcb_app_user`;

CREATE TABLE `fcb_app_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `pin` varchar(225) NOT NULL,
  `city` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fcb_app_user_login_id_a800ed47` (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `fcb_app_user` */

insert  into `fcb_app_user`(`user_id`,`name`,`phone`,`pin`,`city`,`email`,`login_id`) values 
(1,'ronald','1234567898','123456','thrissur','rono@gmail.com',1),
(2,'ronald','1478523698','680306','thalore','rono@gmail.com',4);

/*Table structure for table `fcb_app_vendor` */

DROP TABLE IF EXISTS `fcb_app_vendor`;

CREATE TABLE `fcb_app_vendor` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `license_num` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `pin` varchar(225) NOT NULL,
  `city` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`vendor_id`),
  KEY `fcb_app_vendor_login_id_be7a71ad` (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `fcb_app_vendor` */

insert  into `fcb_app_vendor`(`vendor_id`,`name`,`license_num`,`phone`,`pin`,`city`,`email`,`login_id`) values 
(2,'AVM','1234567898','7654321234','656798','Chennai','avm@gmail.com',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
