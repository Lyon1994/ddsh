/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50147
Source Host           : localhost:3306
Source Database       : dd

Target Server Type    : MYSQL
Target Server Version : 50147
File Encoding         : 65001

Date: 2010-07-07 01:01:21
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dd_back`
-- ----------------------------
DROP TABLE IF EXISTS `dd_back`;
CREATE TABLE `dd_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topperid` int(11) NOT NULL,
  `reson` varchar(300) NOT NULL,
  `amount` int(11) NOT NULL,
  `operator` int(11) NOT NULL,
  `date_` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品审批退回记录表';

-- ----------------------------
-- Records of dd_back
-- ----------------------------

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
  `userid` int(11) NOT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `operator` int(11) DEFAULT NULL,
  `date_` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子下架记录表，操作人，操作日期，下架物品，数量，格子编号,设计师，下架理由，同时需要的话可以更新格子状态表，下架以后要';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子状态表,每个格子存放的物品,一个格子可能会包含多个物品，这里始终保存的是当前格子里面最新的物品，如果被卖掉一个，则数';

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
  `userid` int(11) NOT NULL,
  `spec` varchar(32) DEFAULT NULL,
  `material` varchar(32) DEFAULT NULL,
  `grade` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `operator` int(11) NOT NULL,
  `date_` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存表';

-- ----------------------------
-- Records of dd_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_notice`
-- ----------------------------
DROP TABLE IF EXISTS `dd_notice`;
CREATE TABLE `dd_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `detail` varchar(300) DEFAULT NULL,
  `operator` char(1) DEFAULT NULL,
  `date_` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统公告';

-- ----------------------------
-- Records of dd_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_pass`
-- ----------------------------
DROP TABLE IF EXISTS `dd_pass`;
CREATE TABLE `dd_pass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topperid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `operator` int(11) NOT NULL,
  `date_` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品审批通过记录表';

-- ----------------------------
-- Records of dd_pass
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
  `userid` int(11) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `operator` int(11) NOT NULL,
  `data_` datetime NOT NULL,
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
  `userid` int(11) NOT NULL,
  `operator` int(11) NOT NULL,
  `data_` datetime NOT NULL,
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
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='当前格子在售状态表，格子编号，物品编号，名称，价格，数量';

-- ----------------------------
-- Records of dd_sell
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_topper`
-- ----------------------------
DROP TABLE IF EXISTS `dd_topper`;
CREATE TABLE `dd_topper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `image` blob NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `totalprice` float NOT NULL,
  `userid` int(11) NOT NULL,
  `spec` varchar(32) DEFAULT NULL,
  `material` varchar(32) DEFAULT NULL,
  `grade` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `submitdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上货申请记录表';

-- ----------------------------
-- Records of dd_topper
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `dd_transaction`;
CREATE TABLE `dd_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `from_account` varchar(128) DEFAULT NULL,
  `to_account` varchar(128) DEFAULT NULL,
  `transaction_type` char(1) DEFAULT NULL,
  `transaction_money` float DEFAULT NULL,
  `memo` varchar(128) DEFAULT NULL,
  `operator` int(11) DEFAULT NULL,
  `date_` datetime DEFAULT NULL,
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
  `userid` int(11) NOT NULL,
  `operator` int(11) DEFAULT NULL,
  `date_` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子上架记录表，操作人，操作日期，上架物品，数量，格子编号,设计师，同时需要的话可以更新格子状态表，上架的数量要从库存扣';

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
INSERT INTO `dd_user` VALUES ('9', '3333', '2', '', '1', '', '', '', '', '', '2', '1', '2010-07-04 06:37:47', '2', null, null, null, '');
INSERT INTO `dd_user` VALUES ('10', '3', ' 2', ' ', '2', null, null, null, null, null, '1', '1', '2010-07-04 18:39:14', '1', null, null, null, ' ');
INSERT INTO `dd_user` VALUES ('11', '333', '3', '', '1', '', '', '', '', '', '2', '1', '2010-07-04 06:40:31', '2', null, null, null, '3');
INSERT INTO `dd_user` VALUES ('12', '678678', '6', '', '1', '', '', '', '', '', '2', '1', '2010-07-04 06:41:17', '2', null, null, null, '6');
INSERT INTO `dd_user` VALUES ('13', '2', '2', '', '1', '', '', '', '', '', '2', '1', '2010-07-04 08:18:51', '2', null, null, null, '');
INSERT INTO `dd_user` VALUES ('14', '2', '2', '', '1', '', '', '', '', '', '2', '0', '2010-07-04 08:19:06', '2', null, null, null, '');
INSERT INTO `dd_user` VALUES ('15', '6666', '66', '', '1', '', '', '', '', '', '2', '1', '2010-07-07 12:28:57', '2', null, null, null, '666');

-- ----------------------------
-- Table structure for `dd_wallet`
-- ----------------------------
DROP TABLE IF EXISTS `dd_wallet`;
CREATE TABLE `dd_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
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
