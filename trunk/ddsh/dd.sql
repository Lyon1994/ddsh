/*
MySQL Data Transfer
Source Host: localhost
Source Database: dd
Target Host: localhost
Target Database: dd
Date: 2010-7-8 17:35:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for dd_back
-- ----------------------------
CREATE TABLE `dd_back` (
  `id` int(11) NOT NULL auto_increment,
  `userid` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL,
  `reason` varchar(300) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品审批退回记录表';

-- ----------------------------
-- Table structure for dd_down
-- ----------------------------
CREATE TABLE `dd_down` (
  `id` int(11) NOT NULL auto_increment,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) default NULL,
  `gridid` int(11) NOT NULL,
  `amount` int(11) default NULL,
  `price` float default NULL,
  `userid` varchar(30) NOT NULL,
  `reason` varchar(300) default NULL,
  `operator` varchar(30) default NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子下架记录表，操作人，操作日期，下架物';

-- ----------------------------
-- Table structure for dd_grid
-- ----------------------------
CREATE TABLE `dd_grid` (
  `id` int(11) NOT NULL auto_increment,
  `gridid` varchar(3) NOT NULL,
  `name` varchar(10) NOT NULL,
  `location` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`,`gridid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子表，格子的名称，编号，位置';

-- ----------------------------
-- Table structure for dd_gridstatus
-- ----------------------------
CREATE TABLE `dd_gridstatus` (
  `id` int(11) NOT NULL auto_increment,
  `gridid` varchar(3) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`,`gridid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子状态表,每个格子存放的物品,一个格子可�';

-- ----------------------------
-- Table structure for dd_inventory
-- ----------------------------
CREATE TABLE `dd_inventory` (
  `id` int(11) NOT NULL auto_increment,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `userid` varchar(30) NOT NULL,
  `spec` varchar(32) default NULL,
  `material` varchar(32) default NULL,
  `grade` varchar(32) default NULL,
  `location` varchar(32) default NULL,
  `operator` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`,`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存表';

-- ----------------------------
-- Table structure for dd_notice
-- ----------------------------
CREATE TABLE `dd_notice` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `detail` varchar(300) default NULL,
  `operator` varchar(30) default NULL,
  `date` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统公告';

-- ----------------------------
-- Table structure for dd_rsales
-- ----------------------------
CREATE TABLE `dd_rsales` (
  `id` int(11) NOT NULL auto_increment,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) default NULL,
  `discount` float NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `totalprice` float NOT NULL,
  `userid` varchar(30) default NULL,
  `reason` varchar(128) default NULL,
  `operator` varchar(30) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货记录表';

-- ----------------------------
-- Table structure for dd_sales
-- ----------------------------
CREATE TABLE `dd_sales` (
  `id` int(11) NOT NULL auto_increment,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) NOT NULL,
  `discount` float NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `totalprice` float NOT NULL,
  `userid` varchar(30) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='售货记录表,卖出的数量要相应的从库存减去';

-- ----------------------------
-- Table structure for dd_sell
-- ----------------------------
CREATE TABLE `dd_sell` (
  `id` int(11) NOT NULL auto_increment,
  `barcode` varchar(128) default NULL,
  `name` varchar(10) default NULL,
  `gridid` int(11) default NULL,
  `amount` varchar(20) default NULL,
  `price` float default NULL,
  `userid` varchar(30) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='当前格子在售状态表，格子编号，物品编号，';

-- ----------------------------
-- Table structure for dd_topper
-- ----------------------------
CREATE TABLE `dd_topper` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `image` varchar(300) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `totalprice` float NOT NULL,
  `userid` varchar(30) NOT NULL,
  `spec` varchar(32) default NULL,
  `material` varchar(32) default NULL,
  `grade` varchar(32) default NULL,
  `location` varchar(32) default NULL,
  `status` varchar(30) NOT NULL,
  `memo` varchar(500) default NULL,
  `submitdate` datetime NOT NULL,
  `date` datetime default NULL,
  `operator` varchar(30) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上货申请记录表';

-- ----------------------------
-- Table structure for dd_transaction
-- ----------------------------
CREATE TABLE `dd_transaction` (
  `id` int(11) NOT NULL auto_increment,
  `userid` varchar(30) default NULL,
  `from_account` varchar(128) default NULL,
  `to_account` varchar(128) default NULL,
  `transaction_type` char(1) default NULL,
  `transaction_money` float default NULL,
  `memo` varchar(128) default NULL,
  `operator` varchar(30) default NULL,
  `date` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电子钱包交易记录表';

-- ----------------------------
-- Table structure for dd_upload
-- ----------------------------
CREATE TABLE `dd_upload` (
  `id` int(11) NOT NULL auto_increment,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) default NULL,
  `amount` int(11) default NULL,
  `gridid` int(11) NOT NULL,
  `price` float default NULL,
  `userid` varchar(30) NOT NULL,
  `operator` varchar(30) default NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='格子上架记录表，操作人，操作日期，上架物';

-- ----------------------------
-- Table structure for dd_user
-- ----------------------------
CREATE TABLE `dd_user` (
  `id` int(11) NOT NULL auto_increment,
  `userid` varchar(30) NOT NULL,
  `name` varchar(10) NOT NULL,
  `idcard` varchar(32) default NULL,
  `sex` char(1) NOT NULL,
  `address` varchar(100) default NULL,
  `mobile` varchar(20) default NULL,
  `telephone` varchar(20) default NULL,
  `fax` varchar(20) default NULL,
  `mail` varchar(30) default NULL,
  `type` char(1) NOT NULL,
  `status` char(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `operator` varchar(30) NOT NULL,
  `verifydate` datetime default NULL,
  `updateby` varchar(30) default NULL,
  `updatedate` datetime default NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`,`userid`,`idcard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表，分设计师，管理员，门店操作人员';

-- ----------------------------
-- Table structure for dd_wallet
-- ----------------------------
CREATE TABLE `dd_wallet` (
  `id` int(11) NOT NULL auto_increment,
  `userid` varchar(30) default NULL,
  `bankname` varchar(128) default NULL,
  `location` varchar(300) default NULL,
  `accounter` varchar(10) default NULL,
  `money` int(11) default NULL,
  `account` varchar(128) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设计师、商家电子钱包';

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `dd_back` VALUES ('1', 'user2', 'xx商品', '3', '有问题阿', 'user1', '2010-07-08 04:25:33');
INSERT INTO `dd_topper` VALUES ('1', '32', '2', '33', '2', '66', 'user2', '2', '2', '2', '2', '0', '22', '2010-07-08 09:53:28', null, null);
INSERT INTO `dd_topper` VALUES ('2', '出饿', '2', '22', '2', '2', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:38', null, null);
INSERT INTO `dd_topper` VALUES ('3', '出饿2333', '2', '20', '333', '6666', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:41', null, null);
INSERT INTO `dd_topper` VALUES ('4', '234234', '2', '22', '2', '2', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:44', '2010-07-08 02:28:19', 'user1');
INSERT INTO `dd_topper` VALUES ('5', '2342342344', '2', '78', '2', '4', 'user2', '2', '2', '2', '2', '0', '22', '2010-07-08 09:53:49', null, null);
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
