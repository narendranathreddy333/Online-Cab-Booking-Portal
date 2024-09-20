/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.0.67-community-nt : Database - cab
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`cab` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cab`;

/*Table structure for table `addcab` */

DROP TABLE IF EXISTS `addcab`;

CREATE TABLE `addcab` (
  `cspname` varchar(50) default NULL,
  `cspemail` varchar(50) default NULL,
  `vehtype` varchar(50) default NULL,
  `vehname` varchar(50) default NULL,
  `vehnum` varchar(50) default NULL,
  `vehmodel` varchar(50) default NULL,
  `capacity` varchar(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `addcab` */

insert  into `addcab`(`cspname`,`cspemail`,`vehtype`,`vehname`,`vehnum`,`vehmodel`,`capacity`) values ('adithya','adhi@gmail.com','CarEconomy','Maruthi Suzuki Arena','123456789','Maruti','6'),('harish','harish@gmail.com','Bike','Yamaha','456','YZF','2');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`) values ('Natasha','natasha');

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `booking_id` int(50) NOT NULL auto_increment,
  `csp_name` varchar(50) default NULL,
  `vname` varchar(50) default NULL,
  `uname` varchar(50) default NULL,
  `time` datetime default NULL,
  `fare` varchar(5) default NULL,
  `status` varchar(50) default NULL,
  `pickup` varchar(50) default NULL,
  `destination` varchar(50) default NULL,
  PRIMARY KEY  (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `booking` */

insert  into `booking`(`booking_id`,`csp_name`,`vname`,`uname`,`time`,`fare`,`status`,`pickup`,`destination`) values (4,'adithya','Maruthi Suzuki Arena','swarna','2020-07-28 15:34:55','0','Rejected',NULL,NULL),(5,'harish','Yamaha','swarna','2020-07-28 18:02:27','500','Confirmed',NULL,NULL),(6,'adithya','Maruthi Suzuki Arena','swarna','2020-07-29 11:40:27','0','Rejected',NULL,NULL),(7,'adithya','Maruthi Suzuki Arena','swarna','2020-07-29 12:10:01','0','Cancelled',NULL,NULL),(8,'adithya','Maruthi Suzuki Arena','null','2020-07-30 17:11:32','0','Rejected',NULL,NULL),(9,'adithya','Maruthi Suzuki Arena','swarna','2020-07-30 17:51:13','500','Confirmed','BSK','BNMIT'),(10,'adithya','Maruthi Suzuki Arena','swarna','2020-08-04 12:05:15','700','Confirmed','ittumadu','bsk');

/*Table structure for table `cabregister` */

DROP TABLE IF EXISTS `cabregister`;

CREATE TABLE `cabregister` (
  `cabservicename` varchar(50) default NULL,
  `dos` varchar(20) default NULL,
  `firstname` varchar(20) default NULL,
  `lastname` varchar(20) default NULL,
  `dob` varchar(20) default NULL,
  `email` varchar(20) default NULL,
  `mobile` varchar(10) default NULL,
  `gender` varchar(20) default NULL,
  `city` varchar(20) default NULL,
  `username` varchar(20) default NULL,
  `password` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cabregister` */

insert  into `cabregister`(`cabservicename`,`dos`,`firstname`,`lastname`,`dob`,`email`,`mobile`,`gender`,`city`,`username`,`password`) values ('Adithya Cabs','21/07/2020','Adithya','S','8/10/1999','adhi@gmail.com','1234567891','male','Bangalore','adithya','adithya'),('Apple cabs','5/5/2020','Harish','Kalyan','5/6/1994','harish@gmail.com','1234789561','male','Chennai','harish','harish');

/*Table structure for table `customerreg` */

DROP TABLE IF EXISTS `customerreg`;

CREATE TABLE `customerreg` (
  `firstname` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `dob` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `mobile` varchar(10) default NULL,
  `gender` varchar(10) default NULL,
  `city` varchar(20) default NULL,
  `username` varchar(20) default NULL,
  `password` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customerreg` */

insert  into `customerreg`(`firstname`,`lastname`,`dob`,`email`,`mobile`,`gender`,`city`,`username`,`password`) values ('swarna','malya','21/10/1999','swarna@gmail.com','1234567891','female','Bamgalore','swarna','Swarna');

/*Table structure for table `otp` */

DROP TABLE IF EXISTS `otp`;

CREATE TABLE `otp` (
  `email` varchar(50) default NULL,
  `otp` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  `datetime` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `otp` */

insert  into `otp`(`email`,`otp`,`status`,`datetime`) values ('swarna@gmail.com','213135','Verified','2020-07-20 12:42:05');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
