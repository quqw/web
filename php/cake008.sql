/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-11-10 16:54:53
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `qw_test`
-- ----------------------------
/*蛋糕类别*/
DROP TABLE IF EXISTS `cake_types`;
CREATE TABLE `cake_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(32) NOT NULL,
  `type_name` varchar(32),
  `type_show` varchar(32),
  `description` text default NULL,
  `valid` bool default true,
  PRIMARY KEY (`id`),
  UNIQUE (`type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;

INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('1','type_man' ,'男士蛋糕');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('2','type_woman' ,'女士蛋糕');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('3','type_child' ,'儿童蛋糕');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('4','type_fruit' ,'水果蛋糕');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('5','type_fantang','翻糖蛋糕');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('6','type_shouyan','寿宴蛋糕');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('7','type_photo' ,'照片蛋糕');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('8','type_factory','企业蛋糕');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('9','type_flower','花卉主题');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('10','type_love' ,'浪漫爱情主题');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('11','type_caihui','彩绘蛋糕');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('12','type_tilamisu','提拉米苏');
INSERT INTO `cake_types` (`id`,`type_name`,`type_show`) VALUES ('13','type_tiandian','茶歇甜点');
/*蛋糕图片*/
DROP TABLE IF EXISTS `cake_images`;
CREATE TABLE `cake_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(32) NOT NULL,
  `cake_code`varchar(16) ,
  `cake_name` varchar(32),
  `cost_down` int(3) default 0,
  `cake_price6` int(4) default 120,
  `cake_price8` int(4) default 158,
  `cake_price10` int(4) default 258,
  `cake_price12` int(4) default 358,
  `cake_price14` int(4) default 500,
  `cake_price16` int(4) default 608,
  `cake_price18` int(4) default 800,
  `valid` bool default true,
  `description` text default NULL,
  `type_man` 	BOOL default 	false,
  `type_woman` 	BOOL default false,
  `type_child` 	BOOL default false,
  `type_fruit` 	BOOL default false,
  `type_fantang` 	BOOL default false,
  `type_shouyan` 	BOOL default false,
  `type_photo` 		BOOL default false,
  `type_factory` 	BOOL default false,
  `type_flower` 	BOOL default false,
  `type_love` 		BOOL default false,
  `type_caihui` 	BOOL default false,
  `type_tilamisu` 	BOOL default false,
  `type_tiandian` 	BOOL default false,
  PRIMARY KEY (`id`),
  UNIQUE (`file_name`),
   UNIQUE (`cake_code`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;

/*蛋糕图片详情*/
DROP TABLE IF EXISTS `cake_detail`;
CREATE TABLE `cake_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cake_id` int(11) NOT NULL,
  `file_name` varchar(32) NOT NULL,
  `description` text default NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`cake_id`,`file_name`)
  ) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;
  
/*活动图片*/
DROP TABLE IF EXISTS `activity_images`;
CREATE TABLE `activity_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(32) NOT NULL,
  `description` text,
  `activity_name` text,
  `activity_date` date,
   PRIMARY KEY (`id`),
  UNIQUE (`file_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;

/*活动图片详情*/
DROP TABLE IF EXISTS `activity_detail`;
CREATE TABLE `activity_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `file_name` varchar(32) NOT NULL,
  `description` text default NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`activity_id`,`file_name`)
  ) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;
  
 /*顾客*/

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32),
  `card_code` varchar(32) default null,
  `phone_num1` varchar(32) default null,
  `phone_num2` varchar(32) default null,
  `phone_num3` varchar(32) default null,
  `password` varchar(32) default null,
  `weixin` varchar(32),
  `qq` varchar(32),
  `birthday` date,
  `total_cost`	int(32) default 0,/*总消费*/
  `description` text default NULL,
  PRIMARY KEY (`id`),
  UNIQUE(`card_code`),
  UNIQUE(`weixin`)
  ) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;
  
 /*订单*/
 
-- ----------------------------
-- Records of qw_test
-- ----------------------------


