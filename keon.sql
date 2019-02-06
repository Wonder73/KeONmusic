/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : keon

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-11-23 21:11:14
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS `keon` CHARSET UTF8;

USE `keon`;

-- ----------------------------
-- Table structure for bigcomment
-- ----------------------------
DROP TABLE IF EXISTS `bigcomment`;
CREATE TABLE `bigcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `smallcount` int(11) DEFAULT '0',
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bigcomment
-- ----------------------------
INSERT INTO `bigcomment` VALUES ('1', '001QELfC0vj44v', '1', '123456', 'single', '0', '2018-06-03 11:49:17');
INSERT INTO `bigcomment` VALUES ('2', '001QELfC0vj44v', '1', '蔡钦江', 'single', '0', '2018-06-03 12:01:31');
INSERT INTO `bigcomment` VALUES ('3', '001QELfC0vj44v', '1', '蔡钦江', 'single', '0', '2018-06-03 12:01:34');
INSERT INTO `bigcomment` VALUES ('4', '001QELfC0vj44v', '1', '蔡钦江', 'single', '0', '2018-06-03 12:01:34');
INSERT INTO `bigcomment` VALUES ('5', '001QELfC0vj44v', '1', '蔡钦江', 'single', '0', '2018-06-03 12:01:34');
INSERT INTO `bigcomment` VALUES ('6', '001QELfC0vj44v', '1', '蔡钦江', 'single', '0', '2018-06-03 12:01:34');
INSERT INTO `bigcomment` VALUES ('7', '001QELfC0vj44v', '1', '蔡钦江', 'single', '0', '2018-06-03 12:01:35');
INSERT INTO `bigcomment` VALUES ('8', '001QELfC0vj44v', '1', '蔡钦江', 'single', '0', '2018-06-03 12:01:35');
INSERT INTO `bigcomment` VALUES ('9', '001QELfC0vj44v', '1', '蔡钦江', 'single', '0', '2018-06-03 12:01:35');
INSERT INTO `bigcomment` VALUES ('10', '001QELfC0vj44v', '1', '蔡钦江', 'single', '0', '2018-06-03 12:01:35');
INSERT INTO `bigcomment` VALUES ('11', '0042QMDR1VzSsx', '1', 'wonder', 'single', '0', '2018-06-03 16:20:25');
INSERT INTO `bigcomment` VALUES ('12', '0042QMDR1VzSsx', '1', 'wonder', 'single', '0', '2018-06-03 16:23:10');
INSERT INTO `bigcomment` VALUES ('13', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:33');
INSERT INTO `bigcomment` VALUES ('14', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:34');
INSERT INTO `bigcomment` VALUES ('15', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:34');
INSERT INTO `bigcomment` VALUES ('16', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:35');
INSERT INTO `bigcomment` VALUES ('17', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:35');
INSERT INTO `bigcomment` VALUES ('18', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:36');
INSERT INTO `bigcomment` VALUES ('19', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:38');
INSERT INTO `bigcomment` VALUES ('20', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:39');
INSERT INTO `bigcomment` VALUES ('21', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:40');
INSERT INTO `bigcomment` VALUES ('22', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:41');
INSERT INTO `bigcomment` VALUES ('23', '0042QMDR1VzSsx', '1', '111111111', 'single', '0', '2018-06-03 16:32:43');
INSERT INTO `bigcomment` VALUES ('24', '0042QMDR1VzSsx', '1', '11111111111111111111111111', 'single', '0', '2018-06-03 16:34:13');
INSERT INTO `bigcomment` VALUES ('25', '0042QMDR1VzSsx', '1', 'wonderwonderwonderwonderwonderw', 'single', '0', '2018-06-03 16:37:20');
INSERT INTO `bigcomment` VALUES ('26', '001J5QJL1pRQYB', '1', 'xixixixixixixi', 'single', '0', '2018-06-04 23:19:38');
INSERT INTO `bigcomment` VALUES ('27', '001QELfC0vj44v', '1', 'xxxxxxxx', 'single', '0', '2018-06-05 00:00:46');
INSERT INTO `bigcomment` VALUES ('28', '003OUlho2HcRHC', '1', '周杰伦', 'single', '9', '2018-06-05 14:45:44');
INSERT INTO `bigcomment` VALUES ('29', '003OUlho2HcRHC', '1', '周杰伦', 'single', '0', '2018-06-05 14:45:59');
INSERT INTO `bigcomment` VALUES ('30', '003OUlho2HcRHC', '1', '周杰伦xxx', 'single', '3', '2018-06-05 14:46:26');
INSERT INTO `bigcomment` VALUES ('31', '003OUlho2HcRHC', '1', 'zjl', 'single', '0', '2018-06-05 14:48:22');
INSERT INTO `bigcomment` VALUES ('32', '003OUlho2HcRHC', '1', 'xxxxxx', 'single', '0', '2018-06-05 14:49:07');
INSERT INTO `bigcomment` VALUES ('33', '003OUlho2HcRHC', '1', 'hhhhh', 'single', '0', '2018-06-05 14:49:21');
INSERT INTO `bigcomment` VALUES ('34', '003OUlho2HcRHC', '1', 'zjlxxxxxx', 'single', '0', '2018-06-05 14:49:44');
INSERT INTO `bigcomment` VALUES ('35', '003OUlho2HcRHC', '1', '好帅，好帅', 'single', '4', '2018-06-05 17:21:36');
INSERT INTO `bigcomment` VALUES ('36', '003OUlho2HcRHC', '1', '好帅，好帅', 'single', '0', '2018-06-05 17:21:41');
INSERT INTO `bigcomment` VALUES ('37', '003OUlho2HcRHC', '1', '好帅，好帅', 'single', '0', '2018-06-05 17:21:54');
INSERT INTO `bigcomment` VALUES ('38', '003OUlho2HcRHC', '1', '好帅好帅', 'single', '0', '2018-06-05 17:21:59');
INSERT INTO `bigcomment` VALUES ('39', '003OUlho2HcRHC', '1', '好帅，好帅', 'single', '0', '2018-06-05 17:22:04');
INSERT INTO `bigcomment` VALUES ('40', '001J5QJL1pRQYB', '1', '哈哈哈哈', 'single', '0', '2018-06-05 22:40:35');
INSERT INTO `bigcomment` VALUES ('41', '003ThnHE0lOP3W', '1', '11111', 'single', '1', '2018-06-11 17:50:54');
INSERT INTO `bigcomment` VALUES ('42', '001fpbwS2TUTjV', '1', '1234', 'single', '0', '2018-06-11 21:09:19');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message_user_id` int(11) NOT NULL,
  `message_content` text,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `message_user_id` (`message_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '29', '28', '好帅呀', '2018-06-14 17:55:58');
INSERT INTO `message` VALUES ('2', '29', '28', '好帅呀', '2018-06-14 17:55:59');
INSERT INTO `message` VALUES ('3', '29', '28', '好帅呀', '2018-06-14 17:55:59');
INSERT INTO `message` VALUES ('4', '29', '28', '好帅呀', '2018-06-14 17:55:59');
INSERT INTO `message` VALUES ('5', '29', '28', '好帅呀', '2018-06-14 17:56:00');
INSERT INTO `message` VALUES ('6', '29', '28', '好帅呀', '2018-06-14 17:56:00');
INSERT INTO `message` VALUES ('7', '29', '28', '好帅呀', '2018-06-14 17:56:00');
INSERT INTO `message` VALUES ('8', '29', '28', '好帅呀', '2018-06-14 17:56:00');
INSERT INTO `message` VALUES ('9', '29', '28', '好帅呀', '2018-06-14 17:56:00');
INSERT INTO `message` VALUES ('10', '29', '28', '超级帅', '2018-06-14 17:59:12');
INSERT INTO `message` VALUES ('11', '29', '28', '超级帅', '2018-06-14 17:59:13');
INSERT INTO `message` VALUES ('12', '29', '28', '超级帅', '2018-06-14 17:59:13');

-- ----------------------------
-- Table structure for smallcomment
-- ----------------------------
DROP TABLE IF EXISTS `smallcomment`;
CREATE TABLE `smallcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `big_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `big_id` (`big_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of smallcomment
-- ----------------------------
INSERT INTO `smallcomment` VALUES ('12', '28', '1', '卧槽', '2018-06-05 16:57:19');
INSERT INTO `smallcomment` VALUES ('13', '28', '1', '我靠', '2018-06-05 16:58:34');
INSERT INTO `smallcomment` VALUES ('14', '28', '1', '卧槽', '2018-06-05 17:00:07');
INSERT INTO `smallcomment` VALUES ('15', '28', '1', 'wocha0', '2018-06-05 17:03:22');
INSERT INTO `smallcomment` VALUES ('16', '28', '1', '嘻嘻', '2018-06-05 17:13:21');
INSERT INTO `smallcomment` VALUES ('17', '28', '1', '哈哈', '2018-06-05 17:17:53');
INSERT INTO `smallcomment` VALUES ('18', '28', '1', '嘻嘻', '2018-06-05 17:17:57');
INSERT INTO `smallcomment` VALUES ('19', '28', '1', '我去', '2018-06-05 17:18:01');
INSERT INTO `smallcomment` VALUES ('20', '28', '1', '在干嘛', '2018-06-05 17:18:05');
INSERT INTO `smallcomment` VALUES ('21', '30', '1', '嘻嘻', '2018-06-05 17:21:08');
INSERT INTO `smallcomment` VALUES ('22', '30', '1', '哈哈', '2018-06-05 17:21:14');
INSERT INTO `smallcomment` VALUES ('23', '30', '1', '切', '2018-06-05 17:21:19');
INSERT INTO `smallcomment` VALUES ('24', '35', '1', '有多帅呀，傻逼', '2018-06-05 22:30:48');
INSERT INTO `smallcomment` VALUES ('25', '35', '1', '就是，就是', '2018-06-05 22:30:58');
INSERT INTO `smallcomment` VALUES ('26', '35', '1', '楼上说的好', '2018-06-05 22:31:07');
INSERT INTO `smallcomment` VALUES ('27', '35', '1', '哎。。。。。。', '2018-06-05 22:31:46');
INSERT INTO `smallcomment` VALUES ('28', '41', '1', '1111', '2018-06-11 17:51:02');

-- ----------------------------
-- Table structure for smallmessage
-- ----------------------------
DROP TABLE IF EXISTS `smallmessage`;
CREATE TABLE `smallmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `smallMessage_user_id` int(11) NOT NULL,
  `smallMessage_content` text,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `smallMessage_user_id` (`smallMessage_user_id`),
  KEY `message_id` (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of smallmessage
-- ----------------------------
INSERT INTO `smallmessage` VALUES ('1', '1', '29', '你也一样帅！！', '2018-06-14 18:10:11');
INSERT INTO `smallmessage` VALUES ('2', '1', '29', '你也一样帅！！', '2018-06-14 18:10:12');
INSERT INTO `smallmessage` VALUES ('3', '1', '29', '你也一样帅！！', '2018-06-14 18:10:12');
INSERT INTO `smallmessage` VALUES ('4', '1', '29', '你也一样帅！！', '2018-06-14 18:10:13');
INSERT INTO `smallmessage` VALUES ('5', '1', '29', '你也一样帅！！', '2018-06-14 18:10:13');
INSERT INTO `smallmessage` VALUES ('6', '1', '29', '你也一样帅！！', '2018-06-14 18:10:13');
INSERT INTO `smallmessage` VALUES ('7', '1', '29', '你也一样帅！！', '2018-06-14 18:10:13');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'wonder', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733348@qq.com', '13128348692', '2018-05-20 10:37:26');
INSERT INTO `user` VALUES ('10', 'wonder101', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 15:52:19');
INSERT INTO `user` VALUES ('6', 'wonder4', 'cc2c4b20afee0fcb10c34c328f78b995', '487717130@qq.com', '', '2018-05-20 23:16:44');
INSERT INTO `user` VALUES ('9', 'wonder100', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 15:51:32');
INSERT INTO `user` VALUES ('11', 'wonder102', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 15:52:49');
INSERT INTO `user` VALUES ('12', 'wonder103', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 15:53:23');
INSERT INTO `user` VALUES ('13', 'wonder104', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 15:59:43');
INSERT INTO `user` VALUES ('14', 'wonder105', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:01:41');
INSERT INTO `user` VALUES ('15', 'wonder106', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:01:45');
INSERT INTO `user` VALUES ('16', 'wonder107', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:01:48');
INSERT INTO `user` VALUES ('17', 'wonder109', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:01:54');
INSERT INTO `user` VALUES ('18', 'wonder110', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:01:56');
INSERT INTO `user` VALUES ('19', 'wonder111', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:01:59');
INSERT INTO `user` VALUES ('20', 'wonder112', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:02:01');
INSERT INTO `user` VALUES ('21', 'wonder113', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:02:03');
INSERT INTO `user` VALUES ('22', 'wonder114', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:02:06');
INSERT INTO `user` VALUES ('23', 'wonder115', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:02:09');
INSERT INTO `user` VALUES ('24', 'wonder116', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:02:12');
INSERT INTO `user` VALUES ('25', 'wonder117', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:02:15');
INSERT INTO `user` VALUES ('26', 'wonder118', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:02:18');
INSERT INTO `user` VALUES ('27', 'wonder119', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:02:21');
INSERT INTO `user` VALUES ('28', 'wonder120', 'cc2c4b20afee0fcb10c34c328f78b995', '1491733338@qq.com', '11111111111', '2018-06-14 16:02:24');
INSERT INTO `user` VALUES ('29', 'wonder73', 'cc2c4b20afee0fcb10c34c328f78b995', 'wonder_97@163.com', '', '2018-06-14 16:11:55');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `top_img` varchar(100) DEFAULT NULL,
  `nickname` varchar(50) NOT NULL,
  `age` int(11) DEFAULT '0',
  `sex` varchar(10) DEFAULT '男',
  `province` varchar(50) DEFAULT NULL,
  `description` text,
  `introduction` text,
  `gloy` text,
  `follow` int(11) NOT NULL DEFAULT '0',
  `fans` int(11) NOT NULL DEFAULT '0',
  `popularity` int(11) NOT NULL DEFAULT '0',
  `authentication` int(11) NOT NULL DEFAULT '0',
  `musician` int(11) NOT NULL DEFAULT '0',
  `privacy` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '13', null, 'wonder104', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('2', '14', null, 'wonder105', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('3', '15', null, 'wonder106', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('4', '16', null, 'wonder107', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('5', '17', null, 'wonder109', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('6', '18', null, 'wonder110', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('7', '19', null, 'wonder111', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('8', '20', null, 'wonder112', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('9', '21', null, 'wonder113', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('10', '22', null, 'wonder114', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('11', '23', null, 'wonder115', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('12', '24', null, 'wonder116', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('13', '25', null, 'wonder117', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('14', '26', null, 'wonder118', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('15', '27', null, 'wonder119', '0', '男', null, null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `user_info` VALUES ('16', '28', null, '1', '2', '3', '4', '5', '6', null, '0', '0', '0', '0', '0', '7');
INSERT INTO `user_info` VALUES ('17', '29', '1', '1', '2', '3', '4', '5', '6', null, '0', '0', '0', '0', '0', '7');
