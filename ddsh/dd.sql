/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50147
Source Host           : localhost:3306
Source Database       : dd

Target Server Type    : MYSQL
Target Server Version : 50147
File Encoding         : 65001

Date: 2010-07-09 00:05:23
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dd_back`
-- ----------------------------
DROP TABLE IF EXISTS `dd_back`;
CREATE TABLE `dd_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL,
  `reason` varchar(300) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='物品审批退回记录表';

-- ----------------------------
-- Records of dd_back
-- ----------------------------
INSERT INTO `dd_back` VALUES ('1', 'user2', 'xx商品', '3', '有问题阿', 'user1', '2010-07-08 04:25:33');

-- ----------------------------
-- Table structure for `dd_down`
-- ----------------------------
DROP TABLE IF EXISTS `dd_down`;
CREATE TABLE `dd_down` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `gridid` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `userid` varchar(30) NOT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子下架记录表，操作人，操作日期，下架物';

-- ----------------------------
-- Records of dd_down
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_grid`
-- ----------------------------
DROP TABLE IF EXISTS `dd_grid`;
CREATE TABLE `dd_grid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gridid` varchar(3) NOT NULL,
  `name` varchar(10) NOT NULL,
  `location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`gridid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子表，格子的名称，编号，位置';

-- ----------------------------
-- Records of dd_grid
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_gridstatus`
-- ----------------------------
DROP TABLE IF EXISTS `dd_gridstatus`;
CREATE TABLE `dd_gridstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gridid` varchar(3) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`gridid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子状态表,每个格子存放的物品,一个格子可�';

-- ----------------------------
-- Records of dd_gridstatus
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `dd_inventory`;
CREATE TABLE `dd_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `totalprice` float NOT NULL,
  `userid` varchar(30) NOT NULL,
  `spec` varchar(32) DEFAULT NULL,
  `material` varchar(32) DEFAULT NULL,
  `grade` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='库存表';

-- ----------------------------
-- Records of dd_inventory
-- ----------------------------
INSERT INTO `dd_inventory` VALUES ('1', 's', '32', '33', '2', '66', 'user77', '2', '2', '2', '2', null, null);
INSERT INTO `dd_inventory` VALUES ('2', 's', '出饿', '22', '2', '2.09', 'user77', '2', '2', '2', '2', null, null);
INSERT INTO `dd_inventory` VALUES ('3', 's', '234234', '22', '29.99', '2.999', 'user2', '2', '2', '2', '2', 'user1', '2010-07-08 02:28:19');
INSERT INTO `dd_inventory` VALUES ('4', '201007081015305457', '2342342344', '78', '2.6767', '4', 'user2', '2', '2', '2', '2', 'user1', '2010-07-08 10:15:30');
INSERT INTO `dd_inventory` VALUES ('5', '201007082221325407', '32', '33', '2', '66', 'user2', '2', '2', '2', '2', 'user1', '2010-07-08 10:21:32');
INSERT INTO `dd_inventory` VALUES ('6', '201007082224212206', '546456', '45', '5', '55', 'user2', '55', '5', '5', '5', 'user1', '2010-07-08 10:24:21');
INSERT INTO `dd_inventory` VALUES ('7', '201007082224212190', '54444', '4', '4', '4', 'user2', '4', '4', '4', '44', 'user1', '2010-07-08 10:24:21');
INSERT INTO `dd_inventory` VALUES ('9', '201007082230407496', 'ss', '2', '3', '3', 'user2', '3', '3', '3', '3', 'user1', '2010-07-08 22:30:40');

-- ----------------------------
-- Table structure for `dd_notice`
-- ----------------------------
DROP TABLE IF EXISTS `dd_notice`;
CREATE TABLE `dd_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `detail` varchar(300) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统公告';

-- ----------------------------
-- Records of dd_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_rsales`
-- ----------------------------
DROP TABLE IF EXISTS `dd_rsales`;
CREATE TABLE `dd_rsales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `discount` float NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `totalprice` float NOT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `operator` varchar(30) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货记录表';

-- ----------------------------
-- Records of dd_rsales
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_sales`
-- ----------------------------
DROP TABLE IF EXISTS `dd_sales`;
CREATE TABLE `dd_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) NOT NULL,
  `discount` float NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `totalprice` float NOT NULL,
  `userid` varchar(30) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='售货记录表,卖出的数量要相应的从库存减去';

-- ----------------------------
-- Records of dd_sales
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_sell`
-- ----------------------------
DROP TABLE IF EXISTS `dd_sell`;
CREATE TABLE `dd_sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `gridid` int(11) DEFAULT NULL,
  `amount` varchar(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='当前格子在售状态表，格子编号，物品编号，';

-- ----------------------------
-- Records of dd_sell
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_topper`
-- ----------------------------
DROP TABLE IF EXISTS `dd_topper`;
CREATE TABLE `dd_topper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `image` varchar(300) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `totalprice` float NOT NULL,
  `userid` varchar(30) NOT NULL,
  `spec` varchar(32) DEFAULT NULL,
  `material` varchar(32) DEFAULT NULL,
  `grade` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `submitdate` datetime NOT NULL,
  `date` datetime DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `barcode` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='上货申请记录表';

-- ----------------------------
-- Records of dd_topper
-- ----------------------------
INSERT INTO `dd_topper` VALUES ('1', '32', '2', '33', '2', '66', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:28', '2010-07-08 10:21:32', 'user1', '201007082221325407');
INSERT INTO `dd_topper` VALUES ('2', '出饿', '2', '22', '2', '2.09', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:38', null, null, null);
INSERT INTO `dd_topper` VALUES ('3', '出饿2333', '2', '20', '333.879', '6666', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:41', null, null, null);
INSERT INTO `dd_topper` VALUES ('4', '234234', '2', '22', '29.99', '2.999', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:44', '2010-07-08 02:28:19', 'user1', null);
INSERT INTO `dd_topper` VALUES ('5', '2342342344', '2', '78', '2.6767', '4', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:49', '2010-07-08 10:15:30', 'user1', '201007081015305457');
INSERT INTO `dd_topper` VALUES ('6', '546456', '5', '45', '5', '55', 'user2', '55', '5', '5', '5', '1', '5', '2010-07-08 10:23:43', '2010-07-08 10:24:21', 'user1', '201007082224212206');
INSERT INTO `dd_topper` VALUES ('7', '54444', '4', '4', '4', '4', 'user2', '4', '4', '4', '44', '1', '4', '2010-07-08 10:24:02', '2010-07-08 10:24:21', 'user1', '201007082224212190');
INSERT INTO `dd_topper` VALUES ('8', 'ss', '3', '2', '3', '3', 'user2', '3', '3', '3', '3', '1', '3', '2010-07-08 22:30:19', '2010-07-08 22:30:40', 'user1', '201007082230407496');
INSERT INTO `dd_topper` VALUES ('9', '8898', '8', '8', '8', '88', 'user2', '8', '', '8', '', '0', '8', '2010-07-09 00:04:05', null, null, null);

-- ----------------------------
-- Table structure for `dd_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `dd_transaction`;
CREATE TABLE `dd_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `from_account` varchar(128) DEFAULT NULL,
  `to_account` varchar(128) DEFAULT NULL,
  `transaction_type` char(1) DEFAULT NULL,
  `transaction_money` float DEFAULT NULL,
  `memo` varchar(128) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电子钱包交易记录表';

-- ----------------------------
-- Records of dd_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_upload`
-- ----------------------------
DROP TABLE IF EXISTS `dd_upload`;
CREATE TABLE `dd_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `gridid` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  `userid` varchar(30) NOT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子上架记录表，操作人，操作日期，上架物';

-- ----------------------------
-- Records of dd_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_user`
-- ----------------------------
DROP TABLE IF EXISTS `dd_user`;
CREATE TABLE `dd_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `name` varchar(10) NOT NULL,
  `idcard` varchar(32) DEFAULT NULL,
  `sex` char(1) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `type` char(1) NOT NULL,
  `status` char(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `operator` varchar(30) NOT NULL,
  `verifydate` datetime DEFAULT NULL,
  `updateby` varchar(30) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`userid`,`idcard`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户表，分设计师，管理员，门店操作人员';

-- ----------------------------
-- Records of dd_user
-- ----------------------------
INSERT INTO `dd_user` VALUES ('1', 'user2', 'xx设计师', '4', '4', '4', '4', '4', '4', '4', '2', '1', '2010-07-03 13:03:07', '4', null, null, null, '1');
INSERT INTO `dd_user` VALUES ('2', 'user1', 'xx管理员', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2010-07-03 19:26:15', '1', null, null, null, '1');
INSERT INTO `dd_user` VALUES ('3', 'user3', 'xx店员', '1', '3', '3', '3', '3', '3', '3', '3', '1', '2010-07-04 14:42:13', '1', null, null, null, '1');
INSERT INTO `dd_user` VALUES ('4', 'user4', 'xx测试人员', '1', '1', '1', '1', '1', '1', '1', '4', '1', '2010-07-04 14:43:12', '1', null, null, null, '1');
INSERT INTO `dd_user` VALUES ('9', '3333', '2', '', '1', '', '', '', '', '', '2', '1', '2010-07-04 06:37:47', '2', null, null, null, '1');
INSERT INTO `dd_user` VALUES ('11', '333', '3', '', '1', '', '', '', '', '', '2', '1', '2010-07-04 06:40:31', '2', null, null, null, '1');
INSERT INTO `dd_user` VALUES ('12', '678678', '6', '', '1', '', '', '', '', '', '2', '1', '2010-07-04 06:41:17', '2', null, null, null, '1');
INSERT INTO `dd_user` VALUES ('13', '2', '2', '', '1', '', '', '', '', '', '2', '1', '2010-07-04 08:18:51', '2', null, null, null, '1');
INSERT INTO `dd_user` VALUES ('14', '2', '2', '', '1', '', '', '', '', '', '2', '1', '2010-07-04 08:19:06', '2', '2010-07-08 09:36:03', null, null, '1');
INSERT INTO `dd_user` VALUES ('15', '6666', '66', '', '1', '', '', '', '', '', '2', '1', '2010-07-07 12:28:57', '2', null, null, null, '1');

-- ----------------------------
-- Table structure for `dd_wallet`
-- ----------------------------
DROP TABLE IF EXISTS `dd_wallet`;
CREATE TABLE `dd_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `bankname` varchar(128) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `accounter` varchar(10) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设计师、商家电子钱包';

-- ----------------------------
-- Records of dd_wallet
-- ----------------------------
