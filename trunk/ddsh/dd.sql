/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.206
Source Server Version : 50130
Source Host           : 192.168.1.206:3306
Source Database       : dd

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2010-08-13 18:10:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dd_active`
-- ----------------------------
DROP TABLE IF EXISTS `dd_active`;
CREATE TABLE `dd_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统公告';

-- ----------------------------
-- Records of dd_active
-- ----------------------------
INSERT INTO `dd_active` VALUES ('1', '33的风格', 'user1', '2010-07-15 00:12:17');
INSERT INTO `dd_active` VALUES ('2', '测试公告', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_active` VALUES ('3', '是是的', 'user1', '2010-08-12 14:41:47');

-- ----------------------------
-- Table structure for `dd_back`
-- ----------------------------
DROP TABLE IF EXISTS `dd_back`;
CREATE TABLE `dd_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) NOT NULL,
  `transaction` varchar(128) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `reason` varchar(20) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='物品审批退回记录表';

-- ----------------------------
-- Records of dd_back
-- ----------------------------
INSERT INTO `dd_back` VALUES ('44', '201008061943124469', null, '2', '02', '01', 'user1', '2010-08-07 02:39:34');
INSERT INTO `dd_back` VALUES ('45', '201008061943124469', null, '228', '01', '01', 'user1', '2010-08-07 02:46:53');
INSERT INTO `dd_back` VALUES ('46', '201008061943124463', null, '1', '03', '01', 'user3', '2010-08-07 13:00:39');
INSERT INTO `dd_back` VALUES ('47', '201008061943124463', null, '10', '03', '01', 'user3', '2010-08-07 13:01:34');
INSERT INTO `dd_back` VALUES ('48', '201008061943124463', 'www', '10', '03', '01', 'user3', '2010-08-07 13:03:26');
INSERT INTO `dd_back` VALUES ('49', '201008061943124463', null, '27', '02', '01', 'user1', '2010-08-07 13:15:13');
INSERT INTO `dd_back` VALUES ('50', '201008061943124463', null, '50', '02', '01', 'user4', '2010-08-07 13:15:46');
INSERT INTO `dd_back` VALUES ('51', '201008081551353320', null, '1', '02', '01', 'user1', '2010-08-09 12:01:51');
INSERT INTO `dd_back` VALUES ('52', '201008061943124463', null, '1', '01', '01', 'user1', '2010-08-09 15:38:50');
INSERT INTO `dd_back` VALUES ('53', '201008061943124463', null, '111', '01', '01', 'user1', '2010-08-09 15:43:57');
INSERT INTO `dd_back` VALUES ('54', '201008061943124463', null, '11', '01', '01', 'user1', '2010-08-09 15:43:57');
INSERT INTO `dd_back` VALUES ('55', '201008081551353320', '', '2', '03', '01', 'user3', '2010-08-11 10:44:12');
INSERT INTO `dd_back` VALUES ('56', '201008081551353320', '', '10', '03', '01', 'user3', '2010-08-11 10:44:42');
INSERT INTO `dd_back` VALUES ('57', '201008081551353320', '', '1', '03', '01', 'user3', '2010-08-11 10:44:56');
INSERT INTO `dd_back` VALUES ('58', '201008081551353320', '', '2', '03', '01', 'user3', '2010-08-11 10:45:06');
INSERT INTO `dd_back` VALUES ('59', '201008131447456845', null, '5', '01', '01', 'user1', '2010-08-13 15:00:38');
INSERT INTO `dd_back` VALUES ('60', '201008131447456845', null, '1', '02', '01', 'user1', '2010-08-13 15:09:32');

-- ----------------------------
-- Table structure for `dd_bill`
-- ----------------------------
DROP TABLE IF EXISTS `dd_bill`;
CREATE TABLE `dd_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` varchar(128) NOT NULL,
  `receive` float NOT NULL,
  `changes` float NOT NULL,
  `totalprice` float NOT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='电子钱包交易记录表';

-- ----------------------------
-- Records of dd_bill
-- ----------------------------
INSERT INTO `dd_bill` VALUES ('25', 'dd2010871254466SGIQ', '900', '590.73', '309.27', 'user3', '2010-08-07 12:54:46');
INSERT INTO `dd_bill` VALUES ('26', 'dd201088168371PJUQ', '1000', '760', '240', 'user3', '2010-08-08 16:07:10');
INSERT INTO `dd_bill` VALUES ('27', 'dd201081110405384EQ6', '300', '180', '120', 'user3', '2010-08-11 10:40:53');
INSERT INTO `dd_bill` VALUES ('28', 'dd201081110460YTPFQ', '1000', '160', '840', 'user3', '2010-08-11 10:46:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

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
INSERT INTO `dd_dic` VALUES ('12', 'back', '01', '验货退回');
INSERT INTO `dd_dic` VALUES ('13', 'back', '02', '库存退回');
INSERT INTO `dd_dic` VALUES ('14', 'back', '03', '售后退回');
INSERT INTO `dd_dic` VALUES ('15', 'reason', '01', '质量问题');
INSERT INTO `dd_dic` VALUES ('16', 'reason', '02', '售出率太低');
INSERT INTO `dd_dic` VALUES ('17', 'ems', '08', '德邦快递');
INSERT INTO `dd_dic` VALUES ('18', 'send', '01', '快递送货');
INSERT INTO `dd_dic` VALUES ('19', 'send', '02', '自助送货');
INSERT INTO `dd_dic` VALUES ('20', 'store', '01', '宏伊广场');
INSERT INTO `dd_dic` VALUES ('21', 'store', '02', '八佰伴');
INSERT INTO `dd_dic` VALUES ('22', 'store', '03', '徐家汇');
INSERT INTO `dd_dic` VALUES ('23', 'trans', '01', '充值');
INSERT INTO `dd_dic` VALUES ('24', 'trans', '02', '提现');
INSERT INTO `dd_dic` VALUES ('25', 'trans2', '03', '转账');
INSERT INTO `dd_dic` VALUES ('26', 'trans2', '04', '汇款');

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
  `amount` int(11) NOT NULL,
  `discount` float DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8 COMMENT='库存表';

-- ----------------------------
-- Records of dd_inventory
-- ----------------------------
INSERT INTO `dd_inventory` VALUES ('21', '201008061943124463', '10355', '1', 'user1', '2010-08-07 01:46:18');
INSERT INTO `dd_inventory` VALUES ('22', '201008081551353320', '0', '1', 'user1', '2010-08-08 16:01:24');
INSERT INTO `dd_inventory` VALUES ('23', '10080916530000', '100000', '1', 'user1', '2010-08-07 01:46:18');
INSERT INTO `dd_inventory` VALUES ('24', '10080916530001', '100000', '1', 'user1', '2010-08-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('25', '10080916530002', '100000', '1', 'user1', '2010-08-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('26', '10080916530003', '100000', '1', 'user1', '2010-08-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('27', '10080916530004', '100000', '1', 'user1', '2010-08-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('28', '10080916530005', '100000', '1', 'user1', '2010-08-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('29', '10080916530006', '100000', '1', 'user1', '2010-08-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('30', '10080916530007', '100000', '1', 'user1', '2010-08-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('31', '10080916530008', '100000', '1', 'user1', '2010-08-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('32', '10080916530009', '100000', '1', 'user1', '2010-08-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('33', '10080916530010', '100000', '1', 'user1', '2010-08-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('34', '10080916530011', '100000', '1', 'user1', '2010-08-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('35', '10080916530012', '100000', '1', 'user1', '2010-08-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('36', '10080916530013', '100000', '1', 'user1', '2010-08-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('37', '10080916530014', '100000', '1', 'user1', '2010-08-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('38', '10080916530015', '100000', '1', 'user1', '2010-08-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('39', '10080916530016', '100000', '1', 'user1', '2010-08-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('40', '10080916530017', '100000', '1', 'user1', '2010-08-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('41', '10080916530018', '100000', '1', 'user1', '2010-08-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('42', '10080916530019', '100000', '1', 'user1', '2010-08-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('43', '10080916530020', '100000', '1', 'user1', '2010-08-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('44', '10080916530021', '100000', '1', 'user1', '2010-08-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('45', '10080916530022', '100000', '1', 'user1', '2010-08-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('46', '10080916530023', '100000', '1', 'user1', '2010-08-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('47', '10080916530024', '100000', '1', 'user1', '2010-08-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('48', '10080916530025', '100000', '1', 'user1', '2010-09-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('49', '10080916530026', '100000', '1', 'user1', '2010-09-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('50', '10080916530027', '100000', '1', 'user1', '2010-09-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('51', '10080916530028', '100000', '1', 'user1', '2010-09-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('52', '10080916530029', '100000', '1', 'user1', '2010-09-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('53', '10080916530030', '100000', '1', 'user1', '2010-09-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('54', '10080916530031', '100000', '1', 'user1', '2010-09-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('55', '10080916530032', '100000', '1', 'user1', '2010-09-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('56', '10080916530033', '100000', '1', 'user1', '2010-09-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('57', '10080916530034', '100000', '1', 'user1', '2010-09-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('58', '10080916530035', '100000', '1', 'user1', '2010-09-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('59', '10080916530036', '100000', '1', 'user1', '2010-09-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('60', '10080916530037', '100000', '1', 'user1', '2010-09-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('61', '10080916530038', '100000', '1', 'user1', '2010-09-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('62', '10080916530039', '100000', '1', 'user1', '2010-09-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('63', '10080916530040', '100000', '1', 'user1', '2010-09-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('64', '10080916530041', '100000', '1', 'user1', '2010-09-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('65', '10080916530042', '100000', '1', 'user1', '2010-09-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('66', '10080916530043', '100000', '1', 'user1', '2010-09-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('67', '10080916530044', '100000', '1', 'user1', '2010-09-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('68', '10080916530045', '100000', '1', 'user1', '2010-09-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('69', '10080916530046', '100000', '1', 'user1', '2010-09-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('70', '10080916530047', '100000', '1', 'user1', '2010-09-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('71', '10080916530048', '100000', '1', 'user1', '2010-09-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('72', '10080916530049', '100000', '1', 'user1', '2010-09-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('73', '10080916530050', '100000', '1', 'user1', '2010-09-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('74', '10080916530051', '100000', '1', 'user1', '2010-09-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('75', '10080916530052', '100000', '1', 'user1', '2010-09-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('76', '10080916530053', '100000', '1', 'user1', '2010-09-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('77', '10080916530054', '100000', '1', 'user1', '2010-09-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('78', '10080916530055', '100000', '1', 'user1', '2010-10-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('79', '10080916530056', '100000', '1', 'user1', '2010-10-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('80', '10080916530057', '100000', '1', 'user1', '2010-10-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('81', '10080916530058', '100000', '1', 'user1', '2010-10-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('82', '10080916530059', '100000', '1', 'user1', '2010-10-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('83', '10080916530060', '100000', '1', 'user1', '2010-10-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('84', '10080916530061', '100000', '1', 'user1', '2010-10-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('85', '10080916530062', '100000', '1', 'user1', '2010-10-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('86', '10080916530063', '100000', '1', 'user1', '2010-10-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('87', '10080916530064', '100000', '1', 'user1', '2010-10-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('88', '10080916530065', '100000', '1', 'user1', '2010-10-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('89', '10080916530066', '100000', '1', 'user1', '2010-10-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('90', '10080916530067', '100000', '1', 'user1', '2010-10-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('91', '10080916530068', '100000', '1', 'user1', '2010-10-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('92', '10080916530069', '100000', '1', 'user1', '2010-10-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('93', '10080916530070', '100000', '1', 'user1', '2010-10-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('94', '10080916530071', '100000', '1', 'user1', '2010-10-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('95', '10080916530072', '100000', '1', 'user1', '2010-10-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('96', '10080916530073', '100000', '1', 'user1', '2010-10-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('97', '10080916530074', '100000', '1', 'user1', '2010-10-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('98', '10080916530075', '100000', '1', 'user1', '2010-10-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('99', '10080916530076', '100000', '1', 'user1', '2010-10-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('100', '10080916530077', '100000', '1', 'user1', '2010-10-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('101', '10080916530078', '100000', '1', 'user1', '2010-10-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('102', '10080916530079', '100000', '1', 'user1', '2010-10-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('103', '10080916530080', '100000', '1', 'user1', '2010-10-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('104', '10080916530081', '100000', '1', 'user1', '2010-10-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('105', '10080916530082', '100000', '1', 'user1', '2010-10-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('106', '10080916530083', '100000', '1', 'user1', '2010-10-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('107', '10080916530084', '100000', '1', 'user1', '2010-10-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('108', '10080916530085', '100000', '1', 'user1', '2010-10-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('109', '10080916530086', '100000', '1', 'user1', '2010-11-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('110', '10080916530087', '100000', '1', 'user1', '2010-11-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('111', '10080916530088', '100000', '1', 'user1', '2010-11-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('112', '10080916530089', '100000', '1', 'user1', '2010-11-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('113', '10080916530090', '100000', '1', 'user1', '2010-11-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('114', '10080916530091', '100000', '1', 'user1', '2010-11-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('115', '10080916530092', '100000', '1', 'user1', '2010-11-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('116', '10080916530093', '100000', '1', 'user1', '2010-11-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('117', '10080916530094', '100000', '1', 'user1', '2010-11-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('118', '10080916530095', '100000', '1', 'user1', '2010-11-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('119', '10080916530096', '100000', '1', 'user1', '2010-11-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('120', '10080916530097', '100000', '1', 'user1', '2010-11-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('121', '10080916530098', '100000', '1', 'user1', '2010-11-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('122', '10080916530099', '100000', '1', 'user1', '2010-11-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('123', '10080916530100', '100000', '1', 'user1', '2010-11-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('124', '10080916530101', '100000', '1', 'user1', '2010-11-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('125', '10080916530102', '100000', '1', 'user1', '2010-11-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('126', '10080916530103', '100000', '1', 'user1', '2010-11-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('127', '10080916530104', '100000', '1', 'user1', '2010-11-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('128', '10080916530105', '100000', '1', 'user1', '2010-11-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('129', '10080916530106', '100000', '1', 'user1', '2010-11-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('130', '10080916530107', '100000', '1', 'user1', '2010-11-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('131', '10080916530108', '100000', '1', 'user1', '2010-11-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('132', '10080916530109', '100000', '1', 'user1', '2010-11-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('133', '10080916530110', '100000', '1', 'user1', '2010-11-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('134', '10080916530111', '100000', '1', 'user1', '2010-11-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('135', '10080916530112', '100000', '1', 'user1', '2010-11-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('136', '10080916530113', '100000', '1', 'user1', '2010-11-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('137', '10080916530114', '100000', '1', 'user1', '2010-11-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('138', '10080916530115', '100000', '1', 'user1', '2010-11-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('139', '10080916530116', '100000', '1', 'user1', '2010-12-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('140', '10080916530117', '100000', '1', 'user1', '2010-12-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('141', '10080916530118', '100000', '1', 'user1', '2010-12-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('142', '10080916530119', '100000', '1', 'user1', '2010-12-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('143', '10080916530120', '100000', '1', 'user1', '2010-12-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('144', '10080916530121', '100000', '1', 'user1', '2010-12-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('145', '10080916530122', '100000', '1', 'user1', '2010-12-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('146', '10080916530123', '100000', '1', 'user1', '2010-12-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('147', '10080916530124', '100000', '1', 'user1', '2010-12-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('148', '10080916530125', '100000', '1', 'user1', '2010-12-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('149', '10080916530126', '100000', '1', 'user1', '2010-12-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('150', '10080916530127', '100000', '1', 'user1', '2010-12-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('151', '10080916530128', '100000', '1', 'user1', '2010-12-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('152', '10080916530129', '100000', '1', 'user1', '2010-12-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('153', '10080916530130', '100000', '1', 'user1', '2010-12-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('154', '10080916530131', '100000', '1', 'user1', '2010-12-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('155', '10080916530132', '100000', '1', 'user1', '2010-12-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('156', '10080916530133', '100000', '1', 'user1', '2010-12-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('157', '10080916530134', '100000', '1', 'user1', '2010-12-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('158', '10080916530135', '100000', '1', 'user1', '2010-12-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('159', '10080916530136', '100000', '1', 'user1', '2010-12-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('160', '10080916530137', '100000', '1', 'user1', '2010-12-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('161', '10080916530138', '100000', '1', 'user1', '2010-12-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('162', '10080916530139', '100000', '1', 'user1', '2010-12-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('163', '10080916530140', '100000', '1', 'user1', '2010-12-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('164', '10080916530141', '100000', '1', 'user1', '2010-12-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('165', '10080916530142', '100000', '1', 'user1', '2010-12-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('166', '10080916530143', '100000', '1', 'user1', '2010-12-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('167', '10080916530144', '100000', '1', 'user1', '2010-12-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('168', '10080916530145', '100000', '1', 'user1', '2010-12-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('169', '10080916530146', '100000', '1', 'user1', '2010-12-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('170', '10080916530147', '100000', '1', 'user1', '2011-01-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('171', '10080916530148', '100000', '1', 'user1', '2011-01-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('172', '10080916530149', '100000', '1', 'user1', '2011-01-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('173', '10080916530150', '100000', '1', 'user1', '2011-01-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('174', '10080916530151', '100000', '1', 'user1', '2011-01-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('175', '10080916530152', '100000', '1', 'user1', '2011-01-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('176', '10080916530153', '100000', '1', 'user1', '2011-01-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('177', '10080916530154', '100000', '1', 'user1', '2011-01-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('178', '10080916530155', '100000', '1', 'user1', '2011-01-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('179', '10080916530156', '100000', '1', 'user1', '2011-01-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('180', '10080916530157', '100000', '1', 'user1', '2011-01-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('181', '10080916530158', '100000', '1', 'user1', '2011-01-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('182', '10080916530159', '100000', '1', 'user1', '2011-01-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('183', '10080916530160', '100000', '1', 'user1', '2011-01-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('184', '10080916530161', '100000', '1', 'user1', '2011-01-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('185', '10080916530162', '100000', '1', 'user1', '2011-01-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('186', '10080916530163', '100000', '1', 'user1', '2011-01-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('187', '10080916530164', '100000', '1', 'user1', '2011-01-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('188', '10080916530165', '100000', '1', 'user1', '2011-01-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('189', '10080916530166', '100000', '1', 'user1', '2011-01-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('190', '10080916530167', '100000', '1', 'user1', '2011-01-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('191', '10080916530168', '100000', '1', 'user1', '2011-01-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('192', '10080916530169', '100000', '1', 'user1', '2011-01-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('193', '10080916530170', '100000', '1', 'user1', '2011-01-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('194', '10080916530171', '100000', '1', 'user1', '2011-01-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('195', '10080916530172', '100000', '1', 'user1', '2011-01-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('196', '10080916530173', '100000', '1', 'user1', '2011-01-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('197', '10080916530174', '100000', '1', 'user1', '2011-01-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('198', '10080916530175', '100000', '1', 'user1', '2011-01-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('199', '10080916530176', '100000', '1', 'user1', '2011-01-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('200', '10080916530177', '100000', '1', 'user1', '2011-01-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('201', '10080916530178', '100000', '1', 'user1', '2011-02-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('202', '10080916530179', '100000', '1', 'user1', '2011-02-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('203', '10080916530180', '100000', '1', 'user1', '2011-02-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('204', '10080916530181', '100000', '1', 'user1', '2011-02-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('205', '10080916530182', '100000', '1', 'user1', '2011-02-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('206', '10080916530183', '100000', '1', 'user1', '2011-02-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('207', '10080916530184', '100000', '1', 'user1', '2011-02-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('208', '10080916530185', '100000', '1', 'user1', '2011-02-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('209', '10080916530186', '100000', '1', 'user1', '2011-02-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('210', '10080916530187', '100000', '1', 'user1', '2011-02-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('211', '10080916530188', '100000', '1', 'user1', '2011-02-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('212', '10080916530189', '100000', '1', 'user1', '2011-02-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('213', '10080916530190', '100000', '1', 'user1', '2011-02-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('214', '10080916530191', '100000', '1', 'user1', '2011-02-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('215', '10080916530192', '100000', '1', 'user1', '2011-02-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('216', '10080916530193', '100000', '1', 'user1', '2011-02-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('217', '10080916530194', '100000', '1', 'user1', '2011-02-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('218', '10080916530195', '100000', '1', 'user1', '2011-02-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('219', '10080916530196', '100000', '1', 'user1', '2011-02-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('220', '10080916530197', '100000', '1', 'user1', '2011-02-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('221', '10080916530198', '100000', '1', 'user1', '2011-02-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('222', '10080916530199', '100000', '1', 'user1', '2011-02-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('223', '10080916530200', '100000', '1', 'user1', '2011-02-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('224', '10080916530201', '100000', '1', 'user1', '2011-02-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('225', '10080916530202', '100000', '1', 'user1', '2011-02-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('226', '10080916530203', '100000', '1', 'user1', '2011-02-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('227', '10080916530204', '100000', '1', 'user1', '2011-02-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('228', '10080916530205', '100000', '1', 'user1', '2011-02-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('229', '10080916530206', '100000', '1', 'user1', '2011-03-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('230', '10080916530207', '100000', '1', 'user1', '2011-03-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('231', '10080916530208', '100000', '1', 'user1', '2011-03-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('232', '10080916530209', '100000', '1', 'user1', '2011-03-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('233', '10080916530210', '100000', '1', 'user1', '2011-03-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('234', '10080916530211', '100000', '1', 'user1', '2011-03-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('235', '10080916530212', '100000', '1', 'user1', '2011-03-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('236', '10080916530213', '100000', '1', 'user1', '2011-03-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('237', '10080916530214', '100000', '1', 'user1', '2011-03-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('238', '10080916530215', '100000', '1', 'user1', '2011-03-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('239', '10080916530216', '100000', '1', 'user1', '2011-03-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('240', '10080916530217', '100000', '1', 'user1', '2011-03-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('241', '10080916530218', '100000', '1', 'user1', '2011-03-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('242', '10080916530219', '100000', '1', 'user1', '2011-03-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('243', '10080916530220', '100000', '1', 'user1', '2011-03-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('244', '10080916530221', '100000', '1', 'user1', '2011-03-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('245', '10080916530222', '100000', '1', 'user1', '2011-03-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('246', '10080916530223', '100000', '1', 'user1', '2011-03-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('247', '10080916530224', '100000', '1', 'user1', '2011-03-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('248', '10080916530225', '100000', '1', 'user1', '2011-03-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('249', '10080916530226', '100000', '1', 'user1', '2011-03-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('250', '10080916530227', '100000', '1', 'user1', '2011-03-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('251', '10080916530228', '100000', '1', 'user1', '2011-03-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('252', '10080916530229', '100000', '1', 'user1', '2011-03-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('253', '10080916530230', '100000', '1', 'user1', '2011-03-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('254', '10080916530231', '100000', '1', 'user1', '2011-03-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('255', '10080916530232', '100000', '1', 'user1', '2011-03-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('256', '10080916530233', '100000', '1', 'user1', '2011-03-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('257', '10080916530234', '100000', '1', 'user1', '2011-03-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('258', '10080916530235', '100000', '1', 'user1', '2011-03-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('259', '10080916530236', '100000', '1', 'user1', '2011-03-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('260', '10080916530237', '100000', '1', 'user1', '2011-04-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('261', '10080916530238', '100000', '1', 'user1', '2011-04-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('262', '10080916530239', '100000', '1', 'user1', '2011-04-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('263', '10080916530240', '100000', '1', 'user1', '2011-04-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('264', '10080916530241', '100000', '1', 'user1', '2011-04-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('265', '10080916530242', '100000', '1', 'user1', '2011-04-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('266', '10080916530243', '100000', '1', 'user1', '2011-04-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('267', '10080916530244', '100000', '1', 'user1', '2011-04-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('268', '10080916530245', '100000', '1', 'user1', '2011-04-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('269', '10080916530246', '100000', '1', 'user1', '2011-04-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('270', '10080916530247', '100000', '1', 'user1', '2011-04-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('271', '10080916530248', '100000', '1', 'user1', '2011-04-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('272', '10080916530249', '100000', '1', 'user1', '2011-04-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('273', '10080916530250', '100000', '1', 'user1', '2011-04-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('274', '10080916530251', '100000', '1', 'user1', '2011-04-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('275', '10080916530252', '100000', '1', 'user1', '2011-04-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('276', '10080916530253', '100000', '1', 'user1', '2011-04-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('277', '10080916530254', '100000', '1', 'user1', '2011-04-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('278', '10080916530255', '100000', '1', 'user1', '2011-04-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('279', '10080916530256', '100000', '1', 'user1', '2011-04-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('280', '10080916530257', '100000', '1', 'user1', '2011-04-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('281', '10080916530258', '100000', '1', 'user1', '2011-04-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('282', '10080916530259', '100000', '1', 'user1', '2011-04-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('283', '10080916530260', '100000', '1', 'user1', '2011-04-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('284', '10080916530261', '100000', '1', 'user1', '2011-04-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('285', '10080916530262', '100000', '1', 'user1', '2011-04-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('286', '10080916530263', '100000', '1', 'user1', '2011-04-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('287', '10080916530264', '100000', '1', 'user1', '2011-04-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('288', '10080916530265', '100000', '1', 'user1', '2011-04-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('289', '10080916530266', '100000', '1', 'user1', '2011-04-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('290', '10080916530267', '100000', '1', 'user1', '2011-05-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('291', '10080916530268', '100000', '1', 'user1', '2011-05-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('292', '10080916530269', '100000', '1', 'user1', '2011-05-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('293', '10080916530270', '100000', '1', 'user1', '2011-05-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('294', '10080916530271', '100000', '1', 'user1', '2011-05-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('295', '10080916530272', '100000', '1', 'user1', '2011-05-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('296', '10080916530273', '100000', '1', 'user1', '2011-05-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('297', '10080916530274', '100000', '1', 'user1', '2011-05-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('298', '10080916530275', '100000', '1', 'user1', '2011-05-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('299', '10080916530276', '100000', '1', 'user1', '2011-05-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('300', '10080916530277', '100000', '1', 'user1', '2011-05-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('301', '10080916530278', '100000', '1', 'user1', '2011-05-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('302', '10080916530279', '100000', '1', 'user1', '2011-05-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('303', '10080916530280', '100000', '1', 'user1', '2011-05-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('304', '10080916530281', '100000', '1', 'user1', '2011-05-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('305', '10080916530282', '100000', '1', 'user1', '2011-05-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('306', '10080916530283', '100000', '1', 'user1', '2011-05-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('307', '10080916530284', '100000', '1', 'user1', '2011-05-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('308', '10080916530285', '100000', '1', 'user1', '2011-05-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('309', '10080916530286', '100000', '1', 'user1', '2011-05-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('310', '10080916530287', '100000', '1', 'user1', '2011-05-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('311', '10080916530288', '100000', '1', 'user1', '2011-05-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('312', '10080916530289', '100000', '1', 'user1', '2011-05-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('313', '10080916530290', '100000', '1', 'user1', '2011-05-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('314', '10080916530291', '100000', '1', 'user1', '2011-05-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('315', '10080916530292', '100000', '1', 'user1', '2011-05-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('316', '10080916530293', '100000', '1', 'user1', '2011-05-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('317', '10080916530294', '100000', '1', 'user1', '2011-05-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('318', '10080916530295', '100000', '1', 'user1', '2011-05-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('319', '10080916530296', '100000', '1', 'user1', '2011-05-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('320', '10080916530297', '100000', '1', 'user1', '2011-05-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('321', '10080916530298', '100000', '1', 'user1', '2011-06-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('322', '10080916530299', '100000', '1', 'user1', '2011-06-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('323', '10080916530300', '100000', '1', 'user1', '2011-06-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('324', '10080916530301', '100000', '1', 'user1', '2011-06-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('325', '10080916530302', '100000', '1', 'user1', '2011-06-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('326', '10080916530303', '100000', '1', 'user1', '2011-06-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('327', '10080916530304', '100000', '1', 'user1', '2011-06-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('328', '10080916530305', '100000', '1', 'user1', '2011-06-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('329', '10080916530306', '100000', '1', 'user1', '2011-06-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('330', '10080916530307', '100000', '1', 'user1', '2011-06-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('331', '10080916530308', '100000', '1', 'user1', '2011-06-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('332', '10080916530309', '100000', '1', 'user1', '2011-06-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('333', '10080916530310', '100000', '1', 'user1', '2011-06-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('334', '10080916530311', '100000', '1', 'user1', '2011-06-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('335', '10080916530312', '100000', '1', 'user1', '2011-06-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('336', '10080916530313', '100000', '1', 'user1', '2011-06-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('337', '10080916530314', '100000', '1', 'user1', '2011-06-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('338', '10080916530315', '100000', '1', 'user1', '2011-06-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('339', '10080916530316', '100000', '1', 'user1', '2011-06-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('340', '10080916530317', '100000', '1', 'user1', '2011-06-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('341', '10080916530318', '100000', '1', 'user1', '2011-06-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('342', '10080916530319', '100000', '1', 'user1', '2011-06-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('343', '10080916530320', '100000', '1', 'user1', '2011-06-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('344', '10080916530321', '100000', '1', 'user1', '2011-06-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('345', '10080916530322', '100000', '1', 'user1', '2011-06-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('346', '10080916530323', '100000', '1', 'user1', '2011-06-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('347', '10080916530324', '100000', '1', 'user1', '2011-06-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('348', '10080916530325', '100000', '1', 'user1', '2011-06-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('349', '10080916530326', '100000', '1', 'user1', '2011-06-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('350', '10080916530327', '100000', '1', 'user1', '2011-06-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('351', '10080916530328', '100000', '1', 'user1', '2011-07-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('352', '10080916530329', '100000', '1', 'user1', '2011-07-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('353', '10080916530330', '100000', '1', 'user1', '2011-07-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('354', '10080916530331', '100000', '1', 'user1', '2011-07-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('355', '10080916530332', '100000', '1', 'user1', '2011-07-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('356', '10080916530333', '100000', '1', 'user1', '2011-07-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('357', '10080916530334', '100000', '1', 'user1', '2011-07-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('358', '10080916530335', '100000', '1', 'user1', '2011-07-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('359', '10080916530336', '100000', '1', 'user1', '2011-07-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('360', '10080916530337', '100000', '1', 'user1', '2011-07-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('361', '10080916530338', '100000', '1', 'user1', '2011-07-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('362', '10080916530339', '100000', '1', 'user1', '2011-07-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('363', '10080916530340', '100000', '1', 'user1', '2011-07-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('364', '10080916530341', '100000', '1', 'user1', '2011-07-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('365', '10080916530342', '100000', '1', 'user1', '2011-07-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('366', '10080916530343', '100000', '1', 'user1', '2011-07-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('367', '10080916530344', '100000', '1', 'user1', '2011-07-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('368', '10080916530345', '100000', '1', 'user1', '2011-07-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('369', '10080916530346', '100000', '1', 'user1', '2011-07-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('370', '10080916530347', '100000', '1', 'user1', '2011-07-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('371', '10080916530348', '100000', '1', 'user1', '2011-07-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('372', '10080916530349', '100000', '1', 'user1', '2011-07-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('373', '10080916530350', '100000', '1', 'user1', '2011-07-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('374', '10080916530351', '100000', '1', 'user1', '2011-07-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('375', '10080916530352', '100000', '1', 'user1', '2011-07-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('376', '10080916530353', '100000', '1', 'user1', '2011-07-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('377', '10080916530354', '100000', '1', 'user1', '2011-07-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('378', '10080916530355', '100000', '1', 'user1', '2011-07-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('379', '10080916530356', '100000', '1', 'user1', '2011-07-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('380', '10080916530357', '100000', '1', 'user1', '2011-07-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('381', '10080916530358', '100000', '1', 'user1', '2011-07-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('382', '10080916530359', '100000', '1', 'user1', '2011-08-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('383', '10080916530360', '100000', '1', 'user1', '2011-08-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('384', '10080916530361', '100000', '1', 'user1', '2011-08-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('385', '10080916530362', '100000', '1', 'user1', '2011-08-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('386', '10080916530363', '100000', '1', 'user1', '2011-08-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('387', '10080916530364', '100000', '1', 'user1', '2011-08-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('388', '10080916530365', '100000', '1', 'user1', '2011-08-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('389', '10080916530366', '100000', '1', 'user1', '2011-08-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('390', '10080916530367', '100000', '1', 'user1', '2011-08-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('391', '10080916530368', '100000', '1', 'user1', '2011-08-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('392', '10080916530369', '100000', '1', 'user1', '2011-08-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('393', '10080916530370', '100000', '1', 'user1', '2011-08-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('394', '10080916530371', '100000', '1', 'user1', '2011-08-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('395', '10080916530372', '100000', '1', 'user1', '2011-08-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('396', '10080916530373', '100000', '1', 'user1', '2011-08-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('397', '10080916530374', '100000', '1', 'user1', '2011-08-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('398', '10080916530375', '100000', '1', 'user1', '2011-08-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('399', '10080916530376', '100000', '1', 'user1', '2011-08-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('400', '10080916530377', '100000', '1', 'user1', '2011-08-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('401', '10080916530378', '100000', '1', 'user1', '2011-08-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('402', '10080916530379', '100000', '1', 'user1', '2011-08-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('403', '10080916530380', '100000', '1', 'user1', '2011-08-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('404', '10080916530381', '100000', '1', 'user1', '2011-08-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('405', '10080916530382', '100000', '1', 'user1', '2011-08-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('406', '10080916530383', '100000', '1', 'user1', '2011-08-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('407', '10080916530384', '100000', '1', 'user1', '2011-08-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('408', '10080916530385', '100000', '1', 'user1', '2011-08-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('409', '10080916530386', '100000', '1', 'user1', '2011-08-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('410', '10080916530387', '100000', '1', 'user1', '2011-08-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('411', '10080916530388', '100000', '1', 'user1', '2011-08-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('412', '10080916530389', '100000', '1', 'user1', '2011-08-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('413', '10080916530390', '100000', '1', 'user1', '2011-09-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('414', '10080916530391', '100000', '1', 'user1', '2011-09-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('415', '10080916530392', '100000', '1', 'user1', '2011-09-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('416', '10080916530393', '100000', '1', 'user1', '2011-09-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('417', '10080916530394', '100000', '1', 'user1', '2011-09-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('418', '10080916530395', '100000', '1', 'user1', '2011-09-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('419', '10080916530396', '100000', '1', 'user1', '2011-09-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('420', '10080916530397', '100000', '1', 'user1', '2011-09-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('421', '10080916530398', '100000', '1', 'user1', '2011-09-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('422', '10080916530399', '100000', '1', 'user1', '2011-09-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('423', '10080916530400', '100000', '1', 'user1', '2011-09-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('424', '10080916530401', '100000', '1', 'user1', '2011-09-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('425', '10080916530402', '100000', '1', 'user1', '2011-09-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('426', '10080916530403', '100000', '1', 'user1', '2011-09-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('427', '10080916530404', '100000', '1', 'user1', '2011-09-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('428', '10080916530405', '100000', '1', 'user1', '2011-09-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('429', '10080916530406', '100000', '1', 'user1', '2011-09-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('430', '10080916530407', '100000', '1', 'user1', '2011-09-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('431', '10080916530408', '100000', '1', 'user1', '2011-09-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('432', '10080916530409', '100000', '1', 'user1', '2011-09-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('433', '10080916530410', '100000', '1', 'user1', '2011-09-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('434', '10080916530411', '100000', '1', 'user1', '2011-09-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('435', '10080916530412', '100000', '1', 'user1', '2011-09-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('436', '10080916530413', '100000', '1', 'user1', '2011-09-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('437', '10080916530414', '100000', '1', 'user1', '2011-09-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('438', '10080916530415', '100000', '1', 'user1', '2011-09-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('439', '10080916530416', '100000', '1', 'user1', '2011-09-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('440', '10080916530417', '100000', '1', 'user1', '2011-09-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('441', '10080916530418', '100000', '1', 'user1', '2011-09-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('442', '10080916530419', '100000', '1', 'user1', '2011-09-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('443', '10080916530420', '100000', '1', 'user1', '2011-10-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('444', '10080916530421', '100000', '1', 'user1', '2011-10-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('445', '10080916530422', '100000', '1', 'user1', '2011-10-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('446', '10080916530423', '100000', '1', 'user1', '2011-10-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('447', '10080916530424', '100000', '1', 'user1', '2011-10-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('448', '10080916530425', '100000', '1', 'user1', '2011-10-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('449', '10080916530426', '100000', '1', 'user1', '2011-10-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('450', '10080916530427', '100000', '1', 'user1', '2011-10-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('451', '10080916530428', '100000', '1', 'user1', '2011-10-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('452', '10080916530429', '100000', '1', 'user1', '2011-10-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('453', '10080916530430', '100000', '1', 'user1', '2011-10-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('454', '10080916530431', '100000', '1', 'user1', '2011-10-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('455', '10080916530432', '100000', '1', 'user1', '2011-10-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('456', '10080916530433', '100000', '1', 'user1', '2011-10-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('457', '10080916530434', '100000', '1', 'user1', '2011-10-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('458', '10080916530435', '100000', '1', 'user1', '2011-10-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('459', '10080916530436', '100000', '1', 'user1', '2011-10-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('460', '10080916530437', '100000', '1', 'user1', '2011-10-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('461', '10080916530438', '100000', '1', 'user1', '2011-10-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('462', '10080916530439', '100000', '1', 'user1', '2011-10-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('463', '10080916530440', '100000', '1', 'user1', '2011-10-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('464', '10080916530441', '100000', '1', 'user1', '2011-10-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('465', '10080916530442', '100000', '1', 'user1', '2011-10-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('466', '10080916530443', '100000', '1', 'user1', '2011-10-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('467', '10080916530444', '100000', '1', 'user1', '2011-10-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('468', '10071918140010', '100000', '1', 'user1', '2011-10-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('469', '10080916530446', '100000', '1', 'user1', '2011-10-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('470', '10080916530447', '100000', '1', 'user1', '2011-10-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('471', '10080916530448', '100000', '1', 'user1', '2011-10-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('472', '10080916530449', '100000', '1', 'user1', '2011-10-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('473', '10080916530450', '100000', '1', 'user1', '2011-10-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('474', '10080916530451', '100000', '1', 'user1', '2011-11-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('475', '10080916530452', '100000', '1', 'user1', '2011-11-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('476', '10080916530453', '100000', '1', 'user1', '2011-11-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('477', '10080916530454', '100000', '1', 'user1', '2011-11-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('478', '10080916530455', '100000', '1', 'user1', '2011-11-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('479', '10080916530456', '100000', '1', 'user1', '2011-11-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('480', '10080916530457', '100000', '1', 'user1', '2011-11-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('481', '10080916530458', '100000', '1', 'user1', '2011-11-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('482', '10080916530459', '100000', '1', 'user1', '2011-11-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('483', '10080916530460', '100000', '1', 'user1', '2011-11-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('484', '10080916530461', '100000', '1', 'user1', '2011-11-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('485', '10080916530462', '100000', '1', 'user1', '2011-11-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('486', '10080916530463', '100000', '1', 'user1', '2011-11-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('487', '10080916530464', '100000', '1', 'user1', '2011-11-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('488', '10080916530465', '100000', '1', 'user1', '2011-11-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('489', '10080916530466', '100000', '1', 'user1', '2011-11-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('490', '10080916530467', '100000', '1', 'user1', '2011-11-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('491', '10080916530468', '100000', '1', 'user1', '2011-11-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('492', '10080916530469', '100000', '1', 'user1', '2011-11-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('493', '10080916530470', '100000', '1', 'user1', '2011-11-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('494', '10080916530471', '100000', '1', 'user1', '2011-11-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('495', '10080916530472', '100000', '1', 'user1', '2011-11-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('496', '10080916530473', '100000', '1', 'user1', '2011-11-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('497', '10080916530474', '100000', '1', 'user1', '2011-11-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('498', '10080916530475', '100000', '1', 'user1', '2011-11-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('499', '10080916530476', '100000', '1', 'user1', '2011-11-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('500', '10080916530477', '100000', '1', 'user1', '2011-11-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('501', '10080916530478', '100000', '1', 'user1', '2011-11-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('502', '10080916530479', '100000', '1', 'user1', '2011-11-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('503', '10080916530480', '100000', '1', 'user1', '2011-11-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('504', '10080916530481', '100000', '1', 'user1', '2011-12-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('505', '10080916530482', '100000', '1', 'user1', '2011-12-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('506', '10080916530483', '100000', '1', 'user1', '2011-12-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('507', '10080916530484', '100000', '1', 'user1', '2011-12-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('508', '10080916530485', '100000', '1', 'user1', '2011-12-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('509', '10080916530486', '100000', '1', 'user1', '2011-12-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('510', '10080916530487', '100000', '1', 'user1', '2011-12-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('511', '10080916530488', '100000', '1', 'user1', '2011-12-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('512', '10080916530489', '100000', '1', 'user1', '2011-12-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('513', '10080916530490', '100000', '1', 'user1', '2011-12-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('514', '10080916530491', '100000', '1', 'user1', '2011-12-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('515', '10080916530492', '100000', '1', 'user1', '2011-12-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('516', '10080916530493', '100000', '1', 'user1', '2011-12-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('517', '10080916530494', '100000', '1', 'user1', '2011-12-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('518', '10080916530495', '100000', '1', 'user1', '2011-12-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('519', '10080916530496', '100000', '1', 'user1', '2011-12-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('520', '10080916530497', '100000', '1', 'user1', '2011-12-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('521', '10080916530498', '100000', '1', 'user1', '2011-12-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('522', '10080916530499', '100000', '1', 'user1', '2011-12-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('523', '10080916530500', '100000', '1', 'user1', '2011-12-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('524', '10080916530501', '100000', '1', 'user1', '2011-12-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('525', '10080916530502', '100000', '1', 'user1', '2011-12-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('526', '10080916530503', '100000', '1', 'user1', '2011-12-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('527', '10080916530504', '100000', '1', 'user1', '2011-12-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('528', '10080916530505', '100000', '1', 'user1', '2011-12-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('529', '10080916530506', '100000', '1', 'user1', '2011-12-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('530', '10080916530507', '100000', '1', 'user1', '2011-12-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('531', '10080916530508', '100000', '1', 'user1', '2011-12-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('532', '10080916530509', '100000', '1', 'user1', '2011-12-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('533', '10080916530510', '100000', '1', 'user1', '2011-12-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('534', '10080916530511', '100000', '1', 'user1', '2011-12-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('535', '10080916530512', '100000', '1', 'user1', '2012-01-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('536', '10080916530513', '100000', '1', 'user1', '2012-01-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('537', '10080916530514', '100000', '1', 'user1', '2012-01-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('538', '10080916530515', '100000', '1', 'user1', '2012-01-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('539', '10080916530516', '100000', '1', 'user1', '2012-01-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('540', '10080916530517', '100000', '1', 'user1', '2012-01-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('541', '10080916530518', '100000', '1', 'user1', '2012-01-07 01:46:17');
INSERT INTO `dd_inventory` VALUES ('542', '10080916530519', '100000', '1', 'user1', '2012-01-08 01:46:17');
INSERT INTO `dd_inventory` VALUES ('543', '10080916530520', '100000', '1', 'user1', '2012-01-09 01:46:17');
INSERT INTO `dd_inventory` VALUES ('544', '10080916530521', '100000', '1', 'user1', '2012-01-10 01:46:17');
INSERT INTO `dd_inventory` VALUES ('545', '10080916530522', '100000', '1', 'user1', '2012-01-11 01:46:17');
INSERT INTO `dd_inventory` VALUES ('546', '10080916530523', '100000', '1', 'user1', '2012-01-12 01:46:17');
INSERT INTO `dd_inventory` VALUES ('547', '10080916530524', '100000', '1', 'user1', '2012-01-13 01:46:17');
INSERT INTO `dd_inventory` VALUES ('548', '10080916530525', '100000', '1', 'user1', '2012-01-14 01:46:17');
INSERT INTO `dd_inventory` VALUES ('549', '10080916530526', '100000', '1', 'user1', '2012-01-15 01:46:17');
INSERT INTO `dd_inventory` VALUES ('550', '10080916530527', '100000', '1', 'user1', '2012-01-16 01:46:17');
INSERT INTO `dd_inventory` VALUES ('551', '10080916530528', '100000', '1', 'user1', '2012-01-17 01:46:17');
INSERT INTO `dd_inventory` VALUES ('552', '10080916530529', '100000', '1', 'user1', '2012-01-18 01:46:17');
INSERT INTO `dd_inventory` VALUES ('553', '10080916530530', '100000', '1', 'user1', '2012-01-19 01:46:17');
INSERT INTO `dd_inventory` VALUES ('554', '10080916530531', '100000', '1', 'user1', '2012-01-20 01:46:17');
INSERT INTO `dd_inventory` VALUES ('555', '10080916530532', '100000', '1', 'user1', '2012-01-21 01:46:17');
INSERT INTO `dd_inventory` VALUES ('556', '10080916530533', '100000', '1', 'user1', '2012-01-22 01:46:17');
INSERT INTO `dd_inventory` VALUES ('557', '10080916530534', '100000', '1', 'user1', '2012-01-23 01:46:17');
INSERT INTO `dd_inventory` VALUES ('558', '10080916530535', '100000', '1', 'user1', '2012-01-24 01:46:17');
INSERT INTO `dd_inventory` VALUES ('559', '10080916530536', '100000', '1', 'user1', '2012-01-25 01:46:17');
INSERT INTO `dd_inventory` VALUES ('560', '10080916530537', '100000', '1', 'user1', '2012-01-26 01:46:17');
INSERT INTO `dd_inventory` VALUES ('561', '10080916530538', '100000', '1', 'user1', '2012-01-27 01:46:17');
INSERT INTO `dd_inventory` VALUES ('562', '10080916530539', '100000', '1', 'user1', '2012-01-28 01:46:17');
INSERT INTO `dd_inventory` VALUES ('563', '10080916530540', '100000', '1', 'user1', '2012-01-29 01:46:17');
INSERT INTO `dd_inventory` VALUES ('564', '10080916530541', '100000', '1', 'user1', '2012-01-30 01:46:17');
INSERT INTO `dd_inventory` VALUES ('565', '10080916530542', '100000', '1', 'user1', '2012-01-31 01:46:17');
INSERT INTO `dd_inventory` VALUES ('566', '10080916530543', '100000', '1', 'user1', '2012-02-01 01:46:17');
INSERT INTO `dd_inventory` VALUES ('567', '10080916530544', '100000', '1', 'user1', '2012-02-02 01:46:17');
INSERT INTO `dd_inventory` VALUES ('568', '10080916530545', '100000', '1', 'user1', '2012-02-03 01:46:17');
INSERT INTO `dd_inventory` VALUES ('569', '10080916530546', '100000', '1', 'user1', '2012-02-04 01:46:17');
INSERT INTO `dd_inventory` VALUES ('570', '10080916530547', '100000', '1', 'user1', '2012-02-05 01:46:17');
INSERT INTO `dd_inventory` VALUES ('571', '10080916530548', '100000', '1', 'user1', '2012-02-06 01:46:17');
INSERT INTO `dd_inventory` VALUES ('572', '201008131447456845', '5', '1', 'user1', '2010-08-13 15:01:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='系统公告';

-- ----------------------------
-- Records of dd_notice
-- ----------------------------
INSERT INTO `dd_notice` VALUES ('1', '格子公社【王府井店】店面转移 暂停营业通告', '33的风格', 'user1', '2010-07-15 00:12:17');
INSERT INTO `dd_notice` VALUES ('2', '格子公社【王府井店】店面转移 暂停营业通告', '3333', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_notice` VALUES ('3', '格子公社【王府井店】店面转移 暂停营业通告', '测试公告', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_notice` VALUES ('4', '格子公社【王府井店】店面转移 暂停营业通告', '测试公告', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_notice` VALUES ('5', '格子公社【王府井店】店面转移 暂停营业通告', '测试公告', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_notice` VALUES ('6', '格子公社【王府井店】店面转移 暂停营业通告', '测试公告', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_notice` VALUES ('7', '格子公社【王府井店】店面转移 暂停营业通告', '2011年科技计划项目网上申报已于7月31日18:00结束，申报系统不再受理新的项目，但申报用户可继续登录网上业务平台查看已申报项目的内容，并可进行打印操作。', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_notice` VALUES ('8', '格子公社【王府井店】店面转移 暂停营业通告', '测试公告', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_notice` VALUES ('9', '格子公社【王府井店】店面转移 暂停营业通告', '测试公告', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_notice` VALUES ('10', '格子公社【王府井店】店面转移 暂停营业通告', '测试公告', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_notice` VALUES ('11', '格子公社【王府井店】店面转移 暂停营业通告', '测试公告', 'user1', '2010-07-15 00:36:19');
INSERT INTO `dd_notice` VALUES ('12', '格子公社【王府井店】店面转移 暂停营业通告', '测试公告', 'user1', '2010-07-15 00:36:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=2485 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dd_product
-- ----------------------------
INSERT INTO `dd_product` VALUES ('2', '201008061943124463', '测试商品01', '56.23', '1', '1', '20091003199_.gif', 'user2', '规格11是', '规格11', '规格11', '规格11', '规格11', '2010-08-06 18:38:01', 'user1', '2010-08-07 16:16:24');
INSERT INTO `dd_product` VALUES ('3', '201008061943124429', '测试商品3', '88', '3', '1', '2009061808484530.jpg', 'user2', '规格11我', '规格11', '规格11', '规格11', '规格11', '2010-08-06 19:03:59', 'user1', '2010-08-06 19:35:44');
INSERT INTO `dd_product` VALUES ('4', '201008061943124469', '测试商品4', '20', '2', '1', '2009061808484530.jpg', 'user2', '测试商品4', '测试商品4', '测试商品4', '测试商品4', '测试商品4', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('5', '10072111330028', '印度系列-精油皂', '78', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('6', '10072111330029', '印度系列-手工黄麻布包', '120', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('7', '10072111330030', '印度系列-格子黄麻袋', '130', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('8', '10072111330031', '印度系列-竹子手提袋', '150', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('9', '10072111330032', '印度系列-THE ECO-SACK', '120', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('10', '10072111330033', '印度系列-Think Gueen', '140', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('11', '10072111330034', '印度系列-绿边麻袋包', '150', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('12', '10053022500001', '海洋系列-小挂钩', '12', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('13', '10053022500002', '海洋系列-灯塔和鱼', '22', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('14', '10053022500003', '海洋系列-鸭子和海鸥', '26', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('15', '10053022500004', '海洋系列-法文', '26', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('16', '10053022500005', '海洋系列-相框', '28', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('17', '10053022500006', '海洋系列-WC', '26', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('18', '10053022500007', '海洋系列-锚、温度计', '32', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('19', '10072111330006', '海洋系列-沙滩椅温度计', '46', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('20', '10072111330007', '海洋系列-手绘洒水壶', '62', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('21', '10072111330008', '海洋系列-手绘花瓶', '49', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('22', '10072111330009', '海洋系列-灯塔与海鸥（双钩）', '28', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('23', '10072111330010', '海洋系列-拖鞋挂钩', '32', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('24', '10053022500008', '非洲系列-拨浪鼓铅笔', '18', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('25', '10053022500009', '非洲系列-皂石6寸盘', '118', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('26', '10053022500011', '非洲系列-皂石14寸盘', '588', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('27', '10053022500012', '非洲系列-皂石肥皂碟', '108', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('28', '10053022500013', '非洲系列-皂石10寸盘', '388', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('29', '10053022500014', '非洲系列-皂石12寸盘', '498', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('30', '10061515140000', '非洲系列-乌木裁纸刀', '59', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('31', '10061515140001', '非洲系列-乌木饭勺', '119', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('32', '10061515140002', '非洲系列-乌木立梳', '78', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('33', '10061515140003', '非洲系列-杂木饭勺（大）', '78', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('34', '10061515140004', '非洲系列-杂木饭勺（小）', '59', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('35', '10053022500010', '韩国系列-首饰盒（大）', '1388', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('36', '10053022500015', '韩国系列-木名片', '99', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('37', '10053022500016', '韩国系列-名片夹', '129', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('38', '10053022500017', '韩国系列-镜子', '129', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('39', '10053022500018', '韩国系列-首饰盒（紫色贝）', '860', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('40', '10053022500019', '韩国系列-书签', '26', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('41', '10053022500020', '韩国系列-布三层钱包（小）', '68', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('42', '10053022500021', '韩国系列-布三层钱包（大）', '78', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('43', '10061618250002', '韩国系列-六角小锣', '480', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('44', '10053022500022', 'CD盒-猪', '128', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('45', '10053022500023', 'CD盒-易拉罐', '128', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('46', '10053022500024', '铁艺娃娃-中号', '239', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('47', '10053022500025', '铁艺娃娃-小号', '119', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('48', '10053022500026', '光盘夹', '49', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('49', '10053022500027', '别形针便签夹', '20', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('50', '10053022500028', '趣味警示牌', '12', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('51', '10053022500029', '胸牌', '16', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('52', '10053022500030', '环保袋', '10', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('53', '10053022500031', '心型储钱罐', '72', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('54', '10053022500032', '创意闹钟', '48', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('55', '10053022500033', '铁制模型-探照灯钟', '272', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('56', '10053022500034', '铁制模型-消防车', '376', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('57', '10053022500035', '铁制模型-老爷车1', '315', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('58', '10053022500036', '铁制模型-悍马', '288', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('59', '10053022500037', '铁制模型-单人摩托车', '290', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('60', '10053022500038', '铁制模型-阿帕奇直升机', '480', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('61', '10053022500039', '铁制模型-军用吉普', '336', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('62', '10053022500040', '铁制模型-双人摩托车', '480', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('63', '10053022500041', '铁制模型-双节火车', '560', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('64', '10053022500042', '铁制模型-电话亭', '375', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('65', '10053022500043', '铁制模型-电风扇', '330', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('66', '10053022500044', '铁制模型-大摩托车', '885', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('67', '10053022500045', '铁制模型-老爷车2', '325', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('68', '10061515140008', '铁艺模型-军用摩托车', '390', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('69', '10061515140009', '铁艺模型-警车', '460', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('70', '10061515140010', '铁艺模型-汽车之家', '1080', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('71', '10053022500046', '傩神-中号', '159', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('72', '10053022500047', '傩神-小号', '98', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('73', '10053022500048', '傩神-大号', '298', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('74', '10053022500049', '相框-大号', '59', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('75', '10053022500050', '相框-小号', '29', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('76', '10053022500051', '凹凸CD盒', '12', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('77', '10053022500052', '汽车存钱罐', '98', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('78', '10053022500053', '仿古盒子', '18', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('79', '10053022500054', '森林幽灵（大）', '10', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('80', '10053022500055', '森林幽灵（小）', '10', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('81', '10053022500056', '计算器-大', '47', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('82', '10053022500057', '计算器-中', '68', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('83', '10053022500058', '计算器-小', '38', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('84', '10053022500059', '万年计时历', '66', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('85', '10053022500060', '大件行李牌', '10', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('86', '10053022500061', '袋线娃娃', '8', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('87', '10053022500062', '小兔挂件', '8', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('88', '10053022500063', '穿LV衣服的小熊', '8', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('89', '10053022500064', '布制关节熊', '26', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('90', '10053022500065', '布艺猴', '29', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('91', '10053022500066', '异型便签纸', '12', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('92', '10053022500067', '便签夹铅笔', '3', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('93', '10053022500068', '吸管杯电话', '68', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('94', '10053022500069', '胶卷电话', '68', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('95', '10053022500070', '啤酒电话', '68', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('96', '10053022500071', '电池电话', '79', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('97', '10053022500072', '落地灯(小)', '270', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('98', '10053022500073', '落地灯(大)', '380', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('99', '10053022500074', '吉祥虎挂件', '12', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('100', '10053022500075', '十二生肖挂件', '12', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('101', '10053022500076', '冲天虎公仔', '39', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('102', '10053022500077', '吉祥虎灯具（原价258）', '180', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('103', '10053022500078', '抽屉灯', '236', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('104', '10053022500079', '格子鸡灯', '286', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('105', '10053022500080', '斑点狗灯', '286', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('106', '10061515140005', '布袋灯', '49', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('107', '10061515140006', '斑马灯（小）', '286', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('108', '10061515140007', '狮子灯', '286', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('109', '10053022500081', '木质书盒工艺品', '86', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('110', '10053022500082', '船-小号', '88', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('111', '10053022500083', '船-大号', '368', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('112', '10053022500084', '直抖8K挖空蝴蝶结', '119', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('113', '10053022500085', '直抖16K宝塔伞', '128', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('114', '10053022500086', '直抖16K铁中棒', '109', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('115', '10053022500087', '直抖8K拉簧纤维铝中棒（超轻）', '145', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('116', '10053022500088', '直抖8K海绵伞头法国车', '129', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('117', '10053022500089', '布制玩偶挂件(大)', '15', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('118', '10053022500090', '布制玩偶挂件(小)', '16', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('119', '10053022500091', '卡包', '12', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('120', '10053022500092', '软键盘', '85', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('121', '10053022500093', '按键灯', '39', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('122', '10053022500094', '头部按摩器', '9', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('123', '10053022500095', '卡通小卷尺', '16', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('124', '10053022500096', '金属大方狗', '79', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('125', '10053022500097', '大嘴青蛙', '92', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('126', '10053022500098', '小熊大号', '112', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('127', '10053022500099', '大头狗', '42', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('128', '10053022500100', '纯棉老虎被', '139', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('129', '10053022500101', '发条娃娃-青蛙', '6', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('130', '10053022500102', '发条娃娃-老鼠', '6', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('131', '10053022500103', '发条娃娃-鸭子', '12', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('132', '10053022500104', '发条娃娃-495', '19', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('133', '10053022500105', '发条娃娃-496', '19', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('134', '10053022500106', '发条娃娃-407-3', '36', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('135', '10053022500107', '发条娃娃-407-2', '35', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('136', '10053022500108', '发条娃娃-407-1', '32', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('137', '10053022500109', '火影17代（4个）', '39', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('138', '10053022500110', '死亡笔记-硫克', '152', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('139', '10053022500111', '大豆腐（4个）', '99', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('140', '10053022500112', '大玛丽', '225', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('141', '10053022500113', '毒菇', '88', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('142', '10053022500114', '萝莉', '88', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('143', '10053022500115', '圣诞青龙', '136', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('144', '10053022500116', '超级玛丽之大华里奥', '112', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('145', '10053022500117', '火龙', '112', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('146', '10053022500118', '菇人', '116', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('147', '10053022500119', '龟仙人', '180', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('148', '10053022500120', '海贼王之乔巴', '170', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('149', '10053022500121', '海贼王之路飞', '135', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('150', '10053022500122', '海贼王之娜美', '99', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('151', '10053022500123', '海贼王之青稚', '106', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('152', '10053022500124', '海贼王之香吉寺', '99', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('153', '10053022500125', '海贼王之布鲁克', '128', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('154', '10053022500126', '海贼王之鹰眼', '132', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('155', '10053022500127', '海贼王之罗宾', '106', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('156', '10053022500128', '海贼王之艾斯', '120', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('157', '10053022500129', '海贼王之FRANK', '112', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('158', '10053022500130', '海贼王之妖人', '132', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('159', '10053022500131', '海贼王之路奇', '106', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('160', '10053022500132', '大阿拉蕾（阿拉蕾和小吉）', '450', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('161', '10053022500133', '小阿拉蕾（猫儿）', '175', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('162', '10053022500134', '小阿拉蕾（大便）', '155', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('163', '10053022500135', '辛普森（15个）', '105', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('164', '10053022500136', '9代七龙珠（4个）', '72', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('165', '10053022500137', '二代魔兽之德兰尼', '249', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('166', '10053022500138', '二代魔兽之伊利丹', '265', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('167', '10053022500139', '一代魔兽（每个）', '189', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('168', '10053022500140', '二代魔兽（每个）', '189', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('169', '10053022500141', '大底龙珠（4个）', '124', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('170', '10053022500142', '新乔巴', '75', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('171', '10053022500143', '1、2、3代8款Q版海贼', '89', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('172', '10053022500144', '6款叮当', '126', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('173', '10053022500145', '腾云龟', '78', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('174', '10053022500146', '红玛丽', '88', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('175', '10053022500147', '圣诞玛丽', '88', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('176', '10053022500148', 'Q版夜月神', '88', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('177', '10053022500149', '大火影', '105', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('178', '10053022500150', '网王', '148', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('179', '10053022500151', '二代叮当', '128', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('180', '10053022500152', '小吉', '96', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('181', '10053022500153', '6款小云', '126', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('182', '10053022500154', '十一款马里奥', '249', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('183', '10053022500155', '叮当猫-存钱罐', '76', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('184', '10053022500156', '叮当猫场景（小）', '66', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('185', '10053022500157', '叮当猫场景（大）', '116', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('186', '10053022500158', '冬菇', '379', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('187', '10062316370000', '5个小玛丽', '46', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('188', '10062316370001', '樱桃小丸子场景', '158', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('189', '10062316370002', '叮当不倒翁（6款）', '48', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('190', '10062316370003', '叮当不倒翁（10款）', '78', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('191', '10061914410000', '小阿拉蕾（天使）', '155', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('192', '10061914410001', '古惑仔', '76', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('193', '10061914410002', '特大叮当猫', '280', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('194', '10061914410003', '异型兽', '260', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('195', '10061914410004', '银魂（7个一套）', '165', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('196', '10061914410005', 'CS公仔', '20', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('197', '10061914410006', 'CS公仔一套（8个）', '145', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('198', '10061914410007', '6代死神', '120', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('199', '10061914410008', '新海贼', '135', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('200', '10061914410009', '蓝底海贼', '128', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('201', '10061914410010', 'Q版灌篮高手', '258', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('202', '10061914410011', '飞天马里奥', '118', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('203', '10061914410012', '体育版叮当', '128', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('204', '10061914410013', '迷宫箱', '28', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('205', '10061914410014', '中号马里奥', '86', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('206', '10060223560009', '包装费1', '2', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('207', '10060223560010', '包装费2', '1', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('208', '10071918140010', '趣味扑克牌', '12', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('209', '10071413130001', '新款哒铃闹钟', '58', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('210', '10071413130002', '圆形闹钟（大）', '48', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('211', '10072111330002', '海贼王-索隆', '175', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('212', '10072111330003', '小丸子不倒翁', '42', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('213', '10072111330004', '小丸子场景（24个）', '136', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('214', '10072111330005', '魔兽小号', '115', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('215', '10072111330011', '特大叮当猫（女）', '280', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('216', '10072111330012', '黄金圣斗士', '98', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('217', '10072111330013', '龙珠、海贼、死神', '115', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('218', '10072111330014', '名侦探柯南', '156', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('219', '10072111330015', '龙珠（伍）', '105', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('220', '10072111330016', '龙珠（玖）', '105', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('221', '10072111330017', '龙珠（拾叁）', '105', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('222', '10072111330018', 'QQ农场', '39', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('223', '10072111330026', '新款死神', '148', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('224', '10072111330027', '新款网球王子', '99', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('225', '10072400100000', '趣味围裙', '28', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('226', '10072400100002', '小动物吊饰', '16', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('227', '10072400100003', '小辣椒吊饰', '10', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('228', '10072400100004', '小鱼吊饰', '8', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('229', '10053022500159', '塔卡沙卡贴', '4', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('230', '10053022500160', '塔卡沙CD刻录盘', '12', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('231', '10053022500161', '塔卡沙DVD刻录盘', '18', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('232', '10053022500162', '塔卡沙短袖Tee', '68', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('233', '10053022500163', '塔卡沙长袖Tee', '78', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('234', '10053022500164', '塔卡沙新款短袖Tee', '128', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('235', '10053022500165', '塔卡沙徽章', '4', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('236', '10053022500166', '塔卡沙包', '88', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('237', '10053022500167', '塔卡沙手机擦', '8', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('238', '10053022500168', '塔卡沙AKA娃娃头挂件', '38', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('239', '10053022500169', '塔卡沙项链', '68', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('240', '10053022500170', '塔卡沙布面本子', '38', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('241', '10053022500171', '塔卡沙-衬衫', '258', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('242', '10053022500172', '塔卡沙-VERY+小本子', '30', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('243', '10053022500173', '塔卡沙-VERY+大本子', '38', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('244', '10053022500174', '塔卡沙-VERY名片夹', '30', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('245', '10060223560005', '塔卡沙-胸针', '18', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('246', '10061018100015', '塔卡沙-卡贴套装', '5', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('247', '10061018100016', '塔卡沙-帽子', '68', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('248', '10061618250000', '塔卡沙-发带', '18', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('249', '10061618250001', '塔卡沙-灰色造型T恤', '158', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('250', '10071020310000', '塔卡沙-戒指', '10', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('251', '10071020310001', '塔卡沙-手机链', '30', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('252', '10071020310002', '塔卡沙-鼠标垫', '18', '1', '1', '20091003199_.gif', 'C-4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('253', '10053022500175', '兔子暴一白万花筒', '30', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('254', '10053022500176', '兔子暴一白卡贴', '3', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('255', '10053022500177', '兔子暴一白键盘垫', '39', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('256', '10053022500178', '兔子暴一白徽章', '5', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('257', '10053022500179', '兔子暴一白手机链', '15', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('258', '10053022500180', '兔子暴一白蚕蛹挂件', '15', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('259', '10061718250010', '兔子暴一白-长手机链', '25', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('260', '10060523560000', '兔子暴一白-手机套', '28', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('261', '10072821570000', '兔子暴一白皇冠手机链', '12', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('262', '10072821570001', '兔子暴一白手机擦-兔子', '12', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('263', '10072821570002', '兔子暴一白手机擦-女人', '12', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('264', '10072821570003', '兔子暴一白手机擦-男人', '12', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('265', '10072821570004', '兔子暴一白手机擦-猴子', '12', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('266', '10072821570005', '兔子暴一白手机擦-花', '12', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('267', '10072821570006', '兔子暴一白手机擦-动物园', '12', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('268', '10072821570007', '兔子暴一白五星徽章', '12', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('269', '10072821570008', '兔子暴一白便签本', '8', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('270', '10072821570009', '兔子暴一白贴纸', '6', '1', '1', '20091003199_.gif', 'C-61', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('271', '10053022500213', '安静的静复古项链', '40', '1', '1', '20091003199_.gif', 'C-22', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('272', '10053022500214', '安静的静娃娃项链', '30', '1', '1', '20091003199_.gif', 'C-22', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('273', '10053022500215', '安静的静果冻戒指', '18', '1', '1', '20091003199_.gif', 'C-22', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('274', '10053022500216', '安静的静手工小耳钉', '15', '1', '1', '20091003199_.gif', 'C-22', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('275', '10053022500217', '安静的静胸针', '20', '1', '1', '20091003199_.gif', 'C-22', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('276', '10062212350001', '安静的静-情侣项链', '60', '1', '1', '20091003199_.gif', 'C-22', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('277', '10053022500218', '梵星手绘-鞋带', '6', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('278', '10053022500219', '梵星手绘-内增高中帮（定）', '145', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('279', '10053022500220', '梵星手绘-双层中帮（定）', '145', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('280', '10053022500221', '梵星手绘-中帮（定）', '145', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('281', '10053022500222', '梵星手绘-低帮（定）', '110', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('282', '10053022500223', '梵星手绘-无带拖鞋（定）', '110', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('283', '10053022500224', '梵星手绘-无带（定）', '110', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('284', '10053022500225', '梵星手绘-拖鞋无带一般（定）', '99', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('285', '10053022500226', '梵星手绘-无带一般鞋（定）', '99', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('286', '10053022500227', '梵星手绘-高帮（定）', '145', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('287', '10053022500228', '梵星手绘-高筒鞋（定）', '158', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('288', '10053022500229', '梵星手绘-中式钱包', '99', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('289', '10053022500230', '梵星手绘-插画包', '70', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('290', '10053022500231', '梵星手绘-笔袋', '36', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('291', '10053022500232', '梵星手绘-皮革插画包', '150', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('292', '10053022500233', '梵星手绘-儿童魔术贴', '99', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('293', '10053022500234', '梵星手绘-护士鞋', '60', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('294', '10053022500235', '梵星手绘鞋带DIY套装', '50', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('295', '10053022500236', '梵星手绘货车帽', '68', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('296', '10061914410015', '梵星手绘-快递费', '6', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('297', '10071120310000', '梵星手绘-高跟靴', '158', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('298', '10071120310001', '梵星手绘-彩绘手镯', '15', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('299', '10071120310002', '梵星手绘-古典钱袋', '30', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('300', '10071120310003', '梵星手绘-手机袋', '30', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('301', '10071120310004', '梵星手绘-蝴蝶结浅口鞋', '85', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('302', '10071918140003', '梵星手绘-相机包', '99', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('303', '10071918140004', '梵星手绘-开口笑', '110', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('304', '10071918140005', '梵星手绘-系带拖鞋', '110', '1', '1', '20091003199_.gif', 'C-24', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('305', '10053022500237', 'CIBOYS-2寸公仔', '26', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('306', '10053022500238', 'CIBOYS-慌慌马戏团', '288', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('307', '10053022500239', 'CIBOYS-寿司公仔（无透明盒子）', '28', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('308', '10053022500240', 'CIBOYS-透明盒子', '12', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('309', '10053022500241', 'CIBOYS-6寸公仔', '280', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('310', '10053022500242', 'CIBOYS-十二生肖公仔', '28', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('311', '10060223560000', 'CIBOYS-可爱羊仔', '28', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('312', '10061223080013', 'CIBOYS-6寸小人', '98', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('313', '10061223080014', 'CIBOYS-6寸SAM蘑菇', '188', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('314', '10061223080015', 'CIBOYS-可乐挂钩', '28', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('315', '10071413130000', 'CIBOYS-手机链', '18', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('316', '10071918140000', 'CIBOYS-鸟人公仔', '25', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('317', '10071918140001', 'CIBOYS-魔法馒头', '38', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('318', '10071918140002', 'CIBOYS-KITTY公仔', '25', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('319', '10072523200018', 'CIBOYS-京剧套装', '148', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('320', '10072523200019', 'CIBOYS-中秋套装', '88', '1', '1', '20091003199_.gif', 'CIBOYS', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('321', '10053022500243', '小红裙子-火狐', '169', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('322', '10053022500244', '小红裙子-小美羊', '145', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('323', '10053022500245', '小红裙子-熊猫阿彩', '169', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('324', '10053022500246', '小红裙子-小招财猫', '138', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('325', '10053022500247', '小红裙子-鳄鱼', '135', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('326', '10053022500248', '小红裙子-浣熊', '138', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('327', '10053022500249', '小红裙子-老虎', '158', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('328', '10053022500250', '小红裙子-猴子', '78', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('329', '10053022500251', '小红裙子-白熊', '88', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('330', '10053022500252', '小红裙子-刺猬', '88', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('331', '10053022500253', '小红裙子-蜜蜂', '138', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('332', '10053022500254', '小红裙子-狼', '145', '1', '1', '20091003199_.gif', 'C-31', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('333', '10053022500255', 'BABY兔-15cm兔子（加一副颜料和笔）', '35', '1', '1', '20091003199_.gif', 'C-51', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('334', '10061018100031', 'BABY兔-银色兔子（加一副颜料和笔）', '42', '1', '1', '20091003199_.gif', 'C-51', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('335', '10061018100032', 'BABY兔-金色兔子（加一副颜料和笔）', '42', '1', '1', '20091003199_.gif', 'C-51', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('336', '10061018100033', 'BABY兔-蓝色兔子（加一副颜料和笔）', '40', '1', '1', '20091003199_.gif', 'C-51', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('337', '10061018100034', 'BABY兔-红色兔子（加一副颜料和笔）', '40', '1', '1', '20091003199_.gif', 'C-51', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('338', '10061018100035', 'BABY兔-粉色兔子（加一副颜料和笔）', '40', '1', '1', '20091003199_.gif', 'C-51', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('339', '10061018100036', 'BABY兔-黄色兔子（加一副颜料和笔）', '40', '1', '1', '20091003199_.gif', 'C-51', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('340', '10061018100037', 'BABY兔-绿色兔子（加一副颜料和笔）', '40', '1', '1', '20091003199_.gif', 'C-51', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('341', '10061018100038', 'BABY兔-黑色兔子（加一副颜料和笔）', '40', '1', '1', '20091003199_.gif', 'C-51', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('342', '10061018100039', 'BABY兔-30cm兔子（加一副颜料和笔）', '0', '1', '1', '20091003199_.gif', 'C-51', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('343', '10053022500256', '模范镇-便签本', '10', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('344', '10053022500257', '模范镇-涂鸦本', '15', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('345', '10053022500258', '模范镇-水桶包', '60', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('346', '10053022500259', '模范镇-模范挎包', '90', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('347', '10053022500260', '模范镇-模范娃娃', '40', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('348', '10053022500261', '模范镇-神出鬼没勺', '30', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('349', '10053022500262', '模范镇-大钢杯', '35', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('350', '10053022500263', '模范镇-山野村夫杯', '35', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('351', '10053022500264', '模范镇-叉子', '35', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('352', '10053022500265', '模范镇-风卷残云勺', '60', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('353', '10053022500266', '模范镇-自力更生勺', '45', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('354', '10053022500267', '模范镇-情侣搅拌棒', '50', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('355', '10053022500268', '模范镇-大智若愚勺', '35', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('356', '10053022500269', '模范镇-钣金兔子', '25', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('357', '10053022500270', '模范镇-像素牛', '25', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('358', '10053022500271', '模范镇-钣金狮子', '25', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('359', '10053022500272', '模范镇-挂钟', '80', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('360', '10060523560001', '模范镇-小刚杯', '25', '1', '1', '20091003199_.gif', 'C-62', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('361', '10053022500273', '静闲舍-原创明信片', '10', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('362', '10053022500274', '静闲舍-明信片套装', '95', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('363', '10053022500275', '静闲舍-手绘盒', '30', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('364', '10053022500276', '静闲舍-装饰画（卡）', '50', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('365', '10053022500277', '静闲舍-装饰画', '180', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('366', '10053022500278', '静闲舍-白珊瑚手链', '125', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('367', '10053022500279', '静闲舍-十八菩提', '45', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('368', '10053022500280', '静闲舍--玛瑙手链', '158', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('369', '10053022500281', '静闲舍--石榴石手链（大）', '168', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('370', '10053022500282', '静闲舍--石榴石手链（小）', '138', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('371', '10053022500283', '静闲舍-红珊瑚手链', '138', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('372', '10053022500284', '静闲舍--路路通手编手链', '65', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('373', '10053022500285', '静闲舍--马来玉手编链（大）', '65', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('374', '10053022500286', '静闲舍--马来玉手编链（中）', '45', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('375', '10053022500287', '静闲舍--马来玉手编链（小）', '35', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('376', '10053022500288', '静闲舍--吉祥手编链', '35', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('377', '10053022500289', '静闲舍--鸿运手编链', '45', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('378', '10053022500290', '静闲舍--双鱼手编链（大）', '105', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('379', '10053022500291', '静闲舍--双鱼手编链（小）', '85', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('380', '10053022500292', '静闲舍-彩玉手链', '160', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('381', '10053022500293', '静闲舍--玛瑙手链（大）', '180', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('382', '10053022500294', '静闲舍-月光玛瑙', '285', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('383', '10053022500295', '静闲舍--精致手编链', '218', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('384', '10053022500296', '静闲舍--奥水晶手链', '388', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('385', '10053022500297', '静闲舍--奥地利水晶手编链', '126', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('386', '10053022500298', '静闲舍--台湾玉银手链', '158', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('387', '10053022500299', '静闲舍--祥玉转运珠', '70', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('388', '10053022500300', '静闲舍--手机链', '35', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('389', '10053022500301', '静闲舍--红绳手编链', '15', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('390', '10053022500302', '静闲舍--玉髓手编链', '95', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('391', '10053022500303', '静闲舍--奥水晶银手链', '145', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('392', '10053022500304', '静闲舍--手工项链', '95', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('393', '10053022500305', '静闲舍--工艺项链', '115', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('394', '10061223080001', '静闲舍-紫天然水晶手链', '280', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('395', '10061223080002', '静闲舍-奥地利水晶项链', '180', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('396', '10061223080003', '静闲舍-牛皮玛瑙手环', '50', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('397', '10061223080004', '静闲舍-创意手链', '65', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('398', '10071020310003', '静闲舍-奥地利水晶吊坠', '120', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('399', '10071020310004', '静闲舍-十八菩提手链', '88', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('400', '10071020310005', '静闲舍-红珊瑚创意银手链', '398', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('401', '10071020310006', '静闲舍-蓝玛瑙手链', '285', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('402', '10071020310007', '静闲舍-天然紫莹手链', '260', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('403', '10072400100001', '静闲舍-玉髓牛骨手链', '320', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('404', '10072523200013', '静闲舍-天然月光石手工银', '520', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('405', '10072523200014', '静闲舍-手工银耳环', '218', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('406', '10072523200015', '静闲舍-贝银耳环', '198', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('407', '10072523200016', '静闲舍-茶水晶牛骨手链', '168', '1', '1', '20091003199_.gif', 'C-55', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('408', '10053022500306', 'CC饰品-电影书', '18', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('409', '10053022500307', 'CC饰品-铜戒', '15', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('410', '10053022500308', 'CC饰品-牛皮手环', '45', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('411', '10053022500309', 'CC饰品-紫砂石耳环', '35', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('412', '10053022500310', 'CC饰品-玛瑙耳环', '35', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('413', '10053022500311', 'CC饰品-水晶耳环', '35', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('414', '10053022500312', 'CC饰品-雅克力耳环', '35', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('415', '10053022500313', 'CC饰品-铜镍耳环', '35', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('416', '10053022500314', 'CC饰品-水晶小熊挂件', '158', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('417', '10053022500315', 'CC饰品-水晶大雄挂件', '186', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('418', '10053022500316', 'CC饰品-立体水晶戒指', '136', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('419', '10053022500317', 'CC饰品-空心方长项链', '260', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('420', '10053022500318', 'CC饰品-十字架长项链', '260', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('421', '10053022500319', 'CC饰品-大方片耳环', '128', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('422', '10053022500320', 'CC饰品-胸花', '78', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('423', '10053022500321', 'CC饰品-腕表式手环', '198', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('424', '10053022500322', 'CC饰品-莲花戒指', '168', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('425', '10053022500323', 'CC饰品-大莲花戒指', '198', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('426', '10053022500324', 'CC饰品-花冠戒指', '128', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('427', '10053022500325', 'CC饰品-玛瑙贝壳项链', '160', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('428', '10061223080011', 'CC饰品-玛瑙朱砂项链', '180', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('429', '10061223080012', 'CC饰品-大羽毛胸花', '98', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('430', '10062020140006', 'CC饰品-珊瑚水晶项链', '85', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('431', '10071020310017', 'CC饰品-牛皮水晶颈链', '128', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('432', '10071020310018', 'CC饰品-水晶手环', '88', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('433', '10071020310019', 'CC饰品-水晶项链', '150', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('434', '10071020310020', 'CC饰品-银链水晶项链（方块型）', '160', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('435', '10071020310021', 'CC饰品-银链水晶项链（十字架型）', '180', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('436', '10071020310022', 'CC饰品-纯银小猫尾戒', '268', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('437', '10071020310023', 'CC饰品-猫眼石嵌银项链+耳环', '398', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('438', '10071020310024', 'CC饰品-红珊瑚泰银手环', '520', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('439', '10071020310025', 'CC饰品-黑玛瑙泰银手环', '520', '1', '1', '20091003199_.gif', 'C-12', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('440', '10053022500348', '雪·松万花筒', '48', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('441', '10060523560023', '雪松-耳环（30）', '30', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('442', '10060523560024', '雪松-耳环（45）', '45', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('443', '10060523560025', '雪松-耳环（60）', '60', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('444', '10060523560026', '雪松-耳环（50）', '50', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('445', '10062020140000', '雪松-红珊瑚项链', '180', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('446', '10062020140001', '雪松-铜猫编制项链', '220', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('447', '10062020140002', '雪松-海螺珠项链', '160', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('448', '10062020140003', '雪松-铜荷花片项链', '138', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('449', '10062020140004', '雪松-合成铜金属松石项链', '180', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('450', '10062020140005', '雪松-花纹扣皮绳项链', '120', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('451', '10060523560019', '雪松-瓷珠铜牛皮项链', '120', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('452', '10060523560020', '雪松-人工合成松石皮绳项链', '160', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('453', '10060523560021', '雪松-玛瑙手工编织项链', '170', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('454', '10060523560022', '雪松-老铜囍红珊瑚项链', '200', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('455', '10072000580003', '雪松-黑檀木手工银玛瑙片项链', '200', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('456', '10072000580004', '雪松-天然玉珠手工银牛皮绳项链', '190', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('457', '10072000580005', '雪松-人工合成松石手工编织项链', '160', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('458', '10072000580006', '雪松-青玉丝线项圈', '180', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('459', '10072000580007', '雪松-天然石榴石、亚克力项链', '120', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('460', '10072000580008', '雪松-天然花纹石银小象项链', '200', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('461', '10072000580009', '雪松-纯银牛皮绳项链', '150', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('462', '10072000580010', '雪松-天然蓝砂石虎眼石项链', '200', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('463', '10072000580011', '雪松-玉平安锁牛皮绳项链', '160', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('464', '10072000580012', '雪松-牛皮手带', '35', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('465', '10072000580013', '雪松-80耳环', '80', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('466', '10072000580014', '雪松-70耳环', '70', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('467', '10072000580015', '雪松-40耳环', '40', '1', '1', '20091003199_.gif', 'C-56', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('468', '10053022500373', '酸奶-兔子耳环', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('469', '10053022500374', '酸奶-甜甜圈耳环', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('470', '10053022500375', '酸奶-鲜花耳环', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('471', '10053022500376', '酸奶-草丛项链', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('472', '10053022500377', '酸奶鲜花朵朵长链', '128', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('473', '10053022500378', '酸奶-南瓜耳环', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('474', '10053022500379', '酸奶-龙耳环', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('475', '10053022500380', '酸奶-三钉耳环', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('476', '10053022500381', '酸奶-跳舞女孩耳环', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('477', '10053022500382', '酸奶-琴耳环', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('478', '10053022500383', '酸奶-小鞋子长耳环', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('479', '10053022500384', '酸奶-包包与鞋子耳环', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('480', '10053022500385', '酸奶-钻石小羊长链', '108', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('481', '10053022500386', '酸奶-钻石包包长链', '108', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('482', '10053022500387', '酸奶-天然石圆形长链', '108', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('483', '10053022500388', '酸奶-天然石七彩长链', '108', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('484', '10053022500389', '酸奶-满天星长链', '108', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('485', '10053022500390', '酸奶-小姑娘耳环', '69', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('486', '10053022500391', '酸奶-三色鲜花戒指', '69', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('487', '10053022500392', '酸奶-猫头鹰耳环', '69', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('488', '10053022500393', '酸奶-芭蕉扇耳环（黑色）', '68', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('489', '10053022500394', '酸奶-芭蕉扇耳环（银色）', '68', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('490', '10053022500395', '酸奶-芭蕉扇项链（金色）', '78', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('491', '10053022500396', '酸奶-芭蕉扇项链（黑色）', '78', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('492', '10053022500397', '酸奶-芭蕉扇项链（银色）', '78', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('493', '10053022500398', '酸奶-211长链', '118', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('494', '10053022500399', '酸奶-211双链（黑色）', '88', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('495', '10053022500400', '酸奶-211双链（银色）', '88', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('496', '10053022500401', '酸奶-211耳环（黑色）', '78', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('497', '10053022500402', '酸奶-212耳环（银色）', '78', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('498', '10053022500403', '酸奶-211戒指黑色6码', '58', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('499', '10053022500404', '酸奶-211戒指黑色7码', '58', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('500', '10053022500405', '酸奶-211戒指黑色8码', '58', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('501', '10053022500406', '酸奶-211戒指银色6码', '58', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('502', '10053022500407', '酸奶-211戒指银色7码', '58', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('503', '10053022500408', '酸奶-211戒指银色8码', '58', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('504', '10053022500409', '酸奶-浑天灵戒指', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('505', '10053022500410', '酸奶-紧箍咒1金色6码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('506', '10053022500411', '酸奶-紧箍咒1金色7码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('507', '10053022500412', '酸奶-紧箍咒1金色8码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('508', '10053022500413', '酸奶-紧箍咒1黑色6码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('509', '10053022500414', '酸奶-紧箍咒1黑色7码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('510', '10053022500415', '酸奶-紧箍咒1黑色8码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('511', '10053022500416', '酸奶-紧箍咒1银色6码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('512', '10053022500417', '酸奶-紧箍咒1银色7码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('513', '10053022500418', '酸奶-紧箍咒1银色8码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('514', '10053022500419', '酸奶-紧箍咒2金色6码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('515', '10053022500420', '酸奶-紧箍咒2金色7码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('516', '10053022500421', '酸奶-紧箍咒2金色8码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('517', '10053022500422', '酸奶-紧箍咒2黑色6码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('518', '10053022500423', '酸奶-紧箍咒2黑色7码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('519', '10053022500424', '酸奶-紧箍咒2黑色8码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('520', '10053022500425', '酸奶-紧箍咒2银色6码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('521', '10053022500426', '酸奶-紧箍咒2银色7码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('522', '10053022500427', '酸奶-紧箍咒2银色8码', '49', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('523', '10053022500428', '酸奶-211手链（黑色）', '98', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('524', '10053022500429', '酸奶-211手链（银色）', '98', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('525', '10053022500430', '酸奶-蜜蜂戒指6码', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('526', '10053022500431', '酸奶-蜜蜂戒指7码', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('527', '10053022500432', '酸奶-蜜蜂戒指8码', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('528', '10053022500433', '酸奶-瓢虫戒指6码', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('529', '10053022500434', '酸奶-瓢虫戒指7码', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('530', '10053022500435', '酸奶-瓢虫戒指8码', '39', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('531', '10053022500436', '酸奶-童话钻石耳钉-银边+黑', '30', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('532', '10053022500437', '酸奶-童话钻石耳钉-银边+桃红', '30', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('533', '10053022500438', '酸奶-童话钻石耳钉-银边+蓝', '30', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('534', '10053022500439', '酸奶-童话钻石耳钉-银边+白', '30', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('535', '10053022500440', '酸奶-童话钻石耳钉-金边+黑', '30', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('536', '10053022500441', '酸奶-童话钻石耳环带穗-银边+黑', '40', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('537', '10053022500442', '酸奶-童话钻石耳环带穗-银边+桃红', '40', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('538', '10053022500443', '酸奶-童话钻石耳环带穗-银边+蓝', '40', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('539', '10053022500444', '酸奶-童话钻石耳环带穗-银边+白', '40', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('540', '10053022500445', '酸奶-童话钻石耳环带穗-金边+黑', '40', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('541', '10053022500446', '酸奶-童话钻石耳环-银边+黑', '35', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('542', '10053022500447', '酸奶-童话钻石耳环-银边+桃红', '35', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('543', '10053022500448', '酸奶-童话钻石耳环-银边+蓝', '35', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('544', '10053022500449', '酸奶-童话钻石耳环-银边+白', '35', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('545', '10053022500450', '酸奶-童话钻石耳环-金边+黑', '35', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('546', '10053022500451', '酸奶-童话钻石手链-银边+黑', '55', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('547', '10053022500452', '酸奶-童话钻石手链-银边+桃红', '55', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('548', '10053022500453', '酸奶-童话钻石手链-金边+黑', '55', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('549', '10053022500454', '酸奶-童话钻戒项链-银边+黑', '60', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('550', '10053022500455', '酸奶-童话钻戒项链-银边+桃红', '60', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('551', '10053022500456', '酸奶-童话钻戒项链-金边+黑', '60', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('552', '10053022500457', '酸奶-童话钻戒项链-黑边+黑', '60', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('553', '10053022500458', '酸奶-童话钻石长项链-钢+桃红', '99', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('554', '10053022500459', '酸奶-童话钻石长项链-钢+草绿', '99', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('555', '10053022500460', '酸奶-童话钻石长项链-钢+宝蓝', '99', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('556', '10053022500461', '酸奶-童话钻石长项链-钢+淡粉', '99', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('557', '10053022500462', '酸奶-童话钻石长项链-钢+黑色', '99', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('558', '10053022500463', '酸奶-机器潮人yyobot 项链-钢+桃红', '99', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('559', '10053022500464', '酸奶-机器潮人yyobot 项链-钢+草绿', '99', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('560', '10053022500465', '酸奶-机器潮人yyobot 项链-钢+宝蓝', '99', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('561', '10053022500466', '酸奶-机器潮人yyobot 项链-钢+淡粉', '99', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('562', '10053022500467', '酸奶-机器潮人yyobot 项链-钢+黑色', '99', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('563', '10053022500468', '酸奶-摆钟 耳环-桃红', '109', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('564', '10053022500469', '酸奶-摆钟 耳环-宝蓝', '109', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('565', '10053022500470', '酸奶-拯救地球Ⅰ鸟与树 耳环', '109', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('566', '10053022500471', '酸奶-地球环保Ⅱ兔子蘑菇 耳环', '109', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('567', '10053022500472', '酸奶-云纹项链-粉蓝色系', '139', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('568', '10053022500473', '酸奶-云纹项链-蓝绿色系', '139', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('569', '10053022500474', '酸奶yyobot 机器人钥匙手机挂饰', '19', '1', '1', '20091003199_.gif', 'SN', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('570', '10053022500475', '七口七-手机绳LY080314', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('571', '10053022500476', '七口七-手机绳LY080313', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('572', '10053022500477', '七口七-手机绳LY080305A ', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('573', '10053022500478', '七口七-手机绳LY080305C', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('574', '10053022500479', '七口七-手机绳LY080312', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('575', '10053022500480', '七口七-手机绳LY080307', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('576', '10053022500481', '七口七-手机绳LY080309', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('577', '10053022500482', '七口七-手机绳LY080316', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('578', '10062212350000', '七口七-LY080315', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('579', '10071320310000', '七口七-LY080305D ', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('580', '10071320310001', '七口七-LY080306', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('581', '10071320310002', '七口七-LY080311 ', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('582', '10071320310003', '七口七-OLD', '26', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('583', '10071320310004', '七口七-RB080317M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('584', '10053022500483', '七口七-环保袋中号RB080309 M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('585', '10053022500484', '七口七-环保袋中号RB080312 M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('586', '10053022500485', '七口七-环保袋中号RB080319 M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('587', '10053022500486', '七口七-环保袋中号RB080320M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('588', '10053022500487', '七口七-环保袋中号RB080321M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('589', '10053022500488', '七口七-环保袋中号RB080322M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('590', '10053022500489', '七口七-环保袋中号RB080323M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('591', '10053022500490', '七口七-环保袋中号RB080324M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('592', '10053022500491', '七口七-环保袋中号RB080325M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('593', '10053022500492', '七口七-环保袋中号RB080314M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('594', '10053022500493', '七口七-环保袋中号RB080315M', '38', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('595', '10053022500494', '七口七-环保袋大号RB080320L', '55', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('596', '10053022500495', '七口七-环保袋大号RB080323L', '55', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('597', '10053022500496', '七口七-环保袋大号RB080314L', '55', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('598', '10071320310005', '七口七-RB080315L', '55', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('599', '10053022500497', '七口七-布娃娃PD080301', '36', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('600', '10053022500498', '七口七-布娃娃PD080302', '36', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('601', '10053022500499', '七口七-布娃娃PD080303', '36', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('602', '10053022500500', '七口七-布娃娃PD080304', '36', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('603', '10053022500501', '七口七-布娃娃PD080305', '36', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('604', '10053022500502', '七口七-布娃娃PD080306', '36', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('605', '10053022500503', '七口七-布娃娃PD080307', '36', '1', '1', '20091003199_.gif', 'C-17', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('606', '10053022500504', '黑皮超人-蓝色双面用手提包', '158', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('607', '10053022500505', '黑皮超人-红色皮包带单肩包', '98', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('608', '10053022500506', '黑皮超人-手机包', '28', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('609', '10053022500507', '黑皮超人-卡包', '18', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('610', '10053022500508', '黑皮超人-手机链', '8', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('611', '10053022500509', '黑皮超人-拉链杂物包', '18', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('612', '10053022500510', '黑皮超人-夹棉粉扣电子产品包', '38', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('613', '10062311220001', '黑皮超人-粉红牡丹帆布大包', '168', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('614', '10062311220002', '黑皮超人-皮革提手梨花帆布包', '168', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('615', '10062311220003', '黑皮超人-手绘扎染剪纸小包', '38', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('616', '10060223560001', '黑皮超人-黄色闪金包', '128', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('617', '10060223560002', '黑皮超人-手绘小包（玉兰）', '28', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('618', '10060223560003', '黑皮超人-手绘中包（荷花）', '48', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('619', '10060223560004', '黑皮超人-手绘打包（牡丹）', '168', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('620', '10061018100017', '黑皮超人-彩色印花拼布小鸡', '198', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('621', '10061018100018', '黑皮超人-印花拼布小猫枕头', '48', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('622', '10061018100019', '黑皮超人-拼布腰枕手拿小包', '38', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('623', '10061018100020', '黑皮超人-金属链提手印花布包', '128', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('624', '10061018100021', '黑皮超人-蓝色印花大包', '128', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('625', '10061018100022', '黑皮超人-红色印花钱包', '38', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('626', '10061018100023', '黑皮超人-绿色布艺手机挂件', '18', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('627', '10061018100024', '黑皮超人-红色卡包', '28', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('628', '10061018100025', '黑皮超人-红色杂物小包', '18', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('629', '10061018100026', '黑皮超人-红色大号钱包', '68', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('630', '10061018100027', '黑皮超人-红色亮片单肩包', '38', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('631', '10061018100028', '黑皮超人-超人腕枕', '12', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('632', '10061018100029', '黑皮超人-大红印花手提袋', '88', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('633', '10061018100030', '黑皮超人-红色印花电脑包', '138', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('634', '10072000580017', '黑皮超人-长款钱包', '58', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('635', '10072000580018', '黑皮超人-其他小包', '38', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('636', '10072000580019', '黑皮超人-大包', '98', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('637', '10072000580020', '黑皮超人-小挎包', '48', '1', '1', '20091003199_.gif', 'C-50', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('638', '10053022500581', '森楠陶瓷-陶瓷挂件', '58', '1', '1', '20091003199_.gif', 'C-58', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('639', '10053022500582', '森楠陶瓷-软陶手链', '36', '1', '1', '20091003199_.gif', 'C-58', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('640', '10053022500583', '森楠陶瓷-陶瓷手链', '46', '1', '1', '20091003199_.gif', 'C-58', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('641', '10053022500584', '森楠陶瓷-陶瓷耳环', '36', '1', '1', '20091003199_.gif', 'C-58', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('642', '10053022500585', '森楠陶瓷-软陶耳环', '26', '1', '1', '20091003199_.gif', 'C-58', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('643', '10053022500586', '森楠陶瓷-陶瓷戒指', '26', '1', '1', '20091003199_.gif', 'C-58', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('644', '10053022500587', '玲紫猫-童话兔兔', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('645', '10053022500588', '玲紫猫-宁静之夜', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('646', '10053022500589', '玲紫猫-凝望的黑猫', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('647', '10053022500590', '玲紫猫-水手玲紫猫', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('648', '10053022500591', '玲紫猫-小鸟送来的情书', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('649', '10053022500592', '玲紫猫-熊猫夏季版（黑）', '58', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('650', '10053022500593', '玲紫猫-熊猫夏季版（蓝）', '58', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('651', '10053022500594', '玲紫猫-小熊夏季版（粉）', '58', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('652', '10053022500595', '玲紫猫-心灵花园', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('653', '10053022500596', '玲紫猫-午后阳光', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('654', '10053022500597', '玲紫猫-彩虹小可爱', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('655', '10053022500598', '玲紫猫-彩虹铅笔组', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('656', '10053022500599', '玲紫猫-爱心展览馆', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('657', '10053022500600', '玲紫猫-梦幻之泪', '68', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('658', '10053022500601', '玲紫猫-狐狸夏季版', '58', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('659', '10053022500602', '玲紫猫-cap童话兔兔', '58', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('660', '10053022500603', '玲紫猫-cap猴子夏季版', '58', '1', '1', '20091003199_.gif', 'C-6', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('661', '10053022500604', '格里伏塔-MT01-MT', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('662', '10053022500605', '格里伏塔-MT02-SM', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('663', '10053022500606', '格里伏塔-MT03-DZ', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('664', '10053022500607', '格里伏塔-MT04-XD', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('665', '10053022500608', '格里伏塔-MT05-SS', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('666', '10053022500609', '格里伏塔-MT06-LR', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('667', '10053022500610', '格里伏塔-MT07-JZ', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('668', '10053022500611', '格里伏塔-MT08-FS', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('669', '10053022500612', '格里伏塔-MT09-XD熊（摆）', '65', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('670', '10053022500613', '格里伏塔-PVZ01-太阳菇', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('671', '10053022500614', '格里伏塔-PVZ02-小紫菇', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('672', '10053022500615', '格里伏塔-PVZ03-毁灭菇', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('673', '10053022500616', '格里伏塔-PVZ04-晕菇', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('674', '10053022500617', '格里伏塔-PVZ05-大蒜', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('675', '10053022500618', '格里伏塔-PVZ06-大蒜（摆）', '50', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('676', '10053022500619', '格里伏塔-PVZ06-小坚果', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('677', '10053022500620', '格里伏塔-PVZ07-大坚果', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('678', '10053022500621', '格里伏塔-PVZ08-大坚果（摆）', '57', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('679', '10053022500622', '格里伏塔-PVZ09-倭瓜', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('680', '10053022500623', '格里伏塔-PVZ10-倭瓜（摆）', '57', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('681', '10053022500624', '格里伏塔-PVZ11-土豆地雷（摆）', '50', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('682', '10053022500625', '格里伏塔-PVZ12-地刺', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('683', '10053022500626', '格里伏塔-PVZ13-豌豆炮（摆）', '57', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('684', '10053022500627', '格里伏塔-PVZ14-樱桃炸弹', '27', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('685', '10053022500628', '格里伏塔-PVZ15-玉米（摆）', '57', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('686', '10053022500629', '格里伏塔-PVZ16-辣椒', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('687', '10053022500630', '格里伏塔-PVZ17-辣椒（摆）', '57', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('688', '10053022500631', '格里伏塔-PVZ18-僵尸头', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('689', '10053022500632', '格里伏塔-PVZ19-伪装者', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('690', '10053022500633', '格里伏塔-PVZ20-太阳花', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('691', '10053022500634', '格里伏塔-PVZ21-太阳花(摆）', '57', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('692', '10053022500635', '格里伏塔-PVZ22-大喷菇(摆）', '55', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('693', '10053022500636', '格里伏塔-韩国小礼盒', '8', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('694', '10053022500637', '格里伏塔-石榴包', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('695', '10053022500638', '格里伏塔-复古奥钻耳环', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('696', '10053022500639', '格里伏塔-时光宝石项链', '45', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('697', '10053022500640', '格里伏塔-时光宝石项链（小）', '28', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('698', '10053022500641', '格里伏塔-粉色花朵盆栽耳环', '28', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('699', '10053022500642', '格里伏塔-磨砂花朵珍珠耳环', '18', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('700', '10053022500643', '格里伏塔-指南针耳钉', '30', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('701', '10053022500644', '格里伏塔-复古蝴蝶结珍珠耳环', '18', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('702', '10053022500645', '格里伏塔-复古毛衣链', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('703', '10053022500646', '格里伏塔-巴洛克华丽耳环', '45', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('704', '10053022500647', '格里伏塔-多元素田园风手链', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('705', '10053022500648', '格里伏塔-复古时光宝石耳钉', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('706', '10053022500649', '格里伏塔-复古相盒毛衣链（小）', '31', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('707', '10053022500650', '格里伏塔-守望的小鸟耳钉', '28', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('708', '10053022500651', '格里伏塔-不对称古金花朵项链', '30', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('709', '10053022500652', '格里伏塔-磨砂花朵手链', '28', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('710', '10053022500653', '格里伏塔-真皮钥匙扣', '30', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('711', '10053022500654', '格里伏塔-多元素韩式胸针', '35', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('712', '10053022500655', '格里伏塔-明快真皮手链', '28', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('713', '10061718250000', '格里伏塔-时光宝石胸针（大）', '45', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('714', '10061718250001', '格里伏塔-皇冠时光宝石项链', '45', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('715', '10061718250002', '格里伏塔-时光宝石手链', '35', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('716', '10061718250003', '格里伏塔-DRINK ME', '32', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('717', '10061718250004', '格里伏塔WOW-炉石', '15', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('718', '10061718250005', '格里伏塔WOW-镶钻炉石', '25', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('719', '10061718250006', '格里伏塔WOW-小情人节糖果包', '15', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('720', '10061718250007', '格里伏塔WOW-软泥包', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('721', '10061718250008', '格里伏塔WOW-冲锋', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('722', '10061718250009', '格里伏塔WOW-任务胸针', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('723', '10062020140007', '格里伏塔-复古耳钉', '30', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('724', '10062020140008', '格里伏塔-蜗牛与树叶胸针', '35', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('725', '10061718250013', '格里伏塔-手机包', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('726', '10061718250014', '格里伏塔-时光宝石戒指', '22', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('727', '10060223560006', '格里伏塔-皇冠花边戒指', '15', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('728', '10060223560007', '格里伏塔-Drink me项链', '28', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('729', '10060723560000', '格里伏塔-时光宝石胸针(小）', '31', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('730', '10071020310008', '格里伏塔-套装扑克耳钉(4枚)', '42', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('731', '10071020310009', '格里伏塔-陶瓷首饰盒', '20', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('732', '10072523200017', '格里伏塔-时光宝石手机链', '30', '1', '1', '20091003199_.gif', 'C-15', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('733', '10053022500656', '凤龙-名片夹', '59', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('734', '10053022500657', '凤龙-徽章', '10', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('735', '10053022500658', '凤龙-姜饼钱包', '59', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('736', '10053022500659', '凤龙-化妆包', '78', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('737', '10053022500660', '凤龙-蝴蝶结手拎包', '59', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('738', '10053022500661', '凤龙-姜饼钥匙包', '49', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('739', '10053022500662', '凤龙-姜饼卡包', '29', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('740', '10053022500663', '凤龙-姜饼腕包手机挂包', '49', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('741', '10053022500664', '凤龙-草帽手机包', '49', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('742', '10062612120008', '凤龙-草帽钥匙包', '49', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('743', '10062612120009', '凤龙-PSP包', '59', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('744', '10062612120010', '凤龙-姜饼手机挂包', '49', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('745', '10062612120011', '凤龙-蝴蝶结挎包', '88', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('746', '10062612120012', '凤龙-熊猫挂包', '49', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('747', '10062612120013', '凤龙-零钱卡包', '15', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('748', '10062612120014', '凤龙-收纳包', '24', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('749', '10062612120015', '凤龙-手绘名片夹', '88', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('750', '10062612120016', '凤龙-烟盒', '98', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('751', '10062612120017', '凤龙-打火机', '49', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('752', '10070520310000', '凤龙-文化衫', '78', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('753', '10070520310001', '凤龙-镜子', '49', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('754', '10070520310002', '凤龙-船票', '8', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('755', '10070520310003', '凤龙-证书', '15', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('756', '10070520310004', '凤龙-奖牌', '18', '1', '1', '20091003199_.gif', 'C-23', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('757', '10053022500665', 'STAR-卡贴', '4', '1', '1', '20091003199_.gif', 'C-18', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('758', '10053022500666', 'STAR-情侣卡贴', '8', '1', '1', '20091003199_.gif', 'C-18', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('759', '10053022500667', 'STAR-大徽章', '10', '1', '1', '20091003199_.gif', 'C-18', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('860', '10053022500758', 'N08RA143-001D', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('861', '10053022500759', 'N09ZO107-001C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('862', '10053022500760', 'N09ZO107-002C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('863', '10053022500761', 'N09ZO107-003C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('864', '10053022500762', 'N09ZO107-004C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('865', '10053022500763', 'N08RA148-001C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('866', '10053022500764', 'N08RA148-002C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('867', '10053022500765', 'N08ZO097-002B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('868', '10053022500766', 'N08ZO091-004B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('869', '10053022500767', 'N08ZO091-005B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('870', '10053022500768', 'N08RA142-002A', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('871', '10053022500769', 'N08RA142-006A', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('872', '10053022500770', 'N08ZO100-001C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('873', '10053022500771', 'N08BE078-001B', '198', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('874', '10053022500772', 'N08BE079-001B', '198', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('875', '10053022500773', 'N08CA067-002B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('876', '10053022500774', 'N08CA068-001A', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('877', '10053022500775', 'N09DO059-001C-3', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('878', '10053022500776', 'N09RA151-001C', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('879', '10053022500777', 'N09RA157-001C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('880', '10053022500778', 'N08ZO097-003B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('881', '10053022500779', 'N09ZO108-001B', '98', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('882', '10053022500780', 'N09ZO108-002B', '98', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('883', '10053022500781', 'N09ZO108-003B', '98', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('884', '10053022500782', 'N09ZO108-004B', '98', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('885', '10053022500783', 'N09ZO108-005B', '98', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('886', '10053022500784', 'N09ZO108-008B', '88', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('887', '10053022500785', 'N09ZO108-009B', '88', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('888', '10053022500786', 'N09ZO104-001A', '118', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('889', '10053022500787', 'N09ZO105-001A', '118', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('890', '10053022500788', 'N08RA147-004B', '88', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('891', '10053022500789', 'N08RA147-005B', '88', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('892', '10053022500790', 'N08BE068-001C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('893', '10053022500791', 'N08BE069-001C', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('894', '10053022500792', 'N08BE066-002C', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('895', '10053022500793', 'N09BE085-001C', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('896', '10053022500794', 'N09BE085-002', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('897', '10053022500795', 'N09BE085-003C', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('898', '10053022500796', 'N09BE089-001B', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('899', '10053022500797', 'N08DO049-003B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('900', '10053022500798', 'N08DO049-002C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('901', '10053022500799', 'N07ZO061-038D', '188', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('902', '10053022500800', 'N07ZO061-019D', '188', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('903', '10053022500801', 'N08ZO084-003A', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('904', '10053022500802', 'N08ZO093-002C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('905', '10053022500803', 'N08ZO091-007B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('906', '10053022500804', 'N08ZO100-001C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('907', '10053022500805', 'N08CA068-002A', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('908', '10053022500806', 'N08ZO086-001C', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('909', '10053022500807', 'N08RA110-006C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('910', '10053022500808', 'N08ZO085-003C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('911', '10053022500809', 'N08BE067-001C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('912', '10053022500810', 'N09BE085-003C', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('913', '10053022500811', 'N09BE087-010C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('914', '10053022500812', 'N08BE072-002B', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('915', '10053022500813', 'N09RA166-001C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('916', '10053022500814', 'N08ZO086-003C', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('917', '10053022500815', 'N08DO052-001A', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('918', '10053022500816', 'N08RA110-002C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('919', '10053022500817', 'N09RA156-001C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('920', '10053022500818', 'N08RA138-001C-2', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('921', '10053022500819', 'N08RA139-001C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('922', '10053022500820', 'N08ZO091-008B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('923', '10053022500821', 'N09RA157-001C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('924', '10053022500822', 'N08DO054-002C', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('925', '10053022500823', 'N08RA149-002C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('926', '10053022500824', 'N08ZO097-004B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('927', '10053022500825', 'N09RA168-003C', '98', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('928', '10053022500826', 'N09RA168-004C', '98', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('929', '10053022500827', 'N09RA167-001B', '98', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('930', '10053022500828', 'N09BE085-003C', '168', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('931', '10053022500829', 'N09BE087-011C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('932', '10053022500830', 'N08BE077-001B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('933', '10053022500831', 'N07ZO061-041D', '188', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('934', '10053022500832', 'N08RA110-006C', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('935', '10053022500833', 'N08RA139-005C', '138', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('936', '10053022500834', 'N08ZO091-006B', '158', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('937', '10053022500835', 'N09RA168-009C', '98', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('938', '10053022500836', 'N09RA168-012C', '98', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('939', '10053022500837', '熊笔记本', '15', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('940', '10053022500838', '兔笔记本', '15', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('941', '10053022500839', '猫笔记本', '15', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('942', '10053022500840', '长颈鹿笔记本', '15', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('943', '10053022500841', 'DIY包 1#1', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('944', '10053022500842', 'DIY包 1#2', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('945', '10053022500843', 'DIY包 1#3', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('946', '10053022500844', 'DIY包 1#4', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('947', '10053022500845', 'DIY包 1#5', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('948', '10053022500846', 'DIY包2#1', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('949', '10053022500847', 'DIY包2#2', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('950', '10053022500848', 'DIY包2#3', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('951', '10053022500849', 'DIY包2#4', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('952', '10053022500850', 'DIY包3#1', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('953', '10053022500851', 'DIY包3#2', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('954', '10053022500852', 'DIY包3#3', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('955', '10053022500853', 'DIY包3#4', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('956', '10053022500854', 'DIY包4#', '50', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('957', '10053022500855', 'N10-SF1', '28', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('958', '10053022500856', 'N10-SF2', '28', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('959', '10053022500857', 'N10-SF3', '28', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('960', '10053022500858', 'N10-SF4', '28', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('961', '10053022500859', 'N10-SF5', '28', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('962', '10053022500860', 'N10-SF6', '28', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('963', '10053022500861', 'N10-SF7', '28', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('964', '10053022500862', 'N10-SF8', '28', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('965', '10053022500863', 'N10-SF9', '28', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('966', '10053022500864', 'N10-SF10', '28', '1', '1', '20091003199_.gif', 'NO3NO4', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('967', '10053022500865', '80\'s大队长', '110', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('968', '10053022500866', '80\'s小号大队长', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('969', '10053022500867', '80\'s小样（绿）', '75', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('970', '10053022500868', '80\'s小样（蓝）', '75', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('971', '10053022500869', '80\'s小号加班兔', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('972', '10053022500870', '80\'s大号格子加班兔', '88', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('973', '10053022500871', '80\'s大号条纹加班兔', '88', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('974', '10053022500872', '80\'s小女孩', '85', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('975', '10053022500873', '80\'s娃娃头（汽车头枕）', '28', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('976', '10053022500874', '80\'s娃娃头靠枕', '55', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('977', '10053022500875', '80\'s抱枕（MM）红', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('978', '10053022500876', '80\'s抱枕（MM）蓝', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('979', '10053022500877', '80\'s抱枕（JJ）蓝', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('980', '10053022500878', '80\'s抱枕（JJ）红', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('981', '10053022500879', '80\'s抱枕（DG）红', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('982', '10053022500880', '80\'s抱枕（DG）蓝', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('983', '10053022500881', '80\'s抱枕（BB）红', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('984', '10053022500882', '80\'s抱枕（BB）蓝', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('985', '10053022500883', '80\'s抱枕（DD）蓝', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('986', '10053022500884', '80\'s抱枕（DD）红', '65', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('987', '10060223560008', '80\'s手提袋', '2', '1', '1', '20091003199_.gif', 'C-52', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('988', '10053022500885', '黑嘛嘛-葵花宝典（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('989', '10053022500886', '黑嘛嘛-降龙十八掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('990', '10053022500887', '黑嘛嘛-玉女心经（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('991', '10053022500888', '黑嘛嘛-无字天书（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('992', '10053022500889', '黑嘛嘛-如来神掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('993', '10053022500890', '黑嘛嘛-凌波微步（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('994', '10053022500891', '黑嘛嘛-九阴真经（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('995', '10053022500892', '黑嘛嘛-九阳神功（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('996', '10053022500893', '黑嘛嘛-笑傲江湖（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('997', '10053022500894', '黑嘛嘛-独孤九剑（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('998', '10053022500895', '黑嘛嘛-六脉神剑谱（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('999', '10053022500896', '黑嘛嘛-四十二章经（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1000', '10053022500897', '黑嘛嘛-黯然销魂掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1001', '10053022500898', '黑嘛嘛-辟邪剑谱（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1002', '10053022500899', '黑嘛嘛-乾坤大挪移（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1003', '10053022500900', '黑嘛嘛-抓X龙抓手（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1004', '10053022500901', '黑嘛嘛-吸星大法（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1005', '10053022500902', '黑嘛嘛-蛤蟆功（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1006', '10053022500903', '黑嘛嘛-化骨绵掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1007', '10053022500904', '黑嘛嘛-打狗棒法（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1008', '10053022500905', '黑嘛嘛-紫霞秘籍（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1009', '10053022500906', '黑嘛嘛-北斗神拳（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1010', '10053022500907', '黑嘛嘛-龟派气功（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1011', '10053022500908', '黑嘛嘛-葵花点穴手（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1012', '10053022500909', '黑嘛嘛-玄冥神掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1013', '10053022500910', '黑嘛嘛-弹指神通（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1014', '10053022500911', '黑嘛嘛-拈花擒拿手（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1015', '10053022500912', '黑嘛嘛-九阴白骨爪（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1016', '10053022500913', '黑嘛嘛-斗转星移（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1017', '10053022500914', '黑嘛嘛-高山流水（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1018', '10053022500915', '黑嘛嘛-金蛇秘籍（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1019', '10053022500916', '黑嘛嘛-达摩剑谱（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1020', '10053022500917', '黑嘛嘛-北冥神功（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1021', '10053022500918', '黑嘛嘛-玄铁剑法（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1022', '10053022500919', '黑嘛嘛-一阳指（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1023', '10053022500920', '黑嘛嘛-金刚指（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1024', '10053022500921', '黑嘛嘛-金刚般若掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1025', '10053022500922', '黑嘛嘛-大力精钢掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1026', '10053022500923', '黑嘛嘛-左右互博术（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1027', '10053022500924', '黑嘛嘛-无相神功（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1028', '10053022500925', '黑嘛嘛-铁砂掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1029', '10053022500926', '黑嘛嘛-太极剑法（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1030', '10053022500927', '黑嘛嘛-太极全经（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1031', '10053022500928', '黑嘛嘛-太极拳（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1032', '10053022500929', '黑嘛嘛-摧心掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1033', '10053022500930', '黑嘛嘛-吸心大法（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1034', '10053022500931', '黑嘛嘛-八卦连环掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1035', '10053022500932', '黑嘛嘛-易筋经（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1036', '10053022500933', '黑嘛嘛-我喜欢你（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1037', '10053022500934', '黑嘛嘛-我中意你（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1038', '10053022500935', '黑嘛嘛-我稀饭你（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1039', '10053022500936', '黑嘛嘛-逍遥拳（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1040', '10053022500937', '黑嘛嘛-书生夺命剑（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1041', '10053022500938', '黑嘛嘛-唐寅诗集（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1042', '10053022500939', '黑嘛嘛-面目全非脚（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1043', '10053022500940', '黑嘛嘛-还我飘飘拳（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1044', '10053022500941', '黑嘛嘛-风神腿（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1045', '10053022500942', '黑嘛嘛-排云掌（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1046', '10053022500943', '黑嘛嘛-穿心龙爪手（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1047', '10053022500944', '黑嘛嘛-御女心经（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1048', '10053022500945', '黑嘛嘛-葵花宝典（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1049', '10053022500946', '黑嘛嘛-降龙十八掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1050', '10053022500947', '黑嘛嘛-玉女心经（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1051', '10053022500948', '黑嘛嘛-无字天书（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1052', '10053022500949', '黑嘛嘛-如来神掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1053', '10053022500950', '黑嘛嘛-凌波微步（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1054', '10053022500951', '黑嘛嘛-九阴真经（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1055', '10053022500952', '黑嘛嘛-九阳神功（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1056', '10053022500953', '黑嘛嘛-笑傲江湖（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1057', '10053022500954', '黑嘛嘛-独孤九剑（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1058', '10053022500955', '黑嘛嘛-六脉神剑谱（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1059', '10053022500956', '黑嘛嘛-四十二章经（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1060', '10053022500957', '黑嘛嘛-黯然销魂掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1061', '10053022500958', '黑嘛嘛-辟邪剑谱（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1062', '10053022500959', '黑嘛嘛-乾坤大挪移（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1063', '10053022500960', '黑嘛嘛-抓X龙抓手（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1064', '10053022500961', '黑嘛嘛-吸星大法（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1065', '10053022500962', '黑嘛嘛-蛤蟆功（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1066', '10053022500963', '黑嘛嘛-化骨绵掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1067', '10053022500964', '黑嘛嘛-打狗棒法（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1068', '10053022500965', '黑嘛嘛-紫霞秘籍（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1069', '10053022500966', '黑嘛嘛-北斗神拳（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1070', '10053022500967', '黑嘛嘛-龟派气功（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1071', '10053022500968', '黑嘛嘛-葵花点穴手（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1072', '10053022500969', '黑嘛嘛-玄冥神掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1073', '10053022500970', '黑嘛嘛-弹指神通（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1074', '10053022500971', '黑嘛嘛-拈花擒拿手（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1075', '10053022500972', '黑嘛嘛-九阴白骨爪（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1076', '10053022500973', '黑嘛嘛-斗转星移（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1077', '10053022500974', '黑嘛嘛-高山流水（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1078', '10053022500975', '黑嘛嘛-金蛇秘籍（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1079', '10053022500976', '黑嘛嘛-达摩剑谱（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1080', '10053022500977', '黑嘛嘛-北冥神功（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1081', '10053022500978', '黑嘛嘛-玄铁剑法（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1082', '10053022500979', '黑嘛嘛-一阳指（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1083', '10053022500980', '黑嘛嘛-金刚指（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1084', '10053022500981', '黑嘛嘛-金刚般若掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1085', '10053022500982', '黑嘛嘛-大力精钢掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1086', '10053022500983', '黑嘛嘛-左右互博术（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1087', '10053022500984', '黑嘛嘛-无相神功（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1088', '10053022500985', '黑嘛嘛-铁砂掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1089', '10053022500986', '黑嘛嘛-太极剑法（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1090', '10053022500987', '黑嘛嘛-太极全经（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1091', '10053022500988', '黑嘛嘛-太极拳（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1092', '10053022500989', '黑嘛嘛-摧心掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1093', '10053022500990', '黑嘛嘛-吸心大法（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1094', '10053022500991', '黑嘛嘛-八卦连环掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1095', '10053022500992', '黑嘛嘛-易筋经（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1096', '10053022500993', '黑嘛嘛-我喜欢你（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1097', '10053022500994', '黑嘛嘛-我中意你（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1098', '10053022500995', '黑嘛嘛-我稀饭你（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1099', '10053022500996', '黑嘛嘛-逍遥拳（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1100', '10053022500997', '黑嘛嘛-书生夺命剑（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1101', '10053022500998', '黑嘛嘛-唐寅诗集（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1102', '10053022500999', '黑嘛嘛-面目全非脚（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1106', '10053022501003', '黑嘛嘛-穿心龙爪手（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1116', '10053022501011', '青年马克杯-非诚勿扰', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1118', '10053022501013', '青年马克杯-努力玩乐', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1126', '10053022501021', '一辈子系列-花', '30', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1128', '10053022501023', '一辈子系列-SWEET', '30', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1133', '10060523560006', '自作自售-墨镜皮包', '15', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1135', '10060523560008', '自作自售-长身出气兔', '68', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1139', '10060523560012', '自作自售-小飞猪2号', '25', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1146', '10060723560001', '自作自售-桃心头花P-01', '7', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1148', '10071020310010', '自作自售-大头兔', '48', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1153', '10060523560030', '王赖赖-王赖赖玩偶（大号）', '168', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1155', '10060523560032', '王赖赖挂件', '35', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1157', '10060523560034', '王赖赖-大狼灰灰车枕', '108', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1166', '10060523560043', '王赖赖-王赖赖靠枕', '80', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1177', '10061018100010', '元素X-百花耳钉（小号）', '28', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1181', '10061018100014', '元素X-纯银琉璃项链', '89', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1182', '10062612120000', '白相大上海手绘旅行指南', '15', '1', '1', '20091003199_.gif', 'C-19', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1188', '10062612120006', '玩转世博绘-擦镜布', '30', '1', '1', '20091003199_.gif', 'C-19', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1191', '10071020310027', 'Gismo-砂糖兔储物罐', '35', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1204', '10072111330020', 'Gismo-十二生肖公仔', '30', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1205', '10072111330021', 'Gismo-火影神者', '30', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1206', '10072111330022', 'Gismo-漫画英雄', '30', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1208', '10072111330024', 'Gismo-冬季恋歌', '60', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1209', '10072111330025', 'Gismo-面具海盗', '30', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1210', '10071120310008', '麻椒-熊猫桃心眼卡包（兰）', '68', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1212', '10071120310010', '麻椒-猩猩卡包（兰）', '68', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1216', '10071120310014', '麻椒-HC电脑包（领带绿）', '78', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1218', '10071120310016', '麻椒-HC电脑包（猫头鹰绿）', '78', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1220', '10071120310018', '麻椒-画笔工具卷筒(黑色）', '58', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1224', '10071120310022', '麻椒-雷锋横板包（咖啡）', '128', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1230', '10071120310028', '麻椒-简约斜挎包（咖啡）', '99', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1232', '10071120310030', '麻椒-HC不织布psp包（手柄黑）', '48', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1236', '10071120310034', '麻椒-熊猫桃心眼卡包（绿）', '68', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1244', '10071120310042', '麻椒-画笔工具小手包（橘色）', '38', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1246', '10071120310044', '麻椒-大眼猫包（蓝色）', '138', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1250', '10071120310048', '麻椒-大眼猫包（粉色）', '138', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1252', '10071120310050', '麻椒-猫猫卡卡小竖包（灰色）', '99', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1253', '10071120310051', '麻椒-猫猫卡卡小竖包（绿色）', '99', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1254', '10072523200000', '麻椒-手绘风格小手包', '38', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1262', '10072523200008', '麻椒-大眼猫饺子包（粉）', '138', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1267', '10071120310052', 'flyqueen-天鹅-宝蓝色', '299', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1268', '10071120310053', 'flyqueen-天鹅-粉红色', '299', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1271', '10071120310056', 'flyqueen-贵宾狗方形抱枕', '129', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1273', '10071120310058', 'flyqueen-睡梦公主抱枕', '159', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1275', '10071120310060', 'flyqueen-小丑玩偶-黑色', '139', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1278', '10071120310063', 'flyqueen-穿红鞋的女孩-屎妞', '219', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1279', '10071120310064', 'flyqueen-穿红鞋的女孩-皇冠', '219', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1281', '10071120310066', 'flyqueen-无忧夫', '109', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1283', '10071120310068', 'flyqueen-青葱新娘', '299', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1285', '10071120310070', 'flyqueen-礼服新郎', '109', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1287', '10071120310072', 'flyqueen-warmheart系列群心抱枕', '239', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1289', '10071120310074', 'flyqueen-皇冠心枕-玫红色', '109', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1291', '10071120310076', 'flyqueen-小丑挂饰-蓝色', '69', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1293', '10071120310078', 'flyqueen-小丑挂饰-紫色', '69', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1295', '10071120310080', 'flyqueen-小丑挂饰-黑色', '69', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1297', '10071120310082', 'flyqueen-心愿树吊饰-红心', '39', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1299', '10071120310084', 'flyqueen-公主裙挂饰', '69', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1301', '10071120310086', 'flyqueen-雪茄女王挂饰', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1303', '10071120310088', 'flyqueen-青鸟挂饰', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1305', '10071120310090', 'flyqueen-圣诞树挂饰-粉色', '59', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1307', '10071120310092', 'flyqueen-皇冠小鸟挂饰-黑色', '59', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1312', '10071120310097', 'flyqueen-飞天女侠挂饰-红身', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1320', '10071120310105', 'flyqueen-樱桃挂饰-蓝色', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1323', '10071120310108', 'flyqueen-小白骨精灵-蓝色', '69', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1325', '10071120310110', 'flyqueen-小白兔一家胸针-蓝色', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1326', '10071120310111', 'flyqueen-五彩汽球', '39', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1335', '10071120310120', 'flyqueen-蘑菇胸针-红色', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1336', '10071120310121', 'flyqueen-蘑菇胸针-蓝色', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1338', '10071120310123', 'flyqueen-fly项链', '99', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1340', '10071120310125', 'flyqueen-兔子项链', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1343', '10071120310128', 'flyqueen-猫腕带-酒红', '59', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1345', '10071120310130', 'flyqueen-睡梦公主方纸巾盒', '89', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1346', '10071120310131', 'flyqueen-雪茄圆纸巾盒', '109', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1349', '10071120310134', 'flyqueen-心愿树颈枕--树桩2', '89', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1353', '10071120310138', 'flyqueen-心愿树杂物垫/框', '89', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1360', '10071120310145', 'flyqueen-鸭子胸针', '69', '1', '1', '20091003199_.gif', 'C-11', '宽1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-09 16:41:21');
INSERT INTO `dd_product` VALUES ('1363', '10072000580023', '陶格-工笔青花挂坠', '68', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1367', '10072000580027', '陶格-花项链', '58', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1371', '10072000580031', '陶格-似锦年华耳坠', '38', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1375', '10072000580035', '陶格-花朵戒指', '20', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1377', '10072111330001', '陶格-青花挂坠（小号）', '38', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1381', '10053022501001', '黑嘛嘛-风神腿（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1386', '10072111330019', '黑嘛嘛-门派牌子', '8', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1387', '10053022501005', '青年马克杯-加班是可耻的', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1389', '10053022501007', '青年马克杯-想到祖国未统一', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1391', '10053022501009', '青年马克杯-用猫步走向世界', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1397', '10053022501015', '青年马克杯-是金子总会闪光', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1399', '10053022501017', '一辈子系列-唇印', '30', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1401', '10053022501019', '一辈子系列-心', '30', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1408', '10060523560004', '自作自售-花瓣头花', '12', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1414', '10060523560010', '自作自售-出气兔中', '39', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1418', '10060523560014', '自作自售-小飞兔2号', '20', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1420', '10060523560016', '自作自售-爱美兔4号', '59', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1422', '10060523560018', '自作自售-兔子正方抱枕中', '58', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1428', '10060523560028', '王赖赖-熊猫玩偶（大号）', '168', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1436', '10060523560036', '王赖赖-小号帆布包', '90', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1438', '10060523560038', '王赖赖-休闲风帆布包(长款)', '135', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1440', '10060523560040', '王赖赖-大号帆布包   ', '110', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1442', '10060523560042', '王赖赖-老虎头抱枕', '80', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1444', '10060723560004', '王赖赖-大狼灰灰挂件', '35', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1446', '10061018100002', '元素X-水晶手链', '128', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1448', '10061018100004', '元素X-多彩水晶琉璃手链', '68', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1450', '10061018100006', '元素X-琉璃耳环', '59', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1452', '10061018100008', '元素X-慕斯耳钉', '25', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1456', '10061018100012', '元素X-慕斯蛋糕戒指', '12', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1461', '10062612120002', '玩转世博绘-48张明信片', '100', '1', '1', '20091003199_.gif', 'C-19', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1463', '10062612120004', '玩转世博绘-9张贺卡', '50', '1', '1', '20091003199_.gif', 'C-19', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1470', '10071020310029', 'Gismo-砂糖兔（大）', '78', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1472', '10071020310031', 'Gismo-砂糖兔（小）', '28', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1474', '10071020310033', 'Gismo-爆牙公钥匙包', '28', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1476', '10071020310035', 'Gismo-Q版扑克', '5', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1478', '10071918140007', 'Gismo-玛格丽特杯垫', '3', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1491', '10071120310012', '麻椒-HC电脑包（电视机黄）', '78', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1499', '10071120310020', '麻椒-不织布电视机电脑包（咖啡）', '78', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1503', '10071120310024', '麻椒-大眼猫饺子包（绿）', '138', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1505', '10071120310026', '麻椒-熊猫黑白眼皮饺子包（黄）', '138', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1511', '10071120310032', '麻椒-画笔工具小手包（绿）', '38', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1515', '10071120310036', '麻椒-猩猩卡包（灰）', '68', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1517', '10071120310038', '麻椒-雷锋靠垫（深蓝绒）', '88', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1519', '10071120310040', '麻椒-画笔工具卷筒（灰色）', '58', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1525', '10071120310046', '麻椒-天空帆布包（绿色）', '88', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1536', '10072523200005', '麻椒-大眼猫杂物包（兰）', '38', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1547', '10071120310055', 'flyqueen-天鹅-墨绿', '299', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1549', '10071120310057', 'flyqueen-奥运狗弓形抱枕', '269', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1551', '10071120310059', 'flyqueen-国王头抱枕', '199', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1553', '10071120310061', 'flyqueen-小丑玩偶-黄色', '139', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-09 16:39:55');
INSERT INTO `dd_product` VALUES ('1554', '10071120310062', 'flyqueen-小丑玩偶-蓝色', '139', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1557', '10071120310065', 'flyqueen-吹心女孩', '299', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1559', '10071120310067', 'flyqueen-莫愁娘子', '299', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1563', '10071120310071', 'flyqueen-礼服新娘', '279', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1567', '10071120310075', 'flyqueen-皇冠心枕-蓝色', '109', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1569', '10071120310077', 'flyqueen-小丑挂饰-橙色', '69', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1571', '10071120310079', 'flyqueen-小丑挂饰-金色', '69', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1573', '10071120310081', 'flyqueen-大象挂饰', '39', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1577', '10071120310085', 'flyqueen-横脸公主挂饰', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1579', '10071120310087', 'flyqueen-国王头挂饰', '69', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1587', '10071120310095', 'flyqueen-屎妞挂饰-红身', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1588', '10071120310096', 'flyqueen-屎妞挂饰-蓝身', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1594', '10071120310102', 'flyqueen-美人鱼挂饰-蓝身', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1596', '10071120310104', 'flyqueen-樱桃挂饰-酒红', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1598', '10071120310106', 'flyqueen-苹果挂饰', '39', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1601', '10071120310109', 'flyqueen-小白兔一家胸针-红色', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1609', '10071120310117', 'flyqueen-大耳兔胸针-蓝色', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1618', '10071120310126', 'flyqueen-心塔项链', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1621', '10071120310129', 'flyqueen-猫腕带-蓝色', '59', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1627', '10071120310135', 'flyqueen-心愿树影碟包', '129', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1628', '10071120310136', 'flyqueen-心愿树心果抱枕', '169', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1631', '10071120310139', 'flyqueen-小丑皇冠胸针', '39', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1632', '10071120310140', 'flyqueen-红小丑项链', '59', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1633', '10071120310141', 'flyqueen-红冠皇后胸针', '59', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1635', '10071120310143', 'flyqueen-云朵雨点胸针', '59', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '上海', '1', '2010-08-06 19:06:29', 'user1', '2010-08-09 17:00:40');
INSERT INTO `dd_product` VALUES ('1641', '10072000580024', '陶格-娃娃头挂坠', '88', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1643', '10072000580026', '陶格-粉彩挂坠', '38', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1645', '10072000580028', '陶格-似锦年华项链（小号）', '48', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1646', '10072000580029', '陶格-小老虎', '68', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1647', '10072000580030', '陶格-青花耳坠', '68', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1650', '10072000580033', '陶格-纯色耳钉', '38', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1651', '10072000580034', '陶格-花朵耳钉', '38', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1653', '10072111330000', '陶格-三色手链', '30', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1657', '10053022501000', '黑嘛嘛-还我飘飘拳（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1659', '10053022501002', '黑嘛嘛-排云掌（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1661', '10053022501004', '黑嘛嘛-御女心经（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1662', '10071120310007', '黑嘛嘛-笔记本', '28', '1', '1', '20091003199_.gif', 'C-60', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1665', '10053022501006', '青年马克杯-好好玩乐，天天向上', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1667', '10053022501008', '青年马克杯-没谱青年', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1669', '10053022501010', '青年马克杯-为人民币服务', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1671', '10053022501012', '青年马克杯-还是喝白开水最放心', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1673', '10053022501014', '青年马克杯-幸福的直哆嗦', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1675', '10053022501016', '青年马克杯-不知什么时候', '25', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1677', '10053022501018', '一辈子系列-福', '30', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1679', '10053022501020', '一辈子系列-LOVE', '30', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1681', '10053022501022', '一辈子系列-HAPPY', '30', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1683', '10061914410016', '办公室杯具', '30', '1', '1', '20091003199_.gif', 'ddsh', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1684', '10060523560003', '自作自售-碎花兔挂件', '10', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1686', '10060523560005', '自作自售-大头兔挂件', '16', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1688', '10060523560007', '自作自售-囧皮包', '15', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1690', '10060523560009', '自作自售-兔鼠标垫', '15', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1692', '10060523560011', '自作自售-蘑菇挂饰', '10', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1694', '10060523560013', '自作自售-小飞兔1号', '10', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1696', '10060523560015', '自作自售-果实（小）', '10', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1698', '10060523560017', '自作自售-爱美兔7号圣诞', '120', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1701', '10060723560002', '自作自售-熊猫帽子C-01', '35', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1703', '10072000580016', '自作自首-口罩', '15', '1', '1', '20091003199_.gif', 'C-35', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1704', '10060523560027', '王赖赖-多功能购物袋', '49', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1706', '10060523560029', '王赖赖-熊猫玩偶（中号）', '65', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1708', '10060523560031', '王赖赖-王赖赖玩偶（中号）', '65', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1710', '10060523560033', '王赖赖-大狼灰灰皮衣', '115', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1712', '10060523560035', '王赖赖-老虎车枕', '108', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1714', '10060523560037', '王赖赖-休闲风帆布包(短款) ', '125', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1716', '10060523560039', '王赖赖-双面帆布包 ', '128', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1718', '10060523560041', '王赖赖-单肩包', '129', '1', '1', '20091003199_.gif', 'WLL', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1722', '10061018100001', '元素X-纯银琉璃手链', '128', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1724', '10061018100003', '元素X-磨砂琉璃手链', '88', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1726', '10061018100005', '元素X-黑水晶（三件套）', '198', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1728', '10061018100007', '元素X-天使翅膀耳环', '59', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1730', '10061018100009', '元素X-百花耳钉（大号）', '49', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1732', '10061018100011', '元素X-淑女耳钉', '32', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1734', '10061018100013', '元素X-小花戒指', '19', '1', '1', '20091003199_.gif', 'C-28', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1737', '10062612120001', '玩转世博绘-园区旅行指南', '20', '1', '1', '20091003199_.gif', 'C-19', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1739', '10062612120003', '玩转世博绘-12张明信片', '20', '1', '1', '20091003199_.gif', 'C-19', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1741', '10062612120005', '玩转世博绘-mini贴纸24+8张', '40', '1', '1', '20091003199_.gif', 'C-19', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1743', '10062612120007', '玩转世博绘-手绘典藏丝巾', '200', '1', '1', '20091003199_.gif', 'C-19', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1744', '10071020310026', 'Gismo-生日熊', '10', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1746', '10071020310028', 'Gismo-砂糖兔（特大）', '98', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1748', '10071020310030', 'Gismo-砂糖兔（中）', '48', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1750', '10071020310032', 'Gismo-婚礼兔（1对）', '78', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1752', '10071020310034', 'Gismo-时尚背包', '38', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1754', '10071918140006', 'Gismo-玛格丽特N次贴', '15', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1756', '10071918140008', 'Gismo-玛格丽特鼠标垫', '10', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1757', '10071918140009', 'Gismo-玛格丽特铅笔盒', '15', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1761', '10072111330023', 'Gismo-欢喜冤家', '60', '1', '1', '20091003199_.gif', 'C-21', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1765', '10071120310009', '麻椒-熊猫桃心眼卡包（黄）', '68', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1767', '10071120310011', '麻椒-猩猩卡包（绿）', '68', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1769', '10071120310013', '麻椒-HC电脑包（领带兰）', '78', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1771', '10071120310015', '麻椒-HC电脑包（猫头鹰粉）', '78', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1773', '10071120310017', '麻椒-猩猩靠垫（深蓝绒金）', '88', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1775', '10071120310019', '麻椒-不织布相机包', '48', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1777', '10071120310021', '麻椒-猩猩横板包（黑金）', '128', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1779', '10071120310023', '麻椒-电视机横板包（灰色）', '128', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1781', '10071120310025', '麻椒-卡卡小挎包（兰）', '99', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1783', '10071120310027', '麻椒-雷锋斜挎包（深灰）', '138', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1785', '10071120310029', '麻椒-HC不织布psp包（手柄红）', '48', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1787', '10071120310031', '麻椒-HC不织布psp包（手柄绿）', '48', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1789', '10071120310033', '麻椒-猫猫卡卡小竖包（橘色）', '99', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1791', '10071120310035', '麻椒-熊猫桃心眼卡包（灰）', '68', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1793', '10071120310037', '麻椒-帆布小徽章', '15', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1795', '10071120310039', '麻椒-画笔工具卷筒（红色）', '58', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1797', '10071120310041', '麻椒-画笔工具卷筒（绿色）', '58', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1799', '10071120310043', '麻椒-画笔工具小手包（灰色）', '38', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1801', '10071120310045', '麻椒-天空帆布包（黄色）', '88', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1803', '10071120310047', '麻椒-天空帆布包（灰色）', '88', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1805', '10071120310049', '麻椒-大眼猫包（黄色）', '138', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1809', '10072523200001', '麻椒-熊猫小手包（蓝）', '58', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1810', '10072523200002', '麻椒-熊猫小手包（粉）', '58', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1811', '10072523200003', '麻椒-大眼猫杂物包（咖啡）', '38', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1812', '10072523200004', '麻椒-大眼猫杂物包（粉）', '38', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1814', '10072523200006', '麻椒-大眼猫杂物包（绿）', '38', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1815', '10072523200007', '麻椒-大眼猫包（绿）', '138', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1817', '10072523200009', '麻椒-大眼猫饺子包（黄）', '138', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1818', '10072523200010', '麻椒-简约饺子包（黄）', '99', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1819', '10072523200011', '麻椒-天空帆布包（黄）', '88', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1820', '10072523200012', '麻椒-布扣耳环', '20', '1', '1', '20091003199_.gif', 'C-36', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1823', '10071120310054', 'flyqueen-天鹅-黑色', '299', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1838', '10071120310069', 'flyqueen-豆蔻新郎', '109', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1842', '10071120310073', 'flyqueen-皇冠心枕-豆沙色', '109', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1852', '10071120310083', 'flyqueen-心愿树吊饰-蓝心', '39', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1858', '10071120310089', 'flyqueen-圣诞树挂饰-绿色', '59', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1860', '10071120310091', 'flyqueen-皇冠小鸟挂饰-红色', '59', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1862', '10071120310093', 'flyqueen-偷心女贼挂饰-红心', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1863', '10071120310094', 'flyqueen-偷心女贼挂饰-蓝心', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1867', '10071120310098', 'flyqueen-飞天女侠挂饰-蓝身', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1868', '10071120310099', 'flyqueen-学生妹挂饰-红身', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1869', '10071120310100', 'flyqueen-学生妹挂饰-蓝身', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1870', '10071120310101', 'flyqueen-美人鱼挂饰-红身', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1872', '10071120310103', 'flyqueen-美人鱼挂饰-紫身', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1876', '10071120310107', 'flyqueen-小白骨精灵-酒红', '69', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1881', '10071120310112', 'flyqueen-公主头胸针', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1882', '10071120310113', 'flyqueen-ｃａｔ胸针', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1883', '10071120310114', 'flyqueen-小红兔子胸针', '10', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1884', '10071120310115', 'flyqueen-群心胸针', '29', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1885', '10071120310116', 'flyqueen-大耳兔胸针-酒红', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1887', '10071120310118', 'flyqueen-大新娘胸针 ', '79', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1888', '10071120310119', 'flyqueen-气球女孩', '99', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1891', '10071120310122', 'flyqueen-苹果徽章胸针', '69', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1893', '10071120310124', 'flyqueen-飞走的心项链', '25', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1896', '10071120310127', 'flyqueen-麋鹿项链', '59', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1901', '10071120310132', 'flyqueen-睡梦公主杂物垫/框', '89', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1902', '10071120310133', 'flyqueen-心愿树颈枕--树桩1', '89', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1906', '10071120310137', 'flyqueen-心愿树圆纸巾盒', '99', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1911', '10071120310142', 'flyqueen-黑桃五项链', '49', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1913', '10071120310144', 'flyqueen-红蛋挂饰', '149', '1', '1', '20091003199_.gif', 'C-11', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-09 16:40:03');
INSERT INTO `dd_product` VALUES ('1915', '10072000580021', '陶格-似锦年华项链（大号）', '68', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1916', '10072000580022', '陶格-国画山水挂坠', '118', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1919', '10072000580025', '陶格-海绵宝宝挂坠', '42', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1926', '10072000580032', '陶格-陶珠耳坠', '20', '1', '1', '20091003199_.gif', 'C-37', '1', '1', '1', '1', '1', '2010-08-06 19:06:29', 'user1', '2010-08-07 16:16:18');
INSERT INTO `dd_product` VALUES ('1932', '201008081551353320', '格调家具', '120', '2', '1', 'zf2.jpg', '东东001', '20X30', '原木，麻布，不锈钢', '一级', '上海', '小心轻放', '2010-08-08 15:50:39', 'user1', '2010-08-08 15:51:35');
INSERT INTO `dd_product` VALUES ('1933', '10080916530000', '雪松-牛皮手带', '15', '1', '1', '20091003199_.gif', 'C-56', '20*30', '20*30', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1934', '10080916530001', '雪松-珍珠耳环', '25', '1', '1', '20091003199_.gif', 'C-56', '20*31', '20*31', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1935', '10080916530002', '雪松-铜耳环', '35', '1', '1', '20091003199_.gif', 'C-56', '20*32', '20*32', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1936', '10080916530003', '雪松-虎眼石耳环', '45', '1', '1', '20091003199_.gif', 'C-56', '20*33', '20*33', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1937', '10080916530004', '雪松-反战松石耳环', '55', '1', '1', '20091003199_.gif', 'C-56', '20*34', '20*34', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1938', '10080916530005', '雪松-银耳环', '65', '1', '1', '20091003199_.gif', 'C-56', '20*35', '20*35', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1939', '10080916530006', '雪松-牛皮项链', '80', '1', '1', '20091003199_.gif', 'C-56', '20*36', '20*36', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1940', '10080916530007', '雪松-铜荷叶项链', '90', '1', '1', '20091003199_.gif', 'C-56', '20*37', '20*37', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1941', '10080916530008', '雪松-水晶项链', '100', '1', '1', '20091003199_.gif', 'C-56', '20*38', '20*38', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1942', '10080916530009', '雪松-珍珠项链', '120', '1', '1', '20091003199_.gif', 'C-56', '20*39', '20*39', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1943', '10080916530010', '雪松-蓝砂石项链', '140', '1', '1', '20091003199_.gif', 'C-56', '20*40', '20*40', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1944', '10080916530011', '雪松-石榴石项链', '160', '1', '1', '20091003199_.gif', 'C-56', '20*41', '20*41', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1945', '10080916530012', '雪松-菩提子项链', '180', '1', '1', '20091003199_.gif', 'C-56', '20*42', '20*42', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1946', '10080916530013', '雪松-白玉项链', '200', '1', '1', '20091003199_.gif', 'C-56', '20*43', '20*43', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1947', '10080916530014', 'CIBOYS-2寸公仔', '18', '1', '1', '20091003199_.gif', 'CIBOYS', '20*44', '20*44', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1948', '10080916530015', 'CIBOYS-2寸公仔1', '25', '1', '1', '20091003199_.gif', 'CIBOYS', '20*45', '20*45', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1949', '10080916530016', 'CIBOYS-2寸公仔2', '50', '1', '1', '20091003199_.gif', 'CIBOYS', '20*46', '20*46', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1950', '10080916530017', 'CIBOYS-魔法馒头', '5', '1', '1', '20091003199_.gif', 'CIBOYS', '20*47', '20*47', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1951', '10080916530018', 'CIBOYS-疯狂公园公仔', '20', '1', '1', '20091003199_.gif', 'CIBOYS', '20*48', '20*48', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1952', '10080916530019', 'CIBOYS-好运馒头', '10', '1', '1', '20091003199_.gif', 'CIBOYS', '20*49', '20*49', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1953', '10080916530020', 'CIBOYS-京剧脸谱', '148', '1', '1', '20091003199_.gif', 'CIBOYS', '20*50', '20*50', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1954', '10080916530021', 'CIBOYS-中秋盒装', '88', '1', '1', '20091003199_.gif', 'CIBOYS', '20*51', '20*51', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1955', '10080916530022', 'CIBOYS-惶惶马戏团', '198', '1', '1', '20091003199_.gif', 'CIBOYS', '20*52', '20*52', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1956', '10080916530023', 'CIBOYS-6寸公仔', '288', '1', '1', '20091003199_.gif', 'CIBOYS', '20*53', '20*53', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1957', '10080916530024', 'Fly Queen-天鹅艺术装饰品-宝蓝色', '299', '1', '1', '20091003199_.gif', 'C-11', '20*54', '20*54', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1958', '10080916530025', 'Fly Queen天鹅艺术装饰品-粉红色', '299', '1', '1', '20091003199_.gif', 'C-11', '20*55', '20*55', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1959', '10080916530026', 'Fly Queen天鹅艺术装饰品-黑色', '299', '1', '1', '20091003199_.gif', 'C-11', '20*56', '20*56', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1960', '10080916530027', 'Fly Queen睡梦公主抱枕', '149', '1', '1', '20091003199_.gif', 'C-11', '20*57', '20*57', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1961', '10080916530028', 'Fly Queen国王头抱枕', '169', '1', '1', '20091003199_.gif', 'C-11', '20*58', '20*58', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1962', '10080916530029', 'Fly Queen小丑玩偶-黑色', '120', '1', '1', '20091003199_.gif', 'C-11', '20*59', '20*59', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1963', '10080916530030', 'Fly Queen小丑玩偶-蓝色', '120', '1', '1', '20091003199_.gif', 'C-11', '20*60', '20*60', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1964', '10080916530031', 'Fly Queen小丑玩偶-黄色', '120', '1', '1', '20091003199_.gif', 'C-11', '20*61', '20*61', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1965', '10080916530032', 'Fly Queen穿红鞋的女孩-屎妞', '199', '1', '1', '20091003199_.gif', 'C-11', '20*62', '20*62', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1966', '10080916530033', 'Fly Queen穿红鞋的女孩-皇冠', '199', '1', '1', '20091003199_.gif', 'C-11', '20*63', '20*63', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1967', '10080916530034', 'Fly Queen无忧夫', '99', '1', '1', '20091003199_.gif', 'C-11', '20*64', '20*64', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1968', '10080916530035', 'Fly Queen莫愁娘子', '261', '1', '1', '20091003199_.gif', 'C-11', '20*65', '20*65', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1969', '10080916530036', 'Fly Queen青葱新娘', '261', '1', '1', '20091003199_.gif', 'C-11', '20*66', '20*66', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1970', '10080916530037', 'Fly Queen豆蔻新郎', '99', '1', '1', '20091003199_.gif', 'C-11', '20*67', '20*67', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1971', '10080916530038', 'Fly Queen礼服新郎', '99', '1', '1', '20091003199_.gif', 'C-11', '20*68', '20*68', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1972', '10080916530039', 'Fly Queen礼服新娘', '241', '1', '1', '20091003199_.gif', 'C-11', '20*69', '20*69', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1973', '10080916530040', 'Fly Queen皇冠心枕-豆沙', '99', '1', '1', '20091003199_.gif', 'C-11', '20*70', '20*70', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1974', '10080916530041', 'Fly Queen皇冠心枕-玫红', '99', '1', '1', '20091003199_.gif', 'C-11', '20*71', '20*71', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1975', '10080916530042', 'Fly Queen皇冠心枕-蓝色', '99', '1', '1', '20091003199_.gif', 'C-11', '20*72', '20*72', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1976', '10080916530043', 'Fly Queen小丑挂饰-蓝色', '60', '1', '1', '20091003199_.gif', 'C-11', '20*73', '20*73', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1977', '10080916530044', 'Fly Queen小丑挂饰-橙色', '60', '1', '1', '20091003199_.gif', 'C-11', '20*74', '20*74', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1978', '10080916530045', 'Fly Queen小丑挂饰-紫色', '60', '1', '1', '20091003199_.gif', 'C-11', '20*75', '20*75', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1979', '10080916530046', 'Fly Queen小丑挂饰-金色', '60', '1', '1', '20091003199_.gif', 'C-11', '20*76', '20*76', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1980', '10080916530047', 'Fly Queen小丑挂饰-黑色', '60', '1', '1', '20091003199_.gif', 'C-11', '20*77', '20*77', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1981', '10080916530048', 'Fly Queen大象挂饰', '35', '1', '1', '20091003199_.gif', 'C-11', '20*78', '20*78', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1982', '10080916530049', 'Fly Queen心愿树吊饰-红心', '35', '1', '1', '20091003199_.gif', 'C-11', '20*79', '20*79', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1983', '10080916530050', 'Fly Queen心愿树吊饰-蓝心', '35', '1', '1', '20091003199_.gif', 'C-11', '20*80', '20*80', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1984', '10080916530051', 'Fly Queen公主裙挂饰', '60', '1', '1', '20091003199_.gif', 'C-11', '20*81', '20*81', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1985', '10080916530052', 'Fly Queen横脸公主挂饰', '43', '1', '1', '20091003199_.gif', 'C-11', '20*82', '20*82', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1986', '10080916530053', 'Fly Queen雪茄女王挂饰', '43', '1', '1', '20091003199_.gif', 'C-11', '20*83', '20*83', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1987', '10080916530054', 'Fly Queen国王头挂饰', '60', '1', '1', '20091003199_.gif', 'C-11', '20*84', '20*84', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1988', '10080916530055', 'Fly Queen圣诞树挂饰-粉色', '52', '1', '1', '20091003199_.gif', 'C-11', '20*85', '20*85', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1989', '10080916530056', 'Fly Queen皇冠小鸟挂饰-红色', '52', '1', '1', '20091003199_.gif', 'C-11', '20*86', '20*86', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1990', '10080916530057', 'Fly Queen皇冠小鸟挂饰-黑色', '52', '1', '1', '20091003199_.gif', 'C-11', '20*87', '20*87', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1991', '10080916530058', 'Fly Queen偷心女贼挂饰-红心', '65', '1', '1', '20091003199_.gif', 'C-11', '20*88', '20*88', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1992', '10080916530059', 'Fly Queen偷心女贼挂饰-蓝心', '65', '1', '1', '20091003199_.gif', 'C-11', '20*89', '20*89', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1993', '10080916530060', 'Fly Queen屎妞挂饰-红身', '65', '1', '1', '20091003199_.gif', 'C-11', '20*90', '20*90', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1994', '10080916530061', 'Fly Queen屎妞挂饰-蓝身', '65', '1', '1', '20091003199_.gif', 'C-11', '20*91', '20*91', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1995', '10080916530062', 'Fly Queen学生妹挂饰-红身', '65', '1', '1', '20091003199_.gif', 'C-11', '20*92', '20*92', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1996', '10080916530063', 'Fly Queen学生妹挂饰-蓝身', '65', '1', '1', '20091003199_.gif', 'C-11', '20*93', '20*93', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1997', '10080916530064', 'Fly Queen美人鱼挂饰-红身', '65', '1', '1', '20091003199_.gif', 'C-11', '20*94', '20*94', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1998', '10080916530065', 'Fly Queen美人鱼挂饰-蓝身', '65', '1', '1', '20091003199_.gif', 'C-11', '20*95', '20*95', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('1999', '10080916530066', 'Fly Queen美人鱼挂饰-紫身', '65', '1', '1', '20091003199_.gif', 'C-11', '20*96', '20*96', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2000', '10080916530067', 'Fly Queen樱桃挂饰-酒红', '40', '1', '1', '20091003199_.gif', 'C-11', '20*97', '20*97', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2001', '10080916530068', 'Fly Queen樱桃挂饰-蓝身', '40', '1', '1', '20091003199_.gif', 'C-11', '20*98', '20*98', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2002', '10080916530069', 'Fly Queen苹果挂饰', '30', '1', '1', '20091003199_.gif', 'C-11', '20*99', '20*99', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2003', '10080916530070', 'Fly Queen小白骨精灵-酒红', '60', '1', '1', '20091003199_.gif', 'C-11', '20*100', '20*100', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2004', '10080916530071', 'Fly Queen小白骨精灵-蓝色', '60', '1', '1', '20091003199_.gif', 'C-11', '20*101', '20*101', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2005', '10080916530072', 'Fly Queen小白兔一家胸针-红色', '39', '1', '1', '20091003199_.gif', 'C-11', '20*102', '20*102', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2006', '10080916530073', 'Fly Queen小白兔一家胸针-蓝色', '39', '1', '1', '20091003199_.gif', 'C-11', '20*103', '20*103', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2007', '10080916530074', 'Fly Queen五彩汽球', '25', '1', '1', '20091003199_.gif', 'C-11', '20*104', '20*104', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2008', '10080916530075', 'Fly Queen公主头胸针', '40', '1', '1', '20091003199_.gif', 'C-11', '20*105', '20*105', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2009', '10080916530076', 'Fly Queen-ｃａｔ胸针-黑色', '39', '1', '1', '20091003199_.gif', 'C-11', '20*106', '20*106', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2010', '10080916530077', 'Fly Queen小红兔子胸针', '8', '1', '1', '20091003199_.gif', 'C-11', '20*107', '20*107', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2011', '10080916530078', 'Fly Queen群心胸针', '25', '1', '1', '20091003199_.gif', 'C-11', '20*108', '20*108', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2012', '10080916530079', 'Fly Queen大耳兔胸针-酒红', '39', '1', '1', '20091003199_.gif', 'C-11', '20*109', '20*109', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2013', '10080916530080', 'Fly Queen大耳兔胸针-蓝色', '39', '1', '1', '20091003199_.gif', 'C-11', '20*110', '20*110', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2014', '10080916530081', 'Fly Queen大新娘胸针 ', '70', '1', '1', '20091003199_.gif', 'C-11', '20*111', '20*111', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2015', '10080916530082', 'Fly Queen气球女孩-紫色', '88', '1', '1', '20091003199_.gif', 'C-11', '20*112', '20*112', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2016', '10080916530083', 'Fly Queen蘑菇胸针-红色', '39', '1', '1', '20091003199_.gif', 'C-11', '20*113', '20*113', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2017', '10080916530084', 'Fly Queen蘑菇胸针-蓝色', '39', '1', '1', '20091003199_.gif', 'C-11', '20*114', '20*114', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2018', '10080916530085', 'Fly Queen苹果徽章胸针', '60', '1', '1', '20091003199_.gif', 'C-11', '20*115', '20*115', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2019', '10080916530086', 'Fly Queen飞走的心项链', '25', '1', '1', '20091003199_.gif', 'C-11', '20*116', '20*116', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2020', '10080916530087', 'Fly Queen兔子项链', '40', '1', '1', '20091003199_.gif', 'C-11', '20*117', '20*117', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2021', '10080916530088', 'Fly Queen心塔项链', '40', '1', '1', '20091003199_.gif', 'C-11', '20*118', '20*118', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2022', '10080916530089', 'Fly Queen麋鹿项链', '49', '1', '1', '20091003199_.gif', 'C-11', '20*119', '20*119', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2023', '10080916530090', 'Fly Queen猫腕带-酒红', '52', '1', '1', '20091003199_.gif', 'C-11', '20*120', '20*120', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2024', '10080916530091', 'Fly Queen猫腕带-蓝色', '52', '1', '1', '20091003199_.gif', 'C-11', '20*121', '20*121', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2025', '10080916530092', 'Fly Queen睡梦公主圆纸巾盒-5号', '69', '1', '1', '20091003199_.gif', 'C-11', '20*122', '20*122', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2026', '10080916530093', 'Fly Queen雪茄圆纸巾盒', '96', '1', '1', '20091003199_.gif', 'C-11', '20*123', '20*123', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2027', '10080916530094', 'Fly Queen睡梦公主杂物垫/框', '79', '1', '1', '20091003199_.gif', 'C-11', '20*124', '20*124', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2028', '10080916530095', 'Fly Queen心愿树影碟包', '115', '1', '1', '20091003199_.gif', 'C-11', '20*125', '20*125', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2029', '10080916530096', 'Fly Queen心愿树心果抱枕', '149', '1', '1', '20091003199_.gif', 'C-11', '20*126', '20*126', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2030', '10080916530097', 'Fly Queen心愿树圆纸巾盒', '88', '1', '1', '20091003199_.gif', 'C-11', '20*127', '20*127', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2031', '10080916530098', 'Fly Queen小丑皇冠胸针', '34', '1', '1', '20091003199_.gif', 'C-11', '20*128', '20*128', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2032', '10080916530099', 'Fly Queen红小丑项链', '59', '1', '1', '20091003199_.gif', 'C-11', '20*129', '20*129', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2033', '10080916530100', 'Fly Queen红冠皇后胸针', '49', '1', '1', '20091003199_.gif', 'C-11', '20*130', '20*130', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2034', '10080916530101', 'Fly Queen云朵雨点胸针', '49', '1', '1', '20091003199_.gif', 'C-11', '20*131', '20*131', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2035', '10080916530102', 'Fly Queen红蛋挂饰', '43', '1', '1', '20091003199_.gif', 'C-11', '20*132', '20*132', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2036', '10080916530103', 'Fly Queen鸭子胸针', '59', '1', '1', '20091003199_.gif', 'C-11', '20*133', '20*133', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2037', '10080916530104', '安静的静-手工果冻戒指', '18', '1', '1', '20091003199_.gif', 'C-22', '20*134', '20*134', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2038', '10080916530105', '安静的静-手作小耳钉', '15', '1', '1', '20091003199_.gif', 'C-22', '20*135', '20*135', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2039', '10080916530106', '安静的静-原创插画项链', '30', '1', '1', '20091003199_.gif', 'C-22', '20*136', '20*136', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2040', '10080916530107', '安静的静-手作复古胸针', '20', '1', '1', '20091003199_.gif', 'C-22', '20*137', '20*137', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2041', '10080916530108', '安静的静-古典项链', '40', '1', '1', '20091003199_.gif', 'C-22', '20*138', '20*138', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2042', '10080916530109', 'CC饰品-电影书', '12', '1', '1', '20091003199_.gif', 'C-12', '20*139', '20*139', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2043', '10080916530110', 'CC饰品-铜戒', '10', '1', '1', '20091003199_.gif', 'C-12', '20*140', '20*140', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2044', '10080916530111', 'CC饰品-牛皮手环', '35', '1', '1', '20091003199_.gif', 'C-12', '20*141', '20*141', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2045', '10080916530112', 'CC饰品-牛皮项链', '50', '1', '1', '20091003199_.gif', 'C-12', '20*142', '20*142', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2046', '10080916530113', 'CC饰品-牛皮水晶项链', '95', '1', '1', '20091003199_.gif', 'C-12', '20*143', '20*143', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2047', '10080916530114', 'CC饰品-水晶长项链', '240', '1', '1', '20091003199_.gif', 'C-12', '20*144', '20*144', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2048', '10080916530115', 'CC饰品-水晶银链', '135', '1', '1', '20091003199_.gif', 'C-12', '20*145', '20*145', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2049', '10080916530116', 'CC饰品-耳环', '30', '1', '1', '20091003199_.gif', 'C-12', '20*146', '20*146', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2050', '10080916530117', 'CC饰品-方片银钩耳环', '85', '1', '1', '20091003199_.gif', 'C-12', '20*147', '20*147', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2051', '10080916530118', 'CC饰品-水晶方片戒指', '50', '1', '1', '20091003199_.gif', 'C-12', '20*148', '20*148', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2052', '10080916530119', 'CC饰品-水晶立体戒指', '120', '1', '1', '20091003199_.gif', 'C-12', '20*149', '20*149', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2053', '10080916530120', 'CC饰品-莲花戒指', '145', '1', '1', '20091003199_.gif', 'C-12', '20*150', '20*150', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2054', '10080916530121', 'CC饰品-纯银小猫尾戒', '210', '1', '1', '20091003199_.gif', 'C-12', '20*151', '20*151', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2055', '10080916530122', 'CC饰品-纯银大象戒指', '228', '1', '1', '20091003199_.gif', 'C-12', '20*152', '20*152', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2056', '10080916530123', 'CC饰品-玛瑙项链', '150', '1', '1', '20091003199_.gif', 'C-12', '20*153', '20*153', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2057', '10080916530124', 'CC饰品-V字型项链', '65', '1', '1', '20091003199_.gif', 'C-12', '20*154', '20*154', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2058', '10080916530125', 'CC饰品-简约短项链', '75', '1', '1', '20091003199_.gif', 'C-12', '20*155', '20*155', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2059', '10080916530126', 'CC饰品-珊瑚水晶项链', '80', '1', '1', '20091003199_.gif', 'C-12', '20*156', '20*156', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2060', '10080916530127', 'CC饰品-黑水晶颈链', '800', '1', '1', '20091003199_.gif', 'C-12', '20*157', '20*157', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2061', '10080916530128', 'CC饰品-水晶套装', '960', '1', '1', '20091003199_.gif', 'C-12', '20*158', '20*158', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2062', '10080916530129', 'CC饰品-水晶熊', '160', '1', '1', '20091003199_.gif', 'C-12', '20*159', '20*159', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2063', '10080916530130', 'CC饰品-NANA式颈链', '85', '1', '1', '20091003199_.gif', 'C-12', '20*160', '20*160', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2064', '10080916530131', 'CC饰品-S型水晶项链', '100', '1', '1', '20091003199_.gif', 'C-12', '20*161', '20*161', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2065', '10080916530132', 'CC饰品-S型水晶手环', '65', '1', '1', '20091003199_.gif', 'C-12', '20*162', '20*162', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2066', '10080916530133', 'CC饰品-冰凌花水晶项链', '160', '1', '1', '20091003199_.gif', 'C-12', '20*163', '20*163', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2067', '10080916530134', 'CC饰品-冰凌花水晶颈链', '200', '1', '1', '20091003199_.gif', 'C-12', '20*164', '20*164', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2068', '10080916530135', 'CC饰品-冰凌花水晶手环', '95', '1', '1', '20091003199_.gif', 'C-12', '20*165', '20*165', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2069', '10080916530136', 'CC饰品-冰凌花水晶脚链', '115', '1', '1', '20091003199_.gif', 'C-12', '20*166', '20*166', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2070', '10080916530137', 'CC饰品-S型水晶脚链', '80', '1', '1', '20091003199_.gif', 'C-12', '20*167', '20*167', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2071', '10080916530138', 'CC饰品-猫眼石银钩耳环', '180', '1', '1', '20091003199_.gif', 'C-12', '20*168', '20*168', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2072', '10080916530139', 'CC饰品-猫眼石嵌银项链', '180', '1', '1', '20091003199_.gif', 'C-12', '20*169', '20*169', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2073', '10080916530140', '森楠陶瓷-陶瓷挂件1', '68', '1', '1', '20091003199_.gif', 'C-58', '20*170', '20*170', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2074', '10080916530141', '森楠陶瓷-陶瓷挂件2', '58', '1', '1', '20091003199_.gif', 'C-58', '20*171', '20*171', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2075', '10080916530142', '森楠陶瓷-软陶挂件', '48', '1', '1', '20091003199_.gif', 'C-58', '20*172', '20*172', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2076', '10080916530143', '森楠陶瓷-陶瓷耳环', '38', '1', '1', '20091003199_.gif', 'C-58', '20*173', '20*173', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2077', '10080916530144', '森楠陶瓷-软陶耳环', '28', '1', '1', '20091003199_.gif', 'C-58', '20*174', '20*174', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2078', '10080916530145', '森楠陶瓷-陶瓷手链', '48', '1', '1', '20091003199_.gif', 'C-58', '20*175', '20*175', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2079', '10080916530146', '森楠陶瓷-软陶手链', '38', '1', '1', '20091003199_.gif', 'C-58', '20*176', '20*176', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2080', '10080916530147', '森楠陶瓷-软陶耳钉', '18', '1', '1', '20091003199_.gif', 'C-58', '20*177', '20*177', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2081', '10080916530148', '森楠陶瓷-陶瓷戒指', '26', '1', '1', '20091003199_.gif', 'C-58', '20*178', '20*178', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2082', '10080916530149', '元素X-琉璃耳钉', '28', '1', '1', '20091003199_.gif', 'C-28', '20*179', '20*179', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2083', '10080916530150', '元素X-水晶玻璃耳环', '28', '1', '1', '20091003199_.gif', 'C-28', '20*180', '20*180', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2084', '10080916530151', '元素X-ED010001', '98', '1', '1', '20091003199_.gif', 'C-28', '20*181', '20*181', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2085', '10080916530152', '元素X-EJ010001水晶小猫', '119', '1', '1', '20091003199_.gif', 'C-28', '20*182', '20*182', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2086', '10080916530153', '元素X-EJ010002水晶', '92', '1', '1', '20091003199_.gif', 'C-28', '20*183', '20*183', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2087', '10080916530154', '元素X-EJ010003黄锆石爱心', '98', '1', '1', '20091003199_.gif', 'C-28', '20*184', '20*184', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2088', '10080916530155', '元素X-EJ010004紫水晶耳钉', '132', '1', '1', '20091003199_.gif', 'C-28', '20*185', '20*185', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2089', '10080916530156', '元素X-EJ010005墨绿水晶', '168', '1', '1', '20091003199_.gif', 'C-28', '20*186', '20*186', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2090', '10080916530157', '元素X-EJ010006子水晶云朵', '168', '1', '1', '20091003199_.gif', 'C-28', '20*187', '20*187', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2091', '10080916530158', '元素X-EJ010007四叶草', '172', '1', '1', '20091003199_.gif', 'C-28', '20*188', '20*188', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2092', '10080916530159', '元素X-EJ010008银条', '128', '1', '1', '20091003199_.gif', 'C-28', '20*189', '20*189', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2093', '10080916530160', '元素X-EJ010010水晶条', '79', '1', '1', '20091003199_.gif', 'C-28', '20*190', '20*190', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2094', '10080916530161', '元素X-EJ010011满钻小球', '169', '1', '1', '20091003199_.gif', 'C-28', '20*191', '20*191', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2095', '10080916530162', '元素X-EJ010012号角', '158', '1', '1', '20091003199_.gif', 'C-28', '20*192', '20*192', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2096', '10080916530163', '元素X-EJ010013紫水晶', '216', '1', '1', '20091003199_.gif', 'C-28', '20*193', '20*193', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2097', '10080916530164', '元素X-EJ010015红水晶', '172', '1', '1', '20091003199_.gif', 'C-28', '20*194', '20*194', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2098', '10080916530165', '元素X-EM010001红玛瑙', '112', '1', '1', '20091003199_.gif', 'C-28', '20*195', '20*195', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2099', '10080916530166', '元素X-ES010001泰银小球', '152', '1', '1', '20091003199_.gif', 'C-28', '20*196', '20*196', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2100', '10080916530167', '元素X-ES010002玛瑙算盘', '126', '1', '1', '20091003199_.gif', 'C-28', '20*197', '20*197', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2101', '10080916530168', '元素X-ES010003流动方片', '217', '1', '1', '20091003199_.gif', 'C-28', '20*198', '20*198', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2102', '10080916530169', '元素X-ES010004耳钉', '38', '1', '1', '20091003199_.gif', 'C-28', '20*199', '20*199', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2103', '10080916530170', '元素X-ES010005舞动花蕊', '172', '1', '1', '20091003199_.gif', 'C-28', '20*200', '20*200', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2104', '10080916530171', '元素X-ES010006朋克耳钉', '124', '1', '1', '20091003199_.gif', 'C-28', '20*201', '20*201', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2105', '10080916530172', '元素X-ES010007素银小球', '137', '1', '1', '20091003199_.gif', 'C-28', '20*202', '20*202', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2106', '10080916530173', '元素X-ES010008小爱心', '79', '1', '1', '20091003199_.gif', 'C-28', '20*203', '20*203', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2107', '10080916530174', '元素X-ES010009方片', '103', '1', '1', '20091003199_.gif', 'C-28', '20*204', '20*204', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2108', '10080916530175', '元素X-ES010010马眼小钻', '97', '1', '1', '20091003199_.gif', 'C-28', '20*205', '20*205', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2109', '10080916530176', '元素X-ES010011简洁圆片', '79', '1', '1', '20091003199_.gif', 'C-28', '20*206', '20*206', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2110', '10080916530177', '元素X-ES010012鲍鱼贝耳环', '107', '1', '1', '20091003199_.gif', 'C-28', '20*207', '20*207', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2111', '10080916530178', '元素X-ES010013皇冠', '98', '1', '1', '20091003199_.gif', 'C-28', '20*208', '20*208', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2112', '10080916530179', '元素X-S010014镀黄金流苏', '172', '1', '1', '20091003199_.gif', 'C-28', '20*209', '20*209', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2113', '10080916530180', '元素X-ES010015黄锆石三角', '163', '1', '1', '20091003199_.gif', 'C-28', '20*210', '20*210', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2114', '10080916530181', '元素X-ES010016黄锆石花朵', '125', '1', '1', '20091003199_.gif', 'C-28', '20*211', '20*211', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2115', '10080916530182', '元素X-ES010017水瓶', '110', '1', '1', '20091003199_.gif', 'C-28', '20*212', '20*212', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2116', '10080916530183', '元素X-ES010018摇曳小草', '89', '1', '1', '20091003199_.gif', 'C-28', '20*213', '20*213', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2117', '10080916530184', '元素X-ES010019舞动银片', '107', '1', '1', '20091003199_.gif', 'C-28', '20*214', '20*214', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2118', '10080916530185', '元素X-ES010020舞动菱形', '116', '1', '1', '20091003199_.gif', 'C-28', '20*215', '20*215', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2119', '10080916530186', '元素X-ES010021四方锆石', '98', '1', '1', '20091003199_.gif', 'C-28', '20*216', '20*216', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2120', '10080916530187', '元素X-ES010022镂空水滴', '87', '1', '1', '20091003199_.gif', 'C-28', '20*217', '20*217', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2121', '10080916530188', '元素X-ES010023磨砂镂空', '136', '1', '1', '20091003199_.gif', 'C-28', '20*218', '20*218', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2122', '10080916530189', '元素X-ET010001红刚玉耳钉', '398', '1', '1', '20091003199_.gif', 'C-28', '20*219', '20*219', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2123', '10080916530190', '元素X-ET010002泰银紫水晶', '117', '1', '1', '20091003199_.gif', 'C-28', '20*220', '20*220', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2124', '10080916530191', '元素X-ET010003泰银紫水晶', '169', '1', '1', '20091003199_.gif', 'C-28', '20*221', '20*221', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2125', '10080916530192', '元素X-ET010004泰银贝母', '184', '1', '1', '20091003199_.gif', 'C-28', '20*222', '20*222', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2126', '10080916530193', '元素X-ET010005泰银双圈耳钉', '376', '1', '1', '20091003199_.gif', 'C-28', '20*223', '20*223', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2127', '10080916530194', '元素X-ET010006红刚玉耳环', '279', '1', '1', '20091003199_.gif', 'C-28', '20*224', '20*224', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2128', '10080916530195', '元素X-ET010007猫眼', '492', '1', '1', '20091003199_.gif', 'C-28', '20*225', '20*225', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2129', '10080916530196', '元素X-ES010001水波链', '57', '1', '1', '20091003199_.gif', 'C-28', '20*226', '20*226', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2130', '10080916530197', '元素X-NS010002小球链', '72', '1', '1', '20091003199_.gif', 'C-28', '20*227', '20*227', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2131', '10080916530198', '元素X-NS010003瓜子链', '75', '1', '1', '20091003199_.gif', 'C-28', '20*228', '20*228', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2132', '10080916530199', '元素X-NS010004蛇骨链', '88', '1', '1', '20091003199_.gif', 'C-28', '20*229', '20*229', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2133', '10080916530200', '元素X-NS010005竹节链', '76', '1', '1', '20091003199_.gif', 'C-28', '20*230', '20*230', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2134', '10080916530201', '元素X-NS010006细蛇骨链', '69', '1', '1', '20091003199_.gif', 'C-28', '20*231', '20*231', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2135', '10080916530202', '元素X-NS010007泰银链', '89', '1', '1', '20091003199_.gif', 'C-28', '20*232', '20*232', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2136', '10080916530203', '元素X-PJ010001小皇冠', '105', '1', '1', '20091003199_.gif', 'C-28', '20*233', '20*233', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2137', '10080916530204', '元素X-PJ010002黄水晶', '109', '1', '1', '20091003199_.gif', 'C-28', '20*234', '20*234', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2138', '10080916530205', '元素X-PJ010003紫水晶', '159', '1', '1', '20091003199_.gif', 'C-28', '20*235', '20*235', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2139', '10080916530206', '元素X-PJ010004十字', '107', '1', '1', '20091003199_.gif', 'C-28', '20*236', '20*236', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2140', '10080916530207', '元素X-PJ010005满钻圆片', '112', '1', '1', '20091003199_.gif', 'C-28', '20*237', '20*237', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2141', '10080916530208', '元素X-PJ010006蓝色钻叶', '219', '1', '1', '20091003199_.gif', 'C-28', '20*238', '20*238', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2142', '10080916530209', '元素X-PJ010007满钻小球', '132', '1', '1', '20091003199_.gif', 'C-28', '20*239', '20*239', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2143', '10080916530210', '元素X-PJ010008水晶坠子', '167', '1', '1', '20091003199_.gif', 'C-28', '20*240', '20*240', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2144', '10080916530211', '元素X-PJ010009满钻小草莓', '219', '1', '1', '20091003199_.gif', 'C-28', '20*241', '20*241', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2145', '10080916530212', '元素X-PJ010010锆石坠子', '107', '1', '1', '20091003199_.gif', 'C-28', '20*242', '20*242', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2146', '10080916530213', '元素X-PJ010011水晶雕花', '112', '1', '1', '20091003199_.gif', 'C-28', '20*243', '20*243', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2147', '10080916530214', '元素X-PM010001玛瑙双钱', '98', '1', '1', '20091003199_.gif', 'C-28', '20*244', '20*244', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2148', '10080916530215', '元素X-PM010002方形雕花', '142', '1', '1', '20091003199_.gif', 'C-28', '20*245', '20*245', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2149', '10080916530216', '元素X-PM010003圆形雕花', '198', '1', '1', '20091003199_.gif', 'C-28', '20*246', '20*246', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2150', '10080916530217', '元素X-PM010004三角', '109', '1', '1', '20091003199_.gif', 'C-28', '20*247', '20*247', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2151', '10080916530218', '元素X-PM010005图腾', '112', '1', '1', '20091003199_.gif', 'C-28', '20*248', '20*248', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2152', '10080916530219', '元素X-PM010006转运球', '112', '1', '1', '20091003199_.gif', 'C-28', '20*249', '20*249', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2153', '10080916530220', '元素X-PM010007红刚玉', '318', '1', '1', '20091003199_.gif', 'C-28', '20*250', '20*250', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2154', '10080916530221', '元素X-RJ010002绿色爱心', '102', '1', '1', '20091003199_.gif', 'C-28', '20*251', '20*251', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2155', '10080916530222', '元素X-RJ010003蝴蝶结', '95', '1', '1', '20091003199_.gif', 'C-28', '20*252', '20*252', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2156', '10080916530223', '元素X-RJ010004官帽', '86', '1', '1', '20091003199_.gif', 'C-28', '20*253', '20*253', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2157', '10080916530224', '元素X-RM010001黑曜石', '169', '1', '1', '20091003199_.gif', 'C-28', '20*254', '20*254', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2158', '10080916530225', '元素X-RS010001银色小花', '92', '1', '1', '20091003199_.gif', 'C-28', '20*255', '20*255', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2159', '10080916530226', '元素X-RT010001泰银多宝石戒指', '412', '1', '1', '20091003199_.gif', 'C-28', '20*256', '20*256', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2160', '10080916530227', '元素X-RT010003泰银黄水晶', '312', '1', '1', '20091003199_.gif', 'C-28', '20*257', '20*257', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2161', '10080916530228', '元素X-RT010004琉璃大', '498', '1', '1', '20091003199_.gif', 'C-28', '20*258', '20*258', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2162', '10080916530229', '元素X-RT010005红刚玉', '270', '1', '1', '20091003199_.gif', 'C-28', '20*259', '20*259', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2163', '10080916530230', '元素X-RT010006椭圆红刚玉', '360', '1', '1', '20091003199_.gif', 'C-28', '20*260', '20*260', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2164', '10080916530231', '元素X-RT010007琉璃小', '198', '1', '1', '20091003199_.gif', 'C-28', '20*261', '20*261', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2165', '10080916530232', '元素X-琉璃耳钉', '38', '1', '1', '20091003199_.gif', 'C-28', '20*262', '20*262', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2166', '10080916530233', '元素X-水晶玻璃耳环', '28', '1', '1', '20091003199_.gif', 'C-28', '20*263', '20*263', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2167', '10080916530234', '元素X-美妆小镜挂件', '36', '1', '1', '20091003199_.gif', 'C-28', '20*264', '20*264', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2168', '10080916530235', '元素X-卡包', '32', '1', '1', '20091003199_.gif', 'C-28', '20*265', '20*265', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2169', '10080916530236', '元素X-发光TEE', '118', '1', '1', '20091003199_.gif', 'C-28', '20*266', '20*266', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2170', '10080916530237', '元素X-花朵耳钉', '16', '1', '1', '20091003199_.gif', 'C-28', '20*267', '20*267', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2171', '10080916530238', '元素X-搭配百分百耳环', '38', '1', '1', '20091003199_.gif', 'C-28', '20*268', '20*268', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2172', '10080916530239', '静闲舍-原创明信片', '10', '1', '1', '20091003199_.gif', 'C-55', '20*269', '20*269', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2173', '10080916530240', '静闲舍-明信片套装', '85', '1', '1', '20091003199_.gif', 'C-55', '20*270', '20*270', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2174', '10080916530241', '静闲舍-装饰画（卡）', '50', '1', '1', '20091003199_.gif', 'C-55', '20*271', '20*271', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2175', '10080916530242', '静闲舍-装饰画', '180', '1', '1', '20091003199_.gif', 'C-55', '20*272', '20*272', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2176', '10080916530243', '静闲舍-白珊瑚手链', '125', '1', '1', '20091003199_.gif', 'C-55', '20*273', '20*273', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2177', '10080916530244', '静闲舍-十八菩提', '35', '1', '1', '20091003199_.gif', 'C-55', '20*274', '20*274', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2178', '10080916530245', '静闲舍--玛瑙手链', '158', '1', '1', '20091003199_.gif', 'C-55', '20*275', '20*275', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2179', '10080916530246', '静闲舍--石榴石手链（大）', '168', '1', '1', '20091003199_.gif', 'C-55', '20*276', '20*276', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2180', '10080916530247', '静闲舍--石榴石手链（小）', '138', '1', '1', '20091003199_.gif', 'C-55', '20*277', '20*277', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2181', '10080916530248', '静闲舍-红珊瑚手链', '138', '1', '1', '20091003199_.gif', 'C-55', '20*278', '20*278', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2182', '10080916530249', '静闲舍--路路通手编手链', '65', '1', '1', '20091003199_.gif', 'C-55', '20*279', '20*279', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2183', '10080916530250', '静闲舍--马来玉手编链（大）', '65', '1', '1', '20091003199_.gif', 'C-55', '20*280', '20*280', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2184', '10080916530251', '静闲舍--马来玉手编链（小）', '35', '1', '1', '20091003199_.gif', 'C-55', '20*281', '20*281', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2185', '10080916530252', '静闲舍--吉祥手编链', '35', '1', '1', '20091003199_.gif', 'C-55', '20*282', '20*282', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2186', '10080916530253', '静闲舍--鸿运手编链', '45', '1', '1', '20091003199_.gif', 'C-55', '20*283', '20*283', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2187', '10080916530254', '静闲舍--水晶银艺编链', '65', '1', '1', '20091003199_.gif', 'C-55', '20*284', '20*284', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2188', '10080916530255', '静闲舍--双鱼手编链（大）', '105', '1', '1', '20091003199_.gif', 'C-55', '20*285', '20*285', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2189', '10080916530256', '静闲舍--双鱼手编链（小）', '85', '1', '1', '20091003199_.gif', 'C-55', '20*286', '20*286', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2190', '10080916530257', '静闲舍--祥鱼转运珠', '70', '1', '1', '20091003199_.gif', 'C-55', '20*287', '20*287', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2191', '10080916530258', '静闲舍-彩玉手链', '160', '1', '1', '20091003199_.gif', 'C-55', '20*288', '20*288', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2192', '10080916530259', '静闲舍--玛瑙手链（大）', '180', '1', '1', '20091003199_.gif', 'C-55', '20*289', '20*289', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2193', '10080916530260', '静闲舍--精致手编链', '160', '1', '1', '20091003199_.gif', 'C-55', '20*290', '20*290', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2194', '10080916530261', '静闲舍--奥水晶手链', '388', '1', '1', '20091003199_.gif', 'C-55', '20*291', '20*291', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2195', '10080916530262', '静闲舍--手机链', '35', '1', '1', '20091003199_.gif', 'C-55', '20*292', '20*292', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2196', '10080916530263', '静闲舍--红绳手编链', '15', '1', '1', '20091003199_.gif', 'C-55', '20*293', '20*293', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2197', '10080916530264', '静闲舍--玉髓手编链', '95', '1', '1', '20091003199_.gif', 'C-55', '20*294', '20*294', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2198', '10080916530265', '静闲舍--奥地利水晶手编链', '126', '1', '1', '20091003199_.gif', 'C-55', '20*295', '20*295', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2199', '10080916530266', '静闲舍--奥地利水晶项链', '180', '1', '1', '20091003199_.gif', 'C-55', '20*296', '20*296', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2200', '10080916530267', '静闲舍--紫天然水晶手链', '328', '1', '1', '20091003199_.gif', 'C-55', '20*297', '20*297', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2201', '10080916530268', '静闲舍--天然紫莹手链', '260', '1', '1', '20091003199_.gif', 'C-55', '20*298', '20*298', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2202', '10080916530269', '静闲舍--玉髓手链', '280', '1', '1', '20091003199_.gif', 'C-55', '20*299', '20*299', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2203', '10080916530270', '静闲舍--天然茶晶手链', '168', '1', '1', '20091003199_.gif', 'C-55', '20*300', '20*300', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2204', '10080916530271', '静闲舍--琉璃手链', '85', '1', '1', '20091003199_.gif', 'C-55', '20*301', '20*301', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2205', '10080916530272', '静闲舍--玛瑙水晶手链', '110', '1', '1', '20091003199_.gif', 'C-55', '20*302', '20*302', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2206', '10080916530273', '静闲舍--紫天火焰石手链', '160', '1', '1', '20091003199_.gif', 'C-55', '20*303', '20*303', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2207', '10080916530274', '静闲舍--软陶耳环', '15', '1', '1', '20091003199_.gif', 'C-55', '20*304', '20*304', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2208', '10080916530275', '静闲舍-红珊瑚创意手链（大）', '398', '1', '1', '20091003199_.gif', 'C-55', '20*305', '20*305', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2209', '10080916530276', '静闲舍-红珊瑚创意手链（小）', '320', '1', '1', '20091003199_.gif', 'C-55', '20*306', '20*306', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2210', '10080916530277', '静闲舍-白珊瑚创意手链', '320', '1', '1', '20091003199_.gif', 'C-55', '20*307', '20*307', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2211', '10080916530278', '静闲舍-黑玛瑙手链', '320', '1', '1', '20091003199_.gif', 'C-55', '20*308', '20*308', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2212', '10080916530279', '静闲舍-奥地利水晶吊坠', '120', '1', '1', '20091003199_.gif', 'C-55', '20*309', '20*309', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2213', '10080916530280', '静闲舍-蓝玛瑙手链', '285', '1', '1', '20091003199_.gif', 'C-55', '20*310', '20*310', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2214', '10080916530281', '静闲舍--青金石手工银手链', '520', '1', '1', '20091003199_.gif', 'C-55', '20*311', '20*311', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2215', '10080916530282', '静闲舍--软陶耳环2', '15', '1', '1', '20091003199_.gif', 'C-55', '20*312', '20*312', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2216', '10080916530283', '静闲舍--创意耳环', '30', '1', '1', '20091003199_.gif', 'C-55', '20*313', '20*313', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2217', '10080916530284', '静闲舍--创意银晶耳环', '95', '1', '1', '20091003199_.gif', 'C-55', '20*314', '20*314', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2218', '10080916530285', '静闲舍--手工银晶耳环', '126', '1', '1', '20091003199_.gif', 'C-55', '20*315', '20*315', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2219', '10080916530286', '静闲舍--创意手工耳环', '156', '1', '1', '20091003199_.gif', 'C-55', '20*316', '20*316', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2220', '10080916530287', '静闲舍--创意民俗耳环', '45', '1', '1', '20091003199_.gif', 'C-55', '20*317', '20*317', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2221', '10080916530288', '静闲舍--印度银包贝壳耳环', '185', '1', '1', '20091003199_.gif', 'C-55', '20*318', '20*318', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2222', '10080916530289', '静闲舍--印度手工银耳环1', '126', '1', '1', '20091003199_.gif', 'C-55', '20*319', '20*319', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2223', '10080916530290', '静闲舍--印度手工银耳环2', '145', '1', '1', '20091003199_.gif', 'C-55', '20*320', '20*320', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2224', '10080916530291', '静闲舍--印度手工银耳环3', '185', '1', '1', '20091003199_.gif', 'C-55', '20*321', '20*321', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2225', '10080916530292', '静闲舍--凤尾银耳环', '295', '1', '1', '20091003199_.gif', 'C-55', '20*322', '20*322', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2226', '10080916530293', '静闲舍--月光石银耳环1', '280', '1', '1', '20091003199_.gif', 'C-55', '20*323', '20*323', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2227', '10080916530294', '静闲舍--月光石银耳环2', '380', '1', '1', '20091003199_.gif', 'C-55', '20*324', '20*324', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2228', '10080916530295', '静闲舍--手工银镶天然紫晶', '398', '1', '1', '20091003199_.gif', 'C-55', '20*325', '20*325', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2229', '10080916530296', '静闲舍--手工银镶天然紫晶s', '360', '1', '1', '20091003199_.gif', 'C-55', '20*326', '20*326', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2230', '10080916530297', '静闲舍--印度手工银紫晶耳环', '218', '1', '1', '20091003199_.gif', 'C-55', '20*327', '20*327', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2231', '10080916530298', '黑皮超人-原创手工包袋1', '38', '1', '1', '20091003199_.gif', 'C-50', '20*328', '20*328', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2232', '10080916530299', '黑皮超人-原创手工包袋2', '58', '1', '1', '20091003199_.gif', 'C-50', '20*329', '20*329', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2233', '10080916530300', '黑皮超人-原创手工包袋3', '78', '1', '1', '20091003199_.gif', 'C-50', '20*330', '20*330', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2234', '10080916530301', '黑皮超人-原创手工包袋4', '98', '1', '1', '20091003199_.gif', 'C-50', '20*331', '20*331', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2235', '10080916530302', '黑皮超人-原创手工包袋5', '119', '1', '1', '20091003199_.gif', 'C-50', '20*332', '20*332', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2236', '10080916530303', '玲紫猫-熊猫夏季版（黑）', '58', '1', '1', '20091003199_.gif', 'C-6', '20*333', '20*333', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2237', '10080916530304', '玲紫猫-熊猫夏季版（蓝）', '58', '1', '1', '20091003199_.gif', 'C-6', '20*334', '20*334', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2238', '10080916530305', '玲紫猫-小熊夏季版（粉）', '58', '1', '1', '20091003199_.gif', 'C-6', '20*335', '20*335', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2239', '10080916530306', '玲紫猫-猴子夏季版', '58', '1', '1', '20091003199_.gif', 'C-6', '20*336', '20*336', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2240', '10080916530307', '玲紫猫-CAP童话兔兔', '58', '1', '1', '20091003199_.gif', 'C-6', '20*337', '20*337', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2241', '10080916530308', '玲紫猫-cap大脸熊猫', '58', '1', '1', '20091003199_.gif', 'C-6', '20*338', '20*338', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2242', '10080916530309', '玲紫猫-cap草莓兔兔', '58', '1', '1', '20091003199_.gif', 'C-6', '20*339', '20*339', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2243', '10080916530310', 'Gismo-生日熊', '10', '1', '1', '20091003199_.gif', 'C-21', '20*340', '20*340', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2244', '10080916530311', 'Gismo-馒头扑克', '10', '1', '1', '20091003199_.gif', 'C-21', '20*341', '20*341', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2245', '10080916530312', 'Gismo-面具熊', '25', '1', '1', '20091003199_.gif', 'C-21', '20*342', '20*342', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2246', '10080916530313', 'Gismo-打地鼠', '25', '1', '1', '20091003199_.gif', 'C-21', '20*343', '20*343', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2247', '10080916530314', 'Gismo-爆牙兔钥匙包', '30', '1', '1', '20091003199_.gif', 'C-21', '20*344', '20*344', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2248', '10080916530315', 'Gismo-CARP01', '40', '1', '1', '20091003199_.gif', 'C-21', '20*345', '20*345', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2249', '10080916530316', 'Gismo-CARP02', '40', '1', '1', '20091003199_.gif', 'C-21', '20*346', '20*346', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2250', '10080916530317', 'Gismo-CARP04', '40', '1', '1', '20091003199_.gif', 'C-21', '20*347', '20*347', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2251', '10080916530318', 'Gismo-CARP05', '40', '1', '1', '20091003199_.gif', 'C-21', '20*348', '20*348', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2252', '10080916530319', 'Gismo-CARP07', '40', '1', '1', '20091003199_.gif', 'C-21', '20*349', '20*349', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2253', '10080916530320', 'Gismo-CV02', '40', '1', '1', '20091003199_.gif', 'C-21', '20*350', '20*350', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2254', '10080916530321', 'Gismo-CV04', '40', '1', '1', '20091003199_.gif', 'C-21', '20*351', '20*351', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2255', '10080916530322', 'Gismo-CV08', '40', '1', '1', '20091003199_.gif', 'C-21', '20*352', '20*352', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2256', '10080916530323', 'Gismo-CV25', '40', '1', '1', '20091003199_.gif', 'C-21', '20*353', '20*353', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2257', '10080916530324', 'Gismo-LON06', '40', '1', '1', '20091003199_.gif', 'C-21', '20*354', '20*354', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2258', '10080916530325', 'Gismo-LON07', '40', '1', '1', '20091003199_.gif', 'C-21', '20*355', '20*355', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2259', '10080916530326', 'Gismo-MUG35', '40', '1', '1', '20091003199_.gif', 'C-21', '20*356', '20*356', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2260', '10080916530327', '梵星-体验价-手绘鞋', '60', '1', '1', '20091003199_.gif', 'C-24', '20*357', '20*357', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2261', '10080916530328', '梵星-特价松紧-手绘鞋', '70', '1', '1', '20091003199_.gif', 'C-24', '20*358', '20*358', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2262', '10080916530329', '梵星-无带松紧-手绘鞋', '80', '1', '1', '20091003199_.gif', 'C-24', '20*359', '20*359', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2263', '10080916530330', '梵星-系带低帮-手绘鞋', '90', '1', '1', '20091003199_.gif', 'C-24', '20*360', '20*360', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2264', '10080916530331', '梵星-特价系带-手绘鞋', '80', '1', '1', '20091003199_.gif', 'C-24', '20*361', '20*361', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2265', '10080916530332', '梵星-护士鞋', '50', '1', '1', '20091003199_.gif', 'C-24', '20*362', '20*362', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2266', '10080916530333', '梵星-高帮手绘鞋', '100', '1', '1', '20091003199_.gif', 'C-24', '20*363', '20*363', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2267', '10080916530334', '梵星-手绘盘扣钱包', '60', '1', '1', '20091003199_.gif', 'C-24', '20*364', '20*364', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2268', '10080916530335', '梵星-手绘插画包', '70', '1', '1', '20091003199_.gif', 'C-24', '20*365', '20*365', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2269', '10080916530336', '梵星-手机袋', '25', '1', '1', '20091003199_.gif', 'C-24', '20*366', '20*366', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2270', '10080916530337', '梵星-小钱袋', '25', '1', '1', '20091003199_.gif', 'C-24', '20*367', '20*367', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2271', '10080916530338', '梵星-大钱袋', '30', '1', '1', '20091003199_.gif', 'C-24', '20*368', '20*368', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2272', '10080916530339', '梵星-彩色鞋带', '5', '1', '1', '20091003199_.gif', 'C-24', '20*369', '20*369', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2273', '10080916530340', '陶格-似锦年华项链（大号）', '48', '1', '1', '20091003199_.gif', 'C-37', '20*370', '20*370', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2274', '10080916530341', '陶格-粉彩山水挂坠', '88', '1', '1', '20091003199_.gif', 'C-37', '20*371', '20*371', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2275', '10080916530342', '陶格-青花花鸟挂坠', '48', '1', '1', '20091003199_.gif', 'C-37', '20*372', '20*372', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2276', '10080916530343', '陶格-娃娃头挂坠', '85', '1', '1', '20091003199_.gif', 'C-37', '20*373', '20*373', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2277', '10080916530344', '陶格-海绵宝宝挂坠', '35', '1', '1', '20091003199_.gif', 'C-37', '20*374', '20*374', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2278', '10080916530345', '陶格-粉彩挂坠', '30', '1', '1', '20091003199_.gif', 'C-37', '20*375', '20*375', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2279', '10080916530346', '陶格-花项链', '55', '1', '1', '20091003199_.gif', 'C-37', '20*376', '20*376', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2280', '10080916530347', '陶格-似锦年华项链（小号）', '35', '1', '1', '20091003199_.gif', 'C-37', '20*377', '20*377', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2281', '10080916530348', '陶格-小老虎', '48', '1', '1', '20091003199_.gif', 'C-37', '20*378', '20*378', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2282', '10080916530349', '陶格-青花耳坠', '38', '1', '1', '20091003199_.gif', 'C-37', '20*379', '20*379', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2283', '10080916530350', '陶格-似锦年华耳坠', '38', '1', '1', '20091003199_.gif', 'C-37', '20*380', '20*380', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2284', '10080916530351', '陶格-陶珠耳坠', '15', '1', '1', '20091003199_.gif', 'C-37', '20*381', '20*381', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2285', '10080916530352', '陶格-纯色耳钉', '25', '1', '1', '20091003199_.gif', 'C-37', '20*382', '20*382', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2286', '10080916530353', '陶格-花朵耳钉', '25', '1', '1', '20091003199_.gif', 'C-37', '20*383', '20*383', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2287', '10080916530354', '陶格-花朵戒指', '20', '1', '1', '20091003199_.gif', 'C-37', '20*384', '20*384', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2288', '10080916530355', '陶格-青花手镯', '38', '1', '1', '20091003199_.gif', 'C-37', '20*385', '20*385', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2289', '10080916530356', '陶格-手工编织手链', '20', '1', '1', '20091003199_.gif', 'C-37', '20*386', '20*386', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2290', '10080916530357', '陶格-青花项链（小号）', '35', '1', '1', '20091003199_.gif', 'C-37', '20*387', '20*387', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2291', '10080916530358', '陶格-香薰盘', '58', '1', '1', '20091003199_.gif', 'C-37', '20*388', '20*388', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2292', '10080916530359', '陶格-花朵发夹', '20', '1', '1', '20091003199_.gif', 'C-37', '20*389', '20*389', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2293', '10080916530360', '陶格-陶珠项圈', '25', '1', '1', '20091003199_.gif', 'C-37', '20*390', '20*390', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2294', '10080916530361', '玩转世博绘-园区旅行指南', '20', '1', '1', '20091003199_.gif', 'C-19', '20*391', '20*391', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2295', '10080916530362', '玩转世博绘-12张明信片', '20', '1', '1', '20091003199_.gif', 'C-19', '20*392', '20*392', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2296', '10080916530363', '玩转世博绘-9张贺卡', '50', '1', '1', '20091003199_.gif', 'C-19', '20*393', '20*393', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2297', '10080916530364', '玩转世博绘-48张明信片', '100', '1', '1', '20091003199_.gif', 'C-19', '20*394', '20*394', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2298', '10080916530365', '白相大上海手绘旅行指南', '15', '1', '1', '20091003199_.gif', 'C-19', '20*395', '20*395', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2299', '10080916530366', '玩转世博绘手绘典藏丝巾', '200', '1', '1', '20091003199_.gif', 'C-19', '20*396', '20*396', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2300', '10080916530367', '玩转世博绘Mini贴纸24+8张', '40', '1', '1', '20091003199_.gif', 'C-19', '20*397', '20*397', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2301', '10080916530368', '玩转世博绘-擦镜布', '30', '1', '1', '20091003199_.gif', 'C-19', '20*398', '20*398', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2302', '10080916530369', '塔卡沙套装卡贴', '5', '1', '1', '20091003199_.gif', 'C-4', '20*399', '20*399', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2303', '10080916530370', '塔卡沙单张卡贴', '3', '1', '1', '20091003199_.gif', 'C-4', '20*400', '20*400', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2304', '10080916530371', '塔卡沙熊猫小包', '25', '1', '1', '20091003199_.gif', 'C-4', '20*401', '20*401', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2305', '10080916530372', '塔卡沙钥匙包', '25', '1', '1', '20091003199_.gif', 'C-4', '20*402', '20*402', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2306', '10080916530373', '塔卡沙小鸡零钱包', '20', '1', '1', '20091003199_.gif', 'C-4', '20*403', '20*403', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2307', '10080916530374', '塔卡沙徽章', '4', '1', '1', '20091003199_.gif', 'C-4', '20*404', '20*404', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2308', '10080916530375', '塔卡沙波点布包', '30', '1', '1', '20091003199_.gif', 'C-4', '20*405', '20*405', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2309', '10080916530376', '塔卡沙胸针', '15', '1', '1', '20091003199_.gif', 'C-4', '20*406', '20*406', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2310', '10080916530377', '塔卡沙TEE', '78', '1', '1', '20091003199_.gif', 'C-4', '20*407', '20*407', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2311', '10080916530378', '塔卡沙项链', '55', '1', '1', '20091003199_.gif', 'C-4', '20*408', '20*408', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2312', '10080916530379', '王赖赖-小号帆布包', '90', '1', '1', '20091003199_.gif', 'WLL', '20*409', '20*409', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2313', '10080916530380', '王赖赖-双面帆布包', '128', '1', '1', '20091003199_.gif', 'WLL', '20*410', '20*410', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2314', '10080916530381', '王赖赖-大号帆布包', '110', '1', '1', '20091003199_.gif', 'WLL', '20*411', '20*411', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2315', '10080916530382', '王赖赖-多功能收纳包', '49', '1', '1', '20091003199_.gif', 'WLL', '20*412', '20*412', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2316', '10080916530383', '王赖赖-王赖赖（中）', '65', '1', '1', '20091003199_.gif', 'WLL', '20*413', '20*413', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2317', '10080916530384', '王赖赖-王赖赖（大）', '168', '1', '1', '20091003199_.gif', 'WLL', '20*414', '20*414', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2318', '10080916530385', '王赖赖-大狼灰灰（中）', '0', '1', '1', '20091003199_.gif', 'WLL', '20*415', '20*415', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2319', '10080916530386', '王赖赖-大狼灰灰（大）', '0', '1', '1', '20091003199_.gif', 'WLL', '20*416', '20*416', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2320', '10080916530387', '王赖赖-熊猫（中）', '65', '1', '1', '20091003199_.gif', 'WLL', '20*417', '20*417', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2321', '10080916530388', '王赖赖-休闲风帆布包（长款）', '135', '1', '1', '20091003199_.gif', 'WLL', '20*418', '20*418', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2322', '10080916530389', '王赖赖-休闲风帆布包（短款）', '125', '1', '1', '20091003199_.gif', 'WLL', '20*419', '20*419', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2323', '10080916530390', 'STAR-卡贴', '4', '1', '1', '20091003199_.gif', 'C-18', '20*420', '20*420', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2324', '10080916530391', 'STAR-大徽章', '10', '1', '1', '20091003199_.gif', 'C-18', '20*421', '20*421', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2325', '10080916530392', 'STAR-水晶车贴', '12', '1', '1', '20091003199_.gif', 'C-18', '20*422', '20*422', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2326', '10080916530393', 'STAR-卡包', '20', '1', '1', '20091003199_.gif', 'C-18', '20*423', '20*423', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2327', '10080916530394', 'STAR-公交卡套', '10', '1', '1', '20091003199_.gif', 'C-18', '20*424', '20*424', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2328', '10080916530395', 'BAO\'S-万花筒', '25', '1', '1', '20091003199_.gif', 'C-26', '20*425', '20*425', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2329', '10080916530396', 'BAO\'S-大嘴手机套', '20', '1', '1', '20091003199_.gif', 'C-26', '20*426', '20*426', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2330', '10080916530397', 'BAO\'S-图案手机套', '20', '1', '1', '20091003199_.gif', 'C-26', '20*427', '20*427', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2331', '10080916530398', 'BAO\'S-绒布手机链', '15', '1', '1', '20091003199_.gif', 'C-26', '20*428', '20*428', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2332', '10080916530399', 'BAO\'S-牛皮手机链', '15', '1', '1', '20091003199_.gif', 'C-26', '20*429', '20*429', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2333', '10080916530400', 'BAO\'S-卡贴', '2.5', '1', '1', '20091003199_.gif', 'C-26', '20*430', '20*430', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2334', '10080916530401', 'BAO\'S-饰品', '38', '1', '1', '20091003199_.gif', 'C-26', '20*431', '20*431', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2335', '10080916530402', 'BAO\'S-1', '10', '1', '1', '20091003199_.gif', 'C-26', '20*432', '20*432', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2336', '10080916530403', 'BAO\'S-2', '20', '1', '1', '20091003199_.gif', 'C-26', '20*433', '20*433', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2337', '10080916530404', '80\'s大队长', '110', '1', '1', '20091003199_.gif', 'C-52', '20*434', '20*434', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2338', '10080916530405', '80\'s小号大队长', '65', '1', '1', '20091003199_.gif', 'C-52', '20*435', '20*435', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2339', '10080916530406', '80\'s小样（绿）', '75', '1', '1', '20091003199_.gif', 'C-52', '20*436', '20*436', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2340', '10080916530407', '80\'s小样（蓝）', '75', '1', '1', '20091003199_.gif', 'C-52', '20*437', '20*437', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2341', '10080916530408', '80\'s小号条纹加班兔', '65', '1', '1', '20091003199_.gif', 'C-52', '20*438', '20*438', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2342', '10080916530409', '81\'s小号格子加班兔', '65', '1', '1', '20091003199_.gif', 'C-52', '20*439', '20*439', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2343', '10080916530410', '80\'s大号格子加班兔', '88', '1', '1', '20091003199_.gif', 'C-52', '20*440', '20*440', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2344', '10080916530411', '80\'s大号条纹加班兔', '88', '1', '1', '20091003199_.gif', 'C-52', '20*441', '20*441', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2345', '10080916530412', '80\'s小女孩', '85', '1', '1', '20091003199_.gif', 'C-52', '20*442', '20*442', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2346', '10080916530413', '黑嘛嘛-武功秘籍（大）', '20', '1', '1', '20091003199_.gif', 'C-60', '20*443', '20*443', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2347', '10080916530414', '黑嘛嘛-武功秘籍（小）', '12', '1', '1', '20091003199_.gif', 'C-60', '20*444', '20*444', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2348', '10080916530415', '黑嘛嘛-门派牌子', '8', '1', '1', '20091003199_.gif', 'C-60', '20*445', '20*445', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2349', '10080916530416', '织品-1', '30', '1', '1', '20091003199_.gif', 'C-39', '20*446', '20*446', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2350', '10080916530417', '织品-2', '35', '1', '1', '20091003199_.gif', 'C-39', '20*447', '20*447', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2351', '10080916530418', '织品-3', '38', '1', '1', '20091003199_.gif', 'C-39', '20*448', '20*448', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2352', '10080916530419', '织品-4', '58', '1', '1', '20091003199_.gif', 'C-39', '20*449', '20*449', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2353', '10080916530420', '织品-5', '68', '1', '1', '20091003199_.gif', 'C-39', '20*450', '20*450', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2354', '10080916530421', '织品-6', '260', '1', '1', '20091003199_.gif', 'C-39', '20*451', '20*451', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2355', '10080916530422', '织品-7', '48', '1', '1', '20091003199_.gif', 'C-39', '20*452', '20*452', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2356', '10080916530423', '织品-8', '25', '1', '1', '20091003199_.gif', 'C-39', '20*453', '20*453', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2357', '10080916530424', '织品-9', '45', '1', '1', '20091003199_.gif', 'C-39', '20*454', '20*454', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2358', '10080916530425', '织品-10', '28', '1', '1', '20091003199_.gif', 'C-39', '20*455', '20*455', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2359', '10080916530426', '织品-11', '160', '1', '1', '20091003199_.gif', 'C-39', '20*456', '20*456', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2360', '10080916530427', '趣味围裙', '28', '1', '1', '20091003199_.gif', 'AB-all', '20*457', '20*457', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2361', '10080916530428', '车牌', '12', '1', '1', '20091003199_.gif', 'AB-all', '20*458', '20*458', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2362', '10080916530429', '袋线娃娃', '8', '1', '1', '20091003199_.gif', 'AB-all', '20*459', '20*459', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2363', '10080916530430', '发条娃娃-青蛙', '6', '1', '1', '20091003199_.gif', 'AB-all', '20*460', '20*460', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2364', '10080916530431', '发条娃娃-老鼠', '6', '1', '1', '20091003199_.gif', 'AB-all', '20*461', '20*461', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2365', '10080916530432', '发条娃娃-鸭子', '12', '1', '1', '20091003199_.gif', 'AB-all', '20*462', '20*462', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2366', '10080916530433', '发条娃娃-495', '19', '1', '1', '20091003199_.gif', 'AB-all', '20*463', '20*463', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2367', '10080916530434', '发条娃娃-496', '19', '1', '1', '20091003199_.gif', 'AB-all', '20*464', '20*464', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2368', '10080916530435', '发条娃娃-407-3', '36', '1', '1', '20091003199_.gif', 'AB-all', '20*465', '20*465', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2369', '10080916530436', '发条娃娃-407-2', '35', '1', '1', '20091003199_.gif', 'AB-all', '20*466', '20*466', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2370', '10080916530437', '发条娃娃-407-1', '32', '1', '1', '20091003199_.gif', 'AB-all', '20*467', '20*467', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2371', '10080916530438', '森林幽灵（大）', '10', '1', '1', '20091003199_.gif', 'AB-all', '20*468', '20*468', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2372', '10080916530439', '森林幽灵（小）', '10', '1', '1', '20091003199_.gif', 'AB-all', '20*469', '20*469', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2373', '10080916530440', '老虎被子', '138', '1', '1', '20091003199_.gif', 'AB-all', '20*470', '20*470', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2374', '10080916530441', '办公室杯具', '30', '1', '1', '20091003199_.gif', 'AB-all', '20*471', '20*471', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2375', '10080916530442', '仿古盒子', '18', '1', '1', '20091003199_.gif', 'AB-all', '20*472', '20*472', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2376', '10080916530443', '电灯胆包1', '25', '1', '1', '20091003199_.gif', 'AB-all', '20*473', '20*473', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2377', '10080916530444', '电灯胆包2', '35', '1', '1', '20091003199_.gif', 'AB-all', '20*474', '20*474', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2378', '10071918140010', '扑克牌', '12', '1', '1', '20091003199_.gif', 'AB-all', '20*475', '20*475', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2379', '10080916530446', '计算器（大）', '47', '1', '1', '20091003199_.gif', 'AB-all', '20*476', '20*476', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2380', '10080916530447', '计算器（中）', '68', '1', '1', '20091003199_.gif', 'AB-all', '20*477', '20*477', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2381', '10080916530448', '计算器（小）', '38', '1', '1', '20091003199_.gif', 'AB-all', '20*478', '20*478', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2382', '10080916530449', '头部按摩器', '9', '1', '1', '20091003199_.gif', 'AB-all', '20*479', '20*479', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2383', '10080916530450', '便签夹铅笔', '3', '1', '1', '20091003199_.gif', 'AB-all', '20*480', '20*480', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2384', '10080916530451', '海洋系列-小挂钩', '12', '1', '1', '20091003199_.gif', 'AB-all', '20*481', '20*481', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2385', '10080916530452', '海洋系列-相框', '28', '1', '1', '20091003199_.gif', 'AB-all', '20*482', '20*482', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2386', '10080916530453', '海洋系列-WC', '26', '1', '1', '20091003199_.gif', 'AB-all', '20*483', '20*483', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2387', '10080916530454', '海洋系列-锚、温度计', '32', '1', '1', '20091003199_.gif', 'AB-all', '20*484', '20*484', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2388', '10080916530455', '海洋系列-沙滩椅温度计', '46', '1', '1', '20091003199_.gif', 'AB-all', '20*485', '20*485', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2389', '10080916530456', '海洋系列-手绘洒水壶', '62', '1', '1', '20091003199_.gif', 'AB-all', '20*486', '20*486', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2390', '10080916530457', '海洋系列-手绘花瓶', '49', '1', '1', '20091003199_.gif', 'AB-all', '20*487', '20*487', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2391', '10080916530458', '海洋系列-灯塔与海鸥（双钩）', '28', '1', '1', '20091003199_.gif', 'AB-all', '20*488', '20*488', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2392', '10080916530459', '海洋系列-拖鞋挂钩', '32', '1', '1', '20091003199_.gif', 'AB-all', '20*489', '20*489', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2393', '10080916530460', '闹钟', '48', '1', '1', '20091003199_.gif', 'AB-all', '20*490', '20*490', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2394', '10080916530461', 'DIY手工布艺-三件套挂件', '9', '1', '1', '20091003199_.gif', 'AB-all', '20*491', '20*491', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2395', '10080916530462', 'DIY手工布艺-卡包', '9', '1', '1', '20091003199_.gif', 'AB-all', '20*492', '20*492', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2396', '10080916530463', 'DIY手工布艺-PSP包', '15', '1', '1', '20091003199_.gif', 'AB-all', '20*493', '20*493', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2397', '10080916530464', 'DIY手工布艺-手机包', '12', '1', '1', '20091003199_.gif', 'AB-all', '20*494', '20*494', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2398', '10080916530465', 'DIY手工布艺-钥匙套', '9', '1', '1', '20091003199_.gif', 'AB-all', '20*495', '20*495', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2399', '10080916530466', 'DIY手工布艺-玩偶', '12', '1', '1', '20091003199_.gif', 'AB-all', '20*496', '20*496', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2400', '10080916530467', 'DIY手工布艺-十二星座玩偶', '15', '1', '1', '20091003199_.gif', 'AB-all', '20*497', '20*497', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2401', '10080916530468', 'DIY手工布艺-硬币零钱包', '12', '1', '1', '20091003199_.gif', 'AB-all', '20*498', '20*498', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2402', '10080916530469', '小动物吊饰', '16', '1', '1', '20091003199_.gif', 'AB-all', '20*499', '20*499', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2403', '10080916530470', '小辣椒吊饰', '10', '1', '1', '20091003199_.gif', 'AB-all', '20*500', '20*500', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2404', '10080916530471', '小鱼吊饰', '8', '1', '1', '20091003199_.gif', 'AB-all', '20*501', '20*501', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2405', '10080916530472', '花布猴子', '29', '1', '1', '20091003199_.gif', 'AB-all', '20*502', '20*502', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2406', '10080916530473', '大头狗', '39', '1', '1', '20091003199_.gif', 'AB-all', '20*503', '20*503', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2407', '10080916530474', '布杯具-学习（蓝）', '16', '1', '1', '20091003199_.gif', 'C-39', '20*504', '20*504', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2408', '10080916530475', '布杯具-学习（白）', '16', '1', '1', '20091003199_.gif', 'C-39', '20*505', '20*505', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2409', '10080916530476', '布杯具-爱情（蓝）', '16', '1', '1', '20091003199_.gif', 'C-39', '20*506', '20*506', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2410', '10080916530477', '布杯具-爱情（粉）', '16', '1', '1', '20091003199_.gif', 'C-39', '20*507', '20*507', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2411', '10080916530478', '布杯具-事业（灰）', '16', '1', '1', '20091003199_.gif', 'C-39', '20*508', '20*508', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2412', '10080916530479', '布杯具-事业（紫）', '16', '1', '1', '20091003199_.gif', 'C-39', '20*509', '20*509', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2413', '10080916530480', '布杯具-梦想（青）', '16', '1', '1', '20091003199_.gif', 'C-39', '20*510', '20*510', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2414', '10080916530481', '布杯具-杯子', '72', '1', '1', '20091003199_.gif', 'C-39', '20*511', '20*511', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2415', '10080916530482', 'N03NO4-N08BE070-001C', '168', '1', '1', '20091003199_.gif', 'C-16', '20*512', '20*512', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2416', '10080916530483', 'N03NO4-N08BE066-002C', '168', '1', '1', '20091003199_.gif', 'C-16', '20*513', '20*513', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2417', '10080916530484', 'N03NO4-N07ZO061-041D', '188', '1', '1', '20091003199_.gif', 'C-16', '20*514', '20*514', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2418', '10080916530485', 'N03NO4-NO8Superfamily-03-07', '158', '1', '1', '20091003199_.gif', 'C-16', '20*515', '20*515', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2419', '10080916530486', 'N03NO4-NO8Superfamily-03-03', '158', '1', '1', '20091003199_.gif', 'C-16', '20*516', '20*516', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2420', '10080916530487', 'N03NO4-N07RA110-002C', '158', '1', '1', '20091003199_.gif', 'C-16', '20*517', '20*517', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2421', '10080916530488', 'N03NO4-N08DO055-005B', '158', '1', '1', '20091003199_.gif', 'C-16', '20*518', '20*518', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2422', '10080916530489', 'N03NO4-N08RA148-001C', '158', '1', '1', '20091003199_.gif', 'C-16', '20*519', '20*519', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2423', '10080916530490', 'N03NO4-N08ZO100-001C', '158', '1', '1', '20091003199_.gif', 'C-16', '20*520', '20*520', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2424', '10080916530491', 'N03NO4-N08BE076-001B', '158', '1', '1', '20091003199_.gif', 'C-16', '20*521', '20*521', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2425', '10080916530492', 'N03NO4-N08BE077-001B', '188', '1', '1', '20091003199_.gif', 'C-16', '20*522', '20*522', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2426', '10080916530493', 'N03NO4-N08BE078-002B', '168', '1', '1', '20091003199_.gif', 'C-16', '20*523', '20*523', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2427', '10080916530494', 'N03NO4-N08CA067-001B', '158', '1', '1', '20091003199_.gif', 'C-16', '20*524', '20*524', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2428', '10080916530495', 'N03NO4-N09PI015-005C', '158', '1', '1', '20091003199_.gif', 'C-16', '20*525', '20*525', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2429', '10080916530496', 'N03NO4-N09PI015-006C', '158', '1', '1', '20091003199_.gif', 'C-16', '20*526', '20*526', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2430', '10080916530497', 'N03NO4-N09BE085-003C', '168', '1', '1', '20091003199_.gif', 'C-16', '20*527', '20*527', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2431', '10080916530498', 'N03NO4-N09RA163-003C', '138', '1', '1', '20091003199_.gif', 'C-16', '20*528', '20*528', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2432', '10080916530499', 'N03NO4-N09RA154-002D', '168', '1', '1', '20091003199_.gif', 'C-16', '20*529', '20*529', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2433', '10080916530500', 'N03NO4-N09ZO107-003C', '138', '1', '1', '20091003199_.gif', 'C-16', '20*530', '20*530', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2434', '10080916530501', 'N03NO4-N06FR021-002B', '138', '1', '1', '20091003199_.gif', 'C-16', '20*531', '20*531', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2435', '10080916530502', 'N03NO4-N09SuperXmas-006B', '138', '1', '1', '20091003199_.gif', 'C-16', '20*532', '20*532', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2436', '10080916530503', 'N03NO4-N10DO065-001C', '158', '1', '1', '20091003199_.gif', 'C-16', '20*533', '20*533', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2437', '10080916530504', 'N03NO4-N10DO067-001C', '168', '1', '1', '20091003199_.gif', 'C-16', '20*534', '20*534', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2438', '10080916530505', 'N03NO4-N09RA159-004B', '118', '1', '1', '20091003199_.gif', 'C-16', '20*535', '20*535', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2439', '10080916530506', 'N03NO4-N09RA168-006C', '98', '1', '1', '20091003199_.gif', 'C-16', '20*536', '20*536', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2440', '10080916530507', 'N03NO4-N09RA168-007C', '98', '1', '1', '20091003199_.gif', 'C-16', '20*537', '20*537', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2441', '10080916530508', 'N03NO4-N10RA169-001A', '118', '1', '1', '20091003199_.gif', 'C-16', '20*538', '20*538', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2442', '10080916530509', 'N03NO4-N09RA156-002C', '158', '1', '1', '20091003199_.gif', 'C-16', '20*539', '20*539', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2443', '10080916530510', 'N03NO4-N09RA153-003C', '158', '1', '1', '20091003199_.gif', 'C-16', '20*540', '20*540', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2444', '10080916530511', 'N03NO4-N08RA147-003B', '98', '1', '1', '20091003199_.gif', 'C-16', '20*541', '20*541', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2445', '10080916530512', 'N03NO4-N08RA147-005B', '98', '1', '1', '20091003199_.gif', 'C-16', '20*542', '20*542', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2446', '10080916530513', '麻椒-雷锋横版包（黑金）', '128', '1', '1', '20091003199_.gif', 'C-36', '20*543', '20*543', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2447', '10080916530514', '麻椒-雷锋横版包（灰色）', '128', '1', '1', '20091003199_.gif', 'C-36', '20*544', '20*544', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2448', '10080916530515', '麻椒-双用包', '99', '1', '1', '20091003199_.gif', 'C-36', '20*545', '20*545', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2449', '10080916530516', '麻椒-大眼猫饺子包（绿）', '138', '1', '1', '20091003199_.gif', 'C-36', '20*546', '20*546', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2450', '10080916530517', '麻椒-大眼猫包（黄色）', '138', '1', '1', '20091003199_.gif', 'C-36', '20*547', '20*547', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2451', '10080916530518', '麻椒-大眼猫包（粉色）', '138', '1', '1', '20091003199_.gif', 'C-36', '20*548', '20*548', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2452', '10080916530519', '麻椒-大眼猫包（绿色）', '138', '1', '1', '20091003199_.gif', 'C-36', '20*549', '20*549', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2453', '10080916530520', '麻椒-大眼猫包（蓝色）', '138', '1', '1', '20091003199_.gif', 'C-36', '20*550', '20*550', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2454', '10080916530521', '麻椒-画笔工具卷筒（灰色）', '58', '1', '1', '20091003199_.gif', 'C-36', '20*551', '20*551', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2455', '10080916530522', '麻椒-画笔工具卷筒（红色）', '58', '1', '1', '20091003199_.gif', 'C-36', '20*552', '20*552', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2456', '10080916530523', '麻椒-画笔工具卷筒（绿色）', '58', '1', '1', '20091003199_.gif', 'C-36', '20*553', '20*553', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2457', '10080916530524', '麻椒-不织布电视机电脑包（咖啡）', '78', '1', '1', '20091003199_.gif', 'C-36', '20*554', '20*554', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2458', '10080916530525', '麻椒-不织布猫头鹰电脑包（绿色）', '78', '1', '1', '20091003199_.gif', 'C-36', '20*555', '20*555', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2459', '10080916530526', '麻椒-不织布电视机电脑包（黄色）', '78', '1', '1', '20091003199_.gif', 'C-36', '20*556', '20*556', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2460', '10080916530527', '麻椒-不织布领带电脑包（兰）', '78', '1', '1', '20091003199_.gif', 'C-36', '20*557', '20*557', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2461', '10080916530528', '麻椒-HC不织布PSP包（手柄红)', '48', '1', '1', '20091003199_.gif', 'C-36', '20*558', '20*558', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2462', '10080916530529', '麻椒-熊猫桃心眼卡包（兰）', '68', '1', '1', '20091003199_.gif', 'C-36', '20*559', '20*559', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2463', '10080916530530', '麻椒-熊猫桃心眼卡包（黄）', '68', '1', '1', '20091003199_.gif', 'C-36', '20*560', '20*560', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2464', '10080916530531', '麻椒-熊猫桃心眼卡包（粉）', '68', '1', '1', '20091003199_.gif', 'C-36', '20*561', '20*561', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2465', '10080916530532', '麻椒-猩猩卡包（绿）', '68', '1', '1', '20091003199_.gif', 'C-36', '20*562', '20*562', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2466', '10080916530533', '麻椒-缤纷生活卡包（桔）', '68', '1', '1', '20091003199_.gif', 'C-36', '20*563', '20*563', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2467', '10080916530534', '麻椒-缤纷生活卡包（兰）', '68', '1', '1', '20091003199_.gif', 'C-36', '20*564', '20*564', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2468', '10080916530535', '麻椒-猫猫卡卡小挎包（兰）', '99', '1', '1', '20091003199_.gif', 'C-36', '20*565', '20*565', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2469', '10080916530536', '麻椒-猫猫卡卡小竖包(灰）', '99', '1', '1', '20091003199_.gif', 'C-36', '20*566', '20*566', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2470', '10080916530537', '麻椒-猫猫卡卡小竖包(深灰）', '99', '1', '1', '20091003199_.gif', 'C-36', '20*567', '20*567', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2471', '10080916530538', '麻椒-猫猫卡卡小竖包(橘色）', '99', '1', '1', '20091003199_.gif', 'C-36', '20*568', '20*568', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2472', '10080916530539', '麻椒-大眼猫饺子包（黄）', '138', '1', '1', '20091003199_.gif', 'C-36', '20*569', '20*569', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2473', '10080916530540', '麻椒-大眼猫饺子包（兰）', '138', '1', '1', '20091003199_.gif', 'C-36', '20*570', '20*570', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2474', '10080916530541', '麻椒-雷锋斜挎包（深灰）', '138', '1', '1', '20091003199_.gif', 'C-36', '20*571', '20*571', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2475', '10080916530542', '麻椒-雷锋斜挎包（浅灰）', '138', '1', '1', '20091003199_.gif', 'C-36', '20*572', '20*572', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2476', '10080916530543', '麻椒-帆布小徽章', '15', '1', '1', '20091003199_.gif', 'C-36', '20*573', '20*573', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2477', '10080916530544', 'BABY兔-兔子1', '35', '1', '1', '20091003199_.gif', 'C-51', '20*574', '20*574', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2478', '10080916530545', 'BABY兔-兔子2', '40', '1', '1', '20091003199_.gif', 'C-51', '20*575', '20*575', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2479', '10080916530546', 'BABY兔-兔子3', '42', '1', '1', '20091003199_.gif', 'C-51', '20*576', '20*576', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2480', '10080916530547', 'BABY兔-棒棒兔', '15', '1', '1', '20091003199_.gif', 'C-51', '20*577', '20*577', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2481', '10080916530548', 'BABY兔-棒棒兔1', '10', '1', '1', '20091003199_.gif', 'C-51', '20*578', '20*578', '1', '400', '10', '2010-08-09 13:15:00', null, null);
INSERT INTO `dd_product` VALUES ('2482', '201008131151427102', '士大夫撒旦', '1', '1', '1', 'zf-info.jpg', 'user2', '11', '1111', '11', '11', '1111', '2010-08-13 11:50:19', 'user1', '2010-08-13 11:51:42');
INSERT INTO `dd_product` VALUES ('2483', null, '1111', '1', '1', '0', 'zf-info.jpg', 'user2', '11', '1', '1', '1', '1', '2010-08-13 11:50:34', null, null);
INSERT INTO `dd_product` VALUES ('2484', '201008131447456845', '小白兔', '150', '1', '1', '酷哥.jpg', 'user2', 'xl', '塑料', '1', '上海', '', '2010-08-13 14:45:50', 'user1', '2010-08-13 14:47:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='退货记录表';

-- ----------------------------
-- Records of dd_rsales
-- ----------------------------
INSERT INTO `dd_rsales` VALUES ('2', 'sss', 'ss', '是', '23', '士大夫', 'user3', '2010-07-24 20:09:53');
INSERT INTO `dd_rsales` VALUES ('3', '222222', '201008061943124463', 'null', '2', '02', 'user3', '2010-08-07 12:58:08');

-- ----------------------------
-- Table structure for `dd_sales`
-- ----------------------------
DROP TABLE IF EXISTS `dd_sales`;
CREATE TABLE `dd_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` varchar(64) NOT NULL,
  `barcode` varchar(128) NOT NULL,
  `discount` float NOT NULL,
  `amount` int(11) NOT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='售货记录表,卖出的数量要相应的从库存减去';

-- ----------------------------
-- Records of dd_sales
-- ----------------------------
INSERT INTO `dd_sales` VALUES ('89', 'dd2010871254466SGIQ', '201008061943124463', '1.1', '1', 'user3', '2010-08-07 12:54:46');
INSERT INTO `dd_sales` VALUES ('90', 'dd2010871254466SGIQ', '201008061943124463', '1.1', '1', 'user3', '2010-08-07 12:54:46');
INSERT INTO `dd_sales` VALUES ('91', 'dd2010871254466SGIQ', '201008061943124463', '1.1', '1', 'user3', '2010-08-07 12:54:46');
INSERT INTO `dd_sales` VALUES ('92', 'dd2010871254466SGIQ', '201008061943124463', '1.1', '1', 'user3', '2010-08-07 12:54:46');
INSERT INTO `dd_sales` VALUES ('93', 'dd2010871254466SGIQ', '201008061943124463', '1.1', '1', 'user3', '2010-08-07 12:54:46');
INSERT INTO `dd_sales` VALUES ('94', 'dd201088168371PJUQ', '201008081551353320', '1', '1', 'user3', '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('95', 'dd201088168371PJUQ', '201008081551353320', '1', '1', 'user3', '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('96', 'dd201081110405384EQ6', '201008081551353320', '1', '1', 'user3', '2010-08-11 10:40:53');
INSERT INTO `dd_sales` VALUES ('97', 'dd201081110460YTPFQ', '201008081551353320', '0.7', '10', 'user3', '2010-08-11 10:46:00');
INSERT INTO `dd_sales` VALUES ('98', 'q', '201008081551353320', '1', '11', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('99', 's', '201008081551353320', '1', '3', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('100', '2', '201008081551353320', '1', '12', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('101', '1', '201008081551353320', '1', '12', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('102', '201008081551353320', '201008081551353320', '1', '12', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('103', 'v', '201008081551353320', '1', '2', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('104', 'w', '201008081551353320', '1', '12', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('105', '1', '201008081551353320', '1', '1', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('106', '1', '201008081551353320', '1', '2', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('107', '1', '201008081551353320', '1', '1', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('108', '1', '201008081551353320', '1', '1', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('109', 's', '10080916530007', '1', '22', null, '2010-08-08 16:07:10');
INSERT INTO `dd_sales` VALUES ('110', 'www', '10080916530041', '1', '32', null, '2010-08-12 23:37:14');
INSERT INTO `dd_sales` VALUES ('111', 'w', '10080916530191', '1', '45', null, '2010-08-12 23:37:33');
INSERT INTO `dd_sales` VALUES ('112', '1', '201008061943124469', '1', '12', null, '2010-08-20 12:54:46');
INSERT INTO `dd_sales` VALUES ('113', '2', '201008061943124469', '1', '2', null, '2010-08-19 12:54:46');
INSERT INTO `dd_sales` VALUES ('114', '1', '201008061943124469', '1', '2', null, '2010-08-18 12:54:46');
INSERT INTO `dd_sales` VALUES ('115', '1', '201008061943124469', '1', '3', null, '2010-08-08 12:54:46');
INSERT INTO `dd_sales` VALUES ('116', '1', '201008061943124469', '1', '2', null, '2010-08-17 12:54:46');
INSERT INTO `dd_sales` VALUES ('117', '1', '201008061943124469', '1', '2', null, '2010-08-16 12:54:46');
INSERT INTO `dd_sales` VALUES ('118', '4', '201008061943124469', '2', '2', null, '2010-08-15 12:54:46');
INSERT INTO `dd_sales` VALUES ('119', '5', '201008061943124469', '1', '3', null, '2010-08-14 12:54:46');
INSERT INTO `dd_sales` VALUES ('120', '1', '201008061943124469', '1', '2', null, '2010-08-13 12:54:46');
INSERT INTO `dd_sales` VALUES ('121', '1', '201008061943124469', '1', '1', null, '2010-08-11 12:54:46');
INSERT INTO `dd_sales` VALUES ('122', '2', '201008061943124469', '1', '2', null, '2010-08-12 12:54:46');
INSERT INTO `dd_sales` VALUES ('123', '1', '201008061943124469', '1', '12', null, '2010-08-10 12:54:46');
INSERT INTO `dd_sales` VALUES ('124', '1', '201008061943124469', '1', '1', null, '2010-08-09 12:54:46');
INSERT INTO `dd_sales` VALUES ('125', '1', '201008061943124469', '1', '2', null, '2010-08-01 12:54:46');
INSERT INTO `dd_sales` VALUES ('126', '1', '201008061943124469', '1', '2', null, '2010-08-08 12:54:46');
INSERT INTO `dd_sales` VALUES ('127', '1', '201008061943124469', '1', '1', null, '2010-08-07 12:54:46');
INSERT INTO `dd_sales` VALUES ('128', '2', '201008061943124469', '1', '1', null, '2010-08-06 12:54:46');
INSERT INTO `dd_sales` VALUES ('129', '1', '201008061943124469', '1', '1', null, '2010-08-05 12:54:46');
INSERT INTO `dd_sales` VALUES ('130', '1', '201008061943124469', '1', '1', null, '2010-08-04 12:54:46');
INSERT INTO `dd_sales` VALUES ('131', '1', '201008061943124469', '1', '1', null, '2010-08-03 12:54:46');
INSERT INTO `dd_sales` VALUES ('132', '1', '201008061943124469', '1', '12', null, '2010-08-02 12:54:46');
INSERT INTO `dd_sales` VALUES ('133', '1', '201008061943124469', '1', '1', null, '2010-08-20 12:54:46');
INSERT INTO `dd_sales` VALUES ('134', '1', '201008061943124469', '1', '1', null, '2010-08-26 12:54:46');
INSERT INTO `dd_sales` VALUES ('135', '1', '201008061943124469', '1', '1', null, '2010-08-25 12:54:46');
INSERT INTO `dd_sales` VALUES ('136', '1', '201008061943124469', '1', '1', null, '2010-08-24 12:54:46');
INSERT INTO `dd_sales` VALUES ('137', '1', '201008061943124469', '1', '1', null, '2010-08-23 12:54:46');
INSERT INTO `dd_sales` VALUES ('138', '1', '201008061943124469', '1', '1', null, '2010-08-22 12:54:46');
INSERT INTO `dd_sales` VALUES ('139', '1', '201008061943124469', '1', '1', null, '2010-08-21 12:54:46');
INSERT INTO `dd_sales` VALUES ('140', '1', '201008061943124469', '1', '10', null, '2010-08-31 12:54:46');
INSERT INTO `dd_sales` VALUES ('141', '1', '201008061943124469', '1', '1', null, '2010-08-30 12:54:46');
INSERT INTO `dd_sales` VALUES ('142', '1', '201008061943124469', '1', '1', null, '2010-08-29 12:54:46');
INSERT INTO `dd_sales` VALUES ('143', '1', '201008061943124469', '1', '1', null, '2010-08-28 12:54:46');
INSERT INTO `dd_sales` VALUES ('144', '1', '201008061943124469', '1', '1', null, '2010-08-27 12:54:46');

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
  `status` char(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `place` varchar(300) NOT NULL,
  `begin` datetime NOT NULL,
  `end` datetime NOT NULL,
  `ems` varchar(100) DEFAULT NULL,
  `receipt` varchar(64) DEFAULT NULL,
  `pay` varchar(10) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `submitdate` datetime NOT NULL,
  `date` datetime DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='上货申请记录表';

-- ----------------------------
-- Records of dd_submit
-- ----------------------------
INSERT INTO `dd_submit` VALUES ('33', '201008061943124469', '1111', '0', '01', '上海三林永泰路89号', '2010-08-07 00:00:00', '2010-08-10 00:00:00', '01', null, '01', '5', '无备注', '2010-08-07 00:14:18', null, null);
INSERT INTO `dd_submit` VALUES ('34', '201008061943124463', '333', '1', '01', '上海三林永泰路83号', '2010-08-07 01:22:28', '2010-09-21 01:22:35', '01', null, '01', '3', 'sww', '2010-08-07 01:22:49', '2010-08-07 01:46:18', 'user1');
INSERT INTO `dd_submit` VALUES ('35', '201008061943124463', '234234', '1', '01', '上海三林永泰路83号', '2010-08-10 03:07:54', '2010-08-17 03:07:57', '01', null, '01', '3', '无说明', '2010-08-07 03:08:07', '2010-08-07 10:34:24', 'user1');
INSERT INTO `dd_submit` VALUES ('36', '201008081551353320', '27', '1', '01', '上海三林永泰路83号', '2010-08-09 15:58:07', '2010-08-12 15:58:39', '08', null, '01', '0', '  3', '2010-08-08 15:58:17', '2010-08-08 16:01:24', 'user1');
INSERT INTO `dd_submit` VALUES ('37', '201008081551353320', '20', '1', '01', '自送', '2010-08-10 16:01:21', '2010-08-11 16:01:28', '01', null, '01', '0', '直接送到店里', '2010-08-08 16:00:16', '2010-08-08 16:01:24', 'user1');
INSERT INTO `dd_submit` VALUES ('38', '201008061943124463', '111', '1', '01', '上海三林永泰路83号', '2010-08-09 15:01:11', '2010-08-17 15:01:15', 'DHL', 'null', '01', '5', '无', '2010-08-09 15:01:38', '2010-08-09 15:44:43', 'user1');
INSERT INTO `dd_submit` VALUES ('39', '201008061943124463', '11', '1', '01', '上海三林永泰路89号', '2010-08-09 15:09:16', '2010-08-18 15:09:13', 'DHL', 'null', '01', '5', '无', '2010-08-09 15:10:02', '2010-08-09 15:44:13', 'user1');
INSERT INTO `dd_submit` VALUES ('40', '201008061943124463', '232', '1', '01', '上海三林永泰路83号', '2010-08-10 15:11:28', '2010-08-23 15:11:25', 'DHL', 'AP0000000000001', '01', '3', '', '2010-08-09 15:11:44', '2010-08-09 15:44:13', 'user1');
INSERT INTO `dd_submit` VALUES ('41', '201008061943124463', '0', '0', '01', '上海三林永泰路83号', '2010-08-04 15:12:56', '2010-08-05 15:12:53', 'DHL', 'AP00000000000012', '01', '10', '', '2010-08-09 15:13:07', null, null);
INSERT INTO `dd_submit` VALUES ('42', '201008061943124463', '0', '0', '02', '上海三林永泰路83号', '2010-08-11 15:31:45', '2010-08-25 15:31:43', '', '', '01', '0', '', '2010-08-09 15:31:49', null, null);
INSERT INTO `dd_submit` VALUES ('43', '201008061943124463', '111', '0', '01', '11', '2010-08-18 11:50:43', '2010-08-17 11:50:40', '111111', '11', '01', '0', '', '2010-08-13 11:50:50', null, null);
INSERT INTO `dd_submit` VALUES ('44', '201008061943124463', '12313', '0', '01', '12', '2010-08-19 11:50:58', '2010-08-10 11:50:55', '2', '2', '01', '0', '2', '2010-08-13 11:51:01', null, null);
INSERT INTO `dd_submit` VALUES ('45', '201008131447456845', '6', '1', '02', '上海', '2010-08-10 14:50:07', '2010-08-13 14:49:58', '', '', '01', '0', '', '2010-08-13 14:50:07', '2010-08-13 15:01:46', 'user1');

-- ----------------------------
-- Table structure for `dd_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `dd_transaction`;
CREATE TABLE `dd_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `user` varchar(30) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `status` char(255) NOT NULL,
  `money` float NOT NULL,
  `memo` varchar(128) DEFAULT NULL,
  `submitdate` datetime NOT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='电子钱包交易记录表';

-- ----------------------------
-- Records of dd_transaction
-- ----------------------------
INSERT INTO `dd_transaction` VALUES ('2', 'user2', null, '01', '1', '232', '', '2010-08-10 10:26:09', 'user1', '2010-08-10 10:26:09');
INSERT INTO `dd_transaction` VALUES ('3', 'user2', null, '02', '1', '2342', '', '2010-08-10 10:26:09', 'user2', '2010-08-09 23:45:46');
INSERT INTO `dd_transaction` VALUES ('8', 'user2', '東東設會', '01', '1', '10000', '', '2010-08-10 23:51:31', 'user1', '2010-08-10 11:38:02');
INSERT INTO `dd_transaction` VALUES ('9', 'user2', '東東設會', '02', '1', '5000', '', '2010-08-10 10:26:09', 'user1', '2010-08-10 11:38:02');
INSERT INTO `dd_transaction` VALUES ('10', 'user2', '東東設會', '01', '1', '10000', '', '2010-08-10 23:53:36', 'user1', '2010-08-10 11:55:17');
INSERT INTO `dd_transaction` VALUES ('11', 'user2', '東東設會', '01', '1', '5000', '', '2010-08-10 23:53:44', 'user1', '2010-08-10 11:55:17');
INSERT INTO `dd_transaction` VALUES ('14', '東東設會', 'user2', '03', '1', '3000', '', '2010-08-11 00:08:07', 'user1', '2010-08-11 00:08:07');
INSERT INTO `dd_transaction` VALUES ('15', '東東設會', 'user2', '04', '1', '3000', '', '2010-08-11 00:08:22', 'user1', '2010-08-11 00:08:22');
INSERT INTO `dd_transaction` VALUES ('16', '東東設會', 'user2', '01', '1', '3000', '', '2010-08-11 00:33:47', 'user1', '2010-08-11 00:33:47');
INSERT INTO `dd_transaction` VALUES ('17', '東東設會', 'user2', '02', '1', '7000', '', '2010-08-11 00:34:04', 'user1', '2010-08-11 00:34:04');
INSERT INTO `dd_transaction` VALUES ('18', '東東設會', 'user2', '01', '1', '5000', '本月销售收入', '2010-08-12 12:13:46', 'user1', '2010-08-12 12:13:46');
INSERT INTO `dd_transaction` VALUES ('19', 'user2', '東東設會', '01', '1', '10000', '', '2010-08-13 15:28:48', 'user1', '2010-08-13 03:30:41');
INSERT INTO `dd_transaction` VALUES ('20', 'user2', '東東設會', '01', '0', '10', '', '2010-08-13 15:29:18', null, null);
INSERT INTO `dd_transaction` VALUES ('21', 'user2', '東東設會', '01', '0', '10', '', '2010-08-13 15:29:29', null, null);
INSERT INTO `dd_transaction` VALUES ('22', 'user2', '東東設會', '02', '1', '1000', '', '2010-08-13 15:31:52', 'user1', '2010-08-13 03:32:32');
INSERT INTO `dd_transaction` VALUES ('23', 'user2', '東東設會', '02', '1', '10000', '', '2010-08-13 15:33:48', 'user1', '2010-08-13 03:34:31');

-- ----------------------------
-- Table structure for `dd_upload`
-- ----------------------------
DROP TABLE IF EXISTS `dd_upload`;
CREATE TABLE `dd_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) NOT NULL,
  `amount` int(11) NOT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='格子上架记录表，操作人，操作日期，上架物';

-- ----------------------------
-- Records of dd_upload
-- ----------------------------
INSERT INTO `dd_upload` VALUES ('55', '201008061943124463', '1', 'user1', '2010-08-07 10:33:22');
INSERT INTO `dd_upload` VALUES ('56', '201008061943124463', '1', 'user4', '2010-08-07 10:56:25');
INSERT INTO `dd_upload` VALUES ('57', '201008061943124463', '1', 'user1', '2010-08-07 12:35:26');
INSERT INTO `dd_upload` VALUES ('58', '201008061943124463', '2', 'user1', '2010-08-07 12:35:32');
INSERT INTO `dd_upload` VALUES ('59', '201008061943124463', '50', 'user4', '2010-08-07 13:15:57');
INSERT INTO `dd_upload` VALUES ('60', '201008061943124463', '2', 'user1', '2010-08-08 16:02:14');
INSERT INTO `dd_upload` VALUES ('61', '201008081551353320', '3', 'user1', '2010-08-08 16:02:14');
INSERT INTO `dd_upload` VALUES ('62', '201008061943124463', '2', 'user1', '2010-08-08 16:02:21');
INSERT INTO `dd_upload` VALUES ('63', '201008081551353320', '3', 'user1', '2010-08-08 16:02:21');
INSERT INTO `dd_upload` VALUES ('64', '201008131447456845', '2', 'user1', '2010-08-13 15:03:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='用户表，分设计师，管理员，门店操作人员';

-- ----------------------------
-- Records of dd_user
-- ----------------------------
INSERT INTO `dd_user` VALUES ('1', 'user2', '小黑', '小黑', '1', '2', '1', '4', '4', '4', '13761844061', '12345679', '45566', '4', '2010-07-03 13:03:07', '4', '2010-08-06 01:47:47');
INSERT INTO `dd_user` VALUES ('2', 'user1', '小白', '小白', '1', '1', '1', '1', '1', '1', '137262728282', '4534535', '1', '1', '2010-07-03 19:26:15', '1', null);
INSERT INTO `dd_user` VALUES ('3', 'user3', '小茹', '小茹', '1', '3', '1', '1', '3', '333', '3', '3', '3', '3', '2010-07-04 14:42:13', '1', null);
INSERT INTO `dd_user` VALUES ('4', 'user4', '小张', '小张', '2', '4', '1', '1', '1', '2324', '123234', '1', '1', '1', '2010-07-04 14:43:12', 'user1', '2010-08-06 01:49:13');
INSERT INTO `dd_user` VALUES ('18', 'C-3', '黑头', '黑头', '1', '2', '1', '1', '1', null, '88', '3', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('19', 'C-4', '塔卡莎', '塔卡莎', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('20', 'C-6', '玲紫猫', '玲紫猫', '2', '2', '1', null, '1', null, '1', '22', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('21', 'C-11', 'fly queen', 'fly queen', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('22', 'C-12', 'CC饰品', 'CC饰品', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('23', 'C-15', '格里伏塔', '格里伏塔', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('24', 'C-16', 'NO3NO4', 'NO3NO4', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('25', 'C-17', '七口七', '七口七', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('26', 'C-18', 'STAR', 'STAR', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('27', 'C-19', '手绘世博', '手绘世博', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('28', 'C-21', 'Gismo', 'Gismo', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('29', 'C-22', '安静的静', '安静的静', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('30', 'C-23', '凤龙', '凤龙', '11', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('31', 'C-24', '梵星手绘', '梵星手绘', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('32', 'C-26', 'BAO\'S', 'BAO\'S', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('33', 'C-28', '元素X', '元素X', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('34', 'C-31', '小红裙子', '小红裙子', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('35', 'C-32', '兔子比尔', '兔子比尔', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('36', 'C-35', '自作自售', '自作自售', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('37', 'C-36', '麻椒', '麻椒', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('38', 'C-37', '陶格', '陶格', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('39', 'C-50', '黑皮超人', '黑皮超人', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('40', 'C-51', 'BABY兔', 'BABY兔', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('41', 'C-52', '80\'s', '80\'s', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('42', 'C-55', '静闲舍', '静闲舍', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('43', 'C-56', '雪·松', '雪·松', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('44', 'C-58', '森楠陶瓷', '森楠陶瓷', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('45', 'C-60', '黑嘛嘛', '黑嘛嘛', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('46', 'CIBOYS', 'CIBOYS', 'CIBOYS', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('47', 'SN', '酸奶', '酸奶', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('48', 'WLL', '王赖赖', '王赖赖', '1', '2', '1', null, '1', '上海', '1', '1', null, null, '2010-08-03 10:43:23', 'user1', null);
INSERT INTO `dd_user` VALUES ('93', 'ddsh', '東東設會', '東東設會', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-07 17:43:07', 'user1', null);
INSERT INTO `dd_user` VALUES ('94', 'C-61', '兔子暴', '兔子暴', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-07 17:45:41', 'user1', null);
INSERT INTO `dd_user` VALUES ('95', 'C-62', '模范镇', '模范镇', '1', '2', '1', null, '1', null, '1', '1', null, null, '2010-08-07 17:48:48', 'user1', null);
INSERT INTO `dd_user` VALUES ('104', '东东设会', '王犇', '自主', '1111', '2', '1', '321183198601020014', '1', '上海', '13918685114', '02133666336', '', 'cdkey_wb@yahoo.com.cn', '2010-08-08 15:11:38', 'user1', '2010-08-08 03:27:49');
INSERT INTO `dd_user` VALUES ('106', '东东001', '王犇', '自主', '123456', '2', '1', '321183198601020014', '1', '上海', '13918685114', '02133666336', '', 'cdkey_wb@yahoo.com.cn', '2010-08-08 15:42:12', 'user1', '2010-08-08 03:42:51');

-- ----------------------------
-- Table structure for `dd_wallet`
-- ----------------------------
DROP TABLE IF EXISTS `dd_wallet`;
CREATE TABLE `dd_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `account` varchar(128) DEFAULT NULL,
  `bankname` varchar(128) DEFAULT NULL,
  `accounter` varchar(128) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='设计师、商家电子钱包';

-- ----------------------------
-- Records of dd_wallet
-- ----------------------------
INSERT INTO `dd_wallet` VALUES ('1', 'user3', '2342232', '广州银行', '周建国', '上海', '2342.22', '0.5', null, null);
INSERT INTO `dd_wallet` VALUES ('2', 'user2', '00000010101011', '上海银行', '周1222', '上海·21123', '22342.4', '0.7', 'user1', '2010-08-13 03:34:31');
INSERT INTO `dd_wallet` VALUES ('3', 'user1', '00001', '上海银行', '周', '上海', '111', '0.5', 'user1', '2010-08-10 09:35:53');
