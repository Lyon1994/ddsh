/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.206
Source Server Version : 50130
Source Host           : 192.168.1.206:3306
Source Database       : dd

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2010-07-20 20:47:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dd_back`
-- ----------------------------
DROP TABLE IF EXISTS `dd_back`;
CREATE TABLE `dd_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topperid` int(11) NOT NULL,
  `userid` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL,
  `reason` varchar(300) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='物品审批退回记录表';

-- ----------------------------
-- Records of dd_back
-- ----------------------------
INSERT INTO `dd_back` VALUES ('3', '0', 'user2', '23', '0', '批量删除', 'user1', '2010-07-10 13:04:02');
INSERT INTO `dd_back` VALUES ('5', '0', 'user2', '33', '3', '批量删除', 'user1', '2010-07-10 13:05:43');
INSERT INTO `dd_back` VALUES ('6', '0', 'user2', '4444', '44', '批量删除', 'user1', '2010-07-10 13:05:43');
INSERT INTO `dd_back` VALUES ('8', '14', 'user2', '34534', '1', 'undefined', 'user1', '2010-07-10 17:50:45');
INSERT INTO `dd_back` VALUES ('9', '15', 'user2', '6786', '3', 'undefined', 'user1', '2010-07-10 17:51:17');
INSERT INTO `dd_back` VALUES ('10', '15', 'user2', '6786', '-33', 'undefined', 'user1', '2010-07-10 17:52:20');
INSERT INTO `dd_back` VALUES ('11', '15', 'user2', '6786', '3', 'undefined', 'user1', '2010-07-10 17:52:32');
INSERT INTO `dd_back` VALUES ('12', '16', 'user2', '678', '1', 'undefined', 'user1', '2010-07-10 17:52:45');
INSERT INTO `dd_back` VALUES ('13', '15', 'user2', '6786', '1', 'undefined', 'user1', '2010-07-10 17:53:43');
INSERT INTO `dd_back` VALUES ('14', '14', 'user2', '34534', '1', 'undefined', 'user1', '2010-07-10 17:55:08');
INSERT INTO `dd_back` VALUES ('15', '14', 'user2', '34534', '1', 'undefined', 'user1', '2010-07-10 17:55:26');
INSERT INTO `dd_back` VALUES ('16', '14', 'user2', '34534', '1', 'undefined', 'user1', '2010-07-10 17:56:14');
INSERT INTO `dd_back` VALUES ('17', '15', 'user2', '6786', '5', 'undefined', 'user1', '2010-07-10 17:58:52');
INSERT INTO `dd_back` VALUES ('18', '15', 'user2', '6786', '6', 'dfasf', 'user1', '2010-07-10 18:46:00');
INSERT INTO `dd_back` VALUES ('19', '18', 'user2', '234234', '2', 'ÓÐ²¿·ÖÓÉÎÊÌâ', 'user1', '2010-07-14 18:39:03');
INSERT INTO `dd_back` VALUES ('20', '18', 'user2', '234234', '2', 'ÉíÉÏ', 'user1', '2010-07-14 18:44:38');
INSERT INTO `dd_back` VALUES ('21', '18', 'user2', '234234', '2', 'ÊÇµÄ', 'user1', '2010-07-14 18:53:00');
INSERT INTO `dd_back` VALUES ('22', '18', 'user2', '234234', '2', 'ssÊÇ', 'user1', '2010-07-14 18:53:45');
INSERT INTO `dd_back` VALUES ('23', '18', 'user2', '234234', '2', 'ÊÇÊÇÊÇµÄ', 'user1', '2010-07-14 18:55:08');
INSERT INTO `dd_back` VALUES ('24', '18', 'user2', '234234', '224', 'æ¯å£«å¤§å¤«', 'user1', '2010-07-14 18:55:34');
INSERT INTO `dd_back` VALUES ('25', '17', 'user2', '3333', '1', 'æ¯', 'user1', '2010-07-14 18:56:35');
INSERT INTO `dd_back` VALUES ('26', '17', 'user2', '3333', '2', 'æ¯', 'user1', '2010-07-14 18:57:33');
INSERT INTO `dd_back` VALUES ('27', '17', 'user2', '3333', '1', '11æ', 'user1', '2010-07-14 19:07:05');
INSERT INTO `dd_back` VALUES ('28', '17', 'user2', '3333', '2', 'µ°µ°µÄdss', 'user1', '2010-07-14 19:27:03');
INSERT INTO `dd_back` VALUES ('29', '17', 'user2', '3333', '2', 'ÊÇÊÇ´ò¹þ¹þÈö·É', 'user1', '2010-07-14 19:28:28');
INSERT INTO `dd_back` VALUES ('30', '17', 'user2', '3333', '1', 'æè¯´ç', 'user1', '2010-07-14 19:33:03');
INSERT INTO `dd_back` VALUES ('31', '17', 'user2', '3333', '1', 'è¯´ç', 'user1', '2010-07-14 19:33:55');
INSERT INTO `dd_back` VALUES ('32', '17', 'user2', '3333', '3323', '2ÊÇÊÇÉÁµç', 'user1', '2010-07-14 19:43:22');
INSERT INTO `dd_back` VALUES ('33', '19', 'user2', '5hgg', '1', '�ǵĻ�', 'user1', '2010-07-14 19:48:02');
INSERT INTO `dd_back` VALUES ('34', '19', 'user2', '5hgg', '1', '���ʿ��', 'user1', '2010-07-14 19:49:28');
INSERT INTO `dd_back` VALUES ('35', '19', 'user2', '5hgg', '1', '的话士大夫士大夫', 'user1', '2010-07-14 19:49:50');
INSERT INTO `dd_back` VALUES ('36', '19', 'user2', '5hgg', '1', '说的话说的话士大夫', 'user1', '2010-07-14 19:56:53');
INSERT INTO `dd_back` VALUES ('37', '19', 'user2', '5hgg', '1', 'ʤ�ฺ�ٵ����', 'user1', '2010-07-14 19:57:16');
INSERT INTO `dd_back` VALUES ('39', '25', 'user2', '测试产品1', '1', '身上', 'user1', '2010-07-17 14:47:52');
INSERT INTO `dd_back` VALUES ('40', '19', 'user2', '5hgg', '1', '有问题啊', 'user1', '2010-07-20 19:34:40');

-- ----------------------------
-- Table structure for `dd_down`
-- ----------------------------
DROP TABLE IF EXISTS `dd_down`;
CREATE TABLE `dd_down` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventoryid` int(11) DEFAULT NULL,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `gridid` varchar(10) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `userid` varchar(30) NOT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='格子下架记录表，操作人，操作日期，下架物';

-- ----------------------------
-- Records of dd_down
-- ----------------------------
INSERT INTO `dd_down` VALUES ('1', '15', '201007150055313076', '3333', '3333', '2', '15', '3333', 'weÎÊÌâ°¡', 'user1', '2010-07-15 01:39:06');
INSERT INTO `dd_down` VALUES ('2', '15', '201007150055313076', '3333', '', '0', '15', '3333', '移入库存', 'user1', '2010-07-15 02:01:48');
INSERT INTO `dd_down` VALUES ('3', '13', '201007141729306212', 'ooi', '33', '1', '13', 'user2', '无色', 'user1', '2010-07-15 02:04:14');
INSERT INTO `dd_down` VALUES ('4', '13', '201007141729306212', 'ooi', '33', '1', '13', 'user2', '的话', 'user1', '2010-07-15 02:04:40');
INSERT INTO `dd_down` VALUES ('5', '13', '201007141729306212', 'ooi', '33', '1', '13', 'user2', '', 'user1', '2010-07-15 02:04:44');
INSERT INTO `dd_down` VALUES ('6', '17', '010343604636', '测试产品1', 'a98', '1', '4.04', 'user2', '有点问题', 'user1', '2010-07-17 14:59:48');
INSERT INTO `dd_down` VALUES ('7', '13', '201007141729306212', 'ooi', '12123', '1', '13', 'user2', '卖不掉那啊', 'user1', '2010-07-20 19:35:47');
INSERT INTO `dd_down` VALUES ('8', '18', '201007201934562515', '456456', '', '1', '4', 'user2', '', 'user1', '2010-07-20 19:36:28');

-- ----------------------------
-- Table structure for `dd_grid`
-- ----------------------------
DROP TABLE IF EXISTS `dd_grid`;
CREATE TABLE `dd_grid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gridid` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `location` varchar(20) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`gridid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='格子表，格子的名称，编号，位置';

-- ----------------------------
-- Records of dd_grid
-- ----------------------------
INSERT INTO `dd_grid` VALUES ('2', '001', '001格子', '角落里面', null);
INSERT INTO `dd_grid` VALUES ('3', '002', '002格子', '东面', null);

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
  `discount` float DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='库存表';

-- ----------------------------
-- Records of dd_inventory
-- ----------------------------
INSERT INTO `dd_inventory` VALUES ('1', 's', '32', '0', '2', '1', '66', 'user77', '2', '2', '2', '2', null, null);
INSERT INTO `dd_inventory` VALUES ('2', 's', '出饿', '0', '2', '1', '2.09', 'user77', '2', '2', '2', '2', null, null);
INSERT INTO `dd_inventory` VALUES ('3', 's', '234234', '0', '29.99', '1', '2.999', 'user2', '2', '2', '2', '2', 'user1', '2010-07-08 02:28:19');
INSERT INTO `dd_inventory` VALUES ('4', '201007081015305457', '2342342344', '0', '2.6767', '1', '4', 'user2', '2', '2', '2', '2', 'user1', '2010-07-08 10:15:30');
INSERT INTO `dd_inventory` VALUES ('5', '201007082221325407', '32', '0', '2', '1', '66', 'user2', '2', '2', '2', '2', 'user1', '2010-07-08 10:21:32');
INSERT INTO `dd_inventory` VALUES ('6', '201007082224212206', '546456', '0', '5', '1', '55', 'user2', '55', '5', '5', '5', 'user1', '2010-07-08 10:24:21');
INSERT INTO `dd_inventory` VALUES ('7', '201007082224212190', '54444', '0', '4', '1', '4', 'user2', '4', '4', '4', '44', 'user1', '2010-07-08 10:24:21');
INSERT INTO `dd_inventory` VALUES ('9', '201007082230407496', 'ss', '1', '3', '1', '3', 'user2', '3', '3', '3', '3', 'user1', '2010-07-08 22:30:40');
INSERT INTO `dd_inventory` VALUES ('10', '201007091517158490', '8898', '8', '8', '1', '88', 'user2', '8', '', '8', '', 'user1', '2010-07-09 15:17:15');
INSERT INTO `dd_inventory` VALUES ('11', '201007101757344099', '34534', '17', '3', '1', '33', 'user2', '3', '3', '3', '3', 'user1', '2010-07-10 17:57:34');
INSERT INTO `dd_inventory` VALUES ('12', '201007141729298718', '678', '5', '6', '0.56', '6', 'user2', '6', '6', '6', '6', 'user1', '2010-07-14 17:29:29');
INSERT INTO `dd_inventory` VALUES ('13', '201007141729306212', 'ooi', '37', '4', '1', '44', 'user2', '4', '4', '4', '4', 'user1', '2010-07-14 17:29:29');
INSERT INTO `dd_inventory` VALUES ('14', '201007141729309528', '456456', '0', '4', '1', '4', 'user2', '4', '44', '4', '4', 'user1', '2010-07-14 17:29:29');
INSERT INTO `dd_inventory` VALUES ('15', '201007150055313076', '3333', '34', '3', '1', '3', '3333', '3', '3', '3', '3', 'user1', '2010-07-15 00:55:31');
INSERT INTO `dd_inventory` VALUES ('16', '201007150055318560', '23234', '0', '3', '1', '3', '3333', '3', '3', '3', '3', 'user1', '2010-07-15 00:55:31');
INSERT INTO `dd_inventory` VALUES ('17', '010343604636', '测试产品1', '9', '4.04', '0.7', '34.56', 'user2', '规格一', '材料一', '等级一', '场地已', 'user1', '2010-07-17 14:49:39');
INSERT INTO `dd_inventory` VALUES ('18', '201007201934562515', '456456', '32', '4', '1', '44', 'user2', '4', '4', '4', '4', 'user1', '2010-07-20 19:34:56');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统公告';

-- ----------------------------
-- Records of dd_notice
-- ----------------------------
INSERT INTO `dd_notice` VALUES ('1', '33的风格', '33的风格', 'user1', '2010-07-15 00:12:17');
INSERT INTO `dd_notice` VALUES ('2', '测试公告', '3333', 'user1', '2010-07-15 00:36:19');

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
  `date` datetime NOT NULL,
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
  `date` datetime NOT NULL,
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
  `inventoryid` int(11) DEFAULT NULL,
  `barcode` varchar(128) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `gridid` varchar(11) DEFAULT NULL,
  `amount` int(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='当前格子在售状态表，格子编号，物品编号，';

-- ----------------------------
-- Records of dd_sell
-- ----------------------------
INSERT INTO `dd_sell` VALUES ('1', '13', '201007141729306212', 'ooi', '33', '0', '13', null, 'user2');
INSERT INTO `dd_sell` VALUES ('2', '13', '201007141729306212', 'ooi', '12123', '0', '13', null, 'user2');
INSERT INTO `dd_sell` VALUES ('3', '15', '201007150055313076', '3333', '3333', '2', '15', null, '3333');
INSERT INTO `dd_sell` VALUES ('4', '16', '201007150055318560', '23234', '333', '2', '16', null, '3333');
INSERT INTO `dd_sell` VALUES ('5', '15', '201007150055313076', '3333', '', '0', '15', null, '3333');
INSERT INTO `dd_sell` VALUES ('6', '17', '201007171449391207', '²âÊÔ²úÆ·1', 'a01', '1', '4.04', null, 'user2');
INSERT INTO `dd_sell` VALUES ('7', '17', '010343604636', '测试产品1', 'a98', '0', '4.04', null, 'user2');
INSERT INTO `dd_sell` VALUES ('8', '17', '010343604636', '测试产品1', '11', '1', '4.04', null, 'user2');
INSERT INTO `dd_sell` VALUES ('9', '17', '010343604636', '测试产品1', 'a11', '1', '4.04', '0.7', 'user2');
INSERT INTO `dd_sell` VALUES ('10', '17', '010343604636', '????1', '2324', '1', '4.04', '0.7', 'user2');
INSERT INTO `dd_sell` VALUES ('11', '17', '010343604636', '测试产品1', '213', '1', '4.04', '0.7', 'user2');
INSERT INTO `dd_sell` VALUES ('12', '18', '201007201934562515', '456456', '111a', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('13', '18', '201007201934562515', '456456', '', '0', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('14', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('15', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('16', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('17', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('18', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('19', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('20', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('21', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('22', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('23', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('24', '18', '201007201934562515', '456456', '', '1', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('25', null, 'null', 'null', 'null', null, null, null, 'null');
INSERT INTO `dd_sell` VALUES ('26', null, 'null', 'null', 'null', null, null, null, 'null');
INSERT INTO `dd_sell` VALUES ('27', null, 'null', 'null', 'null', null, null, null, 'null');
INSERT INTO `dd_sell` VALUES ('28', null, 'null', 'null', 'null', null, null, null, 'null');
INSERT INTO `dd_sell` VALUES ('29', null, 'null', 'null', 'null', null, null, null, 'null');

-- ----------------------------
-- Table structure for `dd_topper`
-- ----------------------------
DROP TABLE IF EXISTS `dd_topper`;
CREATE TABLE `dd_topper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='上货申请记录表';

-- ----------------------------
-- Records of dd_topper
-- ----------------------------
INSERT INTO `dd_topper` VALUES ('1', '201007082221325407', '32', '2', '33', '2', '66', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:28', '2010-07-08 10:21:32', 'user1');
INSERT INTO `dd_topper` VALUES ('2', null, '出饿', '2', '22', '2', '2.09', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:38', null, null);
INSERT INTO `dd_topper` VALUES ('3', null, '出饿2333', '2', '20', '333.879', '6666', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:41', null, null);
INSERT INTO `dd_topper` VALUES ('4', null, '234234', '2', '22', '29.99', '2.999', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:44', '2010-07-08 02:28:19', 'user1');
INSERT INTO `dd_topper` VALUES ('5', '201007081015305457', '2342342344', '2', '78', '2.6767', '4', 'user2', '2', '2', '2', '2', '1', '22', '2010-07-08 09:53:49', '2010-07-08 10:15:30', 'user1');
INSERT INTO `dd_topper` VALUES ('6', '201007082224212206', '546456', '5', '45', '5', '55', 'user2', '55', '5', '5', '5', '1', '5', '2010-07-08 10:23:43', '2010-07-08 10:24:21', 'user1');
INSERT INTO `dd_topper` VALUES ('7', '201007082224212190', '54444', '4', '4', '4', '4', 'user2', '4', '4', '4', '44', '1', '4', '2010-07-08 10:24:02', '2010-07-08 10:24:21', 'user1');
INSERT INTO `dd_topper` VALUES ('8', '201007082230407496', 'ss', '3', '2', '3', '3', 'user2', '3', '3', '3', '3', '1', '3', '2010-07-08 22:30:19', '2010-07-08 22:30:40', 'user1');
INSERT INTO `dd_topper` VALUES ('9', '201007091517158490', '8898', '8', '8', '8', '88', 'user2', '8', '', '8', '', '1', '8', '2010-07-09 00:04:05', '2010-07-09 15:17:15', 'user1');
INSERT INTO `dd_topper` VALUES ('10', null, '33', '3', '0', '3', '3', 'user2', '3', '3', '3', '3', '0', '3', '2010-07-10 11:09:14', null, null);
INSERT INTO `dd_topper` VALUES ('11', null, '23', '2', '0', '2', '2', 'user2', '2', '2', '2', '2', '0', '2', '2010-07-10 11:09:23', null, null);
INSERT INTO `dd_topper` VALUES ('12', null, '33', '3', '0', '3', '3', 'user2', '3', '3', '3', '3', '0', '3', '2010-07-10 11:09:31', null, null);
INSERT INTO `dd_topper` VALUES ('13', null, '4444', '4', '0', '4', '44', 'user2', '4', '44', '4', '444', '0', '4', '2010-07-10 11:09:40', null, null);
INSERT INTO `dd_topper` VALUES ('14', '201007101757344099', '34534', '3', '17', '3', '33', 'user2', '3', '3', '3', '3', '1', '3', '2010-07-10 11:09:47', '2010-07-10 17:57:34', 'user1');
INSERT INTO `dd_topper` VALUES ('15', null, '6786', '6', '-2', '6', '6', 'user2', '6', '6', '6', '6', '0', '6', '2010-07-10 11:09:54', null, null);
INSERT INTO `dd_topper` VALUES ('16', '201007141729298718', '678', '6', '5', '6', '6', 'user2', '6', '6', '6', '6', '1', '6', '2010-07-10 11:10:02', '2010-07-14 17:29:29', 'user1');
INSERT INTO `dd_topper` VALUES ('17', null, '3333', '3', '0', '3', '3', 'user2', '3', '3', '3', '3', '0', '3', '2010-07-14 17:25:55', null, null);
INSERT INTO `dd_topper` VALUES ('18', null, '234234', '2', '0', '2', '234', 'user2', '22', '2', '2', '2', '0', '2', '2010-07-14 17:26:12', null, null);
INSERT INTO `dd_topper` VALUES ('19', null, '5hgg', '4', '1', '4', '4', 'user2', '4', '4', '4', '4', '0', '4', '2010-07-14 17:26:21', null, null);
INSERT INTO `dd_topper` VALUES ('20', '201007201934562515', '456456', '4', '44', '4', '44', 'user2', '4', '4', '4', '4', '1', '4', '2010-07-14 17:26:31', '2010-07-20 19:34:56', 'user1');
INSERT INTO `dd_topper` VALUES ('21', '201007141729306212', 'ooi', '4', '44', '4', '44', 'user2', '4', '4', '4', '4', '1', '44', '2010-07-14 17:26:43', '2010-07-14 17:29:29', 'user1');
INSERT INTO `dd_topper` VALUES ('22', '201007141729309528', '456456', '4', '44', '4', '4', 'user2', '4', '44', '4', '4', '1', '4', '2010-07-14 17:26:51', '2010-07-14 17:29:29', 'user1');
INSERT INTO `dd_topper` VALUES ('23', '201007150055313076', '3333', '3', '3', '3', '3', '3333', '3', '3', '3', '3', '1', '3', '2010-07-15 00:55:05', '2010-07-15 00:55:31', 'user1');
INSERT INTO `dd_topper` VALUES ('24', '201007150055318560', '23234', '3', '3', '3', '3', '3333', '3', '3', '3', '3', '1', '23', '2010-07-15 00:55:14', '2010-07-15 00:55:31', 'user1');
INSERT INTO `dd_topper` VALUES ('25', '201007171449391207', '测试产品1', '地址1', '10', '4.04', '34.56', 'user2', '规格一', '材料一', '等级一', '场地已', '1', '备注', '2010-07-17 14:32:34', '2010-07-17 14:49:39', 'user1');
INSERT INTO `dd_topper` VALUES ('27', null, '测试商品', '图片', '1', '1.023', '32.736', 'user2', '', '', '', '', '0', '', '2010-07-20 17:46:44', null, null);

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
  `inventoryid` int(11) DEFAULT NULL,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `gridid` varchar(10) NOT NULL,
  `price` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `userid` varchar(30) NOT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='格子上架记录表，操作人，操作日期，上架物';

-- ----------------------------
-- Records of dd_upload
-- ----------------------------
INSERT INTO `dd_upload` VALUES ('2', null, '201007081015305457', '2342342344', '78', '3a', '2.6767', null, 'user2', 'user1', '2010-07-10 20:11:33');
INSERT INTO `dd_upload` VALUES ('4', null, 's', '32', '33', '', '2', null, 'user77', 'user1', '2010-07-13 20:36:38');
INSERT INTO `dd_upload` VALUES ('5', null, 's', '出饿', '22', '3435', '2', null, 'user77', 'user1', '2010-07-13 20:36:38');
INSERT INTO `dd_upload` VALUES ('7', '2', '22', '2', '2', '3', '3', null, '2', '2', '2009-09-09 00:00:00');
INSERT INTO `dd_upload` VALUES ('8', null, '201007082224212206', '546456', '45', '', '5', null, 'user2', 'user1', '2010-07-13 21:39:17');
INSERT INTO `dd_upload` VALUES ('9', null, '201007082224212190', '54444', '4', '3', '4', null, 'user2', 'user1', '2010-07-13 21:39:17');
INSERT INTO `dd_upload` VALUES ('10', '13', '201007141729306212', 'ooi', '6', 'a232', '4', null, 'user2', 'user1', '2010-07-14 17:31:06');
INSERT INTO `dd_upload` VALUES ('11', '14', '201007141729309528', '456456', '44', '233', '4', null, 'user2', 'user1', '2010-07-14 17:31:06');
INSERT INTO `dd_upload` VALUES ('13', '13', '201007141729306212', 'ooi', '3', '33a', '13', null, 'user2', 'user1', '2010-07-14 18:00:51');
INSERT INTO `dd_upload` VALUES ('14', '13', '201007141729306212', 'ooi', '11', '11aaa', '13', null, 'user2', 'user1', '2010-07-14 18:02:43');
INSERT INTO `dd_upload` VALUES ('15', '13', '201007141729306212', 'ooi', '1', '2a', '13', null, 'user2', 'user1', '2010-07-14 18:32:39');
INSERT INTO `dd_upload` VALUES ('16', '9', '201007082230407496', 'ss', '0', '', '9', null, 'user2', 'user1', '2010-07-14 20:00:09');
INSERT INTO `dd_upload` VALUES ('17', '9', '201007082230407496', 'ss', '1', '111', '9', null, 'user2', 'user1', '2010-07-14 20:22:05');
INSERT INTO `dd_upload` VALUES ('18', '13', '201007141729306212', 'ooi', '3', '33', '13', null, 'user2', 'user1', '2010-07-14 23:12:42');
INSERT INTO `dd_upload` VALUES ('19', '13', '201007141729306212', 'ooi', '1', '12123', '13', null, 'user2', 'user1', '2010-07-14 23:29:45');
INSERT INTO `dd_upload` VALUES ('20', '15', '201007150055313076', '3333', '3', '3333', '15', null, '3333', 'user1', '2010-07-15 00:56:11');
INSERT INTO `dd_upload` VALUES ('21', '16', '201007150055318560', '23234', '3', '333', '16', null, '3333', 'user1', '2010-07-15 00:56:17');
INSERT INTO `dd_upload` VALUES ('22', '16', '201007150055318560', '23234', '1', '', '16', null, '3333', 'user1', '2010-07-15 01:28:47');
INSERT INTO `dd_upload` VALUES ('23', '15', '201007150055313076', '3333', '1', '', '15', null, '3333', 'user1', '2010-07-15 01:39:27');
INSERT INTO `dd_upload` VALUES ('24', '17', '201007171449391207', '²âÊÔ²úÆ·1', '1', 'a01', '4.04', null, 'user2', 'user1', '2010-07-17 14:55:59');
INSERT INTO `dd_upload` VALUES ('25', '17', '010343604636', '测试产品1', '1', 'a98', '4.04', null, 'user2', 'user1', '2010-07-17 14:57:08');
INSERT INTO `dd_upload` VALUES ('26', '17', '010343604636', '测试产品1', '1', '11', '4.04', null, 'user2', 'user1', '2010-07-20 16:57:58');
INSERT INTO `dd_upload` VALUES ('27', '17', '010343604636', '测试产品1', '1', 'a11', '4.04', '0.7', 'user2', 'user1', '2010-07-20 19:08:49');
INSERT INTO `dd_upload` VALUES ('28', '17', '010343604636', '????1', '1', '2324', '4.04', '0.7', 'user2', 'user1', '2010-07-20 19:17:41');
INSERT INTO `dd_upload` VALUES ('29', '17', '010343604636', '测试产品1', '1', '213', '4.04', '0.7', 'user2', 'user1', '2010-07-20 19:18:47');
INSERT INTO `dd_upload` VALUES ('30', '18', '201007201934562515', '456456', '1', '111a', '4', '1', 'user2', 'user1', '2010-07-20 19:35:17');
INSERT INTO `dd_upload` VALUES ('31', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:36:05');
INSERT INTO `dd_upload` VALUES ('32', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:41:08');
INSERT INTO `dd_upload` VALUES ('33', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:41:25');
INSERT INTO `dd_upload` VALUES ('34', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:42:00');
INSERT INTO `dd_upload` VALUES ('35', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:42:13');
INSERT INTO `dd_upload` VALUES ('36', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:43:49');
INSERT INTO `dd_upload` VALUES ('37', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:44:00');
INSERT INTO `dd_upload` VALUES ('38', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:49:12');
INSERT INTO `dd_upload` VALUES ('39', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:49:25');
INSERT INTO `dd_upload` VALUES ('40', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:50:01');
INSERT INTO `dd_upload` VALUES ('41', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:54:04');
INSERT INTO `dd_upload` VALUES ('42', '18', '201007201934562515', '456456', '1', '', '4', '1', 'user2', 'user1', '2010-07-20 19:54:28');
INSERT INTO `dd_upload` VALUES ('43', null, 'null', 'null', null, 'null', null, null, 'null', 'user1', '2010-07-20 20:03:38');
INSERT INTO `dd_upload` VALUES ('44', null, 'null', 'null', null, 'null', null, null, 'null', 'user1', '2010-07-20 20:16:33');
INSERT INTO `dd_upload` VALUES ('45', null, 'null', 'null', null, 'null', null, null, 'null', 'user1', '2010-07-20 20:16:40');
INSERT INTO `dd_upload` VALUES ('46', null, 'null', 'null', null, 'null', null, null, 'null', 'user1', '2010-07-20 20:38:54');
INSERT INTO `dd_upload` VALUES ('47', null, 'null', 'null', null, 'null', null, null, 'null', 'user1', '2010-07-20 20:39:19');

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
  `brand` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`userid`,`idcard`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户表，分设计师，管理员，门店操作人员';

-- ----------------------------
-- Records of dd_user
-- ----------------------------
INSERT INTO `dd_user` VALUES ('1', 'user2', 'xx设计师', '4', '4', '4', '13761844061', '12345679', '45566', '4', '2', '1', '2010-07-03 13:03:07', '4', null, null, null, '1', null);
INSERT INTO `dd_user` VALUES ('2', 'user1', 'xx管理员', '1', '1', '1', '137262728282', '4534535', '1', '1', '1', '1', '2010-07-03 19:26:15', '1', null, null, null, '1', null);
INSERT INTO `dd_user` VALUES ('3', 'user3', 'xx店员', '1', '3', '333', '3', '3', '3', '3', '3', '1', '2010-07-04 14:42:13', '1', null, null, null, '1', null);
INSERT INTO `dd_user` VALUES ('4', 'user4', 'xx测试人员', '1', '1', '2324', '123234', '1', '1', '1', '4', '1', '2010-07-04 14:43:12', '1', null, null, null, '1', null);
INSERT INTO `dd_user` VALUES ('9', '3333', '2', '', '1', '', '333', '', '', '', '2', '1', '2010-07-04 06:37:47', '2', null, null, null, '1', null);
INSERT INTO `dd_user` VALUES ('11', '333', '3', '', '1', '', '', '', '', '', '2', '1', '2010-07-04 06:40:31', '2', null, null, null, '1', null);
INSERT INTO `dd_user` VALUES ('12', '678678', '6', '', '1', '', '222', '', '123', '', '2', '1', '2010-07-04 06:41:17', '2', null, null, null, '1', null);
INSERT INTO `dd_user` VALUES ('14', '2', '2', '', '1', '', '56567', '', '', '', '2', '1', '2010-07-04 08:19:06', '2', '2010-07-08 09:36:03', null, null, '1', null);
INSERT INTO `dd_user` VALUES ('15', '6666', '66', '', '1', '', '', '', '', '', '2', '1', '2010-07-07 12:28:57', '2', null, null, null, '1', null);
INSERT INTO `dd_user` VALUES ('16', '444', '4', '', '1', '', '4', '', '', '', '4', '1', '2010-07-10 11:24:17', 'user1', null, null, null, '4', null);
INSERT INTO `dd_user` VALUES ('17', '33333', '3', '3', '1', '3', '3', '3', '', '3', '2', '1', '2010-07-10 11:29:53', 'user1', '2010-07-10 11:29:53', null, null, '33', '达达牌');

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
