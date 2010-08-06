/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.206
Source Server Version : 50130
Source Host           : 192.168.1.206:3306
Source Database       : dd

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2010-08-06 21:31:55
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='物品审批退回记录表';

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
INSERT INTO `dd_back` VALUES ('41', '19', 'user2', '5hgg', '1', '门店管理员操作。。。有问题啊', 'user3', '2010-07-26 13:26:07');
INSERT INTO `dd_back` VALUES ('42', '29', 'user2', '新物品1', '1', '新物品1 的一件有问题', 'user1', '2010-08-02 17:21:39');
INSERT INTO `dd_back` VALUES ('43', '30', 'user2', '新物品1', '1', '老商品有意见有问题', 'user1', '2010-08-02 17:27:35');

-- ----------------------------
-- Table structure for `dd_bill`
-- ----------------------------
DROP TABLE IF EXISTS `dd_bill`;
CREATE TABLE `dd_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` varchar(64) DEFAULT NULL,
  `receive` float DEFAULT NULL,
  `changes` float DEFAULT NULL,
  `totalprice` float DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='电子钱包交易记录表';

-- ----------------------------
-- Records of dd_bill
-- ----------------------------
INSERT INTO `dd_bill` VALUES ('1', 'dd2010724181445KP766', '2233', '2221.69', '11.31', 'user3', '2010-07-24 18:14:45');
INSERT INTO `dd_bill` VALUES ('2', 'dd2010724183631QVB26', '2233', '2221.69', '11.31', 'user3', '2010-07-24 18:36:31');
INSERT INTO `dd_bill` VALUES ('3', 'dd2010724183738XV9O1', '23', '11.69', '11.31', 'user3', '2010-07-24 18:37:38');
INSERT INTO `dd_bill` VALUES ('4', 'dd2010724183840WBBU5', '32', '20.69', '11.31', 'user3', '2010-07-24 18:38:40');
INSERT INTO `dd_bill` VALUES ('5', 'dd2010724185239MGEHT', '223', '215.32', '7.68', 'user3', '2010-07-24 18:52:39');
INSERT INTO `dd_bill` VALUES ('6', 'dd2010724185585SBQX', '2323', '2312.5', '10.5', 'user3', '2010-07-24 18:55:08');
INSERT INTO `dd_bill` VALUES ('7', 'dd2010724185525XYWC2', '2323', '2312.5', '10.5', 'user3', '2010-07-24 18:55:25');
INSERT INTO `dd_bill` VALUES ('8', 'dd2010724191457QGUFQ', '45', '36.52', '8.48', 'user3', '2010-07-24 19:13:53');
INSERT INTO `dd_bill` VALUES ('9', 'dd2010724191833A9IU2', '56', '50.34', '5.66', 'user3', '2010-07-24 19:17:30');
INSERT INTO `dd_bill` VALUES ('10', 'dd20107241921234TT3M', '898', '889.52', '8.48', 'user3', '2010-07-24 19:20:20');
INSERT INTO `dd_bill` VALUES ('11', 'dd2010724192647SQ33V', '898', '889.52', '8.48', 'user3', '2010-07-24 19:25:44');
INSERT INTO `dd_bill` VALUES ('12', 'dd2010724192914ECGS5', '898', '889.52', '8.48', 'user3', '2010-07-24 19:28:10');
INSERT INTO `dd_bill` VALUES ('13', 'dd2010724193054R9L34', '898', '889.52', '8.48', 'user3', '2010-07-24 19:29:51');
INSERT INTO `dd_bill` VALUES ('14', 'dd2010724193352D1FQX', '898', '889.52', '8.48', 'user3', '2010-07-24 19:32:49');
INSERT INTO `dd_bill` VALUES ('15', 'dd20107261230543UHUA', '56', '50.34', '5.66', 'user3', '2010-07-26 12:29:47');
INSERT INTO `dd_bill` VALUES ('16', 'dd2010726123140GXCLU', '56', '50.34', '5.66', 'user3', '2010-07-26 12:30:33');
INSERT INTO `dd_bill` VALUES ('17', 'dd2010726123245RD3BB', '56', '50.34', '5.66', 'user3', '2010-07-26 12:31:38');
INSERT INTO `dd_bill` VALUES ('18', 'dd201072612370T1QBP', '56', '50.34', '5.66', 'user3', '2010-07-26 12:35:53');
INSERT INTO `dd_bill` VALUES ('19', 'dd20107261238305QOBS', '23', '17.34', '5.66', 'user3', '2010-07-26 12:37:23');
INSERT INTO `dd_bill` VALUES ('20', 'dd2010726124017235VY', '56', '50.34', '5.66', 'user3', '2010-07-26 12:39:10');
INSERT INTO `dd_bill` VALUES ('21', 'dd2010726124141I9RF9', '565', '559.34', '5.66', 'user3', '2010-07-26 12:40:34');
INSERT INTO `dd_bill` VALUES ('22', 'dd2010726124552GUCSG', '78', '72.34', '5.66', 'user3', '2010-07-26 12:44:45');
INSERT INTO `dd_bill` VALUES ('23', 'dd20108316145GLQT2', '600', '9.8', '590.2', 'user3', '2010-08-03 16:01:46');
INSERT INTO `dd_bill` VALUES ('24', 'dd2010831620266USNJ', '300', '92', '208', 'user3', '2010-08-03 16:20:26');

-- ----------------------------
-- Table structure for `dd_dic`
-- ----------------------------
DROP TABLE IF EXISTS `dd_dic`;
CREATE TABLE `dd_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(30) NOT NULL,
  `child` varchar(30) NOT NULL,
  `value` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_dic
-- ----------------------------
INSERT INTO `dd_dic` VALUES ('4', 'ems', '01', '邮政快递');
INSERT INTO `dd_dic` VALUES ('5', 'ems', '02', '申通快递');
INSERT INTO `dd_dic` VALUES ('6', 'ems', '03', '圆通速递');
INSERT INTO `dd_dic` VALUES ('7', 'ems', '04', '中通速递');
INSERT INTO `dd_dic` VALUES ('8', 'ems', '05', '宅急送快运');
INSERT INTO `dd_dic` VALUES ('9', 'ems', '06', '汇通速递');
INSERT INTO `dd_dic` VALUES ('10', 'pay', '01', '发货方付款');
INSERT INTO `dd_dic` VALUES ('11', 'pay', '02', '收货方付款');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='格子下架记录表，操作人，操作日期，下架物';

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
INSERT INTO `dd_down` VALUES ('9', '15', '201007150055313076', '3333', '3333', '2', '15', '3333', '', 'user3', '2010-07-24 20:18:25');
INSERT INTO `dd_down` VALUES ('10', '10', '201007091517158490', '8898', '001', '5', '8', 'user2', '', 'user1', '2010-07-26 16:52:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='库存表';

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
INSERT INTO `dd_inventory` VALUES ('10', '201007091517158490', '8898', '3', '8', '1', '88', 'user2', '8', '', '8', '', 'user1', '2010-07-09 15:17:15');
INSERT INTO `dd_inventory` VALUES ('11', '201007101757344099', '34534', '17', '3', '1', '33', 'user2', '3', '3', '3', '3', 'user1', '2010-07-10 17:57:34');
INSERT INTO `dd_inventory` VALUES ('12', '201007141729298718', '678', '5', '6', '0.56', '6', 'user2', '6', '6', '6', '6', 'user1', '2010-07-14 17:29:29');
INSERT INTO `dd_inventory` VALUES ('13', '201007141729306212', 'ooi', '37', '4', '1', '44', 'user2', '4', '4', '4', '4', 'user1', '2010-07-14 17:29:29');
INSERT INTO `dd_inventory` VALUES ('14', '201007141729309528', '456456', '0', '4', '1', '4', 'user2', '4', '44', '4', '4', 'user1', '2010-07-14 17:29:29');
INSERT INTO `dd_inventory` VALUES ('15', '201007150055313076', '3333', '36', '3', '1', '3', '3333', '3', '3', '3', '3', 'user1', '2010-07-15 00:55:31');
INSERT INTO `dd_inventory` VALUES ('16', '201007150055318560', '23234', '0', '3', '1', '3', '3333', '3', '3', '3', '3', 'user1', '2010-07-15 00:55:31');
INSERT INTO `dd_inventory` VALUES ('17', '010343604636', '测试产品1', '999937', '26', '1', '34.56', 'user2', '规格一', '材料一', '等级一', '场地已', 'user1', '2010-07-17 14:49:39');
INSERT INTO `dd_inventory` VALUES ('18', '201007201934562515', '456456', '-456424', '4', '1', '44', 'user2', '4', '4', '4', '4', 'user1', '2010-07-20 19:34:56');
INSERT INTO `dd_inventory` VALUES ('19', '201007261427509375', '测试商品', '211', '1.023', '1', '32.736', 'user2', '', '', '', '', 'user3', '2010-07-26 14:27:50');
INSERT INTO `dd_inventory` VALUES ('20', '201008021722013223', '新物品1', '999', '1', '1', '1234', 'user2', '', '', '', '', 'user1', '2010-08-02 17:22:01');

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
-- Table structure for `dd_product`
-- ----------------------------
DROP TABLE IF EXISTS `dd_product`;
CREATE TABLE `dd_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `price` float DEFAULT NULL,
  `type` char(255) NOT NULL,
  `status` char(255) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `userid` varchar(32) NOT NULL,
  `spec` varchar(32) DEFAULT NULL,
  `material` varchar(32) DEFAULT NULL,
  `grade` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `memo` varchar(300) DEFAULT NULL,
  `submitdate` datetime NOT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_product
-- ----------------------------
INSERT INTO `dd_product` VALUES ('2', '201008061943124463', '测试商品01', '56.23', '1', '1', '20091003199_.gif', 'user2', '规格11是', '规格11', '规格11', '规格11', '规格11', '2010-08-06 18:38:01', 'user1', '2010-08-06 19:35:51');
INSERT INTO `dd_product` VALUES ('3', '201008061943124429', '测试商品3', '88', '3', '1', '2009061808484530.jpg', 'user2', '规格11我', '规格11', '规格11', '规格11', '规格11', '2010-08-06 19:03:59', 'user1', '2010-08-06 19:35:44');
INSERT INTO `dd_product` VALUES ('4', '201008061943124469', '测试商品4', '2222.34', '2', '1', '2009061808484530.jpg', 'user2', '测试商品4', '测试商品4', '测试商品4', '测试商品4', '测试商品4', '2010-08-06 19:06:29', 'user1', '2010-08-06 19:43:12');

-- ----------------------------
-- Table structure for `dd_rsales`
-- ----------------------------
DROP TABLE IF EXISTS `dd_rsales`;
CREATE TABLE `dd_rsales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` varchar(64) DEFAULT NULL,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `operator` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='退货记录表';

-- ----------------------------
-- Records of dd_rsales
-- ----------------------------
INSERT INTO `dd_rsales` VALUES ('2', 'sss', 'ss', '是', '23', '士大夫', 'user3', '2010-07-24 20:09:53');

-- ----------------------------
-- Table structure for `dd_sales`
-- ----------------------------
DROP TABLE IF EXISTS `dd_sales`;
CREATE TABLE `dd_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` varchar(64) DEFAULT NULL,
  `barcode` varchar(128) NOT NULL,
  `name` varchar(10) NOT NULL,
  `discount` float NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `operator` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='售货记录表,卖出的数量要相应的从库存减去';

-- ----------------------------
-- Records of dd_sales
-- ----------------------------
INSERT INTO `dd_sales` VALUES ('1', 'dd201072418148ROWZW', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:14:08');
INSERT INTO `dd_sales` VALUES ('2', 'dd201072418148ROWZW', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:14:08');
INSERT INTO `dd_sales` VALUES ('3', 'dd201072418148ROWZW', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:14:08');
INSERT INTO `dd_sales` VALUES ('4', 'dd201072418148ROWZW', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:14:08');
INSERT INTO `dd_sales` VALUES ('5', 'dd2010724181445KP766', '010343604636', '测试产品1', '0.7', '1', '345345', 'user3', '2010-08-07 18:14:45');
INSERT INTO `dd_sales` VALUES ('6', 'dd2010724181445KP766', '010343604636', '测试产品1', '0.7', '1', '4456.04', 'user3', '2010-08-08 18:14:45');
INSERT INTO `dd_sales` VALUES ('7', 'dd2010724181445KP766', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:14:45');
INSERT INTO `dd_sales` VALUES ('8', 'dd2010724181445KP766', '010343604636', '测试产品1', '0.7', '1', '46786', 'user3', '2010-08-02 18:14:45');
INSERT INTO `dd_sales` VALUES ('9', 'dd2010724182612C95FU', '010343604636', '测试产品1', '0.7', '1', '4998.04', 'user3', '2010-08-05 18:26:12');
INSERT INTO `dd_sales` VALUES ('10', 'dd2010724182612C95FU', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:26:12');
INSERT INTO `dd_sales` VALUES ('11', 'dd2010724182612C95FU', '010343604636', '测试产品1', '0.7', '1233', '4.04', 'user3', '2010-08-03 18:26:12');
INSERT INTO `dd_sales` VALUES ('12', 'dd2010724182612C95FU', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:26:12');
INSERT INTO `dd_sales` VALUES ('13', 'dd2010724183631QVB26', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:36:31');
INSERT INTO `dd_sales` VALUES ('14', 'dd2010724183631QVB26', '010343604636', '测试产品1', '0.7', '1', '4000.04', 'user3', '2010-08-24 18:36:31');
INSERT INTO `dd_sales` VALUES ('15', 'dd2010724183631QVB26', '201007150055313076', '测试产品2', '0.7', '1', '4234.04', 'user3', '2010-08-05 18:36:31');
INSERT INTO `dd_sales` VALUES ('16', 'dd2010724183631QVB26', '010343604636', '测试产品3', '0.7', '1', '23334', 'user3', '2010-08-15 18:36:31');
INSERT INTO `dd_sales` VALUES ('17', 'dd2010724183738XV9O1', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:37:38');
INSERT INTO `dd_sales` VALUES ('18', 'dd2010724183738XV9O1', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:37:38');
INSERT INTO `dd_sales` VALUES ('19', 'dd2010724183738XV9O1', '010343604636', '测试产品4', '0.7', '1000', '43333', 'user3', '2010-07-24 18:37:38');
INSERT INTO `dd_sales` VALUES ('20', 'dd2010724183738XV9O1', '010343604636', '测试产品4', '0.7', '1', '4222.04', 'user3', '2010-07-24 18:37:38');
INSERT INTO `dd_sales` VALUES ('21', 'dd2010724183840WBBU5', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:38:40');
INSERT INTO `dd_sales` VALUES ('22', 'dd2010724183840WBBU5', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:38:40');
INSERT INTO `dd_sales` VALUES ('25', 'dd2010724185239MGEHT', '010343604636', '测试产品1', '0.7', '2', '4.04', 'user3', '2010-07-24 18:52:39');
INSERT INTO `dd_sales` VALUES ('26', 'dd2010724185239MGEHT', '010343604636', '测试产品1', '0.5', '1', '4.04', 'user3', '2010-07-24 18:52:39');
INSERT INTO `dd_sales` VALUES ('27', 'dd2010724185585SBQX', '010343604636', '测试产品1', '0.5', '1', '4.04', 'user3', '2010-07-24 18:55:08');
INSERT INTO `dd_sales` VALUES ('28', 'dd2010724185585SBQX', '010343604636', '测试产品1', '0.7', '2', '4.04', 'user3', '2010-07-24 18:55:08');
INSERT INTO `dd_sales` VALUES ('29', 'dd2010724185585SBQX', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:55:08');
INSERT INTO `dd_sales` VALUES ('30', 'dd2010724185525XYWC2', '010343604636', '测试产品1', '0.5', '1', '4.04', 'user3', '2010-07-24 18:55:25');
INSERT INTO `dd_sales` VALUES ('31', 'dd2010724185525XYWC2', '010343604636', '测试产品1', '0.7', '2', '4.04', 'user3', '2010-07-24 18:55:25');
INSERT INTO `dd_sales` VALUES ('32', 'dd2010724185525XYWC2', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 18:55:25');
INSERT INTO `dd_sales` VALUES ('33', 'dd2010724191457QGUFQ', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:13:53');
INSERT INTO `dd_sales` VALUES ('34', 'dd2010724191457QGUFQ', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:13:53');
INSERT INTO `dd_sales` VALUES ('35', 'dd2010724191457QGUFQ', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:13:53');
INSERT INTO `dd_sales` VALUES ('36', 'dd2010724191833A9IU2', '010343604636', '测试产品1', '0.7', '1', '40000', 'user3', '2010-07-24 19:17:30');
INSERT INTO `dd_sales` VALUES ('37', 'dd2010724191833A9IU2', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:17:30');
INSERT INTO `dd_sales` VALUES ('38', 'dd20107241921234TT3M', '010343604636', '测试产品12', '0.7', '1', '45644', 'user3', '2010-08-02 19:20:20');
INSERT INTO `dd_sales` VALUES ('39', 'dd20107241921234TT3M', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:20:20');
INSERT INTO `dd_sales` VALUES ('40', 'dd20107241921234TT3M', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:20:20');
INSERT INTO `dd_sales` VALUES ('41', 'dd2010724192647SQ33V', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:25:44');
INSERT INTO `dd_sales` VALUES ('42', 'dd2010724192647SQ33V', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:25:44');
INSERT INTO `dd_sales` VALUES ('43', 'dd2010724192647SQ33V', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:25:44');
INSERT INTO `dd_sales` VALUES ('44', 'dd2010724192914ECGS5', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:28:10');
INSERT INTO `dd_sales` VALUES ('45', 'dd2010724192914ECGS5', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:28:10');
INSERT INTO `dd_sales` VALUES ('46', 'dd2010724192914ECGS5', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:28:10');
INSERT INTO `dd_sales` VALUES ('47', 'dd2010724193054R9L34', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:29:51');
INSERT INTO `dd_sales` VALUES ('48', 'dd2010724193054R9L34', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:29:51');
INSERT INTO `dd_sales` VALUES ('49', 'dd2010724193054R9L34', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:29:51');
INSERT INTO `dd_sales` VALUES ('50', 'dd2010724193352D1FQX', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-24 19:32:49');
INSERT INTO `dd_sales` VALUES ('51', 'dd2010724193352D1FQX', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2009-07-24 19:32:49');
INSERT INTO `dd_sales` VALUES ('52', 'dd2010724193352D1FQX', '010343604636', '测试产品1', '0.7', '1', '600', 'user3', '2010-01-24 19:32:49');
INSERT INTO `dd_sales` VALUES ('53', 'dd20107261230543UHUA', '010343604636', '测试产品1', '0.7', '1', '12345', 'user3', '2008-07-26 12:29:47');
INSERT INTO `dd_sales` VALUES ('54', 'dd20107261230543UHUA', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-26 12:29:47');
INSERT INTO `dd_sales` VALUES ('55', 'dd2010726123140GXCLU', '010343604636', '测试产品1', '0.7', '1', '4000.04', 'user3', '2010-07-26 12:30:33');
INSERT INTO `dd_sales` VALUES ('56', 'dd2010726123140GXCLU', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-26 12:30:33');
INSERT INTO `dd_sales` VALUES ('57', 'dd2010726123245RD3BB', '010343604636', '测试产品1', '0.7', '1', '40000', 'user3', '2010-06-26 12:31:38');
INSERT INTO `dd_sales` VALUES ('58', 'dd2010726123245RD3BB', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-26 12:31:38');
INSERT INTO `dd_sales` VALUES ('59', 'dd201072612370T1QBP', '010343604636', '测试产品1', '0.7', '1', '500.04', 'user3', '2010-07-26 12:35:53');
INSERT INTO `dd_sales` VALUES ('60', 'dd201072612370T1QBP', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-26 12:35:53');
INSERT INTO `dd_sales` VALUES ('61', 'dd20107261238305QOBS', '010343604636', '测试产品1', '0.7', '1', '4000.04', 'user3', '2011-07-26 12:37:23');
INSERT INTO `dd_sales` VALUES ('62', 'dd20107261238305QOBS', '010343604636', '测试产品2', '0.7', '1', '4.04', 'user3', '2010-07-26 12:37:23');
INSERT INTO `dd_sales` VALUES ('63', 'dd2010726124017235VY', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-26 12:39:10');
INSERT INTO `dd_sales` VALUES ('64', 'dd2010726124017235VY', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-26 12:39:10');
INSERT INTO `dd_sales` VALUES ('65', 'dd2010726124141I9RF9', '010343604636', '测试产品1', '0.7', '1', '12333', 'user3', '2010-08-26 12:40:34');
INSERT INTO `dd_sales` VALUES ('66', 'dd2010726124141I9RF9', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-26 12:40:34');
INSERT INTO `dd_sales` VALUES ('67', 'dd2010726124552GUCSG', '010343604636', '测试产品1', '0.7', '1', '6575', 'user3', '2010-11-26 12:44:45');
INSERT INTO `dd_sales` VALUES ('68', 'dd2010726124552GUCSG', '010343604636', '测试产品1', '0.7', '1', '4.04', 'user3', '2010-07-26 12:44:45');
INSERT INTO `dd_sales` VALUES ('69', 'dd20108316145GLQT2', '10053022500481', '测试产品1', '1', '20', '26', 'user3', '2010-08-03 16:01:46');
INSERT INTO `dd_sales` VALUES ('70', 'dd20108316145GLQT2', '10053022500481', '测试产品1', '1', '1', '26', 'user3', '2010-08-03 16:01:46');
INSERT INTO `dd_sales` VALUES ('71', 'dd20108316145GLQT2', '10053022500481', '测试产品1', '0.7', '1', '26', 'user3', '2010-08-03 16:01:46');
INSERT INTO `dd_sales` VALUES ('72', 'dd20108316145GLQT2', '10053022500481', '测试产品1', '1', '1', '26', 'user3', '2010-08-03 16:01:46');
INSERT INTO `dd_sales` VALUES ('73', 'dd2010831620266USNJ', '10053022500481', '测试产品1', '1', '2', '26', 'user3', '2010-08-03 16:20:26');
INSERT INTO `dd_sales` VALUES ('74', 'dd2010831620266USNJ', '10053022500481', '测试产品1', '1', '1', '26', 'user3', '2010-08-03 16:20:26');
INSERT INTO `dd_sales` VALUES ('75', 'dd2010831620266USNJ', '10053022500481', '测试产品1', '1', '1', '26', 'user3', '2010-08-03 16:20:26');
INSERT INTO `dd_sales` VALUES ('76', 'dd2010831620266USNJ', '10053022500481', '测试产品1', '1', '1', '26', 'user3', '2010-08-03 16:20:26');
INSERT INTO `dd_sales` VALUES ('77', 'dd2010831620266USNJ', '10053022500481', '测试产品1', '1', '1', '26', 'user3', '2010-08-03 16:20:26');
INSERT INTO `dd_sales` VALUES ('78', 'dd2010831620266USNJ', '10053022500481', '测试产品1', '1', '1', '26', 'user3', '2010-08-03 16:20:26');
INSERT INTO `dd_sales` VALUES ('79', 'dd2010831620266USNJ', '10053022500481', '测试产品1', '1', '1', '26', 'user3', '2010-08-03 16:20:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='当前格子在售状态表，格子编号，物品编号，';

-- ----------------------------
-- Records of dd_sell
-- ----------------------------
INSERT INTO `dd_sell` VALUES ('1', '13', '201007141729306212', 'ooi', '33', '0', '13', null, 'user2');
INSERT INTO `dd_sell` VALUES ('2', '13', '201007141729306212', 'ooi', '12123', '0', '13', null, 'user2');
INSERT INTO `dd_sell` VALUES ('3', '15', '201007150055313076', '3333', '3333', '0', '15', null, '3333');
INSERT INTO `dd_sell` VALUES ('5', '15', '201007150055313076', '3333', '', '0', '15', null, '3333');
INSERT INTO `dd_sell` VALUES ('7', '17', '010343604636', '测试产品1', 'a98', '0', '4.04', null, 'user2');
INSERT INTO `dd_sell` VALUES ('8', '17', '010343604636', '测试产品1', '11', '1', '4.04', null, 'user2');
INSERT INTO `dd_sell` VALUES ('9', '17', '010343604636', '测试产品1', 'a11', '1', '4.04', '0.7', 'user2');
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
INSERT INTO `dd_sell` VALUES ('30', '18', '201007201934562515', '456456', '1.0', '456456', '4', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('31', '10', '201007091517158490', '8898', '001', '4', '8', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('32', '10', '201007091517158490', '8898', '002', '1', '8', '1', 'user2');
INSERT INTO `dd_sell` VALUES ('33', '20', '201008021722013223', '新物品1', 'a1', '1000', '1', '1', 'user2');

-- ----------------------------
-- Table structure for `dd_submit`
-- ----------------------------
DROP TABLE IF EXISTS `dd_submit`;
CREATE TABLE `dd_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) NOT NULL,
  `amount` int(11) NOT NULL,
  `place` varchar(300) NOT NULL,
  `ems` varchar(10) NOT NULL,
  `begin` datetime NOT NULL,
  `end` datetime NOT NULL,
  `pay` varchar(10) NOT NULL,
  `money` float NOT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `submitdate` datetime NOT NULL,
  `date` datetime DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='上货申请记录表';

-- ----------------------------
-- Records of dd_submit
-- ----------------------------

-- ----------------------------
-- Table structure for `dd_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `dd_transaction`;
CREATE TABLE `dd_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `shop` varchar(10) DEFAULT NULL,
  `from` varchar(128) DEFAULT NULL,
  `to` varchar(128) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `memo` varchar(128) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='电子钱包交易记录表';

-- ----------------------------
-- Records of dd_transaction
-- ----------------------------
INSERT INTO `dd_transaction` VALUES ('1', 'user2', '宏伊广场', 'AA0001', 'AA0002', '1', '234.43', '测试交易1', 'user1', '2010-07-26 17:40:03');

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='格子上架记录表，操作人，操作日期，上架物';

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
INSERT INTO `dd_upload` VALUES ('48', '18', '201007201934562515', '456456', '456456', '1.0', '4', '1', 'user2', 'user3', '2010-07-24 20:15:13');
INSERT INTO `dd_upload` VALUES ('51', '10', '201007091517158490', '8898', '8', '001', '8', '1', 'user2', 'user3', '2010-07-26 16:51:41');
INSERT INTO `dd_upload` VALUES ('52', '10', '201007091517158490', '8898', '1', '001', '8', '1', 'user2', 'user1', '2010-07-26 16:53:50');
INSERT INTO `dd_upload` VALUES ('53', '10', '201007091517158490', '8898', '1', '002', '8', '1', 'user2', 'user1', '2010-07-26 16:54:22');
INSERT INTO `dd_upload` VALUES ('54', '20', '201008021722013223', '新物品1', '1000', 'a1', '1', '1', 'user2', 'user1', '2010-08-02 17:34:53');

-- ----------------------------
-- Table structure for `dd_user`
-- ----------------------------
DROP TABLE IF EXISTS `dd_user`;
CREATE TABLE `dd_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `brand` varchar(3033) DEFAULT '',
  `password` varchar(128) NOT NULL,
  `type` char(1) NOT NULL,
  `status` char(1) NOT NULL,
  `idcard` varchar(32) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `submitdate` datetime DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`userid`,`idcard`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='用户表，分设计师，管理员，门店操作人员';

-- ----------------------------
-- Records of dd_user
-- ----------------------------
INSERT INTO `dd_user` VALUES ('1', 'user2', 'xx设计师', '1', '1', '2', '1', '4', '4', '4', '13761844061', '12345679', '45566', '4', '2010-07-03 13:03:07', '4', '2010-08-06 01:47:47');
INSERT INTO `dd_user` VALUES ('2', 'user1', 'xx管理员', '1', '1', '1', '1', '1', '1', '1', '137262728282', '4534535', '1', '1', '2010-07-03 19:26:15', '1', null);
INSERT INTO `dd_user` VALUES ('3', 'user3', 'xx店员', '1', '1', '3', '1', '1', '3', '333', '3', '3', '3', '3', '2010-07-04 14:42:13', '1', null);
INSERT INTO `dd_user` VALUES ('4', 'user4', 'xx测试人员', '1', '1', '4', '1', '1', '1', '2324', '123234', '1', '1', '1', '2010-07-04 14:43:12', 'user1', '2010-08-06 01:49:13');
INSERT INTO `dd_user` VALUES ('9', '3333', '2', '1', '1', '2', '1', '', '1', '', '333', '', '', '', '2010-07-04 06:37:47', '2', null);
INSERT INTO `dd_user` VALUES ('11', '333', '3', '1', '1', '2', '1', '', '1', '', '1', '1', '', '', '2010-07-04 06:40:31', '2', null);
INSERT INTO `dd_user` VALUES ('12', '678678', '6', '1', '1', '2', '1', '', '1', '', '222', '', '123', '', '2010-07-04 06:41:17', '2', null);
INSERT INTO `dd_user` VALUES ('14', '2', '2', '1', '1', '2', '1', '', '1', '', '56567', '', '', '', '2010-07-04 08:19:06', '2', '2010-07-08 09:36:03');
INSERT INTO `dd_user` VALUES ('15', '6666', '66', '1', '1', '2', '1', '', '1', '', '1', '1', '', '', '2010-07-07 12:28:57', '2', null);
INSERT INTO `dd_user` VALUES ('16', '444', '4', '1', '4', '4', '1', '', '1', '', '4', '', '', '', '2010-07-10 11:24:17', 'user1', null);
INSERT INTO `dd_user` VALUES ('17', '33333', '3', '1', '33', '2', '1', '3', '1', '3', '3', '3', '', '3', '2010-07-10 11:29:53', 'user1', '2010-07-10 11:29:53');
INSERT INTO `dd_user` VALUES ('18', 'C-3', '黑头', '1', '1', '1', '1', '1', '1', null, '88', '3', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('19', 'C-4', '塔卡莎', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('20', 'C-6', '玲紫猫', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('21', 'C-11', 'fly queen', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('22', 'C-12', 'CC饰品', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('23', 'C-15', '格里伏塔', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('24', 'C-16', 'NO3NO4', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('25', 'C-17', '七口七', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('26', 'C-18', 'STAR', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('27', 'C-19', '手绘世博', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('28', 'C-21', 'Gismo', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('29', 'C-22', '安静的静', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('30', 'C-23', '凤龙', '1', '11', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('31', 'C-24', '梵星手绘', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('32', 'C-26', 'BAO\'S', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('33', 'C-28', '元素X', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('34', 'C-31', '小红裙子', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('35', 'C-32', '兔子比尔', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('36', 'C-35', '自作自售', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('37', 'C-36', '麻椒', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('38', 'C-37', '陶格', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('39', 'C-50', '黑皮超人', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('40', 'C-51', 'BABY兔', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('41', 'C-52', '80\'s', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('42', 'C-55', '静闲舍', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('43', 'C-56', '雪·松', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('44', 'C-58', '森楠陶瓷', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('45', 'C-60', '黑嘛嘛', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('46', 'CIBOYS', 'CIBOYS', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('47', 'SN', '酸奶', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('48', 'WLL', '王赖赖', '1', '1', '1', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('49', 'test01', 'test01', '', '1', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:13:58', 'null', null);
INSERT INTO `dd_user` VALUES ('50', 'test02', 'test02', '', '1', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:17:05', null, null);
INSERT INTO `dd_user` VALUES ('51', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:19:03', null, null);
INSERT INTO `dd_user` VALUES ('52', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:21:15', null, null);
INSERT INTO `dd_user` VALUES ('53', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:21:19', null, null);
INSERT INTO `dd_user` VALUES ('54', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:23:26', null, null);
INSERT INTO `dd_user` VALUES ('55', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:23:42', null, null);
INSERT INTO `dd_user` VALUES ('56', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:24:10', null, null);
INSERT INTO `dd_user` VALUES ('57', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:24:30', null, null);
INSERT INTO `dd_user` VALUES ('58', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:25:10', null, null);
INSERT INTO `dd_user` VALUES ('59', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:25:44', null, null);
INSERT INTO `dd_user` VALUES ('60', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:27:00', null, null);
INSERT INTO `dd_user` VALUES ('61', 'test03', 'test03', '', '', '1', '1', '', '1', '', '', '', '', '', '2010-08-05 19:27:39', null, null);
INSERT INTO `dd_user` VALUES ('62', '43534', '3', '', '3', '2', '1', '', '1', '', '3', '', '', '', '2010-08-05 19:28:54', null, null);
INSERT INTO `dd_user` VALUES ('63', '43534t345', '3', '', '3', '2', '1', '', '1', '', '3', '', '', '', '2010-08-05 19:29:22', null, null);
INSERT INTO `dd_user` VALUES ('64', 'test111', 'test111', '', '1', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:35:22', null, null);
INSERT INTO `dd_user` VALUES ('65', '111', 'fasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:35:35', null, null);
INSERT INTO `dd_user` VALUES ('66', '', '', '', '', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:40:24', null, null);
INSERT INTO `dd_user` VALUES ('67', 'dsafas', 'ddddd', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:40:35', null, null);
INSERT INTO `dd_user` VALUES ('68', 'dfasdf', 'asdfas', '', 'ffsadf', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:43:05', null, null);
INSERT INTO `dd_user` VALUES ('69', 'asfsdafdsaf', 'sadfas', '', 'dfsadfsafds', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:43:15', null, null);
INSERT INTO `dd_user` VALUES ('70', 'sadfsaf', '', '', 'sadfsafsa', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:44:53', null, null);
INSERT INTO `dd_user` VALUES ('71', '123123', 'asdfasdf', '', '111111', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:45:13', null, null);
INSERT INTO `dd_user` VALUES ('72', 'werw', 'werwer', '', 'werwrwe', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:45:22', null, null);
INSERT INTO `dd_user` VALUES ('73', '', '', '', '', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:45:30', null, null);
INSERT INTO `dd_user` VALUES ('74', '', '', '', '', '2', '1', '', '1', '', '', '', '', '', '2010-08-05 19:49:01', null, null);
INSERT INTO `dd_user` VALUES ('75', '009', '009', '', '009', '1', '1', '', '1', '', '', '', '', '', '2010-08-05 19:49:18', null, null);
INSERT INTO `dd_user` VALUES ('76', '009009', '009009', '', '009', '1', '1', '', '1', '', '', '', '', '', '2010-08-05 19:50:31', null, null);
INSERT INTO `dd_user` VALUES ('77', '2323423', '2342342', '', '23', '1', '1', '', '1', '', '', '', '', '', '2010-08-05 20:03:05', null, null);
INSERT INTO `dd_user` VALUES ('78', '23424', '234', '', '234234', '1', '1', '', '1', '', '', '', '', '', '2010-08-05 20:09:18', null, null);
INSERT INTO `dd_user` VALUES ('79', '', 'test15333333', '', '', '1', '1', '', '1', '', '', '', '', '', '2010-08-05 20:16:28', null, null);
INSERT INTO `dd_user` VALUES ('80', '', '', '', '', '1', '1', '', '1', '', 'fad啊', '', '', '', '2010-08-05 20:16:39', null, null);
INSERT INTO `dd_user` VALUES ('81', 'test123123', 'test123123', '', 'test123123', '3', '1', '', '1', '', '', '', '', '', '2010-08-06 12:00:15', null, null);
INSERT INTO `dd_user` VALUES ('82', 'test155555', 'test155555', '', 'test155555', '1', '1', '', '1', '', '', '', '', '', '2010-08-06 12:05:34', 'user1', '2010-08-06 12:05:34');
INSERT INTO `dd_user` VALUES ('83', 'test1533333', 'test1533333', '', 'test1533333', '2', '1', '', '1', '', '', '', '', '', '2010-08-06 12:07:42', null, '2010-08-06 01:46:38');
INSERT INTO `dd_user` VALUES ('86', 'sdds', '', 'sdfs', '', '2', '0', 's', '1', 'sf', '', '', '', 's', '2010-08-06 12:51:01', null, null);
INSERT INTO `dd_user` VALUES ('87', '', '', '', '', '2', '0', '', '1', '', '', '', '', '', '2010-08-06 12:51:07', null, null);
INSERT INTO `dd_user` VALUES ('88', '', '', '', '', '2', '0', '', '1', '', '', '', '', '', '2010-08-06 12:51:46', null, null);
INSERT INTO `dd_user` VALUES ('89', '', '', '', '', '2', '0', '', '1', '', '', '', '', '', '2010-08-06 12:51:50', null, null);
INSERT INTO `dd_user` VALUES ('90', '', '', '', '', '2', '0', '', '1', '', '', '', '', '', '2010-08-06 12:53:30', null, null);
INSERT INTO `dd_user` VALUES ('91', '', '', '', '', '2', '0', '', '1', '', '', '', '', '', '2010-08-06 12:55:37', null, null);
INSERT INTO `dd_user` VALUES ('92', '23232332', '333222', '333333333333', '322332', '1', '1', '3333333333332222222', '1', '333333333333', '333333333333', '333333333333', '333333333333', '333333333333@com.com', '2010-08-06 13:29:08', 'user1', '2010-08-06 13:29:08');

-- ----------------------------
-- Table structure for `dd_wallet`
-- ----------------------------
DROP TABLE IF EXISTS `dd_wallet`;
CREATE TABLE `dd_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `bankname` varchar(128) DEFAULT NULL,
  `accounter` varchar(128) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `money` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设计师、商家电子钱包';

-- ----------------------------
-- Records of dd_wallet
-- ----------------------------
INSERT INTO `dd_wallet` VALUES ('1', 'user2', '2342232', '广州银行', '周建国', '上海', '2342.22');
